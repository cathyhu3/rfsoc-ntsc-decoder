
`timescale 1 ns / 1 ps

	module top_wrapper #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXIS
		parameter integer C_S00_AXIS_TDATA_WIDTH	= 32,

		// Parameters of Axi Master Bus Interface M00_AXIS
		parameter integer C_M00_AXIS_TDATA_WIDTH	= 32
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXIS
		input wire  s00_axis_aclk,
		input wire  s00_axis_aresetn,
		output wire  s00_axis_tready,
		input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
		input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] s00_axis_tstrb,
		input wire  s00_axis_tlast,
		input wire  s00_axis_tvalid,

		// Ports of Axi Master Bus Interface M00_AXIS
		input wire  m00_axis_aclk,
		input wire  m00_axis_aresetn,
		output wire  m00_axis_tvalid,
		output wire [C_M00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
		output wire [(C_M00_AXIS_TDATA_WIDTH/8)-1 : 0] m00_axis_tstrb,
		output wire  m00_axis_tlast,
		input wire  m00_axis_tready,
		
		input wire [95:0] MMIO_thresholds,
		
//		input wire thresholded_data_debug,
//		output wire [31:0] raw_data_debug

        //debug signals
        output wire [15:0] cordic_magnitude,
        
        // debug signals
        output wire [3:0] hsync_counter,
        output wire past_hsync_trigger,
        output wire vsync_trigger,
        output wire hsync_trigger,
        output wire in_hsync_range,
        output wire [7:0] hsync_sample_counter,
        output wire in_vsync_range,
        output wire [7:0] vsync_sample_counter,
        output wire in_cb_range,
        output wire [7:0] cb_sample_counter,
        output wire cb_trigger,
        output wire [2:0] state    
	);

    //assign raw_data_debug = {16'b0, s00_axis_tdata[15:0]};

    

	// Add user logic here
    top my_top(
        .s00_axis_aclk(s00_axis_aclk),
        .s00_axis_aresetn(s00_axis_aresetn),
		.s00_axis_tlast(s00_axis_tlast),
		.s00_axis_tvalid(s00_axis_tvalid),
		.s00_axis_tdata(s00_axis_tdata),
		.s00_axis_tstrb(s00_axis_tstrb),
		.s00_axis_tready(s00_axis_tready),

		.m00_axis_aclk(m00_axis_aclk),
		.m00_axis_aresetn(m00_axis_aresetn),
		.m00_axis_tready(m00_axis_tready),
		.m00_axis_tvalid(m00_axis_tvalid),
		.m00_axis_tlast(m00_axis_tlast),
		.m00_axis_tdata(m00_axis_tdata),
		.m00_axis_tstrb(m00_axis_tstrb),
		
		.MMIO_thresholds(MMIO_thresholds),
		
		// debug
		.cordic_magnitude(cordic_magnitude),
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

//        .preamble_coeffs(4096'h101010101010101010101010101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000001010101010101010101010101010101010101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010101010101010101010101010101010101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000101010101010101010101010101010101010101010101010101010101010101),
//        .lowpass_coeffs(600'h100000000000000fffffffffefefefefefefefefeffff0000010203040506070708090909090909090807070605040302010000fffffefefefefefefefefeffffffff0000000000000001),
//        .preamble_detector_threshold(32'd2000),
//        .decoder_threshold(32'd20),
//        .thresholded_data_debug(thresholded_data_debug)
    );
	// User logic ends

	endmodule