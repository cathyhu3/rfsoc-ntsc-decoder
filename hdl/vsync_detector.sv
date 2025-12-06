
`default_nettype none
`timescale 1 ns / 1 ps

// Detects a "vsync" region as a run of samples whose values fall
// between LOW_THRESHOLD_VSYNC and HIGH_THRESHOLD_VSYNC. When we
// leave that region, if the length was within the allowed range,
// we assert `trigger` high for exactly one clock cycle.

module vsync_detector #
	(
		parameter integer C_S00_AXIS_TDATA_WIDTH	= 32
	)
	(
		// Ports of Axi Slave Bus Interface S00_AXIS
		input wire  s00_axis_aclk, s00_axis_aresetn,
		input wire  s00_axis_tlast, s00_axis_tvalid,
		input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
		input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1: 0] s00_axis_tstrb,
		output logic  s00_axis_tready,

        //input wire [C_S00_AXIS_TDATA_WIDTH - 1:0] preamble_detector_threshold,
        output logic trigger,

        // thresholds coming from AXI-Lite regs
        input  wire [15:0] low_threshold_vsync,
        input  wire [15:0] high_threshold_vsync,
        input  wire [15:0] low_vsync_region_length_threshold
	);

    //THRESHOLDSSS

    // localparam int LOW_THRESHOLD_VSYNC                  = 172;
    // localparam int HIGH_THRESHOLD_VSYNC                 = 185;
    // localparam int LOW_VSYNC_REGION_LENGTH_THRESHOLD    = 200;
    localparam int HIGH_VSYNC_REGION_LENGTH_THRESHOLD   = 400;

    // Counter wide enough to count up to HIGH_VSYNC_REGION_LENGTH_THRESHOLD
    logic [$clog2(HIGH_VSYNC_REGION_LENGTH_THRESHOLD+1)-1:0] counter;

    // Always ready to accept data
    assign s00_axis_tready = 1'b1;

    // Simple state: count while inside vsync region; on exit, check length and pulse trigger.
    always_ff @(posedge s00_axis_aclk) begin
        if (!s00_axis_aresetn) begin
            counter <= '0;
            trigger <= 1'b0;
        end else begin
            // Default: no trigger unless conditions below set it
            trigger <= 1'b0;

            if (s00_axis_tvalid) begin
                // Check raw tdata; if you're actually interested in only a byte/field,
                // narrow this comparison accordingly.
                if ((s00_axis_tdata > low_threshold_vsync) &&
                    (s00_axis_tdata < high_threshold_vsync)) begin
                    // Still inside vsync region
                    counter <= counter + 1'b1;
                end else begin
                    // Left vsync region; evaluate the length we just accumulated
                    if (counter > low_vsync_region_length_threshold) begin
                        // One-cycle pulse on falling edge of vsync region
                        trigger <= 1'b1;
                    end
                    // Reset counter after leaving vsync region
                    counter <= '0;
                end
            end
        end
    end

endmodule
