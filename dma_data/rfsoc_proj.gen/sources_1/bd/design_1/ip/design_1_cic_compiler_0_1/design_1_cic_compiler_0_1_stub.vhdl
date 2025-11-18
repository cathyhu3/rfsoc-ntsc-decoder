-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
-- Date        : Mon Nov 17 20:23:11 2025
-- Host        : eecs-digital-42 running 64-bit Ubuntu 24.04.3 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top design_1_cic_compiler_0_1 -prefix
--               design_1_cic_compiler_0_1_ design_1_cic_compiler_0_0_stub.vhdl
-- Design      : design_1_cic_compiler_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu48dr-ffvg1517-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_cic_compiler_0_1 is
  Port ( 
    aclk : in STD_LOGIC;
    s_axis_data_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_data_tvalid : in STD_LOGIC;
    s_axis_data_tready : out STD_LOGIC;
    m_axis_data_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_data_tvalid : out STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_cic_compiler_0_1 : entity is "design_1_cic_compiler_0_0,cic_compiler_v4_0_21,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of design_1_cic_compiler_0_1 : entity is "design_1_cic_compiler_0_0,cic_compiler_v4_0_21,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=cic_compiler,x_ipVersion=4.0,x_ipCoreRevision=21,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_COMPONENT_NAME=design_1_cic_compiler_0_0,C_FILTER_TYPE=1,C_NUM_STAGES=6,C_DIFF_DELAY=1,C_RATE=8,C_INPUT_WIDTH=16,C_OUTPUT_WIDTH=16,C_USE_DSP=1,C_HAS_ROUNDING=0,C_NUM_CHANNELS=1,C_RATE_TYPE=0,C_MIN_RATE=8,C_MAX_RATE=8,C_SAMPLE_FREQ=1,C_CLK_FREQ=1,C_USE_STREAMING_INTERFACE=1,C_FAMILY=zynquplus,C_XDEVICEFAMILY=zynquplus,C_C1=23,C_C2=22,C_C3=21,C_C4=20,C_C5=20,C_C6=19,C_I1=34,C_I2=31,C_I3=29,C_I4=27,C_I5=25,C_I6=24,C_S_AXIS_CONFIG_TDATA_WIDTH=1,C_S_AXIS_DATA_TDATA_WIDTH=16,C_M_AXIS_DATA_TDATA_WIDTH=16,C_M_AXIS_DATA_TUSER_WIDTH=1,C_HAS_DOUT_TREADY=0,C_HAS_ACLKEN=0,C_HAS_ARESETN=0}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_cic_compiler_0_1 : entity is "yes";
end design_1_cic_compiler_0_1;

architecture stub of design_1_cic_compiler_0_1 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "aclk,s_axis_data_tdata[15:0],s_axis_data_tvalid,s_axis_data_tready,m_axis_data_tdata[15:0],m_axis_data_tvalid";
  attribute x_interface_info : string;
  attribute x_interface_info of aclk : signal is "xilinx.com:signal:clock:1.0 aclk_intf CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of aclk : signal is "slave aclk_intf";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of aclk : signal is "XIL_INTERFACENAME aclk_intf, ASSOCIATED_BUSIF S_AXIS_CONFIG:M_AXIS_DATA:S_AXIS_DATA, ASSOCIATED_RESET aresetn, ASSOCIATED_CLKEN aclken, FREQ_HZ 64000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_usp_rf_data_converter_0_0_clk_adc2, INSERT_VIP 0";
  attribute x_interface_info of s_axis_data_tdata : signal is "xilinx.com:interface:axis:1.0 S_AXIS_DATA TDATA";
  attribute x_interface_mode of s_axis_data_tdata : signal is "slave S_AXIS_DATA";
  attribute x_interface_parameter of s_axis_data_tdata : signal is "XIL_INTERFACENAME S_AXIS_DATA, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 64000000, PHASE 0.0, CLK_DOMAIN design_1_usp_rf_data_converter_0_0_clk_adc2, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute x_interface_info of s_axis_data_tvalid : signal is "xilinx.com:interface:axis:1.0 S_AXIS_DATA TVALID";
  attribute x_interface_info of s_axis_data_tready : signal is "xilinx.com:interface:axis:1.0 S_AXIS_DATA TREADY";
  attribute x_interface_info of m_axis_data_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_DATA TDATA";
  attribute x_interface_mode of m_axis_data_tdata : signal is "master M_AXIS_DATA";
  attribute x_interface_parameter of m_axis_data_tdata : signal is "XIL_INTERFACENAME M_AXIS_DATA, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 64000000, PHASE 0.0, CLK_DOMAIN design_1_usp_rf_data_converter_0_0_clk_adc2, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value chan} size {attribs {resolve_type generated dependency chan_size format long minimum {} maximum {}} value 1} stride {attribs {resolve_type generated dependency chan_stride format long minimum {} maximum {}} value 16} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency data_width format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type generated dependency data_fractwidth format long minimum {} maximum {}} value 0} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}} TDATA_WIDTH 16 TUSER {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_chan_out {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value chan_out} enabled {attribs {resolve_type generated dependency enabled format bool minimum {} maximum {}} value false} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency chan_out_width format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} field_chan_sync {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value chan_sync} enabled {attribs {resolve_type generated dependency enabled format bool minimum {} maximum {}} value false} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency chan_sync_width format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type generated dependency chan_sync_offset format long minimum {} maximum {}} value 0}}}}}} TUSER_WIDTH 0}, INSERT_VIP 0";
  attribute x_interface_info of m_axis_data_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_DATA TVALID";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "cic_compiler_v4_0_21,Vivado 2025.1";
begin
end;
