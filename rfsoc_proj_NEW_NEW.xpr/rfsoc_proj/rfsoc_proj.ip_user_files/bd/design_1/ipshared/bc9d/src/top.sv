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

        input wire [95:0] MMIO_thresholds //TODO 8*32-bit registers, 8bit (0->255) thresholds 
	);

//    logic tlast_reg;
//    assign m00_axis_tlast = tlast_reg;
                            
    logic [18:0] count;
    localparam CURRCOUNT = 19'd65535;  // 2^16 - 1
    
    
    always @(posedge s00_axis_aclk)begin
       if (s00_axis_aresetn==0)begin
           count <= 0;
       end else begin
           if (m00_axis_tvalid && m00_axis_tready) begin
               if (count == CURRCOUNT) begin
                   count <= 0;
               end else begin
                   count <= count + 1;
               end
           end
       end
    end

    assign m00_axis_tlast = (count == (CURRCOUNT - 1));
    //assign s00_axis_tready = m00_axis_tready;

    // Split the incoming 32-bit data stream into two 16-bit signed integer data streams.
    logic signed [15:0] adc_data_real;
    logic signed [15:0] adc_data_imag;
    assign adc_data_real = s00_axis_tdata[31:16];
    assign adc_data_imag = s00_axis_tdata[15:0];

    // Split the incoming MMIO thresholds (8-bits each, 0-255 for level thresholds)
    // VSYNC THRESHOLDS
    logic [7:0] vsync_lb_threshold;
    logic [7:0] vsync_ub_threshold;
    logic [7:0] vsync_samples_lb_threshold;

    // COLOR LEVEL THRESHOLDS
    logic [7:0] black_level_default;
    logic [7:0] white_level_default;

    // HSYNC THRESHOLDS
    logic [7:0] hsync_lb_threshold;
    logic [7:0] hsync_ub_threshold;
    logic [7:0] hsync_samples_lb_threshold;

    //colorburst threshold
    logic [7:0] cb_lb_threshold;
    logic [7:0] cb_ub_threshold;
    logic [7:0] cb_samples_ub_threshold;

    //odd/even threshold
    logic [7:0] oddeven_th_threshold;

    // VSYNC THRESHOLDS
    assign vsync_lb_threshold          = MMIO_thresholds[7:0];        // ~172
    assign vsync_ub_threshold          = MMIO_thresholds[15:8];       // ~185
    assign vsync_samples_lb_threshold  = MMIO_thresholds[23:16];      // ~160

    // COLOR LEVEL THRESHOLDS
    assign black_level_default         = MMIO_thresholds[31:24];      // ~150
    assign white_level_default         = MMIO_thresholds[39:32];      // ~40

    // HSYNC THRESHOLDS
    assign hsync_lb_threshold          = MMIO_thresholds[47:40];      // default ~184
    assign hsync_ub_threshold          = MMIO_thresholds[55:48];      // default ~199
    assign hsync_samples_lb_threshold  = MMIO_thresholds[63:56];      // default ~38

    // COLORBURST THRESHOLDS
    assign cb_lb_threshold             = MMIO_thresholds[71:64];      // default ~130
    assign cb_ub_threshold             = MMIO_thresholds[79:72];      // default ~145
    assign cb_samples_ub_threshold     = MMIO_thresholds[87:80];      // default ~23

    // ODD/EVEN THRESHOLD
    assign oddeven_th_threshold        = MMIO_thresholds[95:88];      // default ~85

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
        .s00_axis_tready(s00_axis_tready),
        .m00_axis_tready(s00_tready_sync),
        .m00_axis_tvalid(cordic_tvalid),
        .m00_axis_tlast(cordic_tlast),
        .m00_axis_tdata(cordic_tdata),
        .m00_axis_tstrb(cordic_tstrb)
    );

    logic [15:0] cordic_magnitude;
    assign cordic_magnitude = cordic_tdata[15:0]; // Bottom 16 bits are the magnitude, top 16 bits are the angle (which we don't care about for AM).

    logic s00_tready_sync;
    logic sync_tvalid;
    logic sync_tlast;
    logic [31:0] sync_tdata;
    logic sync_tstrb;
    logic sync_tready;
    sync_detector_axis sync_detect_0 (
        .s00_axis_aclk(s00_axis_aclk),
        .s00_axis_aresetn(s00_axis_aresetn),
        .s00_axis_tlast(cordic_tlast),
        .s00_axis_tvalid(cordic_tvalid),
        .s00_axis_tdata(cordic_magnitude),
        .s00_axis_tstrb(2'b11),
        .s00_axis_tready(s00_tready_sync),
        .m00_axis_tready(sync_tready), // Connect to DMA ready to propagate backpressure
        .m00_axis_tvalid(sync_tvalid),
        .m00_axis_tlast(sync_tlast),
        .m00_axis_tdata(sync_tdata),
        .m00_axis_tstrb(),
        //vsync thresholds
        .vsync_lb(vsync_lb_threshold),
        .vsync_ub(vsync_ub_threshold),
        .vsync_samples_lb(vsync_samples_lb_threshold),
        //hsync thresholds
        .hsync_lb(hsync_lb_threshold),
        .hsync_ub(hsync_ub_threshold),
        .hsync_samples_lb(hsync_samples_lb_threshold),
        //colorburst threshold
        .cb_lb(cb_lb_threshold),
        .cb_ub(cb_ub_threshold),
        .cb_samples_ub(cb_samples_ub_threshold),
        //odd/even
        .oddeven_th(oddeven_th_threshold)

    );

    // logic [15:0] colorburst_black_ref; //black level from hsync
    // assign colorburst_black_ref = sync_tdata[15:0];
     // State machine that starts decoding pixels from the magnitude data
    video_data_decoder #(.ACTIVE_SAMPLES_PER_LINE(421)) video_data_decoder_top(
        .s00_axis_aclk(s00_axis_aclk),
        .s00_axis_aresetn(s00_axis_aresetn),
        .s00_axis_tlast(sync_tlast), // Connect to sync_detector's tlast, not top-level
        .s00_axis_tvalid(sync_tvalid),
        // .s00_axis_tdata({16'b0, cordic_magnitude}),
        .s00_axis_tdata(sync_tdata),
        .s00_axis_tstrb(4'b1111),
        .s00_axis_tready(sync_tready),
        //threshold inputs
        //.black_level(colorburst_black_ref), // NOTE: if not working hardcode using "black_level_default" from MMIO
        .black_level(black_level_default),//"black_level_default" from MMIO TODO CHANGE TO 8BITS IN VIDEO DATA DECODER
        .white_level(white_level_default),
        // AXI master out
        .m00_axis_tready(m00_axis_tready),
        .m00_axis_tdata(m00_axis_tdata), //32 bit encoded data to FIFO [0....0, odd/even bit, hsync, vsync, 8-bit luma value]
        .m00_axis_tvalid(m00_axis_tvalid),
        .m00_axis_tlast(),
        //.m00_axis_tlast(m00_axis_tlast),
        .m00_axis_tstrb(m00_axis_tstrb)
    );



endmodule


//`default_nettype none
//`timescale 1 ns / 1 ps

//module top #
//	(
//		parameter integer C_S00_AXIS_TDATA_WIDTH	= 32,
//		parameter integer C_M00_AXIS_TDATA_WIDTH	= 32
//	)
//	(

//		// Ports of Axi Slave Bus Interface S00_AXIS
//        // Streams in low passed I/Q data (I and Q are each 16 bit signed, packed into 32 bit stream).
//		input wire  s00_axis_aclk, s00_axis_aresetn,
//		input wire  s00_axis_tlast, s00_axis_tvalid,
//		input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
//		input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1: 0] s00_axis_tstrb,
//		output logic  s00_axis_tready,

//		// Ports of Axi Master Bus Interface M00_AXIS
//        // Outputs 32-bit encoder. Ignores downstream ready signal
//        // because the next thing is a FIFO that should always be ready (also
//        // we don't care about losing a squitter occasionally).
//		input wire  m00_axis_aclk, m00_axis_aresetn,
//		input wire  m00_axis_tready,
//		output logic  m00_axis_tvalid, m00_axis_tlast,
//		output logic [C_M00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
//		output logic [(C_M00_AXIS_TDATA_WIDTH/8)-1: 0] m00_axis_tstrb,

//        input wire [95:0] MMIO_thresholds //TODO 8*32-bit registers, 8bit (0->255) thresholds 
//	);

//    logic tlast_reg;
//    assign m00_axis_tlast = tlast_reg;
                            
//    logic [18:0] count;
//    localparam curr_count = 19'd65535;  // 2^16 - 1
    
    
//    always @(posedge s00_axis_aclk)begin
//       if (s00_axis_aresetn==0)begin
//           count <= 0;
//           tlast_reg <= 0;
//       end else begin
//           tlast_reg <= 0;
//           if (m00_axis_tvalid) begin
//               if (count == (curr_count - 1)) begin
//                   tlast_reg <= 1;
//                   count <= count + 1;
//               end else if (count == curr_count) begin
//                   count <= 0;
//               end else begin
//                   count <= count + 1;
//               end
//           end
//       end
//    end

//    //assign s00_axis_tready = m00_axis_tready;

//    // Split the incoming 32-bit data stream into two 16-bit signed integer data streams.
//    logic signed [15:0] adc_data_real;
//    logic signed [15:0] adc_data_imag;
//    assign adc_data_real = s00_axis_tdata[31:16];
//    assign adc_data_imag = s00_axis_tdata[15:0];

//    // Split the incoming MMIO thresholds (8-bits each, 0-255 for level thresholds)
//    // VSYNC THRESHOLDS
//    logic [7:0] vsync_lb_threshold;
//    logic [7:0] vsync_ub_threshold;
//    logic [7:0] vsync_samples_lb_threshold;

//    // COLOR LEVEL THRESHOLDS
//    logic [7:0] black_level_default;
//    logic [7:0] white_level_default;

//    // HSYNC THRESHOLDS
//    logic [7:0] hsync_lb_threshold;
//    logic [7:0] hsync_ub_threshold;
//    logic [7:0] hsync_samples_lb_threshold;

//    //colorburst threshold
//    logic [7:0] cb_lb_threshold;
//    logic [7:0] cb_ub_threshold;
//    logic [7:0] cb_samples_ub_threshold;

//    //odd/even threshold
//    logic [7:0] oddeven_th_threshold;


//        // VSYNC THRESHOLDS
//    assign vsync_lb_threshold          = MMIO_thresholds[7:0];        // ~172
//    assign vsync_ub_threshold          = MMIO_thresholds[15:8];       // ~185
//    assign vsync_samples_lb_threshold  = MMIO_thresholds[23:16];      // ~160

//    // COLOR LEVEL THRESHOLDS
//    assign black_level_default         = MMIO_thresholds[31:24];      // ~150
//    assign white_level_default         = MMIO_thresholds[39:32];      // ~40

//    // HSYNC THRESHOLDS
//    assign hsync_lb_threshold          = MMIO_thresholds[47:40];      // default ~184
//    assign hsync_ub_threshold          = MMIO_thresholds[55:48];      // default ~199
//    assign hsync_samples_lb_threshold  = MMIO_thresholds[63:56];      // default ~38

//    // COLORBURST THRESHOLDS
//    assign cb_lb_threshold             = MMIO_thresholds[71:64];      // default ~130
//    assign cb_ub_threshold             = MMIO_thresholds[79:72];      // default ~145
//    assign cb_samples_ub_threshold     = MMIO_thresholds[87:80];      // default ~23

//    // ODD/EVEN THRESHOLD
//    assign oddeven_th_threshold        = MMIO_thresholds[95:88];      // default ~85

//    // Feed the 16-bit filtered/scaled/clipped I/Q data into the CORDIC to calculate its magnitude.
//    logic cordic_tvalid;
//    logic cordic_tlast;
//    logic [C_S00_AXIS_TDATA_WIDTH-1:0] cordic_tdata;
//    logic [(C_S00_AXIS_TDATA_WIDTH/8)-1:0] cordic_tstrb;
//    cordic my_cordic(
//        .s00_axis_aclk(s00_axis_aclk),
//        .s00_axis_aresetn(s00_axis_aresetn),
//        .s00_axis_tlast(1'b0),
//        .s00_axis_tvalid(s00_axis_tvalid),
//        .s00_axis_tdata({s00_axis_tdata[31:16], s00_axis_tdata[15:0]}), // 16-bit real, 16-bit imaginary
//        .s00_axis_tstrb(4'b1111),
//        .s00_axis_tready(s00_axis_tready),
//        .m00_axis_tready(s00_tready_sync),
//        .m00_axis_tvalid(cordic_tvalid),
//        .m00_axis_tlast(cordic_tlast),
//        .m00_axis_tdata(cordic_tdata),
//        .m00_axis_tstrb(cordic_tstrb)
//    );

//    logic [15:0] cordic_magnitude;
//    assign cordic_magnitude = cordic_tdata[15:0]; // Bottom 16 bits are the magnitude, top 16 bits are the angle (which we don't care about for AM).

//    logic s00_tready_sync;
//    logic sync_tvalid;
//    logic sync_tlast;
//    logic [31:0] sync_tdata;
//    logic sync_tstrb;
//    logic sync_tready;
//    sync_detector_axis sync_detect_0 (
//        .s00_axis_aclk(s00_axis_aclk),
//        .s00_axis_aresetn(s00_axis_aresetn),
//        .s00_axis_tlast(cordic_tlast),
//        .s00_axis_tvalid(cordic_tvalid),
//        .s00_axis_tdata(cordic_magnitude),
//        .s00_axis_tstrb(2'b11),
//        .s00_axis_tready(s00_tready_sync),
//        .m00_axis_tready(sync_tready), // Connect to DMA ready to propagate backpressure
//        .m00_axis_tvalid(sync_tvalid),
//        .m00_axis_tlast(sync_tlast),
//        .m00_axis_tdata(sync_tdata),
//        .m00_axis_tstrb(),
//        //vsync thresholds
//        .vsync_lb(vsync_lb_threshold),
//        .vsync_ub(vsync_ub_threshold),
//        .vsync_samples_lb(vsync_samples_lb_threshold),
//        //hsync thresholds
//        .hsync_lb(hsync_lb_threshold),
//        .hsync_ub(hsync_ub_threshold),
//        .hsync_samples_lb(hsync_samples_lb_threshold),
//        //colorburst threshold
//        .cb_lb(cb_lb_threshold),
//        .cb_ub(cb_ub_threshold),
//        .cb_samples_ub(cb_samples_ub_threshold),
//        //odd/even
//        .oddeven_th(oddeven_th_threshold)

//    );

//    logic [15:0] colorburst_black_ref; //black level from hsync
//    assign colorburst_black_ref = sync_tdata[15:0];
//     // State machine that starts decoding pixels from the magnitude data
//    video_data_decoder #(.ACTIVE_SAMPLES_PER_LINE(421)) video_data_decoder_top(
//        .s00_axis_aclk(s00_axis_aclk),
//        .s00_axis_aresetn(s00_axis_aresetn),
//        .s00_axis_tlast(sync_tlast), // Connect to sync_detector's tlast, not top-level
//        .s00_axis_tvalid(sync_tvalid),
//        // .s00_axis_tdata({16'b0, cordic_magnitude}),
//        .s00_axis_tdata(sync_tdata),
//        .s00_axis_tstrb(4'b1111),
//        .s00_axis_tready(sync_tready),
//        //threshold inputs
//        //.black_level(colorburst_black_ref), // NOTE: if not working hardcode using "black_level_default" from MMIO
//        .black_level(black_level_default),//"black_level_default" from MMIO TODO CHANGE TO 8BITS IN VIDEO DATA DECODER
//        .white_level(white_level_default),
//        // AXI master out
//        .m00_axis_tready(m00_axis_tready),
//        .m00_axis_tdata(m00_axis_tdata), //32 bit encoded data to FIFO [0....0, odd/even bit, hsync, vsync, 8-bit luma value]
//        .m00_axis_tvalid(m00_axis_tvalid),
//        .m00_axis_tlast(),
//        //.m00_axis_tlast(m00_axis_tlast),
//        .m00_axis_tstrb(m00_axis_tstrb)
//    );



//endmodule

// OLD 1
//#################################################################################################################################################3


//`default_nettype none
//`timescale 1 ns / 1 ps

//module top #
//	(
//		parameter integer C_S00_AXIS_TDATA_WIDTH	= 32,
//		parameter integer C_M00_AXIS_TDATA_WIDTH	= 32
//	)
//	(

//		// Ports of Axi Slave Bus Interface S00_AXIS
//        // Streams in low passed I/Q data (I and Q are each 16 bit signed, packed into 32 bit stream).
//		input wire  s00_axis_aclk, s00_axis_aresetn,
//		input wire  s00_axis_tlast, s00_axis_tvalid,
//		input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
//		input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1: 0] s00_axis_tstrb,
//		output logic  s00_axis_tready,

//		// Ports of Axi Master Bus Interface M00_AXIS
//        // Outputs 32-bit encoder. Ignores downstream ready signal
//        // because the next thing is a FIFO that should always be ready (also
//        // we don't care about losing a squitter occasionally).
//		input wire  m00_axis_aclk, m00_axis_aresetn,
//		input wire  m00_axis_tready,
//		output logic  m00_axis_tvalid, m00_axis_tlast,
//		output logic [C_M00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
//		output logic [(C_M00_AXIS_TDATA_WIDTH/8)-1: 0] m00_axis_tstrb,

//        input wire [95:0] MMIO_thresholds //TODO 8*32-bit registers, 8bit (0->255) thresholds 
//	);


//    //SET TLAST FOR FIFO
//    logic tlast_reg;
//    assign m00_axis_tlast = tlast_reg;
                            
//    logic [18:0] count;
//    localparam curr_count = 19'd65535; // 2^18 - 1 //19'd262143;  // 2^18 - 1
    
    
//    always @(posedge s00_axis_aclk)begin
//       if (s00_axis_aresetn==0)begin
//           count <= 0;
//           tlast_reg <= 0;
//       end else begin
//           tlast_reg <= 0;
//           if (m00_axis_tvalid) begin
//               if (count == (curr_count - 1)) begin
//                   tlast_reg <= 1;
//                   count <= count + 1;
//               end else if (count == curr_count) begin
//                   count <= 0;
//               end else begin
//                   count <= count + 1;
//               end
//           end
//       end
//    end

//    assign s00_axis_tready = m00_axis_tready;

//    // Split the incoming 32-bit data stream into two 16-bit signed integer data streams.
//    logic signed [15:0] adc_data_real;
//    logic signed [15:0] adc_data_imag;
//    assign adc_data_real = s00_axis_tdata[31:16];
//    assign adc_data_imag = s00_axis_tdata[15:0];

//    // Split the incoming MMIO thresholds (8-bits each, 0-255 for level thresholds)
//    // VSYNC THRESHOLDS
//    logic [7:0] vsync_lb_threshold;
//    logic [7:0] vsync_ub_threshold;
//    logic [7:0] vsync_samples_lb_threshold;

//    // COLOR LEVEL THRESHOLDS
//    logic [7:0] black_level_default;
//    logic [7:0] white_level_default;

//    // HSYNC THRESHOLDS
//    logic [7:0] hsync_lb_threshold;
//    logic [7:0] hsync_ub_threshold;
//    logic [7:0] hsync_samples_lb_threshold;

//    //colorburst threshold
//    logic [7:0] cb_lb_threshold;
//    logic [7:0] cb_ub_threshold;
//    logic [7:0] cb_samples_ub_threshold;

//    //odd/even threshold
//    logic [7:0] oddeven_th_threshold;


//    // VSYNC THRESHOLDS
//    assign vsync_lb_threshold          = MMIO_thresholds[7:0];        // ~172
//    assign vsync_ub_threshold          = MMIO_thresholds[15:8];       // ~185
//    assign vsync_samples_lb_threshold  = MMIO_thresholds[23:16];      // ~160

//    // COLOR LEVEL THRESHOLDS
//    assign black_level_default         = MMIO_thresholds[31:24];      // ~150
//    assign white_level_default         = MMIO_thresholds[39:32];      // ~40

//    // HSYNC THRESHOLDS
//    assign hsync_lb_threshold          = MMIO_thresholds[47:40];      // default ~184
//    assign hsync_ub_threshold          = MMIO_thresholds[55:48];      // default ~199
//    assign hsync_samples_lb_threshold  = MMIO_thresholds[63:56];      // default ~38

//    // COLORBURST THRESHOLDS
//    assign cb_lb_threshold             = MMIO_thresholds[71:64];      // default ~130
//    assign cb_ub_threshold             = MMIO_thresholds[79:72];      // default ~145
//    assign cb_samples_ub_threshold     = MMIO_thresholds[87:80];      // default ~23

//    // ODD/EVEN THRESHOLD
//    assign oddeven_th_threshold        = MMIO_thresholds[95:88];      // default ~85

//    // Feed the 16-bit filtered/scaled/clipped I/Q data into the CORDIC to calculate its magnitude.
//    logic cordic_tvalid;
//    logic cordic_tlast;
//    logic [C_S00_AXIS_TDATA_WIDTH-1:0] cordic_tdata;
//    logic [(C_S00_AXIS_TDATA_WIDTH/8)-1:0] cordic_tstrb;
//    cordic my_cordic(
//        .s00_axis_aclk(s00_axis_aclk),
//        .s00_axis_aresetn(s00_axis_aresetn),
//        .s00_axis_tlast(1'b0),
//        .s00_axis_tvalid(s00_axis_tvalid),
//        .s00_axis_tdata({s00_axis_tdata[31:16], s00_axis_tdata[15:0]}), // 16-bit real, 16-bit imaginary
//        .s00_axis_tstrb(4'b1111),
//        .s00_axis_tready(),
//        .m00_axis_tready(1'b1),
//        .m00_axis_tvalid(cordic_tvalid),
//        .m00_axis_tlast(cordic_tlast),
//        .m00_axis_tdata(cordic_tdata),
//        .m00_axis_tstrb(cordic_tstrb)
//    );

//    logic [15:0] cordic_magnitude;
//    assign cordic_magnitude = cordic_tdata[15:0]; // Bottom 16 bits are the magnitude, top 16 bits are the angle (which we don't care about for AM).

//    logic s00_tready_sync;
//    logic sync_tvalid;
//    logic sync_tlast;
//    logic [31:0] sync_tdata;
//    logic sync_tstrb;
//    sync_detector_axis sync_detect_0 (
//        .s00_axis_aclk(s00_axis_aclk),
//        .s00_axis_aresetn(s00_axis_aresetn),
//        .s00_axis_tlast(cordic_tlast),
//        .s00_axis_tvalid(cordic_tvalid),
//        .s00_axis_tdata(cordic_magnitude),
//        .s00_axis_tstrb(2'b11),
//        .s00_axis_tready(s00_tready_sync),
//        .m00_axis_tready(m00_axis_tready), // Connect to DMA ready to propagate backpressure
//        .m00_axis_tvalid(sync_tvalid),
//        .m00_axis_tlast(sync_tlast),
//        .m00_axis_tdata(sync_tdata),
//        .m00_axis_tstrb(),
//        //vsync thresholds
//        .vsync_lb(vsync_lb_threshold),
//        .vsync_ub(vsync_ub_threshold),
//        .vsync_samples_lb(vsync_samples_lb_threshold),
//        //hsync thresholds
//        .hsync_lb(hsync_lb_threshold),
//        .hsync_ub(hsync_ub_threshold),
//        .hsync_samples_lb(hsync_samples_lb_threshold),
//        //colorburst threshold
//        .cb_lb(cb_lb_threshold),
//        .cb_ub(cb_ub_threshold),
//        .cb_samples_ub(cb_samples_ub_threshold),
//        //odd/even
//        .oddeven_th(oddeven_th_threshold)

//    );

//    logic [15:0] colorburst_black_ref; //black level from hsync
//    assign colorburst_black_ref = sync_tdata[15:0];
//     // State machine that starts decoding pixels from the magnitude data
//    video_data_decoder #(.ACTIVE_SAMPLES_PER_LINE(421)) video_data_decoder_top(
//        .s00_axis_aclk(s00_axis_aclk),
//        .s00_axis_aresetn(s00_axis_aresetn),
//        .s00_axis_tlast(sync_tlast), // Connect to sync_detector's tlast, not top-level
//        .s00_axis_tvalid(sync_tvalid),
//        // .s00_axis_tdata({16'b0, cordic_magnitude}),
//        .s00_axis_tdata(sync_tdata),
//        .s00_axis_tstrb(4'b1111),
//        //threshold inputs
//        //.black_level(colorburst_black_ref), // NOTE: if not working hardcode using "black_level_default" from MMIO
//        .black_level(black_level_default),//"black_level_default" from MMIO TODO CHANGE TO 8BITS IN VIDEO DATA DECODER
//        .white_level(white_level_default),
//        // AXI master out
//        .m00_axis_tready(m00_axis_tready),
//        .m00_axis_tdata(m00_axis_tdata), //32 bit encoded data to FIFO [0....0, odd/even bit, hsync, vsync, 8-bit luma value]
//        .m00_axis_tvalid(m00_axis_tvalid),
//        .m00_axis_tlast(),
//        //.m00_axis_tlast(m00_axis_tlast),
//        .m00_axis_tstrb(m00_axis_tstrb)
//    );



//endmodule




// OLD 1
//#################################################################################################################################################3

//`default_nettype none
//`timescale 1 ns / 1 ps

//module top #
//	(
//		parameter integer C_S00_AXIS_TDATA_WIDTH	= 32,
//		parameter integer C_M00_AXIS_TDATA_WIDTH	= 32
//	)
//	(

//		// Ports of Axi Slave Bus Interface S00_AXIS
//        // Streams in low passed I/Q data (I and Q are each 16 bit signed, packed into 32 bit stream).
//		input wire  s00_axis_aclk, s00_axis_aresetn,
//		input wire  s00_axis_tlast, s00_axis_tvalid,
//		input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
//		input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1: 0] s00_axis_tstrb,
//		output logic  s00_axis_tready,

//		// Ports of Axi Master Bus Interface M00_AXIS
//        // Outputs 32-bit encoder. Ignores downstream ready signal
//        // because the next thing is a FIFO that should always be ready (also
//        // we don't care about losing a squitter occasionally).
//		input wire  m00_axis_aclk, m00_axis_aresetn,
//		input wire  m00_axis_tready,
//		output logic  m00_axis_tvalid, m00_axis_tlast,
//		output logic [C_M00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
//		output logic [(C_M00_AXIS_TDATA_WIDTH/8)-1: 0] m00_axis_tstrb,

//        // SIM OUTPUTS
//        output logic [7:0] pixel,
//        output logic [2:0] state,
//        output logic oddeven,
//        output logic trigger,
//        output logic [31:0] sample_count,

//        input wire [95:0] MMIO_thresholds //TODO 8*32-bit registers, 8bit (0->255) thresholds 
//	);

//    always_ff @(posedge s00_axis_aclk) begin
//        if (!s00_axis_aresetn) begin
//            sample_count <= 16000;
//        end else begin
//            sample_count <= sample_count + 1;
//        end
//    end

//    assign pixel = m00_axis_tdata[7:0];
//    assign state = m00_axis_tdata[10:8];
//    assign oddeven = m00_axis_tdata[11];
//    assign trigger = sync_tdata[20];

//    assign s00_axis_tready = m00_axis_tready;

//    // Split the incoming 32-bit data stream into two 16-bit signed integer data streams.
//    logic signed [15:0] adc_data_real;
//    logic signed [15:0] adc_data_imag;
//    assign adc_data_real = s00_axis_tdata[31:16];
//    assign adc_data_imag = s00_axis_tdata[15:0];

//    // Split the incoming MMIO thresholds (8-bits each, 0-255 for level thresholds)
//    // VSYNC THRESHOLDS
//    logic [7:0] vsync_lb_threshold;
//    logic [7:0] vsync_ub_threshold;
//    logic [7:0] vsync_samples_lb_threshold;

//    // COLOR LEVEL THRESHOLDS
//    logic [7:0] black_level_default;
//    logic [7:0] white_level_default;

//    // HSYNC THRESHOLDS
//    logic [7:0] hsync_lb_threshold;
//    logic [7:0] hsync_ub_threshold;
//    logic [7:0] hsync_samples_lb_threshold;

//    //colorburst threshold
//    logic [7:0] cb_lb_threshold;
//    logic [7:0] cb_ub_threshold;
//    logic [7:0] cb_samples_ub_threshold;

//    //odd/even threshold
//    logic [7:0] oddeven_th_threshold;

//    // logic [7:0] hsync_threshold_upper_fp;
//    // logic [7:0] hsync_threshold_lower_st;
//    // logic [7:0] hsync_threshold_upper_st;
//    // logic [7:0] hsync_threshold_lower_bp;
//    // logic [7:0] hsync_threshold_upper_bp;
//    // logic [7:0] hsync_threshold_lower_eq;
//    // logic [7:0] hsync_threshold_upper_eq;


//        // VSYNC THRESHOLDS
//    assign vsync_lb_threshold          = MMIO_thresholds[7:0];        // ~172
//    assign vsync_ub_threshold          = MMIO_thresholds[15:8];       // ~185
//    assign vsync_samples_lb_threshold  = MMIO_thresholds[23:16];      // ~160

//    // COLOR LEVEL THRESHOLDS
//    assign black_level_default         = MMIO_thresholds[31:24];      // ~150
//    assign white_level_default         = MMIO_thresholds[39:32];      // ~40

//    // HSYNC THRESHOLDS
//    assign hsync_lb_threshold          = MMIO_thresholds[47:40];      // default ~184
//    assign hsync_ub_threshold          = MMIO_thresholds[55:48];      // default ~199
//    assign hsync_samples_lb_threshold  = MMIO_thresholds[63:56];      // default ~38

//    // COLORBURST THRESHOLDS
//    assign cb_lb_threshold             = MMIO_thresholds[71:64];      // default ~130
//    assign cb_ub_threshold             = MMIO_thresholds[79:72];      // default ~145
//    assign cb_samples_ub_threshold     = MMIO_thresholds[87:80];      // default ~23

//    // ODD/EVEN THRESHOLD
//    assign oddeven_th_threshold        = MMIO_thresholds[95:88];      // default ~85


//        // hsync_threshold_upper_fp          = MMIO_thresholds[103:96];    // default ~138 (UPPER_FP)
//        // hsync_threshold_lower_st          = MMIO_thresholds[111:104];   // default ~184 (LOWER_ST)
//        // hsync_threshold_upper_st          = MMIO_thresholds[119:112];   // default ~192 (UPPER_ST)
//        // hsync_threshold_lower_bp          = MMIO_thresholds[127:120];   // default ~134 (LOWER_BP)
//        // hsync_threshold_upper_bp          = MMIO_thresholds[135:128];   // default ~142 (UPPER_BP)
//        // hsync_threshold_lower_eq          = MMIO_thresholds[143:136];   // default ~135 (LOWER_EQ)
//        // hsync_threshold_upper_eq          = MMIO_thresholds[151:144];   // default ~142 (UPPER_EQ)

//    // Feed the 16-bit filtered/scaled/clipped I/Q data into the CORDIC to calculate its magnitude.
//    logic cordic_tvalid;
//    logic cordic_tlast;
//    logic [C_S00_AXIS_TDATA_WIDTH-1:0] cordic_tdata;
//    logic [(C_S00_AXIS_TDATA_WIDTH/8)-1:0] cordic_tstrb;
//    cordic my_cordic(
//        .s00_axis_aclk(s00_axis_aclk),
//        .s00_axis_aresetn(s00_axis_aresetn),
//        .s00_axis_tlast(1'b0),
//        .s00_axis_tvalid(s00_axis_tvalid),
//        .s00_axis_tdata({s00_axis_tdata[31:16], s00_axis_tdata[15:0]}), // 16-bit real, 16-bit imaginary
//        .s00_axis_tstrb(4'b1111),
//        .s00_axis_tready(),
//        .m00_axis_tready(1'b1),
//        .m00_axis_tvalid(cordic_tvalid),
//        .m00_axis_tlast(cordic_tlast),
//        .m00_axis_tdata(cordic_tdata),
//        .m00_axis_tstrb(cordic_tstrb)
//    );

//    logic [15:0] cordic_magnitude;
//    assign cordic_magnitude = cordic_tdata[15:0]; // Bottom 16 bits are the magnitude, top 16 bits are the angle (which we don't care about for AM).

//    logic s00_tready_sync;
//    logic sync_tvalid;
//    logic sync_tlast;
//    logic [31:0] sync_tdata;
//    logic sync_tstrb;
//    sync_detector_axis sync_detect_0 (
//        .s00_axis_aclk(s00_axis_aclk),
//        .s00_axis_aresetn(s00_axis_aresetn),
//        .s00_axis_tlast(cordic_tlast),
//        .s00_axis_tvalid(cordic_tvalid),
//        .s00_axis_tdata(cordic_magnitude),
//        .s00_axis_tstrb(2'b11),
//        .s00_axis_tready(s00_tready_sync),
//        .m00_axis_tready(1'b1),
//        .m00_axis_tvalid(sync_tvalid),
//        .m00_axis_tlast(sync_tlast),
//        .m00_axis_tdata(sync_tdata),
//        .m00_axis_tstrb(),
//        //vsync thresholds
//        .vsync_lb(vsync_lb_threshold),
//        .vsync_ub(vsync_ub_threshold),
//        .vsync_samples_lb(vsync_samples_lb_threshold),
//        //hsync thresholds
//        .hsync_lb(hsync_lb_threshold),
//        .hsync_ub(hsync_ub_threshold),
//        .hsync_samples_lb(hsync_samples_lb_threshold),
//        //colorburst threshold
//        .cb_lb(cb_lb_threshold),
//        .cb_ub(cb_ub_threshold),
//        .cb_samples_ub(cb_samples_ub_threshold),
//        //odd/even
//        .oddeven_th(oddeven_th_threshold)

//    );

//    logic [15:0] colorburst_black_ref; //black level from hsync
//    assign colorburst_black_ref = sync_tdata[15:0];
//     // State machine that starts decoding pixels from the magnitude data
//    video_data_decoder #(.ACTIVE_SAMPLES_PER_LINE(421)) video_data_decoder_top(
//        .s00_axis_aclk(s00_axis_aclk),
//        .s00_axis_aresetn(s00_axis_aresetn),
//        .s00_axis_tlast(s00_axis_tlast),
//        .s00_axis_tvalid(s00_axis_tvalid),
//        // .s00_axis_tdata({16'b0, cordic_magnitude}),
//        .s00_axis_tdata(sync_tdata),
//        .s00_axis_tstrb(s00_axis_tstrb),
//        //threshold inputs
//        //.black_level(colorburst_black_ref), // NOTE: if not working hardcode using "black_level_default" from MMIO
//        .black_level(black_level_default),//"black_level_default" from MMIO TODO CHANGE TO 8BITS IN VIDEO DATA DECODER
//        .white_level(white_level_default),
//        // AXI master out
//        .m00_axis_tdata(m00_axis_tdata), //32 bit encoded data to FIFO [0....0, odd/even bit, hsync, vsync, 8-bit luma value]
//        .m00_axis_tvalid(m00_axis_tvalid),
//        .m00_axis_tlast(m00_axis_tlast),
//        .m00_axis_tstrb(m00_axis_tstrb)
//    );



//endmodule