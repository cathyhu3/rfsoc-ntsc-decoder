/*
two types of hsync:
1. long hsync period after new frame (low sync, high sync, low sync)
2. singular hsync period before each new line (front porch, sync tip, back porch)
*/

module sync_detector_axis #(
    parameter integer C_S00_AXIS_TDATA_WIDTH = 16,
    parameter integer C_M00_AXIS_TDATA_WIDTH = 32
    // // VSYNC
    // parameter integer VSYNC_LB               = 172,
    // parameter integer VSYNC_UB               = 185,
    // parameter integer VSYNC_SAMPLES_LB       = 160,

    // // HSYNC
    // parameter integer HSYNC_LB               = 184,
    // parameter integer HSYNC_UB               = 199,
    // parameter integer HSYNC_SAMPLES_LB       = 38,

    // // COLORBURST
    // parameter integer CB_LB                  = 130,
    // parameter integer CB_UB                  = 145,
    // parameter integer CB_SAMPLES_LB          = 23

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
    input wire m00_axis_aclk, m00_axis_aresetn,
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
    input wire [7:0] oddeven_th

    // // simulation signals
    // output logic colorburst_pulse,
    // output logic odd_even
    // // output logic vsync_pulse,
    // // output logic hsync_pulse,
    // // output logic coloburst_pulse,
    // // output logic [15:0] magnitude
);
// Debug signal to verify cb_trigger is being assigned correctly
// Uncomment to add to waveform for debugging
// (* keep *) logic debug_cb_trigger_bit20;
// assign debug_cb_trigger_bit20 = m00_axis_tdata[20];
// sim stuff
// assign colorburst_pulse = cb_trigger;
// assign odd_even = odd_even_interlace_parity;


// HARD-CODED THRESHOLDS FOR TESTING ///////////////////////////////////////////////////////
// VSYNC
localparam int VSYNC_LB                 = 172;
localparam int VSYNC_UB                 = 185;
localparam int VSYNC_SAMPLES_LB         = 160;
// HYSNC
localparam int HSYNC_LB                 = 182;
localparam int HSYNC_UB                 = 199;
localparam int HSYNC_SAMPLES_LB         = 35;
// COLORBURST
localparam int CB_LB                    = 130;
localparam int CB_UB                    = 145;
localparam int CB_SAMPLES_LB            = 23;
// ODDEVEN
localparam int ODDEVEN_TH                = 85;

// VSYNC
logic in_vsync_range;
logic [7:0] vsync_sample_counter;
logic vsync_trigger;

// HSYNC
logic in_hsync_range;
logic [7:0] hsync_sample_counter;
logic hsync_trigger;

// COLOBURST
logic in_cb_range;
logic [7:0] cb_sample_counter;
logic cb_trigger; // cb trigger works differnetly because we want the trigger to occur exactly when the cb ends


logic [15:0] magnitude;
assign magnitude = s00_axis_tdata;

// VSYNC AND HSYNC TRIGGERS ///////////////////////////////////////////////////////

always_comb begin
    in_vsync_range = (magnitude > vsync_lb && magnitude < vsync_ub);
    in_hsync_range = (magnitude > hsync_lb && magnitude < hsync_ub);
    in_cb_range = (magnitude > cb_lb && magnitude < cb_ub);
end

assign vsync_trigger = (vsync_sample_counter > vsync_samples_lb); // not a single cycle high (doesn't have to be)
assign hsync_trigger = (hsync_sample_counter > hsync_samples_lb); // single cycle high

// for testing
// always_comb begin
//     in_vsync_range = (magnitude > VSYNC_LB && magnitude < VSYNC_UB);
//     in_hsync_range = (magnitude > HSYNC_LB && magnitude < HSYNC_UB);
//     in_cb_range = (magnitude > CB_LB && magnitude < CB_UB);
// end

// assign vsync_trigger = (vsync_sample_counter > VSYNC_SAMPLES_LB); // not a single cycle high (doesn't have to be)
// assign hsync_trigger = (hsync_sample_counter > HSYNC_SAMPLES_LB); // single cycle high

enum {RESET, GO} hsync_counter_state;

