module cocotb_iverilog_dump();
initial begin
    $dumpfile("/Users/cathyhu/fall2025/rfsoc-ntsc-decoder/sim_build/hsync_detector_axis.fst");
    $dumpvars(0, hsync_detector_axis);
end
endmodule
