// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Fri Oct 24 10:13:42 2025
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S00_AXIS_CLK CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXIS_CLK, ASSOCIATED_BUSIF S00_AXIS, ASSOCIATED_RESET s00_axis_aresetn, FREQ_HZ 64000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_usp_rf_data_converter_0_0_clk_adc2, INSERT_VIP 0" *) input s00_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S00_AXIS_RST RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axis_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TREADY" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 64000000, PHASE 0.0, CLK_DOMAIN design_1_usp_rf_data_converter_0_0_clk_adc2, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value chan} size {attribs {resolve_type generated dependency chan_size format long minimum {} maximum {}} value 1} stride {attribs {resolve_type generated dependency chan_stride format long minimum {} maximum {}} value 16} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency data_width format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type generated dependency data_fractwidth format long minimum {} maximum {}} value 0} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}} TDATA_WIDTH 16 TUSER {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_chan_out {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value chan_out} enabled {attribs {resolve_type generated dependency enabled format bool minimum {} maximum {}} value false} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency chan_out_width format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} field_chan_sync {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value chan_sync} enabled {attribs {resolve_type generated dependency enabled format bool minimum {} maximum {}} value false} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency chan_sync_width format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type generated dependency chan_sync_offset format long minimum {} maximum {}} value 0}}}}}} TUSER_WIDTH 0}, INSERT_VIP 0" *) output s00_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TDATA" *) input [15:0]s00_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TSTRB" *) input [3:0]s00_axis_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TLAST" *) input s00_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TVALID" *) input s00_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S01_AXIS_CLK CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S01_AXIS_CLK, ASSOCIATED_BUSIF S01_AXIS, ASSOCIATED_RESET s01_axis_aresetn, FREQ_HZ 64000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_usp_rf_data_converter_0_0_clk_adc2, INSERT_VIP 0" *) input s01_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S01_AXIS_RST RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S01_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s01_axis_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S01_AXIS TREADY" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S01_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 64000000, PHASE 0.0, CLK_DOMAIN design_1_usp_rf_data_converter_0_0_clk_adc2, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value chan} size {attribs {resolve_type generated dependency chan_size format long minimum {} maximum {}} value 1} stride {attribs {resolve_type generated dependency chan_stride format long minimum {} maximum {}} value 16} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency data_width format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type generated dependency data_fractwidth format long minimum {} maximum {}} value 0} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}} TDATA_WIDTH 16 TUSER {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_chan_out {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value chan_out} enabled {attribs {resolve_type generated dependency enabled format bool minimum {} maximum {}} value false} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency chan_out_width format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} field_chan_sync {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value chan_sync} enabled {attribs {resolve_type generated dependency enabled format bool minimum {} maximum {}} value false} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency chan_sync_width format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type generated dependency chan_sync_offset format long minimum {} maximum {}} value 0}}}}}} TUSER_WIDTH 0}, INSERT_VIP 0" *) output s01_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S01_AXIS TDATA" *) input [15:0]s01_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S01_AXIS TSTRB" *) input [3:0]s01_axis_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S01_AXIS TLAST" *) input s01_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S01_AXIS TVALID" *) input s01_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 M00_AXIS_CLK CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXIS_CLK, ASSOCIATED_BUSIF M00_AXIS, ASSOCIATED_RESET m00_axis_aresetn, FREQ_HZ 64000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_usp_rf_data_converter_0_0_clk_adc2, INSERT_VIP 0" *) input m00_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 M00_AXIS_RST RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input m00_axis_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TVALID" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 64000000, PHASE 0.0, CLK_DOMAIN design_1_usp_rf_data_converter_0_0_clk_adc2, LAYERED_METADATA undef, INSERT_VIP 0" *) output m00_axis_tvalid;
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
  wire m00_axis_tready;
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
        .m00_axis_tready(m00_axis_tready),
        .s00_axis_aclk(s00_axis_aclk),
        .s00_axis_aresetn(s00_axis_aresetn),
        .s00_axis_tdata(s00_axis_tdata),
        .s00_axis_tvalid(s00_axis_tvalid),
        .s01_axis_tdata(s01_axis_tdata[2:0]));
  LUT4 #(
    .INIT(16'hFD00)) 
    \m00_axis_tdata[19]_INST_0 
       (.I0(control[0]),
        .I1(control[2]),
        .I2(control[3]),
        .I3(s01_axis_tdata[3]),
        .O(m00_axis_tdata[19]));
  LUT4 #(
    .INIT(16'hFD00)) 
    \m00_axis_tdata[20]_INST_0 
       (.I0(control[0]),
        .I1(control[2]),
        .I2(control[3]),
        .I3(s01_axis_tdata[4]),
        .O(m00_axis_tdata[20]));
  LUT4 #(
    .INIT(16'hFD00)) 
    \m00_axis_tdata[21]_INST_0 
       (.I0(control[0]),
        .I1(control[2]),
        .I2(control[3]),
        .I3(s01_axis_tdata[5]),
        .O(m00_axis_tdata[21]));
  LUT4 #(
    .INIT(16'hFD00)) 
    \m00_axis_tdata[22]_INST_0 
       (.I0(control[0]),
        .I1(control[2]),
        .I2(control[3]),
        .I3(s01_axis_tdata[6]),
        .O(m00_axis_tdata[22]));
  LUT4 #(
    .INIT(16'hFD00)) 
    \m00_axis_tdata[23]_INST_0 
       (.I0(control[0]),
        .I1(control[2]),
        .I2(control[3]),
        .I3(s01_axis_tdata[7]),
        .O(m00_axis_tdata[23]));
  LUT4 #(
    .INIT(16'hFD00)) 
    \m00_axis_tdata[24]_INST_0 
       (.I0(control[0]),
        .I1(control[2]),
        .I2(control[3]),
        .I3(s01_axis_tdata[8]),
        .O(m00_axis_tdata[24]));
  LUT4 #(
    .INIT(16'hFD00)) 
    \m00_axis_tdata[25]_INST_0 
       (.I0(control[0]),
        .I1(control[2]),
        .I2(control[3]),
        .I3(s01_axis_tdata[9]),
        .O(m00_axis_tdata[25]));
  LUT4 #(
    .INIT(16'hFD00)) 
    \m00_axis_tdata[26]_INST_0 
       (.I0(control[0]),
        .I1(control[2]),
        .I2(control[3]),
        .I3(s01_axis_tdata[10]),
        .O(m00_axis_tdata[26]));
  LUT4 #(
    .INIT(16'hFD00)) 
    \m00_axis_tdata[27]_INST_0 
       (.I0(control[0]),
        .I1(control[2]),
        .I2(control[3]),
        .I3(s01_axis_tdata[11]),
        .O(m00_axis_tdata[27]));
  LUT4 #(
    .INIT(16'hFD00)) 
    \m00_axis_tdata[28]_INST_0 
       (.I0(control[0]),
        .I1(control[2]),
        .I2(control[3]),
        .I3(s01_axis_tdata[12]),
        .O(m00_axis_tdata[28]));
  LUT4 #(
    .INIT(16'hFD00)) 
    \m00_axis_tdata[29]_INST_0 
       (.I0(control[0]),
        .I1(control[2]),
        .I2(control[3]),
        .I3(s01_axis_tdata[13]),
        .O(m00_axis_tdata[29]));
  LUT4 #(
    .INIT(16'hFD00)) 
    \m00_axis_tdata[30]_INST_0 
       (.I0(control[0]),
        .I1(control[2]),
        .I2(control[3]),
        .I3(s01_axis_tdata[14]),
        .O(m00_axis_tdata[30]));
  LUT4 #(
    .INIT(16'hFD00)) 
    \m00_axis_tdata[31]_INST_0 
       (.I0(control[0]),
        .I1(control[2]),
        .I2(control[3]),
        .I3(s01_axis_tdata[15]),
        .O(m00_axis_tdata[31]));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_iq_framer
   (m00_axis_tlast,
    m00_axis_tdata,
    s00_axis_aclk,
    s00_axis_tvalid,
    m00_axis_tready,
    control,
    s00_axis_tdata,
    s01_axis_tdata,
    s00_axis_aresetn);
  output m00_axis_tlast;
  output [18:0]m00_axis_tdata;
  input s00_axis_aclk;
  input s00_axis_tvalid;
  input m00_axis_tready;
  input [3:0]control;
  input [15:0]s00_axis_tdata;
  input [2:0]s01_axis_tdata;
  input s00_axis_aresetn;

  wire [3:0]control;
  wire [18:0]count;
  wire [18:1]count0;
  wire count0_0;
  wire [0:0]count0__0;
  wire \count0_inferred__0/i__carry__0_n_0 ;
  wire \count0_inferred__0/i__carry__0_n_1 ;
  wire \count0_inferred__0/i__carry__0_n_2 ;
  wire \count0_inferred__0/i__carry__0_n_3 ;
  wire \count0_inferred__0/i__carry__0_n_4 ;
  wire \count0_inferred__0/i__carry__0_n_5 ;
  wire \count0_inferred__0/i__carry__0_n_6 ;
  wire \count0_inferred__0/i__carry__0_n_7 ;
  wire \count0_inferred__0/i__carry__1_n_7 ;
  wire \count0_inferred__0/i__carry_n_0 ;
  wire \count0_inferred__0/i__carry_n_1 ;
  wire \count0_inferred__0/i__carry_n_2 ;
  wire \count0_inferred__0/i__carry_n_3 ;
  wire \count0_inferred__0/i__carry_n_4 ;
  wire \count0_inferred__0/i__carry_n_5 ;
  wire \count0_inferred__0/i__carry_n_6 ;
  wire \count0_inferred__0/i__carry_n_7 ;
  wire \count[18]_i_1_n_0 ;
  wire \count[18]_i_4_n_0 ;
  wire \count[18]_i_5_n_0 ;
  wire \count[18]_i_6_n_0 ;
  wire \count[18]_i_7_n_0 ;
  wire [18:0]m00_axis_tdata;
  wire m00_axis_tlast;
  wire m00_axis_tready;
  wire [18:1]p_1_in;
  wire s00_axis_aclk;
  wire s00_axis_aresetn;
  wire [15:0]s00_axis_tdata;
  wire s00_axis_tvalid;
  wire [2:0]s01_axis_tdata;
  wire tlast_reg_i_1_n_0;
  wire tlast_reg_i_2_n_0;
  wire [7:1]\NLW_count0_inferred__0/i__carry__1_CO_UNCONNECTED ;
  wire [7:2]\NLW_count0_inferred__0/i__carry__1_O_UNCONNECTED ;

  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \count0_inferred__0/i__carry 
       (.CI(count[0]),
        .CI_TOP(1'b0),
        .CO({\count0_inferred__0/i__carry_n_0 ,\count0_inferred__0/i__carry_n_1 ,\count0_inferred__0/i__carry_n_2 ,\count0_inferred__0/i__carry_n_3 ,\count0_inferred__0/i__carry_n_4 ,\count0_inferred__0/i__carry_n_5 ,\count0_inferred__0/i__carry_n_6 ,\count0_inferred__0/i__carry_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(count0[8:1]),
        .S(count[8:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \count0_inferred__0/i__carry__0 
       (.CI(\count0_inferred__0/i__carry_n_0 ),
        .CI_TOP(1'b0),
        .CO({\count0_inferred__0/i__carry__0_n_0 ,\count0_inferred__0/i__carry__0_n_1 ,\count0_inferred__0/i__carry__0_n_2 ,\count0_inferred__0/i__carry__0_n_3 ,\count0_inferred__0/i__carry__0_n_4 ,\count0_inferred__0/i__carry__0_n_5 ,\count0_inferred__0/i__carry__0_n_6 ,\count0_inferred__0/i__carry__0_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(count0[16:9]),
        .S(count[16:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \count0_inferred__0/i__carry__1 
       (.CI(\count0_inferred__0/i__carry__0_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_count0_inferred__0/i__carry__1_CO_UNCONNECTED [7:1],\count0_inferred__0/i__carry__1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_count0_inferred__0/i__carry__1_O_UNCONNECTED [7:2],count0[18:17]}),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,count[18:17]}));
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1 
       (.I0(count[0]),
        .O(count0__0));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \count[10]_i_1 
       (.I0(\count[18]_i_4_n_0 ),
        .I1(\count[18]_i_5_n_0 ),
        .I2(\count[18]_i_6_n_0 ),
        .I3(\count[18]_i_7_n_0 ),
        .I4(count[0]),
        .I5(count0[10]),
        .O(p_1_in[10]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \count[11]_i_1 
       (.I0(\count[18]_i_4_n_0 ),
        .I1(\count[18]_i_5_n_0 ),
        .I2(\count[18]_i_6_n_0 ),
        .I3(\count[18]_i_7_n_0 ),
        .I4(count[0]),
        .I5(count0[11]),
        .O(p_1_in[11]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \count[12]_i_1 
       (.I0(\count[18]_i_4_n_0 ),
        .I1(\count[18]_i_5_n_0 ),
        .I2(\count[18]_i_6_n_0 ),
        .I3(\count[18]_i_7_n_0 ),
        .I4(count[0]),
        .I5(count0[12]),
        .O(p_1_in[12]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \count[13]_i_1 
       (.I0(\count[18]_i_4_n_0 ),
        .I1(\count[18]_i_5_n_0 ),
        .I2(\count[18]_i_6_n_0 ),
        .I3(\count[18]_i_7_n_0 ),
        .I4(count[0]),
        .I5(count0[13]),
        .O(p_1_in[13]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \count[14]_i_1 
       (.I0(\count[18]_i_4_n_0 ),
        .I1(\count[18]_i_5_n_0 ),
        .I2(\count[18]_i_6_n_0 ),
        .I3(\count[18]_i_7_n_0 ),
        .I4(count[0]),
        .I5(count0[14]),
        .O(p_1_in[14]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \count[15]_i_1 
       (.I0(\count[18]_i_4_n_0 ),
        .I1(\count[18]_i_5_n_0 ),
        .I2(\count[18]_i_6_n_0 ),
        .I3(\count[18]_i_7_n_0 ),
        .I4(count[0]),
        .I5(count0[15]),
        .O(p_1_in[15]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \count[16]_i_1 
       (.I0(\count[18]_i_4_n_0 ),
        .I1(\count[18]_i_5_n_0 ),
        .I2(\count[18]_i_6_n_0 ),
        .I3(\count[18]_i_7_n_0 ),
        .I4(count[0]),
        .I5(count0[16]),
        .O(p_1_in[16]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \count[17]_i_1 
       (.I0(\count[18]_i_4_n_0 ),
        .I1(\count[18]_i_5_n_0 ),
        .I2(\count[18]_i_6_n_0 ),
        .I3(\count[18]_i_7_n_0 ),
        .I4(count[0]),
        .I5(count0[17]),
        .O(p_1_in[17]));
  LUT1 #(
    .INIT(2'h1)) 
    \count[18]_i_1 
       (.I0(s00_axis_aresetn),
        .O(\count[18]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \count[18]_i_2 
       (.I0(s00_axis_tvalid),
        .I1(m00_axis_tready),
        .O(count0_0));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \count[18]_i_3 
       (.I0(\count[18]_i_4_n_0 ),
        .I1(\count[18]_i_5_n_0 ),
        .I2(\count[18]_i_6_n_0 ),
        .I3(\count[18]_i_7_n_0 ),
        .I4(count[0]),
        .I5(count0[18]),
        .O(p_1_in[18]));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \count[18]_i_4 
       (.I0(count[8]),
        .I1(count[7]),
        .I2(count[10]),
        .I3(count[9]),
        .O(\count[18]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \count[18]_i_5 
       (.I0(count[12]),
        .I1(count[11]),
        .I2(count[14]),
        .I3(count[13]),
        .O(\count[18]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFFFFFFFFFFFFF)) 
    \count[18]_i_6 
       (.I0(count[18]),
        .I1(count[17]),
        .I2(count[15]),
        .I3(count[16]),
        .I4(count[2]),
        .I5(count[1]),
        .O(\count[18]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \count[18]_i_7 
       (.I0(count[4]),
        .I1(count[3]),
        .I2(count[6]),
        .I3(count[5]),
        .O(\count[18]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \count[1]_i_1 
       (.I0(\count[18]_i_4_n_0 ),
        .I1(\count[18]_i_5_n_0 ),
        .I2(\count[18]_i_6_n_0 ),
        .I3(\count[18]_i_7_n_0 ),
        .I4(count[0]),
        .I5(count0[1]),
        .O(p_1_in[1]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \count[2]_i_1 
       (.I0(\count[18]_i_4_n_0 ),
        .I1(\count[18]_i_5_n_0 ),
        .I2(\count[18]_i_6_n_0 ),
        .I3(\count[18]_i_7_n_0 ),
        .I4(count[0]),
        .I5(count0[2]),
        .O(p_1_in[2]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \count[3]_i_1 
       (.I0(\count[18]_i_4_n_0 ),
        .I1(\count[18]_i_5_n_0 ),
        .I2(\count[18]_i_6_n_0 ),
        .I3(\count[18]_i_7_n_0 ),
        .I4(count[0]),
        .I5(count0[3]),
        .O(p_1_in[3]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \count[4]_i_1 
       (.I0(\count[18]_i_4_n_0 ),
        .I1(\count[18]_i_5_n_0 ),
        .I2(\count[18]_i_6_n_0 ),
        .I3(\count[18]_i_7_n_0 ),
        .I4(count[0]),
        .I5(count0[4]),
        .O(p_1_in[4]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \count[5]_i_1 
       (.I0(\count[18]_i_4_n_0 ),
        .I1(\count[18]_i_5_n_0 ),
        .I2(\count[18]_i_6_n_0 ),
        .I3(\count[18]_i_7_n_0 ),
        .I4(count[0]),
        .I5(count0[5]),
        .O(p_1_in[5]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \count[6]_i_1 
       (.I0(\count[18]_i_4_n_0 ),
        .I1(\count[18]_i_5_n_0 ),
        .I2(\count[18]_i_6_n_0 ),
        .I3(\count[18]_i_7_n_0 ),
        .I4(count[0]),
        .I5(count0[6]),
        .O(p_1_in[6]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \count[7]_i_1 
       (.I0(\count[18]_i_4_n_0 ),
        .I1(\count[18]_i_5_n_0 ),
        .I2(\count[18]_i_6_n_0 ),
        .I3(\count[18]_i_7_n_0 ),
        .I4(count[0]),
        .I5(count0[7]),
        .O(p_1_in[7]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \count[8]_i_1 
       (.I0(\count[18]_i_4_n_0 ),
        .I1(\count[18]_i_5_n_0 ),
        .I2(\count[18]_i_6_n_0 ),
        .I3(\count[18]_i_7_n_0 ),
        .I4(count[0]),
        .I5(count0[8]),
        .O(p_1_in[8]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \count[9]_i_1 
       (.I0(\count[18]_i_4_n_0 ),
        .I1(\count[18]_i_5_n_0 ),
        .I2(\count[18]_i_6_n_0 ),
        .I3(\count[18]_i_7_n_0 ),
        .I4(count[0]),
        .I5(count0[9]),
        .O(p_1_in[9]));
  FDRE \count_reg[0] 
       (.C(s00_axis_aclk),
        .CE(count0_0),
        .D(count0__0),
        .Q(count[0]),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[10] 
       (.C(s00_axis_aclk),
        .CE(count0_0),
        .D(p_1_in[10]),
        .Q(count[10]),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[11] 
       (.C(s00_axis_aclk),
        .CE(count0_0),
        .D(p_1_in[11]),
        .Q(count[11]),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[12] 
       (.C(s00_axis_aclk),
        .CE(count0_0),
        .D(p_1_in[12]),
        .Q(count[12]),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[13] 
       (.C(s00_axis_aclk),
        .CE(count0_0),
        .D(p_1_in[13]),
        .Q(count[13]),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[14] 
       (.C(s00_axis_aclk),
        .CE(count0_0),
        .D(p_1_in[14]),
        .Q(count[14]),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[15] 
       (.C(s00_axis_aclk),
        .CE(count0_0),
        .D(p_1_in[15]),
        .Q(count[15]),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[16] 
       (.C(s00_axis_aclk),
        .CE(count0_0),
        .D(p_1_in[16]),
        .Q(count[16]),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[17] 
       (.C(s00_axis_aclk),
        .CE(count0_0),
        .D(p_1_in[17]),
        .Q(count[17]),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[18] 
       (.C(s00_axis_aclk),
        .CE(count0_0),
        .D(p_1_in[18]),
        .Q(count[18]),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[1] 
       (.C(s00_axis_aclk),
        .CE(count0_0),
        .D(p_1_in[1]),
        .Q(count[1]),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[2] 
       (.C(s00_axis_aclk),
        .CE(count0_0),
        .D(p_1_in[2]),
        .Q(count[2]),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[3] 
       (.C(s00_axis_aclk),
        .CE(count0_0),
        .D(p_1_in[3]),
        .Q(count[3]),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[4] 
       (.C(s00_axis_aclk),
        .CE(count0_0),
        .D(p_1_in[4]),
        .Q(count[4]),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[5] 
       (.C(s00_axis_aclk),
        .CE(count0_0),
        .D(p_1_in[5]),
        .Q(count[5]),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[6] 
       (.C(s00_axis_aclk),
        .CE(count0_0),
        .D(p_1_in[6]),
        .Q(count[6]),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[7] 
       (.C(s00_axis_aclk),
        .CE(count0_0),
        .D(p_1_in[7]),
        .Q(count[7]),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[8] 
       (.C(s00_axis_aclk),
        .CE(count0_0),
        .D(p_1_in[8]),
        .Q(count[8]),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[9] 
       (.C(s00_axis_aclk),
        .CE(count0_0),
        .D(p_1_in[9]),
        .Q(count[9]),
        .R(\count[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[0]_INST_0 
       (.I0(control[1]),
        .I1(count[0]),
        .I2(s00_axis_tdata[0]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[0]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[10]_INST_0 
       (.I0(control[1]),
        .I1(count[10]),
        .I2(s00_axis_tdata[10]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[10]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[11]_INST_0 
       (.I0(control[1]),
        .I1(count[11]),
        .I2(s00_axis_tdata[11]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[11]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[12]_INST_0 
       (.I0(control[1]),
        .I1(count[12]),
        .I2(s00_axis_tdata[12]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[12]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[13]_INST_0 
       (.I0(control[1]),
        .I1(count[13]),
        .I2(s00_axis_tdata[13]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[13]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[14]_INST_0 
       (.I0(control[1]),
        .I1(count[14]),
        .I2(s00_axis_tdata[14]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[14]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[15]_INST_0 
       (.I0(control[1]),
        .I1(count[15]),
        .I2(s00_axis_tdata[15]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[15]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[16]_INST_0 
       (.I0(control[1]),
        .I1(count[16]),
        .I2(s01_axis_tdata[0]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[16]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[17]_INST_0 
       (.I0(control[1]),
        .I1(count[17]),
        .I2(s01_axis_tdata[1]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[17]));
  LUT6 #(
    .INIT(64'hA8AAA8AAABAAA8AA)) 
    \m00_axis_tdata[18]_INST_0 
       (.I0(s01_axis_tdata[2]),
        .I1(control[3]),
        .I2(control[2]),
        .I3(control[0]),
        .I4(count[18]),
        .I5(control[1]),
        .O(m00_axis_tdata[18]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[1]_INST_0 
       (.I0(control[1]),
        .I1(count[1]),
        .I2(s00_axis_tdata[1]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[1]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[2]_INST_0 
       (.I0(control[1]),
        .I1(count[2]),
        .I2(s00_axis_tdata[2]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[2]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[3]_INST_0 
       (.I0(control[1]),
        .I1(count[3]),
        .I2(s00_axis_tdata[3]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[3]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[4]_INST_0 
       (.I0(control[1]),
        .I1(count[4]),
        .I2(s00_axis_tdata[4]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[4]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[5]_INST_0 
       (.I0(control[1]),
        .I1(count[5]),
        .I2(s00_axis_tdata[5]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[5]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[6]_INST_0 
       (.I0(control[1]),
        .I1(count[6]),
        .I2(s00_axis_tdata[6]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[6]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[7]_INST_0 
       (.I0(control[1]),
        .I1(count[7]),
        .I2(s00_axis_tdata[7]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[7]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[8]_INST_0 
       (.I0(control[1]),
        .I1(count[8]),
        .I2(s00_axis_tdata[8]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[8]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[9]_INST_0 
       (.I0(control[1]),
        .I1(count[9]),
        .I2(s00_axis_tdata[9]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[9]));
  LUT5 #(
    .INIT(32'h00400000)) 
    tlast_reg_i_1
       (.I0(tlast_reg_i_2_n_0),
        .I1(m00_axis_tready),
        .I2(s00_axis_tvalid),
        .I3(count[0]),
        .I4(s00_axis_aresetn),
        .O(tlast_reg_i_1_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    tlast_reg_i_2
       (.I0(\count[18]_i_7_n_0 ),
        .I1(\count[18]_i_6_n_0 ),
        .I2(\count[18]_i_5_n_0 ),
        .I3(\count[18]_i_4_n_0 ),
        .O(tlast_reg_i_2_n_0));
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
