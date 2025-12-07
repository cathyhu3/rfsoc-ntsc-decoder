`default_nettype none
`timescale 1 ns / 1 ps

module top #
	(
		parameter integer C_S00_AXIS_TDATA_WIDTH	= 32,
		parameter integer C_M00_AXIS_TDATA_WIDTH	= 32
	)
	(

		// Ports of Axi Slave Bus Interface S00_AXIS
        // Streams in low passed I/Q data (I and Q are each 16 bit signed, packed into 32 bit stream).
		input wire  s00_axis_aclk, s00_axis_aresetn,
		input wire  s00_axis_tlast, s00_axis_tvalid,
		input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
		input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1: 0] s00_axis_tstrb,
		output logic  s00_axis_tready,

		// Ports of Axi Master Bus Interface M00_AXIS
        // Outputs 32-bit encoder. Ignores downstream ready signal
        // because the next thing is a FIFO that should always be ready (also
        // we don't care about losing a squitter occasionally).
		input wire  m00_axis_aclk, m00_axis_aresetn,
		input wire  m00_axis_tready,
		output logic  m00_axis_tvalid, m00_axis_tlast,
		output logic [C_M00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
		output logic [(C_M00_AXIS_TDATA_WIDTH/8)-1: 0] m00_axis_tstrb,

        input wire [184:0] MMIO_thresholds //TODO minimum 152 bit bus size (19*8-bit 0->255 thresholds) | 184 (4 more extra)
	);

    assign s00_axis_tready = m00_axis_tready;

    // Split the incoming 32-bit data stream into two 16-bit signed integer data streams.
    logic signed [15:0] adc_data_real;
    logic signed [15:0] adc_data_imag;
    assign adc_data_real = s00_axis_tdata[31:16];
    assign adc_data_imag = s00_axis_tdata[15:0];

    // Split the incoming MMIO thresholds (8-bits each, 0–255 for level thresholds)
    // VSYNC THRESHOLDS
    localparam vsync_low_threshold               = MMIO_thresholds[7:0];       // default ~172
    localparam vsync_high_threshold              = MMIO_thresholds[15:8];      // default ~185
    localparam vsync_region_length_low_threshold = MMIO_thresholds[23:16];     // default ~200

    // COLOR LEVEL THRESHOLDS
    localparam black_level_default               = MMIO_thresholds[31:24];     // default ~150
    localparam white_level_default               = MMIO_thresholds[39:32];     // default ~40

    // HSYNC THRESHOLDS
    localparam hsync_threshold_lower_ls          = MMIO_thresholds[47:40];     // default ~128 (LOWER_LS)
    localparam hsync_threshold_upper_ls          = MMIO_thresholds[55:48];     // default ~136 (UPPER_LS)
    localparam hsync_threshold_lower_hs          = MMIO_thresholds[63:56];     // default ~184 (LOWER_HS)
    localparam hsync_threshold_upper_hs          = MMIO_thresholds[71:64];     // default ~190 (UPPER_HS)
    localparam hsync_threshold_lower_vd          = MMIO_thresholds[79:72];     // default ~75  (LOWER_VD)
    localparam hsync_threshold_upper_vd          = MMIO_thresholds[87:80];     // default ~100 (UPPER_VD)
    localparam hsync_threshold_lower_fp          = MMIO_thresholds[95:88];     // default ~133 (LOWER_FP)
    localparam hsync_threshold_upper_fp          = MMIO_thresholds[103:96];    // default ~138 (UPPER_FP)
    localparam hsync_threshold_lower_st          = MMIO_thresholds[111:104];   // default ~184 (LOWER_ST)
    localparam hsync_threshold_upper_st          = MMIO_thresholds[119:112];   // default ~192 (UPPER_ST)
    localparam hsync_threshold_lower_bp          = MMIO_thresholds[127:120];   // default ~134 (LOWER_BP)
    localparam hsync_threshold_upper_bp          = MMIO_thresholds[135:128];   // default ~142 (UPPER_BP)
    localparam hsync_threshold_lower_eq          = MMIO_thresholds[143:136];   // default ~135 (LOWER_EQ)
    localparam hsync_threshold_upper_eq          = MMIO_thresholds[151:144];   // default ~142 (UPPER_EQ)

    // Feed the 16-bit filtered/scaled/clipped I/Q data into the CORDIC to calculate its magnitude.
    logic cordic_tvalid;
    logic cordic_tlast;
    logic [C_S00_AXIS_TDATA_WIDTH-1:0] cordic_tdata;
    logic [(C_S00_AXIS_TDATA_WIDTH/8)-1:0] cordic_tstrb;
    cordic my_cordic(
        .s00_axis_aclk(s00_axis_aclk),
        .s00_axis_aresetn(s00_axis_aresetn),
        .s00_axis_tlast(1'b0),
        .s00_axis_tvalid(s00_axis_tvalid),
        .s00_axis_tdata({s00_axis_tdata[31:16], s00_axis_tdata[15:0]}), // 16-bit real, 16-bit imaginary
        .s00_axis_tstrb(4'b1111),
        .s00_axis_tready(),
        .m00_axis_tready(1'b1),
        .m00_axis_tvalid(cordic_tvalid),
        .m00_axis_tlast(cordic_tlast),
        .m00_axis_tdata(cordic_tdata),
        .m00_axis_tstrb(cordic_tstrb)
    );

    logic [15:0] cordic_magnitude;
    assign cordic_magnitude = cordic_tdata[15:0]; // Bottom 16 bits are the magnitude, top 16 bits are the angle (which we don't care about for AM).


    logic vsync_detector_trigger;
    // single cycle high at falling edge of every vsync pulse
    vsync_detector #(.C_S00_AXIS_TDATA_WIDTH(C_S00_AXIS_TDATA_WIDTH)) vsync_detector_top (
        .s00_axis_aclk(s00_axis_aclk),
        .s00_axis_aresetn(s00_axis_aresetn),
        .s00_axis_tlast(cordic_tlast),
        .s00_axis_tvalid(cordic_tvalid),
        .s00_axis_tdata({16'b0, cordic_magnitude}),
        .s00_axis_tstrb(cordic_tstrb),
        .s00_axis_tready(),
        .trigger(vsync_detector_trigger), //output
        //vsync thresholds coming from AXI-Lite regs
        .low_threshold_vsync(vsync_low_threshold),
        .high_threshold_vsync(vsync_high_threshold),
        .low_vsync_region_length_threshold(vsync_region_length_low_threshold)
	);

    logic hsync_detector_trigger;
    logic colorburst_detector_trigger;
    logic [15:0] colorburst_black_ref; //black level from hsync
    hsync_detector #(.MAG_WIDTH(16)) hsync_detector_top (
        .s00_axis_aclk   (s00_axis_aclk),
        .s00_axis_aresetn(s00_axis_aresetn),
        .s00_axis_tlast  (cordic_tlast),
        .s00_axis_tvalid (cordic_tvalid),
        .s00_axis_tdata  ({16'b0, cordic_magnitude}),
        .s00_axis_tstrb  (cordic_tstrb),
        .s00_axis_tready (),
        // outputs
        .hsync_pulse(hsync_detector_trigger),
        .cb_pulse(colorburst_detector_trigger),
        .colorburst_val(colorburst_black_ref),
        // hsync thresholds coming from AXI-Lite regs
        .lower_ls (hsync_threshold_lower_ls),
        .upper_ls (hsync_threshold_upper_ls),
        .lower_hs (hsync_threshold_lower_hs),
        .upper_hs (hsync_threshold_upper_hs),
        .lower_vd (hsync_threshold_lower_vd),
        .upper_vd (hsync_threshold_upper_vd),
        .lower_fp (hsync_threshold_lower_fp),
        .upper_fp (hsync_threshold_upper_fp),
        .lower_st (hsync_threshold_lower_st),
        .upper_st (hsync_threshold_upper_st),
        .lower_bp (hsync_threshold_lower_bp),
        .upper_bp (hsync_threshold_upper_bp),
        .lower_eq (hsync_threshold_lower_eq),
        .upper_eq (hsync_threshold_upper_eq),
        .m00_axis_aclk   (),
        .m00_axis_aresetn(),
        .m00_axis_tlast  (),
        .m00_axis_tvalid (),
        .m00_axis_tdata  (),
        .m00_axis_tstrb  (),
        .m00_axis_tready ()
    );


    //TODO INSERT FSM HERE #################
    // uses detector vals: cordic_magnitude, vsync_detector_trigger, hsync_detector_trigger, colorburst_detector_trigger, colorburst_black_ref
    // outputs to decoder: odd_even_interlace_parity
    // outputs of toplevel to framebuffer: state 
    
    logic [3:0] hsync_counter;
    logic [3:0] vsync_counter;

    // logic vsync_falling_edge_trigger; //set using FSM (pulse when the vsync period at the end of each frame ends)
    logic check_evenodd; //set using FSM (pulse when the hsync period at thes start of each frame ends)
    logic odd_even_interlace_parity; //set using FSM (tells )
    logic decodeline_trigger;


    localparam HSYNC_COUNT = 11;
    // localparam VSYNC_COUNT = 5;

    assign check_evenodd = (hsync_counter == HSYNC_COUNT-1);

    enum {IDLE, FRAME_SYNC, EVENODD, DECODE_LINE} state;

    //END FSM HERE #################
    always_ff @(s00_axis_aclk) begin
        if (!s00_axis_aresetn) begin
            state <= IDLE;
        end else begin
            if (s00_axis_tvalid && s00_axis_tready) begin
                case (state)
                    IDLE: begin
                        state <= (vsync_detector_trigger) ? FRAME_SYNC;
                        hsync_counter <= 0;
                    end
                    FRAME_SYNC: begin
                        hsync_counter <= (hsync_detector_trigger) ? hsync_counter + 1;
                        state <= (check_evenodd) ? STARTLINE_EVENODD;
                        odd_even_interlace_parity <= 1; // first assume even
                    end
                    EVENODD: begin // between the 11th and 12th hsync line
                        if (cordic_magnitude < 71) begin
                            odd_even_interlace_parity <= 0; // if it ever goes below 71 threshold it's odd
                        end
                        
                        if (colorburst_detector_trigger) begin
                            state <= DECODE_LINE;
                        end
                    end
                    DECODE_LINE: state <= (vsync_detector_trigger) ? FRAME_SYNC;
                endcase
            end
        end
    end

     // State machine that starts decoding pixels from the magnitude data
    video_data_decoder #(.ACTIVE_SAMPLES_PER_LINE(421)) video_data_decoder_top(
        .s00_axis_aclk(s00_axis_aclk),
        .s00_axis_aresetn(s00_axis_aresetn),
        .s00_axis_tlast(s00_axis_tlast),
        .s00_axis_tvalid(s00_axis_tvalid),
        .s00_axis_tdata({16'b0, cordic_magnitude}),
        .s00_axis_tstrb(s00_axis_tstrb),
        //sync detector inputs
        // .hsync(check_evenodd),
        // .vsync(vsync_falling_edge_trigger),
        .state(state),
        .start_decode_trigger(colorburst_detector_trigger),
        .odd_even_interlace_parity(odd_even_interlace_parity),
        //threshold inputs
        .black_level(colorburst_black_ref), // NOTE: if not working hardcode using "black_level_default" from MMIO
        .white_level(white_level_default),
        // AXI master out
        .m00_axis_tdata(m00_axis_tdata), //32 bit encoded data to FIFO [0....0, odd/even bit, hsync, vsync, 8-bit luma value]
        .m00_axis_tvalid(m00_axis_tvalid),
        .m00_axis_tlast(m00_axis_tlast),
        .m00_axis_tstrb(m00_axis_tstrb)
    );



endmodule
