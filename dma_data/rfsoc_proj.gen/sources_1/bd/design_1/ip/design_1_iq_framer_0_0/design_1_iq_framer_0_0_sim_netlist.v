// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Mon Nov 17 20:23:06 2025
// Host        : eecs-digital-42 running 64-bit Ubuntu 24.04.3 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/thagenlo/Desktop/dma_data/rfsoc_proj.gen/sources_1/bd/design_1/ip/design_1_iq_framer_0_0/design_1_iq_framer_0_0_sim_netlist.v
// Design      : design_1_iq_framer_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu48dr-ffvg1517-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_iq_framer_0_0,iq_framer,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "iq_framer,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module design_1_iq_framer_0_0
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

  assign m00_axis_tstrb[3] = \<const1> ;
  assign m00_axis_tstrb[2] = \<const1> ;
  assign m00_axis_tstrb[1] = \<const1> ;
  assign m00_axis_tstrb[0] = \<const1> ;
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
  design_1_iq_framer_0_0_iq_framer inst
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

(* ORIG_REF_NAME = "iq_framer" *) 
module design_1_iq_framer_0_0_iq_framer
   (m00_axis_tdata,
    m00_axis_tlast,
    s00_axis_tvalid,
    m00_axis_tready,
    control,
    s00_axis_tdata,
    s01_axis_tdata,
    s00_axis_aresetn,
    s00_axis_aclk);
  output [18:0]m00_axis_tdata;
  output m00_axis_tlast;
  input s00_axis_tvalid;
  input m00_axis_tready;
  input [3:0]control;
  input [15:0]s00_axis_tdata;
  input [2:0]s01_axis_tdata;
  input s00_axis_aresetn;
  input s00_axis_aclk;

  wire [3:0]control;
  wire [18:0]count;
  wire count0;
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
  wire \count_reg_n_0_[0] ;
  wire \count_reg_n_0_[10] ;
  wire \count_reg_n_0_[11] ;
  wire \count_reg_n_0_[12] ;
  wire \count_reg_n_0_[13] ;
  wire \count_reg_n_0_[14] ;
  wire \count_reg_n_0_[15] ;
  wire \count_reg_n_0_[16] ;
  wire \count_reg_n_0_[17] ;
  wire \count_reg_n_0_[18] ;
  wire \count_reg_n_0_[1] ;
  wire \count_reg_n_0_[2] ;
  wire \count_reg_n_0_[3] ;
  wire \count_reg_n_0_[4] ;
  wire \count_reg_n_0_[5] ;
  wire \count_reg_n_0_[6] ;
  wire \count_reg_n_0_[7] ;
  wire \count_reg_n_0_[8] ;
  wire \count_reg_n_0_[9] ;
  wire [18:1]data0;
  wire [18:0]m00_axis_tdata;
  wire m00_axis_tlast;
  wire m00_axis_tlast_INST_0_i_1_n_0;
  wire m00_axis_tlast_INST_0_i_2_n_0;
  wire m00_axis_tlast_INST_0_i_3_n_0;
  wire m00_axis_tlast_INST_0_i_4_n_0;
  wire m00_axis_tlast_INST_0_i_5_n_0;
  wire m00_axis_tready;
  wire s00_axis_aclk;
  wire s00_axis_aresetn;
  wire [15:0]s00_axis_tdata;
  wire s00_axis_tvalid;
  wire [2:0]s01_axis_tdata;
  wire [7:1]\NLW_count0_inferred__0/i__carry__1_CO_UNCONNECTED ;
  wire [7:2]\NLW_count0_inferred__0/i__carry__1_O_UNCONNECTED ;

  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \count0_inferred__0/i__carry 
       (.CI(\count_reg_n_0_[0] ),
        .CI_TOP(1'b0),
        .CO({\count0_inferred__0/i__carry_n_0 ,\count0_inferred__0/i__carry_n_1 ,\count0_inferred__0/i__carry_n_2 ,\count0_inferred__0/i__carry_n_3 ,\count0_inferred__0/i__carry_n_4 ,\count0_inferred__0/i__carry_n_5 ,\count0_inferred__0/i__carry_n_6 ,\count0_inferred__0/i__carry_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:1]),
        .S({\count_reg_n_0_[8] ,\count_reg_n_0_[7] ,\count_reg_n_0_[6] ,\count_reg_n_0_[5] ,\count_reg_n_0_[4] ,\count_reg_n_0_[3] ,\count_reg_n_0_[2] ,\count_reg_n_0_[1] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \count0_inferred__0/i__carry__0 
       (.CI(\count0_inferred__0/i__carry_n_0 ),
        .CI_TOP(1'b0),
        .CO({\count0_inferred__0/i__carry__0_n_0 ,\count0_inferred__0/i__carry__0_n_1 ,\count0_inferred__0/i__carry__0_n_2 ,\count0_inferred__0/i__carry__0_n_3 ,\count0_inferred__0/i__carry__0_n_4 ,\count0_inferred__0/i__carry__0_n_5 ,\count0_inferred__0/i__carry__0_n_6 ,\count0_inferred__0/i__carry__0_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:9]),
        .S({\count_reg_n_0_[16] ,\count_reg_n_0_[15] ,\count_reg_n_0_[14] ,\count_reg_n_0_[13] ,\count_reg_n_0_[12] ,\count_reg_n_0_[11] ,\count_reg_n_0_[10] ,\count_reg_n_0_[9] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \count0_inferred__0/i__carry__1 
       (.CI(\count0_inferred__0/i__carry__0_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_count0_inferred__0/i__carry__1_CO_UNCONNECTED [7:1],\count0_inferred__0/i__carry__1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_count0_inferred__0/i__carry__1_O_UNCONNECTED [7:2],data0[18:17]}),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\count_reg_n_0_[18] ,\count_reg_n_0_[17] }));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1 
       (.I0(\count_reg_n_0_[0] ),
        .O(count[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \count[10]_i_1 
       (.I0(m00_axis_tlast_INST_0_i_1_n_0),
        .I1(m00_axis_tlast_INST_0_i_2_n_0),
        .I2(m00_axis_tlast_INST_0_i_3_n_0),
        .I3(m00_axis_tlast_INST_0_i_4_n_0),
        .I4(m00_axis_tlast_INST_0_i_5_n_0),
        .I5(data0[10]),
        .O(count[10]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \count[11]_i_1 
       (.I0(m00_axis_tlast_INST_0_i_1_n_0),
        .I1(m00_axis_tlast_INST_0_i_2_n_0),
        .I2(m00_axis_tlast_INST_0_i_3_n_0),
        .I3(m00_axis_tlast_INST_0_i_4_n_0),
        .I4(m00_axis_tlast_INST_0_i_5_n_0),
        .I5(data0[11]),
        .O(count[11]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \count[12]_i_1 
       (.I0(m00_axis_tlast_INST_0_i_1_n_0),
        .I1(m00_axis_tlast_INST_0_i_2_n_0),
        .I2(m00_axis_tlast_INST_0_i_3_n_0),
        .I3(m00_axis_tlast_INST_0_i_4_n_0),
        .I4(m00_axis_tlast_INST_0_i_5_n_0),
        .I5(data0[12]),
        .O(count[12]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \count[13]_i_1 
       (.I0(m00_axis_tlast_INST_0_i_1_n_0),
        .I1(m00_axis_tlast_INST_0_i_2_n_0),
        .I2(m00_axis_tlast_INST_0_i_3_n_0),
        .I3(m00_axis_tlast_INST_0_i_4_n_0),
        .I4(m00_axis_tlast_INST_0_i_5_n_0),
        .I5(data0[13]),
        .O(count[13]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \count[14]_i_1 
       (.I0(m00_axis_tlast_INST_0_i_1_n_0),
        .I1(m00_axis_tlast_INST_0_i_2_n_0),
        .I2(m00_axis_tlast_INST_0_i_3_n_0),
        .I3(m00_axis_tlast_INST_0_i_4_n_0),
        .I4(m00_axis_tlast_INST_0_i_5_n_0),
        .I5(data0[14]),
        .O(count[14]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \count[15]_i_1 
       (.I0(m00_axis_tlast_INST_0_i_1_n_0),
        .I1(m00_axis_tlast_INST_0_i_2_n_0),
        .I2(m00_axis_tlast_INST_0_i_3_n_0),
        .I3(m00_axis_tlast_INST_0_i_4_n_0),
        .I4(m00_axis_tlast_INST_0_i_5_n_0),
        .I5(data0[15]),
        .O(count[15]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \count[16]_i_1 
       (.I0(m00_axis_tlast_INST_0_i_1_n_0),
        .I1(m00_axis_tlast_INST_0_i_2_n_0),
        .I2(m00_axis_tlast_INST_0_i_3_n_0),
        .I3(m00_axis_tlast_INST_0_i_4_n_0),
        .I4(m00_axis_tlast_INST_0_i_5_n_0),
        .I5(data0[16]),
        .O(count[16]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \count[17]_i_1 
       (.I0(m00_axis_tlast_INST_0_i_1_n_0),
        .I1(m00_axis_tlast_INST_0_i_2_n_0),
        .I2(m00_axis_tlast_INST_0_i_3_n_0),
        .I3(m00_axis_tlast_INST_0_i_4_n_0),
        .I4(m00_axis_tlast_INST_0_i_5_n_0),
        .I5(data0[17]),
        .O(count[17]));
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
        .O(count0));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \count[18]_i_3 
       (.I0(m00_axis_tlast_INST_0_i_1_n_0),
        .I1(m00_axis_tlast_INST_0_i_2_n_0),
        .I2(m00_axis_tlast_INST_0_i_3_n_0),
        .I3(m00_axis_tlast_INST_0_i_4_n_0),
        .I4(m00_axis_tlast_INST_0_i_5_n_0),
        .I5(data0[18]),
        .O(count[18]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \count[1]_i_1 
       (.I0(m00_axis_tlast_INST_0_i_1_n_0),
        .I1(m00_axis_tlast_INST_0_i_2_n_0),
        .I2(m00_axis_tlast_INST_0_i_3_n_0),
        .I3(m00_axis_tlast_INST_0_i_4_n_0),
        .I4(m00_axis_tlast_INST_0_i_5_n_0),
        .I5(data0[1]),
        .O(count[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \count[2]_i_1 
       (.I0(m00_axis_tlast_INST_0_i_1_n_0),
        .I1(m00_axis_tlast_INST_0_i_2_n_0),
        .I2(m00_axis_tlast_INST_0_i_3_n_0),
        .I3(m00_axis_tlast_INST_0_i_4_n_0),
        .I4(m00_axis_tlast_INST_0_i_5_n_0),
        .I5(data0[2]),
        .O(count[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \count[3]_i_1 
       (.I0(m00_axis_tlast_INST_0_i_1_n_0),
        .I1(m00_axis_tlast_INST_0_i_2_n_0),
        .I2(m00_axis_tlast_INST_0_i_3_n_0),
        .I3(m00_axis_tlast_INST_0_i_4_n_0),
        .I4(m00_axis_tlast_INST_0_i_5_n_0),
        .I5(data0[3]),
        .O(count[3]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \count[4]_i_1 
       (.I0(m00_axis_tlast_INST_0_i_1_n_0),
        .I1(m00_axis_tlast_INST_0_i_2_n_0),
        .I2(m00_axis_tlast_INST_0_i_3_n_0),
        .I3(m00_axis_tlast_INST_0_i_4_n_0),
        .I4(m00_axis_tlast_INST_0_i_5_n_0),
        .I5(data0[4]),
        .O(count[4]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \count[5]_i_1 
       (.I0(m00_axis_tlast_INST_0_i_1_n_0),
        .I1(m00_axis_tlast_INST_0_i_2_n_0),
        .I2(m00_axis_tlast_INST_0_i_3_n_0),
        .I3(m00_axis_tlast_INST_0_i_4_n_0),
        .I4(m00_axis_tlast_INST_0_i_5_n_0),
        .I5(data0[5]),
        .O(count[5]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \count[6]_i_1 
       (.I0(m00_axis_tlast_INST_0_i_1_n_0),
        .I1(m00_axis_tlast_INST_0_i_2_n_0),
        .I2(m00_axis_tlast_INST_0_i_3_n_0),
        .I3(m00_axis_tlast_INST_0_i_4_n_0),
        .I4(m00_axis_tlast_INST_0_i_5_n_0),
        .I5(data0[6]),
        .O(count[6]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \count[7]_i_1 
       (.I0(m00_axis_tlast_INST_0_i_1_n_0),
        .I1(m00_axis_tlast_INST_0_i_2_n_0),
        .I2(m00_axis_tlast_INST_0_i_3_n_0),
        .I3(m00_axis_tlast_INST_0_i_4_n_0),
        .I4(m00_axis_tlast_INST_0_i_5_n_0),
        .I5(data0[7]),
        .O(count[7]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \count[8]_i_1 
       (.I0(m00_axis_tlast_INST_0_i_1_n_0),
        .I1(m00_axis_tlast_INST_0_i_2_n_0),
        .I2(m00_axis_tlast_INST_0_i_3_n_0),
        .I3(m00_axis_tlast_INST_0_i_4_n_0),
        .I4(m00_axis_tlast_INST_0_i_5_n_0),
        .I5(data0[8]),
        .O(count[8]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \count[9]_i_1 
       (.I0(m00_axis_tlast_INST_0_i_1_n_0),
        .I1(m00_axis_tlast_INST_0_i_2_n_0),
        .I2(m00_axis_tlast_INST_0_i_3_n_0),
        .I3(m00_axis_tlast_INST_0_i_4_n_0),
        .I4(m00_axis_tlast_INST_0_i_5_n_0),
        .I5(data0[9]),
        .O(count[9]));
  FDRE \count_reg[0] 
       (.C(s00_axis_aclk),
        .CE(count0),
        .D(count[0]),
        .Q(\count_reg_n_0_[0] ),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[10] 
       (.C(s00_axis_aclk),
        .CE(count0),
        .D(count[10]),
        .Q(\count_reg_n_0_[10] ),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[11] 
       (.C(s00_axis_aclk),
        .CE(count0),
        .D(count[11]),
        .Q(\count_reg_n_0_[11] ),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[12] 
       (.C(s00_axis_aclk),
        .CE(count0),
        .D(count[12]),
        .Q(\count_reg_n_0_[12] ),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[13] 
       (.C(s00_axis_aclk),
        .CE(count0),
        .D(count[13]),
        .Q(\count_reg_n_0_[13] ),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[14] 
       (.C(s00_axis_aclk),
        .CE(count0),
        .D(count[14]),
        .Q(\count_reg_n_0_[14] ),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[15] 
       (.C(s00_axis_aclk),
        .CE(count0),
        .D(count[15]),
        .Q(\count_reg_n_0_[15] ),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[16] 
       (.C(s00_axis_aclk),
        .CE(count0),
        .D(count[16]),
        .Q(\count_reg_n_0_[16] ),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[17] 
       (.C(s00_axis_aclk),
        .CE(count0),
        .D(count[17]),
        .Q(\count_reg_n_0_[17] ),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[18] 
       (.C(s00_axis_aclk),
        .CE(count0),
        .D(count[18]),
        .Q(\count_reg_n_0_[18] ),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[1] 
       (.C(s00_axis_aclk),
        .CE(count0),
        .D(count[1]),
        .Q(\count_reg_n_0_[1] ),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[2] 
       (.C(s00_axis_aclk),
        .CE(count0),
        .D(count[2]),
        .Q(\count_reg_n_0_[2] ),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[3] 
       (.C(s00_axis_aclk),
        .CE(count0),
        .D(count[3]),
        .Q(\count_reg_n_0_[3] ),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[4] 
       (.C(s00_axis_aclk),
        .CE(count0),
        .D(count[4]),
        .Q(\count_reg_n_0_[4] ),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[5] 
       (.C(s00_axis_aclk),
        .CE(count0),
        .D(count[5]),
        .Q(\count_reg_n_0_[5] ),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[6] 
       (.C(s00_axis_aclk),
        .CE(count0),
        .D(count[6]),
        .Q(\count_reg_n_0_[6] ),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[7] 
       (.C(s00_axis_aclk),
        .CE(count0),
        .D(count[7]),
        .Q(\count_reg_n_0_[7] ),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[8] 
       (.C(s00_axis_aclk),
        .CE(count0),
        .D(count[8]),
        .Q(\count_reg_n_0_[8] ),
        .R(\count[18]_i_1_n_0 ));
  FDRE \count_reg[9] 
       (.C(s00_axis_aclk),
        .CE(count0),
        .D(count[9]),
        .Q(\count_reg_n_0_[9] ),
        .R(\count[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[0]_INST_0 
       (.I0(control[1]),
        .I1(\count_reg_n_0_[0] ),
        .I2(s00_axis_tdata[0]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[0]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[10]_INST_0 
       (.I0(control[1]),
        .I1(\count_reg_n_0_[10] ),
        .I2(s00_axis_tdata[10]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[10]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[11]_INST_0 
       (.I0(control[1]),
        .I1(\count_reg_n_0_[11] ),
        .I2(s00_axis_tdata[11]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[11]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[12]_INST_0 
       (.I0(control[1]),
        .I1(\count_reg_n_0_[12] ),
        .I2(s00_axis_tdata[12]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[12]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[13]_INST_0 
       (.I0(control[1]),
        .I1(\count_reg_n_0_[13] ),
        .I2(s00_axis_tdata[13]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[13]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[14]_INST_0 
       (.I0(control[1]),
        .I1(\count_reg_n_0_[14] ),
        .I2(s00_axis_tdata[14]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[14]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[15]_INST_0 
       (.I0(control[1]),
        .I1(\count_reg_n_0_[15] ),
        .I2(s00_axis_tdata[15]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[15]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[16]_INST_0 
       (.I0(control[1]),
        .I1(\count_reg_n_0_[16] ),
        .I2(s01_axis_tdata[0]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[16]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[17]_INST_0 
       (.I0(control[1]),
        .I1(\count_reg_n_0_[17] ),
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
        .I4(\count_reg_n_0_[18] ),
        .I5(control[1]),
        .O(m00_axis_tdata[18]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[1]_INST_0 
       (.I0(control[1]),
        .I1(\count_reg_n_0_[1] ),
        .I2(s00_axis_tdata[1]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[1]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[2]_INST_0 
       (.I0(control[1]),
        .I1(\count_reg_n_0_[2] ),
        .I2(s00_axis_tdata[2]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[2]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[3]_INST_0 
       (.I0(control[1]),
        .I1(\count_reg_n_0_[3] ),
        .I2(s00_axis_tdata[3]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[3]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[4]_INST_0 
       (.I0(control[1]),
        .I1(\count_reg_n_0_[4] ),
        .I2(s00_axis_tdata[4]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[4]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[5]_INST_0 
       (.I0(control[1]),
        .I1(\count_reg_n_0_[5] ),
        .I2(s00_axis_tdata[5]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[5]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[6]_INST_0 
       (.I0(control[1]),
        .I1(\count_reg_n_0_[6] ),
        .I2(s00_axis_tdata[6]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[6]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[7]_INST_0 
       (.I0(control[1]),
        .I1(\count_reg_n_0_[7] ),
        .I2(s00_axis_tdata[7]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[7]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[8]_INST_0 
       (.I0(control[1]),
        .I1(\count_reg_n_0_[8] ),
        .I2(s00_axis_tdata[8]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[8]));
  LUT6 #(
    .INIT(64'hF0F0F0EEF0F0F0F0)) 
    \m00_axis_tdata[9]_INST_0 
       (.I0(control[1]),
        .I1(\count_reg_n_0_[9] ),
        .I2(s00_axis_tdata[9]),
        .I3(control[3]),
        .I4(control[2]),
        .I5(control[0]),
        .O(m00_axis_tdata[9]));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    m00_axis_tlast_INST_0
       (.I0(m00_axis_tlast_INST_0_i_1_n_0),
        .I1(m00_axis_tlast_INST_0_i_2_n_0),
        .I2(m00_axis_tlast_INST_0_i_3_n_0),
        .I3(m00_axis_tlast_INST_0_i_4_n_0),
        .I4(m00_axis_tlast_INST_0_i_5_n_0),
        .I5(s00_axis_tvalid),
        .O(m00_axis_tlast));
  LUT4 #(
    .INIT(16'h7FFF)) 
    m00_axis_tlast_INST_0_i_1
       (.I0(\count_reg_n_0_[2] ),
        .I1(\count_reg_n_0_[1] ),
        .I2(\count_reg_n_0_[4] ),
        .I3(\count_reg_n_0_[3] ),
        .O(m00_axis_tlast_INST_0_i_1_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    m00_axis_tlast_INST_0_i_2
       (.I0(\count_reg_n_0_[14] ),
        .I1(\count_reg_n_0_[13] ),
        .I2(\count_reg_n_0_[16] ),
        .I3(\count_reg_n_0_[15] ),
        .O(m00_axis_tlast_INST_0_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    m00_axis_tlast_INST_0_i_3
       (.I0(\count_reg_n_0_[17] ),
        .I1(\count_reg_n_0_[18] ),
        .I2(\count_reg_n_0_[0] ),
        .O(m00_axis_tlast_INST_0_i_3_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    m00_axis_tlast_INST_0_i_4
       (.I0(\count_reg_n_0_[10] ),
        .I1(\count_reg_n_0_[9] ),
        .I2(\count_reg_n_0_[12] ),
        .I3(\count_reg_n_0_[11] ),
        .O(m00_axis_tlast_INST_0_i_4_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    m00_axis_tlast_INST_0_i_5
       (.I0(\count_reg_n_0_[6] ),
        .I1(\count_reg_n_0_[5] ),
        .I2(\count_reg_n_0_[8] ),
        .I3(\count_reg_n_0_[7] ),
        .O(m00_axis_tlast_INST_0_i_5_n_0));
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
