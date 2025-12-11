// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Fri Oct 24 09:36:24 2025
// Host        : eecs-digital-42 running 64-bit Ubuntu 24.04.3 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_iq_framer_0_0_sim_netlist.v
// Design      : design_1_iq_framer_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu48dr-ffvg1517-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_iq_framer_0_0,iq_framer,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "iq_framer,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (s00_axis_aclk,
    s00_axis_aresetn,
    s00_axis_tready,
    s00_axis_tdata,
    s00_axis_tstrb,
    s00_axis_tlast,
    s00_axis_tvalid,
    s01_axis_aclk,
    s01_axis_aresetn,
    s01_axis_tready,
    s01_axis_tdata,
    s01_axis_tstrb,
    s01_axis_tlast,
    s01_axis_tvalid,
    m00_axis_aclk,
    m00_axis_aresetn,
    m00_axis_tvalid,
    m00_axis_tdata,
    m00_axis_tstrb,
    m00_axis_tlast,
    m00_axis_tready,
    control,
    probe);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S00_AXIS_CLK CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXIS_CLK, ASSOCIATED_BUSIF S00_AXIS, ASSOCIATED_RESET s00_axis_aresetn, FREQ_HZ 147456000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_0_clk_out1, INSERT_VIP 0" *) input s00_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S00_AXIS_RST RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axis_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TREADY" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 147456000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *) output s00_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TDATA" *) input [15:0]s00_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TSTRB" *) input [3:0]s00_axis_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TLAST" *) input s00_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TVALID" *) input s00_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S01_AXIS_CLK CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S01_AXIS_CLK, ASSOCIATED_BUSIF S01_AXIS, ASSOCIATED_RESET s01_axis_aresetn, FREQ_HZ 147456000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_0_clk_out1, INSERT_VIP 0" *) input s01_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S01_AXIS_RST RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S01_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s01_axis_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S01_AXIS TREADY" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S01_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 147456000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *) output s01_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S01_AXIS TDATA" *) input [15:0]s01_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S01_AXIS TSTRB" *) input [3:0]s01_axis_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S01_AXIS TLAST" *) input s01_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S01_AXIS TVALID" *) input s01_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 M00_AXIS_CLK CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXIS_CLK, ASSOCIATED_BUSIF M00_AXIS, ASSOCIATED_RESET m00_axis_aresetn, FREQ_HZ 147456000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_0_clk_out1, INSERT_VIP 0" *) input m00_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 M00_AXIS_RST RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input m00_axis_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TVALID" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 147456000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *) output m00_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TDATA" *) output [31:0]m00_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TSTRB" *) output [3:0]m00_axis_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TLAST" *) output m00_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TREADY" *) input m00_axis_tready;
  input [3:0]control;
  output [3:0]probe;

  wire \<const0> ;
  wire \<const1> ;
  wire [3:0]control;
  wire [31:0]m00_axis_tdata;
  wire m00_axis_tlast;
  wire s00_axis_aclk;
  wire s00_axis_aresetn;
  wire [15:0]s00_axis_tdata;
  wire s00_axis_tvalid;
  wire [15:0]s01_axis_tdata;

  assign m00_axis_tstrb[3] = \<const0> ;
  assign m00_axis_tstrb[2] = \<const0> ;
  assign m00_axis_tstrb[1] = \<const0> ;
  assign m00_axis_tstrb[0] = \<const0> ;
  assign m00_axis_tvalid = s00_axis_tvalid;
  assign probe[3] = \<const0> ;
  assign probe[2] = \<const0> ;
  assign probe[1] = \<const0> ;
  assign probe[0] = \<const0> ;
  assign s00_axis_tready = \<const1> ;
  assign s01_axis_tready = \<const1> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_iq_framer inst
       (.control(control),
        .m00_axis_tdata(m00_axis_tdata[18:0]),
        .m00_axis_tlast(m00_axis_tlast),
        .s00_axis_aclk(s00_axis_aclk),
        .s00_axis_aresetn(s00_axis_aresetn),
        .s00_axis_tdata(s00_axis_tdata),
        .s00_axis_tvalid(s00_axis_tvalid),
        .s01_axis_tdata(s01_axis_tdata[2:0]));
  LUT4 #(
    .INIT(16'hE0F0)) 
    \m00_axis_tdata[19]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(s01_axis_tdata[3]),
        .I3(control[0]),
        .O(m00_axis_tdata[19]));
  LUT4 #(
    .INIT(16'hE0F0)) 
    \m00_axis_tdata[20]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(s01_axis_tdata[4]),
        .I3(control[0]),
        .O(m00_axis_tdata[20]));
  LUT4 #(
    .INIT(16'hE0F0)) 
    \m00_axis_tdata[21]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(s01_axis_tdata[5]),
        .I3(control[0]),
        .O(m00_axis_tdata[21]));
  LUT4 #(
    .INIT(16'hE0F0)) 
    \m00_axis_tdata[22]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(s01_axis_tdata[6]),
        .I3(control[0]),
        .O(m00_axis_tdata[22]));
  LUT4 #(
    .INIT(16'hE0F0)) 
    \m00_axis_tdata[23]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(s01_axis_tdata[7]),
        .I3(control[0]),
        .O(m00_axis_tdata[23]));
  LUT4 #(
    .INIT(16'hE0F0)) 
    \m00_axis_tdata[24]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(s01_axis_tdata[8]),
        .I3(control[0]),
        .O(m00_axis_tdata[24]));
  LUT4 #(
    .INIT(16'hE0F0)) 
    \m00_axis_tdata[25]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(s01_axis_tdata[9]),
        .I3(control[0]),
        .O(m00_axis_tdata[25]));
  LUT4 #(
    .INIT(16'hE0F0)) 
    \m00_axis_tdata[26]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(s01_axis_tdata[10]),
        .I3(control[0]),
        .O(m00_axis_tdata[26]));
  LUT4 #(
    .INIT(16'hE0F0)) 
    \m00_axis_tdata[27]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(s01_axis_tdata[11]),
        .I3(control[0]),
        .O(m00_axis_tdata[27]));
  LUT4 #(
    .INIT(16'hE0F0)) 
    \m00_axis_tdata[28]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(s01_axis_tdata[12]),
        .I3(control[0]),
        .O(m00_axis_tdata[28]));
  LUT4 #(
    .INIT(16'hE0F0)) 
    \m00_axis_tdata[29]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(s01_axis_tdata[13]),
        .I3(control[0]),
        .O(m00_axis_tdata[29]));
  LUT4 #(
    .INIT(16'hE0F0)) 
    \m00_axis_tdata[30]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(s01_axis_tdata[14]),
        .I3(control[0]),
        .O(m00_axis_tdata[30]));
  LUT4 #(
    .INIT(16'hE0F0)) 
    \m00_axis_tdata[31]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(s01_axis_tdata[15]),
        .I3(control[0]),
        .O(m00_axis_tdata[31]));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_iq_framer
   (m00_axis_tlast,
    m00_axis_tdata,
    s00_axis_aclk,
    control,
    s00_axis_tdata,
    s01_axis_tdata,
    s00_axis_tvalid,
    s00_axis_aresetn);
  output m00_axis_tlast;
  output [18:0]m00_axis_tdata;
  input s00_axis_aclk;
  input [3:0]control;
  input [15:0]s00_axis_tdata;
  input [2:0]s01_axis_tdata;
  input s00_axis_tvalid;
  input s00_axis_aresetn;

  wire [3:0]control;
  wire count0;
  wire count0_carry_i_1_n_0;
  wire count0_carry_i_2_n_0;
  wire count0_carry_i_3_n_0;
  wire count0_carry_i_4_n_0;
  wire count0_carry_i_5_n_0;
  wire count0_carry_i_6_n_0;
  wire count0_carry_i_7_n_0;
  wire count0_carry_n_2;
  wire count0_carry_n_3;
  wire count0_carry_n_4;
  wire count0_carry_n_5;
  wire count0_carry_n_6;
  wire count0_carry_n_7;
  wire count1;
  wire count1_carry_i_1_n_0;
  wire count1_carry_i_2_n_0;
  wire count1_carry_i_3_n_0;
  wire count1_carry_i_4_n_0;
  wire count1_carry_i_5_n_0;
  wire count1_carry_i_6_n_0;
  wire count1_carry_i_7_n_0;
  wire count1_carry_n_2;
  wire count1_carry_n_3;
  wire count1_carry_n_4;
  wire count1_carry_n_5;
  wire count1_carry_n_6;
  wire count1_carry_n_7;
  wire \count[0]_i_1_n_0 ;
  wire \count[0]_i_3_n_0 ;
  wire [18:0]count_reg;
  wire \count_reg[0]_i_2_n_0 ;
  wire \count_reg[0]_i_2_n_1 ;
  wire \count_reg[0]_i_2_n_10 ;
  wire \count_reg[0]_i_2_n_11 ;
  wire \count_reg[0]_i_2_n_12 ;
  wire \count_reg[0]_i_2_n_13 ;
  wire \count_reg[0]_i_2_n_14 ;
  wire \count_reg[0]_i_2_n_15 ;
  wire \count_reg[0]_i_2_n_2 ;
  wire \count_reg[0]_i_2_n_3 ;
  wire \count_reg[0]_i_2_n_4 ;
  wire \count_reg[0]_i_2_n_5 ;
  wire \count_reg[0]_i_2_n_6 ;
  wire \count_reg[0]_i_2_n_7 ;
  wire \count_reg[0]_i_2_n_8 ;
  wire \count_reg[0]_i_2_n_9 ;
  wire \count_reg[16]_i_1_n_13 ;
  wire \count_reg[16]_i_1_n_14 ;
  wire \count_reg[16]_i_1_n_15 ;
  wire \count_reg[16]_i_1_n_6 ;
  wire \count_reg[16]_i_1_n_7 ;
  wire \count_reg[8]_i_1_n_0 ;
  wire \count_reg[8]_i_1_n_1 ;
  wire \count_reg[8]_i_1_n_10 ;
  wire \count_reg[8]_i_1_n_11 ;
  wire \count_reg[8]_i_1_n_12 ;
  wire \count_reg[8]_i_1_n_13 ;
  wire \count_reg[8]_i_1_n_14 ;
  wire \count_reg[8]_i_1_n_15 ;
  wire \count_reg[8]_i_1_n_2 ;
  wire \count_reg[8]_i_1_n_3 ;
  wire \count_reg[8]_i_1_n_4 ;
  wire \count_reg[8]_i_1_n_5 ;
  wire \count_reg[8]_i_1_n_6 ;
  wire \count_reg[8]_i_1_n_7 ;
  wire \count_reg[8]_i_1_n_8 ;
  wire \count_reg[8]_i_1_n_9 ;
  wire [18:0]m00_axis_tdata;
  wire m00_axis_tlast;
  wire p_0_in;
  wire s00_axis_aclk;
  wire s00_axis_aresetn;
  wire [15:0]s00_axis_tdata;
  wire s00_axis_tvalid;
  wire [2:0]s01_axis_tdata;
  wire tlast_reg_i_1_n_0;
  wire [7:7]NLW_count0_carry_CO_UNCONNECTED;
  wire [7:0]NLW_count0_carry_O_UNCONNECTED;
  wire [7:7]NLW_count1_carry_CO_UNCONNECTED;
  wire [7:0]NLW_count1_carry_O_UNCONNECTED;
  wire [7:2]\NLW_count_reg[16]_i_1_CO_UNCONNECTED ;
  wire [7:3]\NLW_count_reg[16]_i_1_O_UNCONNECTED ;

  CARRY8 count0_carry
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({NLW_count0_carry_CO_UNCONNECTED[7],count0,count0_carry_n_2,count0_carry_n_3,count0_carry_n_4,count0_carry_n_5,count0_carry_n_6,count0_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_count0_carry_O_UNCONNECTED[7:0]),
        .S({1'b0,count0_carry_i_1_n_0,count0_carry_i_2_n_0,count0_carry_i_3_n_0,count0_carry_i_4_n_0,count0_carry_i_5_n_0,count0_carry_i_6_n_0,count0_carry_i_7_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    count0_carry_i_1
       (.I0(count_reg[18]),
        .O(count0_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h002000000000AA8A)) 
    count0_carry_i_2
       (.I0(count_reg[15]),
        .I1(control[0]),
        .I2(control[1]),
        .I3(p_0_in),
        .I4(count_reg[17]),
        .I5(count_reg[16]),
        .O(count0_carry_i_2_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    count0_carry_i_3
       (.I0(count_reg[12]),
        .I1(count_reg[14]),
        .I2(count_reg[13]),
        .O(count0_carry_i_3_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    count0_carry_i_4
       (.I0(count_reg[9]),
        .I1(count_reg[11]),
        .I2(count_reg[10]),
        .O(count0_carry_i_4_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    count0_carry_i_5
       (.I0(count_reg[6]),
        .I1(count_reg[8]),
        .I2(count_reg[7]),
        .O(count0_carry_i_5_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    count0_carry_i_6
       (.I0(count_reg[3]),
        .I1(count_reg[5]),
        .I2(count_reg[4]),
        .O(count0_carry_i_6_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    count0_carry_i_7
       (.I0(count_reg[0]),
        .I1(count_reg[2]),
        .I2(count_reg[1]),
        .O(count0_carry_i_7_n_0));
  CARRY8 count1_carry
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({NLW_count1_carry_CO_UNCONNECTED[7],count1,count1_carry_n_2,count1_carry_n_3,count1_carry_n_4,count1_carry_n_5,count1_carry_n_6,count1_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_count1_carry_O_UNCONNECTED[7:0]),
        .S({1'b0,count1_carry_i_1_n_0,count1_carry_i_2_n_0,count1_carry_i_3_n_0,count1_carry_i_4_n_0,count1_carry_i_5_n_0,count1_carry_i_6_n_0,count1_carry_i_7_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    count1_carry_i_1
       (.I0(count_reg[18]),
        .O(count1_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h002000000000AA8A)) 
    count1_carry_i_2
       (.I0(count_reg[15]),
        .I1(control[0]),
        .I2(control[1]),
        .I3(p_0_in),
        .I4(count_reg[17]),
        .I5(count_reg[16]),
        .O(count1_carry_i_2_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    count1_carry_i_3
       (.I0(count_reg[12]),
        .I1(count_reg[14]),
        .I2(count_reg[13]),
        .O(count1_carry_i_3_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    count1_carry_i_4
       (.I0(count_reg[9]),
        .I1(count_reg[11]),
        .I2(count_reg[10]),
        .O(count1_carry_i_4_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    count1_carry_i_5
       (.I0(count_reg[6]),
        .I1(count_reg[8]),
        .I2(count_reg[7]),
        .O(count1_carry_i_5_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    count1_carry_i_6
       (.I0(count_reg[3]),
        .I1(count_reg[5]),
        .I2(count_reg[4]),
        .O(count1_carry_i_6_n_0));
  LUT3 #(
    .INIT(8'h08)) 
    count1_carry_i_7
       (.I0(count_reg[2]),
        .I1(count_reg[1]),
        .I2(count_reg[0]),
        .O(count1_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    count1_carry_i_8
       (.I0(control[3]),
        .I1(control[2]),
        .O(p_0_in));
  LUT4 #(
    .INIT(16'h20FF)) 
    \count[0]_i_1 
       (.I0(count0),
        .I1(count1),
        .I2(s00_axis_tvalid),
        .I3(s00_axis_aresetn),
        .O(\count[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_3 
       (.I0(count_reg[0]),
        .O(\count[0]_i_3_n_0 ));
  FDRE \count_reg[0] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tvalid),
        .D(\count_reg[0]_i_2_n_15 ),
        .Q(count_reg[0]),
        .R(\count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "16" *) 
  CARRY8 \count_reg[0]_i_2 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\count_reg[0]_i_2_n_0 ,\count_reg[0]_i_2_n_1 ,\count_reg[0]_i_2_n_2 ,\count_reg[0]_i_2_n_3 ,\count_reg[0]_i_2_n_4 ,\count_reg[0]_i_2_n_5 ,\count_reg[0]_i_2_n_6 ,\count_reg[0]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .O({\count_reg[0]_i_2_n_8 ,\count_reg[0]_i_2_n_9 ,\count_reg[0]_i_2_n_10 ,\count_reg[0]_i_2_n_11 ,\count_reg[0]_i_2_n_12 ,\count_reg[0]_i_2_n_13 ,\count_reg[0]_i_2_n_14 ,\count_reg[0]_i_2_n_15 }),
        .S({count_reg[7:1],\count[0]_i_3_n_0 }));
  FDRE \count_reg[10] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tvalid),
        .D(\count_reg[8]_i_1_n_13 ),
        .Q(count_reg[10]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[11] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tvalid),
        .D(\count_reg[8]_i_1_n_12 ),
        .Q(count_reg[11]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[12] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tvalid),
        .D(\count_reg[8]_i_1_n_11 ),
        .Q(count_reg[12]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[13] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tvalid),
        .D(\count_reg[8]_i_1_n_10 ),
        .Q(count_reg[13]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[14] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tvalid),
        .D(\count_reg[8]_i_1_n_9 ),
        .Q(count_reg[14]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[15] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tvalid),
        .D(\count_reg[8]_i_1_n_8 ),
        .Q(count_reg[15]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[16] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tvalid),
        .D(\count_reg[16]_i_1_n_15 ),
        .Q(count_reg[16]),
        .R(\count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "16" *) 
  CARRY8 \count_reg[16]_i_1 
       (.CI(\count_reg[8]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_count_reg[16]_i_1_CO_UNCONNECTED [7:2],\count_reg[16]_i_1_n_6 ,\count_reg[16]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_count_reg[16]_i_1_O_UNCONNECTED [7:3],\count_reg[16]_i_1_n_13 ,\count_reg[16]_i_1_n_14 ,\count_reg[16]_i_1_n_15 }),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,count_reg[18:16]}));
  FDRE \count_reg[17] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tvalid),
        .D(\count_reg[16]_i_1_n_14 ),
        .Q(count_reg[17]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[18] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tvalid),
        .D(\count_reg[16]_i_1_n_13 ),
        .Q(count_reg[18]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[1] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tvalid),
        .D(\count_reg[0]_i_2_n_14 ),
        .Q(count_reg[1]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[2] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tvalid),
        .D(\count_reg[0]_i_2_n_13 ),
        .Q(count_reg[2]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[3] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tvalid),
        .D(\count_reg[0]_i_2_n_12 ),
        .Q(count_reg[3]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[4] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tvalid),
        .D(\count_reg[0]_i_2_n_11 ),
        .Q(count_reg[4]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[5] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tvalid),
        .D(\count_reg[0]_i_2_n_10 ),
        .Q(count_reg[5]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[6] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tvalid),
        .D(\count_reg[0]_i_2_n_9 ),
        .Q(count_reg[6]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[7] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tvalid),
        .D(\count_reg[0]_i_2_n_8 ),
        .Q(count_reg[7]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[8] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tvalid),
        .D(\count_reg[8]_i_1_n_15 ),
        .Q(count_reg[8]),
        .R(\count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "16" *) 
  CARRY8 \count_reg[8]_i_1 
       (.CI(\count_reg[0]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\count_reg[8]_i_1_n_0 ,\count_reg[8]_i_1_n_1 ,\count_reg[8]_i_1_n_2 ,\count_reg[8]_i_1_n_3 ,\count_reg[8]_i_1_n_4 ,\count_reg[8]_i_1_n_5 ,\count_reg[8]_i_1_n_6 ,\count_reg[8]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\count_reg[8]_i_1_n_8 ,\count_reg[8]_i_1_n_9 ,\count_reg[8]_i_1_n_10 ,\count_reg[8]_i_1_n_11 ,\count_reg[8]_i_1_n_12 ,\count_reg[8]_i_1_n_13 ,\count_reg[8]_i_1_n_14 ,\count_reg[8]_i_1_n_15 }),
        .S(count_reg[15:8]));
  FDRE \count_reg[9] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tvalid),
        .D(\count_reg[8]_i_1_n_14 ),
        .Q(count_reg[9]),
        .R(\count[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFFF11100000)) 
    \m00_axis_tdata[0]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(control[1]),
        .I3(count_reg[0]),
        .I4(control[0]),
        .I5(s00_axis_tdata[0]),
        .O(m00_axis_tdata[0]));
  LUT6 #(
    .INIT(64'hFFFEFFFF11100000)) 
    \m00_axis_tdata[10]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(control[1]),
        .I3(count_reg[10]),
        .I4(control[0]),
        .I5(s00_axis_tdata[10]),
        .O(m00_axis_tdata[10]));
  LUT6 #(
    .INIT(64'hFFFEFFFF11100000)) 
    \m00_axis_tdata[11]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(control[1]),
        .I3(count_reg[11]),
        .I4(control[0]),
        .I5(s00_axis_tdata[11]),
        .O(m00_axis_tdata[11]));
  LUT6 #(
    .INIT(64'hFFFEFFFF11100000)) 
    \m00_axis_tdata[12]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(control[1]),
        .I3(count_reg[12]),
        .I4(control[0]),
        .I5(s00_axis_tdata[12]),
        .O(m00_axis_tdata[12]));
  LUT6 #(
    .INIT(64'hFFFEFFFF11100000)) 
    \m00_axis_tdata[13]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(control[1]),
        .I3(count_reg[13]),
        .I4(control[0]),
        .I5(s00_axis_tdata[13]),
        .O(m00_axis_tdata[13]));
  LUT6 #(
    .INIT(64'hFFFEFFFF11100000)) 
    \m00_axis_tdata[14]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(control[1]),
        .I3(count_reg[14]),
        .I4(control[0]),
        .I5(s00_axis_tdata[14]),
        .O(m00_axis_tdata[14]));
  LUT6 #(
    .INIT(64'hFFFEFFFF11100000)) 
    \m00_axis_tdata[15]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(control[1]),
        .I3(count_reg[15]),
        .I4(control[0]),
        .I5(s00_axis_tdata[15]),
        .O(m00_axis_tdata[15]));
  LUT6 #(
    .INIT(64'hEFEEFFFF01000000)) 
    \m00_axis_tdata[16]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(control[1]),
        .I3(count_reg[16]),
        .I4(control[0]),
        .I5(s01_axis_tdata[0]),
        .O(m00_axis_tdata[16]));
  LUT6 #(
    .INIT(64'hEFEEFFFF01000000)) 
    \m00_axis_tdata[17]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(control[1]),
        .I3(count_reg[17]),
        .I4(control[0]),
        .I5(s01_axis_tdata[1]),
        .O(m00_axis_tdata[17]));
  LUT6 #(
    .INIT(64'hEEFEFFFF00100000)) 
    \m00_axis_tdata[18]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(count_reg[18]),
        .I3(control[1]),
        .I4(control[0]),
        .I5(s01_axis_tdata[2]),
        .O(m00_axis_tdata[18]));
  LUT6 #(
    .INIT(64'hFFFEFFFF11100000)) 
    \m00_axis_tdata[1]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(control[1]),
        .I3(count_reg[1]),
        .I4(control[0]),
        .I5(s00_axis_tdata[1]),
        .O(m00_axis_tdata[1]));
  LUT6 #(
    .INIT(64'hFFFEFFFF11100000)) 
    \m00_axis_tdata[2]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(control[1]),
        .I3(count_reg[2]),
        .I4(control[0]),
        .I5(s00_axis_tdata[2]),
        .O(m00_axis_tdata[2]));
  LUT6 #(
    .INIT(64'hFFFEFFFF11100000)) 
    \m00_axis_tdata[3]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(control[1]),
        .I3(count_reg[3]),
        .I4(control[0]),
        .I5(s00_axis_tdata[3]),
        .O(m00_axis_tdata[3]));
  LUT6 #(
    .INIT(64'hFFFEFFFF11100000)) 
    \m00_axis_tdata[4]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(control[1]),
        .I3(count_reg[4]),
        .I4(control[0]),
        .I5(s00_axis_tdata[4]),
        .O(m00_axis_tdata[4]));
  LUT6 #(
    .INIT(64'hFFFEFFFF11100000)) 
    \m00_axis_tdata[5]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(control[1]),
        .I3(count_reg[5]),
        .I4(control[0]),
        .I5(s00_axis_tdata[5]),
        .O(m00_axis_tdata[5]));
  LUT6 #(
    .INIT(64'hFFFEFFFF11100000)) 
    \m00_axis_tdata[6]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(control[1]),
        .I3(count_reg[6]),
        .I4(control[0]),
        .I5(s00_axis_tdata[6]),
        .O(m00_axis_tdata[6]));
  LUT6 #(
    .INIT(64'hFFFEFFFF11100000)) 
    \m00_axis_tdata[7]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(control[1]),
        .I3(count_reg[7]),
        .I4(control[0]),
        .I5(s00_axis_tdata[7]),
        .O(m00_axis_tdata[7]));
  LUT6 #(
    .INIT(64'hFFFEFFFF11100000)) 
    \m00_axis_tdata[8]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(control[1]),
        .I3(count_reg[8]),
        .I4(control[0]),
        .I5(s00_axis_tdata[8]),
        .O(m00_axis_tdata[8]));
  LUT6 #(
    .INIT(64'hFFFEFFFF11100000)) 
    \m00_axis_tdata[9]_INST_0 
       (.I0(control[3]),
        .I1(control[2]),
        .I2(control[1]),
        .I3(count_reg[9]),
        .I4(control[0]),
        .I5(s00_axis_tdata[9]),
        .O(m00_axis_tdata[9]));
  LUT3 #(
    .INIT(8'h80)) 
    tlast_reg_i_1
       (.I0(count1),
        .I1(s00_axis_tvalid),
        .I2(s00_axis_aresetn),
        .O(tlast_reg_i_1_n_0));
  FDRE tlast_reg_reg
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(tlast_reg_i_1_n_0),
        .Q(m00_axis_tlast),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
