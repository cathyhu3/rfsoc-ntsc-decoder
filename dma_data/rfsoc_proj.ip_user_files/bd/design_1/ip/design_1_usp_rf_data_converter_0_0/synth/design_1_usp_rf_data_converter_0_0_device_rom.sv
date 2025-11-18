//----------------------------------------------------------------------------
// Title : ROM for tile configuration
// Project : Ultrascale+ RF Data Converter Subsystem
//----------------------------------------------------------------------------
//
// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


`timescale 1ps/1ps

module design_1_usp_rf_data_converter_0_0_device_rom (
    aux_clk,
    data_index,
    data_out,
    addr_out,
    tile_out
  );

    input aux_clk;

    input [10:0] data_index;

    output [15:0] data_out;
    output [10:0] addr_out;
    output [2:0]  tile_out;

    reg [29:0] data;

    // The 30-bit data in the array follows the format below:
    // 29:27 |  26:24  |    23:16    |    15:0
    // Tile  |  Slice  | DRP Address |  DRP Data

    (* rom_style = "distributed" *) reg [29:0] data_array [0:76] = '{
       30'h07280280,  // SYSREF Distribution (ADC0)
       30'h0f280600,  // SYSREF Distribution (ADC1)
       30'h17230000,  // Clock Network Control 0 (ADC2)
       30'h17240000,  // Clock Network Control 1 (ADC2)
       30'h17222000,  // Clock Distribution Control (ADC2)
       30'h17170017,  // PLL FB Div (ADC2)
       30'h170c00c4,  // PLL Output Divide (ADC2)
       30'h17100010,  // PLL Ref clock divide (ADC2)
       30'h17000080,  // PLL SDM CONFIG0 (ADC2)
       30'h17060111,  // PLL SDM seed (ADC2)
       30'h17070011,  // PLL SDM seed setup (ADC2)
       30'h170e0d37,  // PLL ChargePump setup (ADC2)
       30'h170f2080,  // PLL temprature sensor control (ADC2)
       30'h1712ffff,  // PLL ChargePump setup (ADC2)
       30'h17137fe9,  // PLL loop filter setup (ADC2)
       30'h17140006,  // PLL loop filter setup (ADC2)
       30'h17155800,  // PLL VCO setup (ADC2)
       30'h17160008,  // PLL VCO setup (ADC2)
       30'h170a7a20,  // PLL Coarse Frequency setup (ADC2)
       30'h170b7008,  // PLL Coarse Frequency setup (ADC2)
       30'h1711002d,  // PLL Voltage Regulator setup (ADC2)
       30'h172c0022,  // CLK_DIV (ADC2)
       30'h17288880,  // SYSREF Distribution (ADC2)
       30'h172dfffc,  // HSCOM_PWR_MASK (ADC2)
       30'h17310062,  // CLOCK_DETECT_CTRL0 (ADC2)
       30'h17320032,  // CLOCK_DETECT_CTRL1 (ADC2)
       30'h17300040,  // FIFO_START (ADC2)
       30'h10020101,  // ADC20 Data Width
       30'h10100003,  // ADC20 Decimation Config
       30'h10110010,  // ADC20 Decimation Mode
       30'h10221015,  // ADC20 Mixer Mode
       30'h102a0001,  // ADC20 NCO Phase Mode
       30'h10270000,  // ADC20 NCO Frequency Word 0
       30'h10260000,  // ADC20 NCO Frequency Word 1
       30'h10250f50,  // ADC20 NCO Frequency Word 2
       30'h10290000,  // ADC20 NCO Phase Offset Word 0
       30'h10280000,  // ADC20 NCO Phase Offset Word 1
       30'h103a0020,  // ADC20 Switch Matrix Config
       30'h107101f1,  // ADC20 RX MC Config 0
       30'h10780002,  // ADC20 DSA Control
       30'h105181c3,  // ADC20 TI_DCB_CTRL0
       30'h1055d55a,  // ADC20 TI_TIME_SKEW_CTRL0
       30'h105a0000,  // ADC20 TI_TIME_SKEW_CTRL5
       30'h101d001c,  // ADC20 CAL_FREEZE_MASK
       30'h10450091,  // ADC20_SIG_DET_CTRL
       30'h10460148,  // ADC20_SIG_DET_THRESHOLD_LEVEL0
       30'h1047012c,  // ADC20_SIG_DET_THRESHOLD_LEVEL0_CNT_ON
       30'h1048012c,  // ADC20_SIG_DET_THRESHOLD_LEVEL0_CNT_OFF
       30'h10060001,  // ADC20 FABRIC_DEBUG
       30'h11020101,  // ADC21 Data Width
       30'h11100003,  // ADC21 Decimation Config
       30'h11110010,  // ADC21 Decimation Mode
       30'h11221015,  // ADC21 Mixer Mode
       30'h112a0002,  // ADC21 NCO Phase Mode
       30'h11270000,  // ADC21 NCO Frequency Word 0
       30'h11260000,  // ADC21 NCO Frequency Word 1
       30'h11250f50,  // ADC21 NCO Frequency Word 2
       30'h11290000,  // ADC21 NCO Phase Offset Word 0
       30'h11280000,  // ADC21 NCO Phase Offset Word 1
       30'h113a0024,  // ADC21 Switch Matrix Config
       30'h117101f9,  // ADC21 RX MC Config 0
       30'h11780002,  // ADC21 DSA Control
       30'h115181c7,  // ADC21 TI_DCB_CTRL0
       30'h1155d55a,  // ADC21 TI_TIME_SKEW_CTRL0
       30'h115a0000,  // ADC21 TI_TIME_SKEW_CTRL5
       30'h111d001c,  // ADC21 CAL_FREEZE_MASK
       30'h11450091,  // ADC21_SIG_DET_CTRL
       30'h11460148,  // ADC21_SIG_DET_THRESHOLD_LEVEL0
       30'h1147012c,  // ADC21_SIG_DET_THRESHOLD_LEVEL0_CNT_ON
       30'h1148012c,  // ADC21_SIG_DET_THRESHOLD_LEVEL0_CNT_OFF
       30'h11060001,  // ADC21 FABRIC_DEBUG
       30'h1f280700,  // SYSREF Distribution (ADC3)
       30'h2728ca80,  // SYSREF Distribution (DAC0)
       30'h2f282400,  // SYSREF Distribution (DAC1)
       30'h37280980,  // SYSREF Distribution (DAC2)
       30'h3f280100,  // SYSREF Distribution (DAC3)
       30'h00000000};

    //-------------------------------------------------------------------------
    // Output the tile number, address and data for the DRP writes
    // depending on the data_index input
    //-------------------------------------------------------------------------
    always @(posedge aux_clk)
    begin
      data <= data_array[data_index];
    end

    assign data_out = data[15:0];
    assign addr_out = data[26:16];
    assign tile_out = data[29:27];

endmodule
