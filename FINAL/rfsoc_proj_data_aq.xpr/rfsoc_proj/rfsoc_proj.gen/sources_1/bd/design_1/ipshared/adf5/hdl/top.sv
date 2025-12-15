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
		
		input wire [95:0] MMIO_thresholds,
		
		// debug
		output logic [15:0] adc_data_real,
		output logic [15:0] adc_data_imag,
		output logic [15:0] cordic_data_magnitude,
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

    // Split the incoming 32-bit data stream into two 16-bit signed integer data streams.
    assign adc_data_real = s00_axis_tdata[31:16];
    assign adc_data_imag = s00_axis_tdata[15:0];
    
    
    // TEST HARDCODING AXIS VALUES
    assign s00_axis_tready = 1'b1;
    assign m00_axis_tstrb = 14'b11111111111111;
    
    
    // CORDIC //////////////////////////////////////////////////////////////////////////////////

    // Feed the 16-bit filtered/scaled/clipped I/Q data into the CORDIC to calculate its magnitude.
    // feed all axis values into sync_detector
    logic cordic_tvalid;
    logic cordic_tlast;
    logic [31:0] cordic_tdata;

    cordic my_cordic(
        .s00_axis_aclk(s00_axis_aclk),
        .s00_axis_aresetn(s00_axis_aresetn),
        .s00_axis_tlast(s00_axis_tlast),
        .s00_axis_tvalid(s00_axis_tvalid),
        .s00_axis_tdata({s00_axis_tdata[31:16], s00_axis_tdata[15:0]}), // 16-bit real, 16-bit imaginary
        .s00_axis_tstrb(4'b1111),
        .s00_axis_tready(),
        .m00_axis_tready(1'b1),
        .m00_axis_tvalid(cordic_tvalid),
        .m00_axis_tlast(cordic_tlast),
        .m00_axis_tdata(cordic_tdata),
        .m00_axis_tstrb()
    );
    
    assign cordic_data_magnitude = cordic_tdata[15:0];
    
    // HARD-CODED THRESHOLDS FOR TESTING ///////////////////////////////////////////////////////
//     // VSYNC
//     localparam int vsync_lb                 = 169;
//     localparam int vsync_ub                 = 185;
//     localparam int vsync_samples_lb         = 160;
//     // HYSNC
//     localparam int hsync_lb                 = 180;
//     localparam int hsync_ub                 = 199;
//     localparam int hsync_samples_lb         = 35;
//     // COLORBURST
//     localparam int cb_lb                    = 130;
//     localparam int cb_ub                    = 145;
//     localparam int cb_samples_ub            = 23;
//     // ODDEVEN
//     localparam int oddeven_th                = 85;
//     // COLOR LEVEL THRESHOLDS
//     localparam int black_level_default              = 150;
//     localparam int white_level_default              = 40;

    // MMIO SET THRESHOLDS //////////////////////////////////////////////////////////////////////
    // Declarations
    logic [7:0] vsync_lb;
    logic [7:0] vsync_ub;
    logic [7:0] vsync_samples_lb;
    logic [7:0] black_level_default;
    logic [7:0] white_level_default;
    logic [7:0] hsync_lb;
    logic [7:0] hsync_ub;
    logic [7:0] hsync_samples_lb_threshold;
    logic [7:0] cb_lb;
    logic [7:0] cb_ub;
    logic [7:0] cb_samples_ub;
    logic [7:0] oddeven_th;
    // VSYNC THRESHOLDS
    assign vsync_lb          = MMIO_thresholds[7:0];        // ~172
    assign vsync_ub          = MMIO_thresholds[15:8];       // ~185
    assign vsync_samples_lb  = MMIO_thresholds[23:16];      // ~160

    // COLOR LEVEL THRESHOLDS
    assign black_level_default         = MMIO_thresholds[31:24];      // ~150
    assign white_level_default         = MMIO_thresholds[39:32];      // ~40

    // HSYNC THRESHOLDS
    assign hsync_lb          = MMIO_thresholds[47:40];      // default ~184
    assign hsync_ub          = MMIO_thresholds[55:48];      // default ~199
    assign hsync_samples_lb_threshold  = MMIO_thresholds[63:56];      // default ~38

    // COLORBURST THRESHOLDS
    assign cb_lb             = MMIO_thresholds[71:64];      // default ~130
    assign cb_ub             = MMIO_thresholds[79:72];      // default ~145
    assign cb_samples_ub     = MMIO_thresholds[87:80];      // default ~23

    // ODD/EVEN THRESHOLD
    assign oddeven_th        = MMIO_thresholds[95:88];      // default ~85


    // SYNC DETECTOR /////////////////////////////////////////////////////////////////////////////
    logic sync_tvalid;
    logic sync_tlast;
    logic [31:0] sync_tdata;
    
    
    sync_detector_axis sync_detect_0 (
        .s00_axis_aclk(s00_axis_aclk),
        .s00_axis_aresetn(s00_axis_aresetn),
        .s00_axis_tlast(cordic_tlast),
        .s00_axis_tvalid(cordic_tvalid),
        .s00_axis_tdata(cordic_data_magnitude),
        .s00_axis_tstrb(4'b1111),
        .s00_axis_tready(),
        .m00_axis_tready(1'b1), // Connect to DMA ready to propagate backpressure
        .m00_axis_tvalid(sync_tvalid),
        .m00_axis_tlast(sync_tlast),
        .m00_axis_tdata(sync_tdata),
        .m00_axis_tstrb(),
        // THRESHOLDS 
        .vsync_lb(vsync_lb),
        .vsync_ub(vsync_ub),
        .vsync_samples_lb(vsync_samples_lb),
        .hsync_lb(hsync_lb),
        .hsync_ub(hsync_ub),
        .hsync_samples_lb(),
        .cb_lb(cb_lb),
        .cb_ub(cb_ub),
        .cb_samples_ub(cb_samples_ub),
        .oddeven_th(oddeven_th),
        // debug
        .hsync_counter(hsync_counter),
        .past_hsync_trigger(past_hsync_trigger),
        .vsync_trigger(vsync_trigger),
        .hsync_trigger(hsync_trigger),
        .in_hsync_range(in_hsync_range),
        .hsync_sample_counter(hsync_sample_counter),
        .in_vsync_range(in_vsync_range),
        .vsync_sample_counter(vsync_sample_counter),
        .in_cb_range(in_cb_range),
        .cb_sample_counter(cb_sample_counter),
        .cb_trigger(cb_trigger),
        .state(state)

    );

    // VIDEO DECODER //////////////////////////////////////////////////////////////////////////////
    video_data_decoder video_data_decoder_top (
        .s00_axis_aclk(s00_axis_aclk),
        .s00_axis_aresetn(s00_axis_aresetn),
        .s00_axis_tlast(sync_tlast),
        .s00_axis_tvalid(sync_tvalid),
        .s00_axis_tdata(sync_tdata),
        .s00_axis_tstrb(4'b1111),
        .s00_axis_tready(),
        
        .m00_axis_tready(1'b1), // Connect to DMA ready to propagate backpressure
        .m00_axis_tvalid(m00_axis_tvalid),
        .m00_axis_tlast(m00_axis_tlast),
        .m00_axis_tdata(m00_axis_tdata),
        .m00_axis_tstrb(),
        // THRESHOLDS 
        .black_level(black_level_default),
        .white_level(white_level_default)

    );


endmodule



