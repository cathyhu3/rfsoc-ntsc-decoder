
`timescale 1 ns / 1 ps

	module iq_framer #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXIS
		parameter integer C_S00_AXIS_TDATA_WIDTH	= 32,

		// Parameters of Axi Slave Bus Interface S01_AXIS
		parameter integer C_S01_AXIS_TDATA_WIDTH	= 32,

		// Parameters of Axi Master Bus Interface M00_AXIS
		parameter integer C_M00_AXIS_TDATA_WIDTH	= 32,
		parameter integer C_M00_AXIS_START_COUNT	= 32
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXIS
		input wire  s00_axis_aclk,
		input wire  s00_axis_aresetn,
		output wire  s00_axis_tready,
		input wire [C_S00_AXIS_TDATA_WIDTH/2-1 : 0] s00_axis_tdata,
		input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] s00_axis_tstrb,
		input wire  s00_axis_tlast,
		input wire  s00_axis_tvalid,

		// Ports of Axi Slave Bus Interface S01_AXIS
		input wire  s01_axis_aclk,
		input wire  s01_axis_aresetn,
		output wire  s01_axis_tready,
		input wire [C_S01_AXIS_TDATA_WIDTH/2-1 : 0] s01_axis_tdata,
		input wire [(C_S01_AXIS_TDATA_WIDTH/8)-1 : 0] s01_axis_tstrb,
		input wire  s01_axis_tlast,
		input wire  s01_axis_tvalid,

		// Ports of Axi Master Bus Interface M00_AXIS
		input wire  m00_axis_aclk,
		input wire  m00_axis_aresetn,
		output wire  m00_axis_tvalid, //!!!!!!!!!! -
		output wire [C_M00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata, //!!!!!!!!!! -
		output wire [(C_M00_AXIS_TDATA_WIDTH/8)-1 : 0] m00_axis_tstrb, //!!!!!!!!!!
		output wire  m00_axis_tlast, //!!!!!!!!!!
		input wire  m00_axis_tready,
		
		input wire [3:0] control,
		output reg [3:0] probe
		
	);

	// Add user logic here
	
    reg [18:0] count;
    wire [18:0] curr_count;
    assign curr_count = 19'd262143; //(control == 2) ? 19'd262143  // 2^18 - 1
                                       //: 19'd65535; // 2^16 - 1
    
    
    assign s00_axis_tready = 1;
    assign s01_axis_tready = 1;
    assign m00_axis_tvalid = s00_axis_tvalid;
    assign m00_axis_tstrb = {(C_M00_AXIS_TDATA_WIDTH/8){1'b1}};
    
    
    assign m00_axis_tdata = control==1?{13'b0, count}:
                           control==3?{13'b0, curr_count}:
                           {s01_axis_tdata, s00_axis_tdata};
                           
                           
    //reg tlast_reg;
	assign m00_axis_tlast = m00_axis_tvalid && (count == curr_count); //tlast_reg;
    
    
    always @(posedge s00_axis_aclk)begin
       if (s00_axis_aresetn==0)begin
           count <= 0;
           //tlast_reg <= 0;
       end else begin
           //tlast_reg <= 0;
           if (m00_axis_tvalid && m00_axis_tready) begin
               //if (count == (curr_count - 1)) begin
                   //tlast_reg <= 1;
                   //count <= count + 1;
               //end else 
               if (count == curr_count) begin
                   count <= 0;
               end else begin
                   count <= count + 1;
               end
           end
       end
    end

	// User logic ends

	endmodule
