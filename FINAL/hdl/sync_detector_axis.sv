`default_nettype none
`timescale 1 ns / 1 ps

/*
two types of hsync:
1. long hsync period after new frame (low sync, high sync, low sync)
2. singular hsync period before each new line (front porch, sync tip, back porch)
*/

module sync_detector_axis #(
    parameter integer C_S00_AXIS_TDATA_WIDTH = 16,
    parameter integer C_M00_AXIS_TDATA_WIDTH = 32

)
(
    // Ports of Axis Slave Bus Interface S00_AXIS: 
    // s00_axis_tdata = {[14:0] magnitude in}
    input wire s00_axis_aclk, s00_axis_aresetn,
    input wire s00_axis_tlast, s00_axis_tvalid,
    input wire [C_S00_AXIS_TDATA_WIDTH-1:0] s00_axis_tdata,
    input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1:0] s00_axis_tstrb,
    output logic s00_axis_tready,

    // Ports of Axis Master Bus Interface M00_AXIS
    /*
    m00_axis_tdata = {11'b0, colorburst_trigger, evenodd, [2:0] state, [15:0] magnitude}
    */
    input wire m00_axis_tready,
    output logic m00_axis_tvalid, m00_axis_tlast,
    output logic [C_M00_AXIS_TDATA_WIDTH-1:0] m00_axis_tdata,
    output logic [(C_M00_AXIS_TDATA_WIDTH/8)-1:0] m00_axis_tstrb,

    // VSYNC THRESHOLDS
    input  wire [7:0] vsync_lb,
    input  wire [7:0] vsync_ub,
    input  wire [7:0] vsync_samples_lb,

    // HSYNC THRESHOLDS
    input  wire [7:0] hsync_lb,
    input  wire [7:0] hsync_ub,
    input  wire [7:0] hsync_samples_lb,

    // COLORBURST THRESHOLDS
    input wire [7:0] cb_lb,
    input wire [7:0] cb_ub,
    input wire [7:0] cb_samples_ub,

    // ODDEVEN THRESHOLD,
    input wire [7:0] oddeven_th,
    
    // debug signals
    output logic [4:0] hsync_counter,
    output logic past_hsync_trigger,
    output logic vsync_trigger,
    output logic hsync_trigger,
    output logic in_hsync_range,
    output logic [7:0] hsync_sample_counter,
    output logic in_vsync_range,
    output logic [7:0] vsync_sample_counter,
    output logic in_cb_range,
    output logic [7:0] cb_sample_counter,
    output logic cb_trigger,
    output logic [2:0] state
    
    
);

// VSYNC
//logic in_vsync_range;
//logic [7:0] vsync_sample_counter;
//logic vsync_trigger;

// HSYNC
//logic in_hsync_range;
//logic [7:0] hsync_sample_counter;
//logic hsync_trigger;

// COLOBURST
//logic in_cb_range;
//logic [7:0] cb_sample_counter;
//logic cb_trigger; // cb trigger works differnetly because we want the trigger to occur exactly when the cb ends


logic [15:0] magnitude;
assign magnitude = s00_axis_tdata;

// VSYNC AND HSYNC TRIGGERS ///////////////////////////////////////////////////////

always_comb begin
    in_vsync_range = (magnitude > vsync_lb && magnitude < vsync_ub);
    in_hsync_range = (magnitude > hsync_lb && magnitude < hsync_ub);
    in_cb_range = (magnitude > cb_lb && magnitude < cb_ub);
end

// Trigger signals
assign vsync_trigger = (vsync_sample_counter > vsync_samples_lb);
assign hsync_trigger = (hsync_sample_counter > hsync_samples_lb);


// STATE MACHINE ///////////////////////////////////////////////////////
localparam IDLE = 0;
localparam FRAME_SYNC = 1;
localparam EVENODD = 2;
localparam COLORBURST = 3;
localparam CB_TRIGGER = 4;
localparam DECODE_LINE = 5;

