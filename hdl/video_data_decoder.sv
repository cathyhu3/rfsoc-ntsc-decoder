`default_nettype none
`timescale 1 ns / 1 ps

module video_data_decoder #
	(
        parameter integer C_S00_AXIS_TDATA_WIDTH = 32, // 32-bit magnitude in (from CORDIC)
        parameter integer C_M00_AXIS_TDATA_WIDTH = 32, //21-bit zeros + 1-bit odd/even interlacicing + 1-bit hsync + 1-bit vsync 8-bit luma value

        // ---- NTSC / sampling parameters ----
        parameter integer ACTIVE_SAMPLES_PER_LINE = 421, // 8 MHz sample rate * 52.6 us ≈ 421 samples of active video per line
        parameter integer PIXELS_PER_LINE = 421, // were just going to use every sample we get from the line - python will rescale the frame to display 
        parameter integer SAMPLES_PER_PIXEL = ACTIVE_SAMPLES_PER_LINE / PIXELS_PER_LINE 
	)
	(
		// Ports of Axi Slave Bus Interface S00_AXIS
		input wire  s00_axis_aclk, s00_axis_aresetn,
		input wire  s00_axis_tlast, s00_axis_tvalid,
		input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata, // {11'b0, colorburst_trigger, evenodd, state, magnitude}
		input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1: 0] s00_axis_tstrb,
		output logic  s00_axis_tready,

		// Ports of Axi Master Bus Interface M00_AXIS
		input wire  m00_axis_tready,
		output logic  m00_axis_tvalid, m00_axis_tlast,
		output logic [C_M00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata, // outputs 8 bit luminance value
		output logic [(C_M00_AXIS_TDATA_WIDTH/8)-1: 0] m00_axis_tstrb,

        // threshold inputs - Programmable black / white levels (in same units as magnitude)
        // 150 for black, 40 for white
        input  wire [7:0]  black_level,
        input  wire [7:0]  white_level
	);

    // pixel in line counter
    localparam integer LINE_SAMPLE_COUNTER_WIDTH  = $clog2(ACTIVE_SAMPLES_PER_LINE+1);
    logic [LINE_SAMPLE_COUNTER_WIDTH-1:0]   line_sample_count; // counts samples within this active line

    // break up input data into individual signals {19'b0, start_decode_trigger, odd_even_interlace_parity, state, magnitude}
    logic [15:0] magnitude;
    logic [2:0] state;
    logic start_decode_trigger;
    logic odd_even_interlace_parity;
    assign magnitude = s00_axis_tdata[15:0];
    assign state = s00_axis_tdata[18:16];
    assign odd_even_interlace_parity = s00_axis_tdata[19];
    assign start_decode_trigger = s00_axis_tdata[20];
    
    // values to pipeline out through tdata {19'b0, trigger, oddeven, state_val, y}
    logic trigger;
    logic oddeven;
    logic [2:0] state_val;
    logic [7:0] y;

    // AXI4-Stream handshake signals
    assign s00_axis_tready = m00_axis_tready;
    assign m00_axis_tdata = {18'b0, trigger, oddeven, state_val, y};
    
//    assign m00_axis_tvalid = 1;
//    assign m00_axis_tstrb = s00_axis_tstrb;
//    assign m00_axis_tlast = s00_axis_tlast;


    // FSM stuff
    typedef enum logic {IDLE, DECODE} fsm_state_t;
    fsm_state_t fsm;

    always_ff @(posedge s00_axis_aclk) begin
        
        if (!s00_axis_aresetn) begin

            line_sample_count  <= 0;
            fsm <= IDLE;

            trigger <= 0;
            oddeven <= 0;
            state_val <= 0;
            y <= 0;

//            m00_axis_tstrb <= 0;
//            m00_axis_tlast <= 0;    
//            m00_axis_tvalid <= 0;

        end else begin


            if (s00_axis_tvalid && s00_axis_tready) begin

//                m00_axis_tvalid <= 1;
//                m00_axis_tstrb <= s00_axis_tstrb;
//                m00_axis_tlast <= s00_axis_tlast;

                case (fsm)

                    IDLE: begin
                        oddeven <= odd_even_interlace_parity;
                        state_val <= state;

                        if (start_decode_trigger) begin
                            fsm <= DECODE;                                  // transition to decode state
                            line_sample_count <= line_sample_count + 1;     // increment counter
                            trigger <= 1;  
                            if (magnitude < black_level && magnitude > white_level) begin
//                                y <= 256 * (magnitude - white_level) / (black_level - white_level); // map cordic magnitude to 8-bit (0-255)
                                  y <= (magnitude-40) << 1;
                            end
                            else begin
                                y <= 0; // set to black
                            end
                        end

                        else begin
                            line_sample_count <= 0; // reset counter
                            trigger <= 0;
                            y <= 0; // set to black
                        end
                    end

                    DECODE: begin
                        oddeven <= odd_even_interlace_parity;
                        state_val <= state;
                        trigger <= 0;

                        if (line_sample_count < ACTIVE_SAMPLES_PER_LINE-1) begin
                            line_sample_count <= line_sample_count + 1;
                            if (magnitude < black_level && magnitude > white_level) begin
//                                y <= 256 * (magnitude - white_level) / (black_level - white_level); // map cordic magnitude to 8-bit (0-255)
                                    y <= (magnitude-40) << 1;
                            end
                            else begin
                                y <= 0; // set to black
                            end
                        end 
                        
                        // collected all 421 pixels
                        else begin
                            line_sample_count <= 0;
                            fsm <= IDLE;
                            y <= 0; // set to black
                        end
                    end

                    default: begin
                        fsm <= IDLE;
                    end
                endcase
            end
        end
    end
    
    
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


