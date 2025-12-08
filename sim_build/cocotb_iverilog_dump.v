module cocotb_iverilog_dump();
initial begin
    $dumpfile("/Users/cathyhu/fall2025/rfsoc-ntsc-decoder/sim_build/top.fst");
    $dumpvars(0, top);
end
endmodule
