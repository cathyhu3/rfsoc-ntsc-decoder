module cocotb_iverilog_dump();
initial begin
    $dumpfile("/Users/cathyhu/fall2025/rfsoc-ntsc-decoder/sim_build/sync_detector_axis.fst");
    $dumpvars(0, sync_detector_axis);
end
endmodule
