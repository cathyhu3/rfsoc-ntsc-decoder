//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
//Date        : Mon Nov 17 20:57:55 2025
//Host        : eecs-digital-42 running 64-bit Ubuntu 24.04.3 LTS
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=11,numReposBlks=11,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=4,da_rf_converter_usp_cnt=1,da_zynq_ultra_ps_e_cnt=1,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (adc2_clk_clk_n,
    adc2_clk_clk_p,
    led,
    sw,
    sysref_in_diff_n,
    sysref_in_diff_p,
    vin2_01_v_n,
    vin2_01_v_p);
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 adc2_clk CLK_N" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME adc2_clk, CAN_DEBUG false, FREQ_HZ 491520000.0" *) input adc2_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 adc2_clk CLK_P" *) input adc2_clk_clk_p;
  output [3:0]led;
  input [3:0]sw;
  (* X_INTERFACE_INFO = "xilinx.com:display_usp_rf_data_converter:diff_pins:1.0 sysref_in diff_n" *) (* X_INTERFACE_MODE = "Slave" *) input sysref_in_diff_n;
  (* X_INTERFACE_INFO = "xilinx.com:display_usp_rf_data_converter:diff_pins:1.0 sysref_in diff_p" *) input sysref_in_diff_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin2_01 V_N" *) (* X_INTERFACE_MODE = "Slave" *) input vin2_01_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin2_01 V_P" *) input vin2_01_v_p;

  wire adc2_clk_clk_n;
  wire adc2_clk_clk_p;
  wire [31:0]axi_dma_0_M_AXI_S2MM_AWADDR;
  wire [1:0]axi_dma_0_M_AXI_S2MM_AWBURST;
  wire [3:0]axi_dma_0_M_AXI_S2MM_AWCACHE;
  wire [7:0]axi_dma_0_M_AXI_S2MM_AWLEN;
  wire [2:0]axi_dma_0_M_AXI_S2MM_AWPROT;
  wire axi_dma_0_M_AXI_S2MM_AWREADY;
  wire [2:0]axi_dma_0_M_AXI_S2MM_AWSIZE;
  wire axi_dma_0_M_AXI_S2MM_AWVALID;
  wire axi_dma_0_M_AXI_S2MM_BREADY;
  wire [1:0]axi_dma_0_M_AXI_S2MM_BRESP;
  wire axi_dma_0_M_AXI_S2MM_BVALID;
  wire [31:0]axi_dma_0_M_AXI_S2MM_WDATA;
  wire axi_dma_0_M_AXI_S2MM_WLAST;
  wire axi_dma_0_M_AXI_S2MM_WREADY;
  wire [3:0]axi_dma_0_M_AXI_S2MM_WSTRB;
  wire axi_dma_0_M_AXI_S2MM_WVALID;
  wire [48:0]axi_smc_1_M00_AXI_AWADDR;
  wire [1:0]axi_smc_1_M00_AXI_AWBURST;
  wire [3:0]axi_smc_1_M00_AXI_AWCACHE;
  wire [7:0]axi_smc_1_M00_AXI_AWLEN;
  wire [0:0]axi_smc_1_M00_AXI_AWLOCK;
  wire [2:0]axi_smc_1_M00_AXI_AWPROT;
  wire [3:0]axi_smc_1_M00_AXI_AWQOS;
  wire axi_smc_1_M00_AXI_AWREADY;
  wire [2:0]axi_smc_1_M00_AXI_AWSIZE;
  wire axi_smc_1_M00_AXI_AWVALID;
  wire axi_smc_1_M00_AXI_BREADY;
  wire [1:0]axi_smc_1_M00_AXI_BRESP;
  wire axi_smc_1_M00_AXI_BVALID;
  wire [127:0]axi_smc_1_M00_AXI_WDATA;
  wire axi_smc_1_M00_AXI_WLAST;
  wire axi_smc_1_M00_AXI_WREADY;
  wire [15:0]axi_smc_1_M00_AXI_WSTRB;
  wire axi_smc_1_M00_AXI_WVALID;
  wire [9:0]axi_smc_M00_AXI_ARADDR;
  wire axi_smc_M00_AXI_ARREADY;
  wire axi_smc_M00_AXI_ARVALID;
  wire [9:0]axi_smc_M00_AXI_AWADDR;
  wire axi_smc_M00_AXI_AWREADY;
  wire axi_smc_M00_AXI_AWVALID;
  wire axi_smc_M00_AXI_BREADY;
  wire [1:0]axi_smc_M00_AXI_BRESP;
  wire axi_smc_M00_AXI_BVALID;
  wire [31:0]axi_smc_M00_AXI_RDATA;
  wire axi_smc_M00_AXI_RREADY;
  wire [1:0]axi_smc_M00_AXI_RRESP;
  wire axi_smc_M00_AXI_RVALID;
  wire [31:0]axi_smc_M00_AXI_WDATA;
  wire axi_smc_M00_AXI_WREADY;
  wire axi_smc_M00_AXI_WVALID;
  wire [17:0]axi_smc_M01_AXI_ARADDR;
  wire axi_smc_M01_AXI_ARREADY;
  wire axi_smc_M01_AXI_ARVALID;
  wire [17:0]axi_smc_M01_AXI_AWADDR;
  wire axi_smc_M01_AXI_AWREADY;
  wire axi_smc_M01_AXI_AWVALID;
  wire axi_smc_M01_AXI_BREADY;
  wire [1:0]axi_smc_M01_AXI_BRESP;
  wire axi_smc_M01_AXI_BVALID;
  wire [31:0]axi_smc_M01_AXI_RDATA;
  wire axi_smc_M01_AXI_RREADY;
  wire [1:0]axi_smc_M01_AXI_RRESP;
  wire axi_smc_M01_AXI_RVALID;
  wire [31:0]axi_smc_M01_AXI_WDATA;
  wire axi_smc_M01_AXI_WREADY;
  wire [3:0]axi_smc_M01_AXI_WSTRB;
  wire axi_smc_M01_AXI_WVALID;
  wire [31:0]axis_data_fifo_0_M_AXIS_TDATA;
  wire axis_data_fifo_0_M_AXIS_TLAST;
  wire axis_data_fifo_0_M_AXIS_TREADY;
  wire axis_data_fifo_0_M_AXIS_TVALID;
  wire [15:0]cic_compiler_0_M_AXIS_DATA_TDATA;
  wire cic_compiler_0_M_AXIS_DATA_TVALID;
  wire [15:0]cic_compiler_1_M_AXIS_DATA_TDATA;
  wire cic_compiler_1_M_AXIS_DATA_TVALID;
  wire clk_wiz_0_clk_out1;
  wire [31:0]iq_framer_0_M00_AXIS_TDATA;
  wire iq_framer_0_M00_AXIS_TLAST;
  wire iq_framer_0_M00_AXIS_TREADY;
  wire [3:0]iq_framer_0_M00_AXIS_TSTRB;
  wire iq_framer_0_M00_AXIS_TVALID;
  wire [3:0]led;
  wire [0:0]proc_sys_reset_0_peripheral_aresetn;
  wire [0:0]proc_sys_reset_1_peripheral_aresetn;
  wire [3:0]sw;
  wire sysref_in_diff_n;
  wire sysref_in_diff_p;
  wire [15:0]usp_rf_data_converter_0_m20_axis_TDATA;
  wire usp_rf_data_converter_0_m20_axis_TREADY;
  wire usp_rf_data_converter_0_m20_axis_TVALID;
  wire [15:0]usp_rf_data_converter_0_m21_axis_TDATA;
  wire usp_rf_data_converter_0_m21_axis_TREADY;
  wire usp_rf_data_converter_0_m21_axis_TVALID;
  wire vin2_01_v_n;
  wire vin2_01_v_p;
  wire [39:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARADDR;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARBURST;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARCACHE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARID;
  wire [7:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLEN;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLOCK;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARPROT;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARQOS;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARREADY;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARSIZE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARUSER;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARVALID;
  wire [39:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWADDR;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWBURST;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWCACHE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWID;
  wire [7:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLEN;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLOCK;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWPROT;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWQOS;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWREADY;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWSIZE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWUSER;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWVALID;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BID;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BREADY;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BRESP;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BVALID;
  wire [127:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RDATA;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RID;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RLAST;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RREADY;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RRESP;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RVALID;
  wire [127:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WDATA;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WLAST;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WREADY;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WSTRB;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WVALID;
  wire [39:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARADDR;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARBURST;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARCACHE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARID;
  wire [7:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARLEN;
  wire zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARLOCK;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARPROT;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARQOS;
  wire zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARREADY;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARSIZE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARUSER;
  wire zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARVALID;
  wire [39:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWADDR;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWBURST;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWCACHE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWID;
  wire [7:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWLEN;
  wire zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWLOCK;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWPROT;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWQOS;
  wire zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWREADY;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWSIZE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWUSER;
  wire zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWVALID;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_BID;
  wire zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_BREADY;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_BRESP;
  wire zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_BVALID;
  wire [127:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_RDATA;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_RID;
  wire zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_RLAST;
  wire zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_RREADY;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_RRESP;
  wire zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_RVALID;
  wire [127:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_WDATA;
  wire zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_WLAST;
  wire zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_WREADY;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_WSTRB;
  wire zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_WVALID;
  wire zynq_ultra_ps_e_0_pl_clk0;
  wire zynq_ultra_ps_e_0_pl_resetn0;

  design_1_axi_dma_0_0 axi_dma_0
       (.axi_resetn(proc_sys_reset_0_peripheral_aresetn),
        .m_axi_s2mm_aclk(zynq_ultra_ps_e_0_pl_clk0),
        .m_axi_s2mm_awaddr(axi_dma_0_M_AXI_S2MM_AWADDR),
        .m_axi_s2mm_awburst(axi_dma_0_M_AXI_S2MM_AWBURST),
        .m_axi_s2mm_awcache(axi_dma_0_M_AXI_S2MM_AWCACHE),
        .m_axi_s2mm_awlen(axi_dma_0_M_AXI_S2MM_AWLEN),
        .m_axi_s2mm_awprot(axi_dma_0_M_AXI_S2MM_AWPROT),
        .m_axi_s2mm_awready(axi_dma_0_M_AXI_S2MM_AWREADY),
        .m_axi_s2mm_awsize(axi_dma_0_M_AXI_S2MM_AWSIZE),
        .m_axi_s2mm_awvalid(axi_dma_0_M_AXI_S2MM_AWVALID),
        .m_axi_s2mm_bready(axi_dma_0_M_AXI_S2MM_BREADY),
        .m_axi_s2mm_bresp(axi_dma_0_M_AXI_S2MM_BRESP),
        .m_axi_s2mm_bvalid(axi_dma_0_M_AXI_S2MM_BVALID),
        .m_axi_s2mm_wdata(axi_dma_0_M_AXI_S2MM_WDATA),
        .m_axi_s2mm_wlast(axi_dma_0_M_AXI_S2MM_WLAST),
        .m_axi_s2mm_wready(axi_dma_0_M_AXI_S2MM_WREADY),
        .m_axi_s2mm_wstrb(axi_dma_0_M_AXI_S2MM_WSTRB),
        .m_axi_s2mm_wvalid(axi_dma_0_M_AXI_S2MM_WVALID),
        .s_axi_lite_aclk(zynq_ultra_ps_e_0_pl_clk0),
        .s_axi_lite_araddr(axi_smc_M00_AXI_ARADDR),
        .s_axi_lite_arready(axi_smc_M00_AXI_ARREADY),
        .s_axi_lite_arvalid(axi_smc_M00_AXI_ARVALID),
        .s_axi_lite_awaddr(axi_smc_M00_AXI_AWADDR),
        .s_axi_lite_awready(axi_smc_M00_AXI_AWREADY),
        .s_axi_lite_awvalid(axi_smc_M00_AXI_AWVALID),
        .s_axi_lite_bready(axi_smc_M00_AXI_BREADY),
        .s_axi_lite_bresp(axi_smc_M00_AXI_BRESP),
        .s_axi_lite_bvalid(axi_smc_M00_AXI_BVALID),
        .s_axi_lite_rdata(axi_smc_M00_AXI_RDATA),
        .s_axi_lite_rready(axi_smc_M00_AXI_RREADY),
        .s_axi_lite_rresp(axi_smc_M00_AXI_RRESP),
        .s_axi_lite_rvalid(axi_smc_M00_AXI_RVALID),
        .s_axi_lite_wdata(axi_smc_M00_AXI_WDATA),
        .s_axi_lite_wready(axi_smc_M00_AXI_WREADY),
        .s_axi_lite_wvalid(axi_smc_M00_AXI_WVALID),
        .s_axis_s2mm_tdata(axis_data_fifo_0_M_AXIS_TDATA),
        .s_axis_s2mm_tkeep({1'b1,1'b1,1'b1,1'b1}),
        .s_axis_s2mm_tlast(axis_data_fifo_0_M_AXIS_TLAST),
        .s_axis_s2mm_tready(axis_data_fifo_0_M_AXIS_TREADY),
        .s_axis_s2mm_tvalid(axis_data_fifo_0_M_AXIS_TVALID));
  design_1_axi_smc_0 axi_smc
       (.M00_AXI_araddr(axi_smc_M00_AXI_ARADDR),
        .M00_AXI_arready(axi_smc_M00_AXI_ARREADY),
        .M00_AXI_arvalid(axi_smc_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_smc_M00_AXI_AWADDR),
        .M00_AXI_awready(axi_smc_M00_AXI_AWREADY),
        .M00_AXI_awvalid(axi_smc_M00_AXI_AWVALID),
        .M00_AXI_bready(axi_smc_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_smc_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_smc_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_smc_M00_AXI_RDATA),
        .M00_AXI_rready(axi_smc_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_smc_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_smc_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_smc_M00_AXI_WDATA),
        .M00_AXI_wready(axi_smc_M00_AXI_WREADY),
        .M00_AXI_wvalid(axi_smc_M00_AXI_WVALID),
        .M01_AXI_araddr(axi_smc_M01_AXI_ARADDR),
        .M01_AXI_arready(axi_smc_M01_AXI_ARREADY),
        .M01_AXI_arvalid(axi_smc_M01_AXI_ARVALID),
        .M01_AXI_awaddr(axi_smc_M01_AXI_AWADDR),
        .M01_AXI_awready(axi_smc_M01_AXI_AWREADY),
        .M01_AXI_awvalid(axi_smc_M01_AXI_AWVALID),
        .M01_AXI_bready(axi_smc_M01_AXI_BREADY),
        .M01_AXI_bresp(axi_smc_M01_AXI_BRESP),
        .M01_AXI_bvalid(axi_smc_M01_AXI_BVALID),
        .M01_AXI_rdata(axi_smc_M01_AXI_RDATA),
        .M01_AXI_rready(axi_smc_M01_AXI_RREADY),
        .M01_AXI_rresp(axi_smc_M01_AXI_RRESP),
        .M01_AXI_rvalid(axi_smc_M01_AXI_RVALID),
        .M01_AXI_wdata(axi_smc_M01_AXI_WDATA),
        .M01_AXI_wready(axi_smc_M01_AXI_WREADY),
        .M01_AXI_wstrb(axi_smc_M01_AXI_WSTRB),
        .M01_AXI_wvalid(axi_smc_M01_AXI_WVALID),
        .S00_AXI_araddr(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARADDR),
        .S00_AXI_arburst(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARBURST),
        .S00_AXI_arcache(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARCACHE),
        .S00_AXI_arid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARID),
        .S00_AXI_arlen(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLEN),
        .S00_AXI_arlock(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLOCK),
        .S00_AXI_arprot(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARPROT),
        .S00_AXI_arqos(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARQOS),
        .S00_AXI_arready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARREADY),
        .S00_AXI_arsize(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARSIZE),
        .S00_AXI_aruser(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARUSER),
        .S00_AXI_arvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARVALID),
        .S00_AXI_awaddr(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWADDR),
        .S00_AXI_awburst(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWBURST),
        .S00_AXI_awcache(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWCACHE),
        .S00_AXI_awid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWID),
        .S00_AXI_awlen(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLEN),
        .S00_AXI_awlock(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLOCK),
        .S00_AXI_awprot(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWPROT),
        .S00_AXI_awqos(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWQOS),
        .S00_AXI_awready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWREADY),
        .S00_AXI_awsize(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWSIZE),
        .S00_AXI_awuser(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWUSER),
        .S00_AXI_awvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWVALID),
        .S00_AXI_bid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BID),
        .S00_AXI_bready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BREADY),
        .S00_AXI_bresp(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BRESP),
        .S00_AXI_bvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BVALID),
        .S00_AXI_rdata(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RDATA),
        .S00_AXI_rid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RID),
        .S00_AXI_rlast(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RLAST),
        .S00_AXI_rready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RREADY),
        .S00_AXI_rresp(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RRESP),
        .S00_AXI_rvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RVALID),
        .S00_AXI_wdata(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WDATA),
        .S00_AXI_wlast(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WLAST),
        .S00_AXI_wready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WREADY),
        .S00_AXI_wstrb(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WSTRB),
        .S00_AXI_wvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WVALID),
        .S01_AXI_araddr(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARADDR),
        .S01_AXI_arburst(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARBURST),
        .S01_AXI_arcache(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARCACHE),
        .S01_AXI_arid(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARID),
        .S01_AXI_arlen(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARLEN),
        .S01_AXI_arlock(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARLOCK),
        .S01_AXI_arprot(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARPROT),
        .S01_AXI_arqos(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARQOS),
        .S01_AXI_arready(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARREADY),
        .S01_AXI_arsize(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARSIZE),
        .S01_AXI_aruser(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARUSER),
        .S01_AXI_arvalid(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARVALID),
        .S01_AXI_awaddr(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWADDR),
        .S01_AXI_awburst(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWBURST),
        .S01_AXI_awcache(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWCACHE),
        .S01_AXI_awid(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWID),
        .S01_AXI_awlen(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWLEN),
        .S01_AXI_awlock(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWLOCK),
        .S01_AXI_awprot(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWPROT),
        .S01_AXI_awqos(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWQOS),
        .S01_AXI_awready(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWREADY),
        .S01_AXI_awsize(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWSIZE),
        .S01_AXI_awuser(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWUSER),
        .S01_AXI_awvalid(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWVALID),
        .S01_AXI_bid(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_BID),
        .S01_AXI_bready(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_BREADY),
        .S01_AXI_bresp(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_BRESP),
        .S01_AXI_bvalid(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_BVALID),
        .S01_AXI_rdata(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_RDATA),
        .S01_AXI_rid(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_RID),
        .S01_AXI_rlast(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_RLAST),
        .S01_AXI_rready(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_RREADY),
        .S01_AXI_rresp(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_RRESP),
        .S01_AXI_rvalid(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_RVALID),
        .S01_AXI_wdata(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_WDATA),
        .S01_AXI_wlast(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_WLAST),
        .S01_AXI_wready(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_WREADY),
        .S01_AXI_wstrb(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_WSTRB),
        .S01_AXI_wvalid(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_WVALID),
        .aclk(zynq_ultra_ps_e_0_pl_clk0),
        .aresetn(proc_sys_reset_0_peripheral_aresetn));
  design_1_axi_smc_1_0 axi_smc_1
       (.M00_AXI_awaddr(axi_smc_1_M00_AXI_AWADDR),
        .M00_AXI_awburst(axi_smc_1_M00_AXI_AWBURST),
        .M00_AXI_awcache(axi_smc_1_M00_AXI_AWCACHE),
        .M00_AXI_awlen(axi_smc_1_M00_AXI_AWLEN),
        .M00_AXI_awlock(axi_smc_1_M00_AXI_AWLOCK),
        .M00_AXI_awprot(axi_smc_1_M00_AXI_AWPROT),
        .M00_AXI_awqos(axi_smc_1_M00_AXI_AWQOS),
        .M00_AXI_awready(axi_smc_1_M00_AXI_AWREADY),
        .M00_AXI_awsize(axi_smc_1_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(axi_smc_1_M00_AXI_AWVALID),
        .M00_AXI_bready(axi_smc_1_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_smc_1_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_smc_1_M00_AXI_BVALID),
        .M00_AXI_wdata(axi_smc_1_M00_AXI_WDATA),
        .M00_AXI_wlast(axi_smc_1_M00_AXI_WLAST),
        .M00_AXI_wready(axi_smc_1_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_smc_1_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_smc_1_M00_AXI_WVALID),
        .S00_AXI_awaddr(axi_dma_0_M_AXI_S2MM_AWADDR),
        .S00_AXI_awburst(axi_dma_0_M_AXI_S2MM_AWBURST),
        .S00_AXI_awcache(axi_dma_0_M_AXI_S2MM_AWCACHE),
        .S00_AXI_awlen(axi_dma_0_M_AXI_S2MM_AWLEN),
        .S00_AXI_awlock(1'b0),
        .S00_AXI_awprot(axi_dma_0_M_AXI_S2MM_AWPROT),
        .S00_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_awready(axi_dma_0_M_AXI_S2MM_AWREADY),
        .S00_AXI_awsize(axi_dma_0_M_AXI_S2MM_AWSIZE),
        .S00_AXI_awvalid(axi_dma_0_M_AXI_S2MM_AWVALID),
        .S00_AXI_bready(axi_dma_0_M_AXI_S2MM_BREADY),
        .S00_AXI_bresp(axi_dma_0_M_AXI_S2MM_BRESP),
        .S00_AXI_bvalid(axi_dma_0_M_AXI_S2MM_BVALID),
        .S00_AXI_wdata(axi_dma_0_M_AXI_S2MM_WDATA),
        .S00_AXI_wlast(axi_dma_0_M_AXI_S2MM_WLAST),
        .S00_AXI_wready(axi_dma_0_M_AXI_S2MM_WREADY),
        .S00_AXI_wstrb(axi_dma_0_M_AXI_S2MM_WSTRB),
        .S00_AXI_wvalid(axi_dma_0_M_AXI_S2MM_WVALID),
        .aclk(zynq_ultra_ps_e_0_pl_clk0),
        .aresetn(proc_sys_reset_0_peripheral_aresetn));
  design_1_axis_data_fifo_0_0 axis_data_fifo_0
       (.m_axis_aclk(zynq_ultra_ps_e_0_pl_clk0),
        .m_axis_tdata(axis_data_fifo_0_M_AXIS_TDATA),
        .m_axis_tlast(axis_data_fifo_0_M_AXIS_TLAST),
        .m_axis_tready(axis_data_fifo_0_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_0_M_AXIS_TVALID),
        .s_axis_aclk(clk_wiz_0_clk_out1),
        .s_axis_aresetn(proc_sys_reset_1_peripheral_aresetn),
        .s_axis_tdata(iq_framer_0_M00_AXIS_TDATA),
        .s_axis_tlast(iq_framer_0_M00_AXIS_TLAST),
        .s_axis_tready(iq_framer_0_M00_AXIS_TREADY),
        .s_axis_tstrb(iq_framer_0_M00_AXIS_TSTRB),
        .s_axis_tvalid(iq_framer_0_M00_AXIS_TVALID));
  design_1_cic_compiler_0_0 cic_compiler_0
       (.aclk(clk_wiz_0_clk_out1),
        .m_axis_data_tdata(cic_compiler_0_M_AXIS_DATA_TDATA),
        .m_axis_data_tvalid(cic_compiler_0_M_AXIS_DATA_TVALID),
        .s_axis_data_tdata(usp_rf_data_converter_0_m20_axis_TDATA),
        .s_axis_data_tready(usp_rf_data_converter_0_m20_axis_TREADY),
        .s_axis_data_tvalid(usp_rf_data_converter_0_m20_axis_TVALID));
  design_1_cic_compiler_0_1 cic_compiler_1
       (.aclk(clk_wiz_0_clk_out1),
        .m_axis_data_tdata(cic_compiler_1_M_AXIS_DATA_TDATA),
        .m_axis_data_tvalid(cic_compiler_1_M_AXIS_DATA_TVALID),
        .s_axis_data_tdata(usp_rf_data_converter_0_m21_axis_TDATA),
        .s_axis_data_tready(usp_rf_data_converter_0_m21_axis_TREADY),
        .s_axis_data_tvalid(usp_rf_data_converter_0_m21_axis_TVALID));
  design_1_iq_framer_0_0 iq_framer_0
       (.control(sw),
        .m00_axis_aclk(clk_wiz_0_clk_out1),
        .m00_axis_aresetn(proc_sys_reset_1_peripheral_aresetn),
        .m00_axis_tdata(iq_framer_0_M00_AXIS_TDATA),
        .m00_axis_tlast(iq_framer_0_M00_AXIS_TLAST),
        .m00_axis_tready(iq_framer_0_M00_AXIS_TREADY),
        .m00_axis_tstrb(iq_framer_0_M00_AXIS_TSTRB),
        .m00_axis_tvalid(iq_framer_0_M00_AXIS_TVALID),
        .probe(led),
        .s00_axis_aclk(clk_wiz_0_clk_out1),
        .s00_axis_aresetn(proc_sys_reset_1_peripheral_aresetn),
        .s00_axis_tdata(cic_compiler_0_M_AXIS_DATA_TDATA),
        .s00_axis_tlast(1'b0),
        .s00_axis_tstrb({1'b1,1'b1,1'b1,1'b1}),
        .s00_axis_tvalid(cic_compiler_0_M_AXIS_DATA_TVALID),
        .s01_axis_aclk(clk_wiz_0_clk_out1),
        .s01_axis_aresetn(proc_sys_reset_1_peripheral_aresetn),
        .s01_axis_tdata(cic_compiler_1_M_AXIS_DATA_TDATA),
        .s01_axis_tlast(1'b0),
        .s01_axis_tstrb({1'b1,1'b1,1'b1,1'b1}),
        .s01_axis_tvalid(cic_compiler_1_M_AXIS_DATA_TVALID));
  design_1_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(zynq_ultra_ps_e_0_pl_resetn0),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .slowest_sync_clk(zynq_ultra_ps_e_0_pl_clk0));
  design_1_proc_sys_reset_1_0 proc_sys_reset_1
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(zynq_ultra_ps_e_0_pl_resetn0),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(proc_sys_reset_1_peripheral_aresetn),
        .slowest_sync_clk(clk_wiz_0_clk_out1));
  design_1_usp_rf_data_converter_0_0 usp_rf_data_converter_0
       (.adc2_clk_n(adc2_clk_clk_n),
        .adc2_clk_p(adc2_clk_clk_p),
        .clk_adc2(clk_wiz_0_clk_out1),
        .m20_axis_tdata(usp_rf_data_converter_0_m20_axis_TDATA),
        .m20_axis_tready(usp_rf_data_converter_0_m20_axis_TREADY),
        .m20_axis_tvalid(usp_rf_data_converter_0_m20_axis_TVALID),
        .m21_axis_tdata(usp_rf_data_converter_0_m21_axis_TDATA),
        .m21_axis_tready(usp_rf_data_converter_0_m21_axis_TREADY),
        .m21_axis_tvalid(usp_rf_data_converter_0_m21_axis_TVALID),
        .m2_axis_aclk(clk_wiz_0_clk_out1),
        .m2_axis_aresetn(proc_sys_reset_1_peripheral_aresetn),
        .s_axi_aclk(zynq_ultra_ps_e_0_pl_clk0),
        .s_axi_araddr(axi_smc_M01_AXI_ARADDR),
        .s_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s_axi_arready(axi_smc_M01_AXI_ARREADY),
        .s_axi_arvalid(axi_smc_M01_AXI_ARVALID),
        .s_axi_awaddr(axi_smc_M01_AXI_AWADDR),
        .s_axi_awready(axi_smc_M01_AXI_AWREADY),
        .s_axi_awvalid(axi_smc_M01_AXI_AWVALID),
        .s_axi_bready(axi_smc_M01_AXI_BREADY),
        .s_axi_bresp(axi_smc_M01_AXI_BRESP),
        .s_axi_bvalid(axi_smc_M01_AXI_BVALID),
        .s_axi_rdata(axi_smc_M01_AXI_RDATA),
        .s_axi_rready(axi_smc_M01_AXI_RREADY),
        .s_axi_rresp(axi_smc_M01_AXI_RRESP),
        .s_axi_rvalid(axi_smc_M01_AXI_RVALID),
        .s_axi_wdata(axi_smc_M01_AXI_WDATA),
        .s_axi_wready(axi_smc_M01_AXI_WREADY),
        .s_axi_wstrb(axi_smc_M01_AXI_WSTRB),
        .s_axi_wvalid(axi_smc_M01_AXI_WVALID),
        .sysref_in_n(sysref_in_diff_n),
        .sysref_in_p(sysref_in_diff_p),
        .vin2_01_n(vin2_01_v_n),
        .vin2_01_p(vin2_01_v_p));
  design_1_zynq_ultra_ps_e_0_0 zynq_ultra_ps_e_0
       (.emio_gpio_i({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .maxigp0_araddr(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARADDR),
        .maxigp0_arburst(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARBURST),
        .maxigp0_arcache(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARCACHE),
        .maxigp0_arid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARID),
        .maxigp0_arlen(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLEN),
        .maxigp0_arlock(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLOCK),
        .maxigp0_arprot(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARPROT),
        .maxigp0_arqos(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARQOS),
        .maxigp0_arready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARREADY),
        .maxigp0_arsize(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARSIZE),
        .maxigp0_aruser(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARUSER),
        .maxigp0_arvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARVALID),
        .maxigp0_awaddr(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWADDR),
        .maxigp0_awburst(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWBURST),
        .maxigp0_awcache(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWCACHE),
        .maxigp0_awid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWID),
        .maxigp0_awlen(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLEN),
        .maxigp0_awlock(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLOCK),
        .maxigp0_awprot(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWPROT),
        .maxigp0_awqos(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWQOS),
        .maxigp0_awready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWREADY),
        .maxigp0_awsize(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWSIZE),
        .maxigp0_awuser(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWUSER),
        .maxigp0_awvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWVALID),
        .maxigp0_bid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BID),
        .maxigp0_bready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BREADY),
        .maxigp0_bresp(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BRESP),
        .maxigp0_bvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BVALID),
        .maxigp0_rdata(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RDATA),
        .maxigp0_rid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RID),
        .maxigp0_rlast(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RLAST),
        .maxigp0_rready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RREADY),
        .maxigp0_rresp(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RRESP),
        .maxigp0_rvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RVALID),
        .maxigp0_wdata(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WDATA),
        .maxigp0_wlast(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WLAST),
        .maxigp0_wready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WREADY),
        .maxigp0_wstrb(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WSTRB),
        .maxigp0_wvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WVALID),
        .maxigp1_araddr(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARADDR),
        .maxigp1_arburst(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARBURST),
        .maxigp1_arcache(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARCACHE),
        .maxigp1_arid(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARID),
        .maxigp1_arlen(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARLEN),
        .maxigp1_arlock(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARLOCK),
        .maxigp1_arprot(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARPROT),
        .maxigp1_arqos(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARQOS),
        .maxigp1_arready(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARREADY),
        .maxigp1_arsize(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARSIZE),
        .maxigp1_aruser(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARUSER),
        .maxigp1_arvalid(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_ARVALID),
        .maxigp1_awaddr(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWADDR),
        .maxigp1_awburst(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWBURST),
        .maxigp1_awcache(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWCACHE),
        .maxigp1_awid(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWID),
        .maxigp1_awlen(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWLEN),
        .maxigp1_awlock(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWLOCK),
        .maxigp1_awprot(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWPROT),
        .maxigp1_awqos(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWQOS),
        .maxigp1_awready(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWREADY),
        .maxigp1_awsize(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWSIZE),
        .maxigp1_awuser(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWUSER),
        .maxigp1_awvalid(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_AWVALID),
        .maxigp1_bid(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_BID),
        .maxigp1_bready(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_BREADY),
        .maxigp1_bresp(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_BRESP),
        .maxigp1_bvalid(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_BVALID),
        .maxigp1_rdata(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_RDATA),
        .maxigp1_rid(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_RID),
        .maxigp1_rlast(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_RLAST),
        .maxigp1_rready(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_RREADY),
        .maxigp1_rresp(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_RRESP),
        .maxigp1_rvalid(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_RVALID),
        .maxigp1_wdata(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_WDATA),
        .maxigp1_wlast(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_WLAST),
        .maxigp1_wready(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_WREADY),
        .maxigp1_wstrb(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_WSTRB),
        .maxigp1_wvalid(zynq_ultra_ps_e_0_M_AXI_HPM1_FPD_WVALID),
        .maxihpm0_fpd_aclk(zynq_ultra_ps_e_0_pl_clk0),
        .maxihpm1_fpd_aclk(zynq_ultra_ps_e_0_pl_clk0),
        .pl_clk0(zynq_ultra_ps_e_0_pl_clk0),
        .pl_ps_irq0(1'b0),
        .pl_ps_irq1(1'b0),
        .pl_resetn0(zynq_ultra_ps_e_0_pl_resetn0),
        .saxigp2_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .saxigp2_arburst({1'b0,1'b1}),
        .saxigp2_arcache({1'b0,1'b0,1'b1,1'b1}),
        .saxigp2_arid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .saxigp2_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .saxigp2_arlock(1'b0),
        .saxigp2_arprot({1'b0,1'b0,1'b0}),
        .saxigp2_arqos({1'b0,1'b0,1'b0,1'b0}),
        .saxigp2_arsize({1'b1,1'b0,1'b0}),
        .saxigp2_aruser(1'b0),
        .saxigp2_arvalid(1'b0),
        .saxigp2_awaddr(axi_smc_1_M00_AXI_AWADDR),
        .saxigp2_awburst(axi_smc_1_M00_AXI_AWBURST),
        .saxigp2_awcache(axi_smc_1_M00_AXI_AWCACHE),
        .saxigp2_awid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .saxigp2_awlen(axi_smc_1_M00_AXI_AWLEN),
        .saxigp2_awlock(axi_smc_1_M00_AXI_AWLOCK),
        .saxigp2_awprot(axi_smc_1_M00_AXI_AWPROT),
        .saxigp2_awqos(axi_smc_1_M00_AXI_AWQOS),
        .saxigp2_awready(axi_smc_1_M00_AXI_AWREADY),
        .saxigp2_awsize(axi_smc_1_M00_AXI_AWSIZE),
        .saxigp2_awuser(1'b0),
        .saxigp2_awvalid(axi_smc_1_M00_AXI_AWVALID),
        .saxigp2_bready(axi_smc_1_M00_AXI_BREADY),
        .saxigp2_bresp(axi_smc_1_M00_AXI_BRESP),
        .saxigp2_bvalid(axi_smc_1_M00_AXI_BVALID),
        .saxigp2_rready(1'b0),
        .saxigp2_wdata(axi_smc_1_M00_AXI_WDATA),
        .saxigp2_wlast(axi_smc_1_M00_AXI_WLAST),
        .saxigp2_wready(axi_smc_1_M00_AXI_WREADY),
        .saxigp2_wstrb(axi_smc_1_M00_AXI_WSTRB),
        .saxigp2_wvalid(axi_smc_1_M00_AXI_WVALID),
        .saxihp0_fpd_aclk(zynq_ultra_ps_e_0_pl_clk0));
endmodule