logic odd_even_interlace_parity;
localparam HSYNC_COUNT = 17; // Count 17? hsyncs after vsync before odd/even
logic past_vsync_trigger;


enum {HSYNC_GO, HSYNC_RESET} hsync_counter_state;


always_ff @(posedge s00_axis_aclk) begin
    if (!s00_axis_aresetn) begin
        state <= IDLE;
        vsync_sample_counter <= 0;
        hsync_sample_counter <= 0;
        cb_sample_counter <= 0;
        cb_trigger <= 0;
        odd_even_interlace_parity <= 0;
        hsync_counter <= 0;
        past_hsync_trigger <= 0;
        past_vsync_trigger <= 0;
        hsync_counter_state <= HSYNC_GO;
    end else begin
        if (s00_axis_tvalid && s00_axis_tready) begin
            past_hsync_trigger <= hsync_trigger;
            past_vsync_trigger <= vsync_trigger;
            case (state)
                ////////////////// IDLE ////////////////////////
                IDLE: begin
                    if (in_vsync_range) begin
                        vsync_sample_counter <= vsync_sample_counter + 1;
                    end else begin
                        vsync_sample_counter <= 0;
                    end

                    // Reset counters
                    hsync_sample_counter <= 0;
                    cb_sample_counter <= 0;
                    hsync_counter_state <= HSYNC_GO;


                    // Check for vsync
                    if (vsync_trigger && !past_vsync_trigger) begin
                        state <= FRAME_SYNC;
                        hsync_counter <= 0;
                    end
                end
                ///////////////// FRAME_SYNC ////////////////////
                FRAME_SYNC: begin
                    case (hsync_counter_state)
                        HSYNC_GO: begin
                            if (hsync_trigger && in_hsync_range) begin
                                // Already triggered, go to reset 
                                hsync_counter_state <= HSYNC_RESET;
                                hsync_sample_counter <= 0;
                            end else if (in_hsync_range) begin
                                hsync_sample_counter <= hsync_sample_counter + 1;
                            end else begin
                                hsync_sample_counter <= 0;
                            end
                        end
                        HSYNC_RESET: begin
                            if (!in_hsync_range) begin
                                // Exited hsync range, start counting again
                                hsync_counter_state <= HSYNC_GO;
                                hsync_sample_counter <= 0;
                            end else begin
                                hsync_sample_counter <= 0;
                            end
                        end
                    endcase

                    // Reset other counters
                    vsync_sample_counter <= 0;
                    cb_sample_counter <= 0;

                    // Count hsync pulse
                    if (hsync_trigger && !past_hsync_trigger) begin
                        hsync_counter <= hsync_counter + 1;
                    end

                    // Transition after 17 hsync
                    if (hsync_counter == 17) begin
                        state <= EVENODD;
                        odd_even_interlace_parity <= 1; 
                    end
                end
                /////////////////// EVENODD //////////////////
                EVENODD: begin
                    case (hsync_counter_state)
                        HSYNC_GO: begin
                            if (hsync_trigger && in_hsync_range) begin
                                hsync_counter_state <= HSYNC_RESET;
                                hsync_sample_counter <= 0;
                            end else if (in_hsync_range) begin
                                hsync_sample_counter <= hsync_sample_counter + 1;
                            end else begin
                                hsync_sample_counter <= 0;
                            end
                        end
                        HSYNC_RESET: begin
                            if (!in_hsync_range) begin
                                hsync_counter_state <= HSYNC_GO;
                                hsync_sample_counter <= 0;
                            end else begin
                                hsync_sample_counter <= 0;
                            end
                        end
                    endcase

                    // Reset counters
                    vsync_sample_counter <= 0;
                    cb_sample_counter <= 0;

                    // Check odd/even field
                    if (magnitude < oddeven_th) begin
                        odd_even_interlace_parity <= 0; 
                    end
                    
                    // Wait for 18th hsync- then look for colorburst
                    if (hsync_trigger && !past_hsync_trigger) begin
                        state <= COLORBURST;
                        cb_sample_counter <= 0; 
                        hsync_counter <= 0; 
                    end
                end
                //////////////// COLORBURST ///////////////////////////
                COLORBURST: begin
                    // count cb 
                    if (in_cb_range) begin
                        cb_sample_counter <= cb_sample_counter + 1;
                    end else begin
                        cb_sample_counter <= 0;
                    end

                    // Reset  counters
                    vsync_sample_counter <= 0;
                    hsync_sample_counter <= 0;
                    hsync_counter_state <= HSYNC_GO;

                    // colorburst done
                    if (cb_sample_counter > cb_samples_ub) begin
                        state <= CB_TRIGGER;
                    end
                end
                ///////////////// CB_TRIGGER /////////////////////////
                CB_TRIGGER: begin
                    // Reset all counters
                    vsync_sample_counter <= 0;
                    hsync_sample_counter <= 0;
                    cb_sample_counter <= 0;
                    hsync_counter_state <= HSYNC_GO;

                    // colorburst ends
                    if (!in_cb_range && !cb_trigger) begin
                        cb_trigger <= 1;
                        state <= DECODE_LINE;
                    end
                end
                ///////////////////// DECODE_LINE ////////////////////
                DECODE_LINE: begin
                    cb_trigger <= 0;
                    // vsync counting
                    if (in_vsync_range) begin
                        vsync_sample_counter <= vsync_sample_counter + 1;
                    end else begin
                        vsync_sample_counter <= 0;
                    end

                    // hsync counting
                    case (hsync_counter_state)
                        HSYNC_GO: begin
                            if (hsync_trigger && in_hsync_range) begin
                                hsync_counter_state <= HSYNC_RESET;
                                hsync_sample_counter <= 0;
                            end else if (in_hsync_range) begin
                                hsync_sample_counter <= hsync_sample_counter + 1;
                            end else begin
                                hsync_sample_counter <= 0;
                            end
                        end
                        HSYNC_RESET: begin
                            if (!in_hsync_range) begin
                                hsync_counter_state <= HSYNC_GO;
                                hsync_sample_counter <= 0;
                            end else begin
                                hsync_sample_counter <= 0;
                            end
                        end
                    endcase

                    // Reset counter
                    cb_sample_counter <= 0;

                    if (vsync_trigger && !past_vsync_trigger) begin
                        // New frame 
                        state <= FRAME_SYNC;
                        hsync_counter <= 0;
                    end else if (hsync_trigger && !past_hsync_trigger) begin
                        // New line 
                        state <= COLORBURST;
                        cb_sample_counter <= 0;
                    end
                end
            endcase
        end
    end
end

// AXIS HANDSHAKE STUFF ///////////////////////////////////////////////////////
// Combinational assign - should immediately reflect cb_trigger value
// Bit breakdown: [31:21] = 11'b0, [20] = cb_trigger, [19] = odd_even_interlace_parity,
// [18:16] = state, [15:0] = magnitude
assign m00_axis_tdata = {11'b0, cb_trigger, odd_even_interlace_parity, state, magnitude};

assign s00_axis_tready = m00_axis_tready;

always_ff @(posedge s00_axis_aclk) begin
    if (!s00_axis_aresetn) begin
        m00_axis_tstrb = 0;
        m00_axis_tvalid = 0;
        m00_axis_tlast = 0;
    end else begin
        if (s00_axis_tvalid && s00_axis_tready) begin 
            m00_axis_tvalid <= 1;
            m00_axis_tlast <= s00_axis_tlast;
            m00_axis_tstrb <= s00_axis_tstrb;
        end else if (m00_axis_tvalid && m00_axis_tready) begin 
            m00_axis_tvalid <= 0;
        end
    end
end

endmodule