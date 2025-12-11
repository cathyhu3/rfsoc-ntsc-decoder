
`timescale 1ns / 1ps
module cocotb_vivado_dump();
  initial begin
    $dumpfile("/home/thagenlo/Desktop/rfsoc-ntsc-decoder/sim_build/top.fst");
    $dumpvars(0,top);
  end
endmodule