always_ff @(posedge s00_axis_aclk) begin
    if (!s00_axis_aresetn) begin
        vsync_sample_counter <= 0;
        hsync_sample_counter <= 0;
        hsync_counter_state <= GO;
    end else begin
        if (in_vsync_range) begin
            vsync_sample_counter <= vsync_sample_counter + 1;
        end else begin
            vsync_sample_counter <= 0;
        end

        case (hsync_counter_state)
            GO: begin
                if (hsync_trigger && in_hsync_range) begin // if we've already triggered and still in the hsync range, go to reset state
                    hsync_counter_state <= RESET;
                    hsync_sample_counter <= 0;
                end else if (in_hsync_range) begin
                    hsync_sample_counter <= hsync_sample_counter + 1;
                end else begin
                    hsync_sample_counter <= 0;
                end
            end
            RESET: begin
                if (!in_hsync_range) begin // only start counting again when we exited the previous hsync region
                    hsync_counter_state <= GO;
                    hsync_sample_counter <= 0;
                end
            end
        endcase
    end
end


// STATE MACHINE ///////////////////////////////////////////////////////
logic [2:0] state;
localparam IDLE = 0;
localparam FRAME_SYNC = 1;
localparam EVENODD = 2;
localparam COLORBURST = 3;
localparam CB_TRIGGER = 4;
localparam DECODE_LINE = 5;

logic odd_even_interlace_parity;
logic check_evenodd;
logic [3:0] hsync_counter;
localparam HSYNC_COUNT = 11;
// assign check_evenodd = (hsync_counter == HSYNC_COUNT-1);
logic past_hsync_trigger;

always_ff @(posedge s00_axis_aclk) begin
    if (!s00_axis_aresetn) begin
        state <= IDLE;
        cb_sample_counter <= 0;
        cb_trigger <= 0;
        odd_even_interlace_parity <= 0;
    end else begin
        if (s00_axis_tvalid && s00_axis_tready) begin
            past_hsync_trigger <= hsync_trigger;
            case (state)
                IDLE: begin
                    state <= (vsync_trigger) ? FRAME_SYNC : IDLE;
                    hsync_counter <= 0;
                end
                FRAME_SYNC: begin
                    hsync_counter <= (hsync_trigger && !past_hsync_trigger) ? hsync_counter + 1 : hsync_counter;
                    state <= (hsync_counter == 11) ? EVENODD : FRAME_SYNC;
                    odd_even_interlace_parity <= 1; // first assume even
                end
                EVENODD: begin // between the 11th and 12th hsync line
                    // if (magnitude < ODDEVEN_TH) begin
                    // if (magnitude < oddeven_th) begin
                    //     odd_even_interlace_parity <= 0; // if it ever goes below 71 threshold it's odd
                    // end
                    if (hsync_trigger && !past_hsync_trigger) begin
                        state <= COLORBURST;
                        // state <= IDLE;
                    end else if (magnitude < oddeven_th) begin
                        odd_even_interlace_parity <= 0; // if it ever goes below 71 threshold it's odd
                    end
                end
                COLORBURST: begin
                    // if (cb_sample_counter > CB_SAMPLES_LB) begin
                    if (cb_sample_counter > cb_samples_ub) begin
                        cb_sample_counter <= 0;
                        state <= CB_TRIGGER;
                    end else if (in_cb_range) begin
                        cb_sample_counter <= cb_sample_counter + 1;
                    end
                end
                CB_TRIGGER: begin
                    if (!in_cb_range && !cb_trigger) begin
                        cb_trigger <= 1;
                        state <= DECODE_LINE;
                    end
                end
                DECODE_LINE: begin
                    cb_trigger <= 0;
                    if (vsync_trigger) begin
                        state <= FRAME_SYNC;
                    end else if (hsync_trigger) begin
                        state <= COLORBURST;
                    end
                end
            endcase
        end
    end
end

// AXIS HANDSHAKE STUFF ///////////////////////////////////////////////////////
// Combinational assign - should immediately reflect cb_trigger value
// Bit breakdown: [31:21] = 11'b0, [20] = cb_trigger, [19] = odd_even_interlace_parity, 
//                [18:16] = state, [15:0] = magnitude
assign m00_axis_tdata = {11'b0, cb_trigger, odd_even_interlace_parity, state, magnitude};

assign s00_axis_tready = m00_axis_tready;

always_ff @(posedge s00_axis_aclk) begin
    if (!s00_axis_aresetn) begin
        m00_axis_tstrb = 0;
        m00_axis_tvalid = 0;
        m00_axis_tlast = 0;
    end else begin
        if (s00_axis_tvalid && s00_axis_tready) begin // input handshake
            m00_axis_tvalid <= 1;
            m00_axis_tlast <= s00_axis_tlast;
            m00_axis_tstrb <= s00_axis_tstrb;
        end else if (m00_axis_tvalid && m00_axis_tready) begin // output handshake (data has been transferred)
            m00_axis_tvalid <= 0;
        end
    end
end

endmodule