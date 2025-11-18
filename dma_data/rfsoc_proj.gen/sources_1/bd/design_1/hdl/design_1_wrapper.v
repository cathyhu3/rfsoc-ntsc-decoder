//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
//Date        : Mon Nov 17 20:57:55 2025
//Host        : eecs-digital-42 running 64-bit Ubuntu 24.04.3 LTS
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (adc2_clk_clk_n,
    adc2_clk_clk_p,
    led,
    sw,
    sysref_in_diff_n,
    sysref_in_diff_p,
    vin2_01_v_n,
    vin2_01_v_p);
  input adc2_clk_clk_n;
  input adc2_clk_clk_p;
  output [3:0]led;
  input [3:0]sw;
  input sysref_in_diff_n;
  input sysref_in_diff_p;
  input vin2_01_v_n;
  input vin2_01_v_p;

  wire adc2_clk_clk_n;
  wire adc2_clk_clk_p;
  wire [3:0]led;
  wire [3:0]sw;
  wire sysref_in_diff_n;
  wire sysref_in_diff_p;
  wire vin2_01_v_n;
  wire vin2_01_v_p;

  design_1 design_1_i
       (.adc2_clk_clk_n(adc2_clk_clk_n),
        .adc2_clk_clk_p(adc2_clk_clk_p),
        .led(led),
        .sw(sw),
        .sysref_in_diff_n(sysref_in_diff_n),
        .sysref_in_diff_p(sysref_in_diff_p),
        .vin2_01_v_n(vin2_01_v_n),
        .vin2_01_v_p(vin2_01_v_p));
endmodule
