vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_21
vlib modelsim_lib/msim/zynq_ultra_ps_e_vip_v1_0_21
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/axi_datamover_v5_1_37
vlib modelsim_lib/msim/axi_sg_v4_1_21
vlib modelsim_lib/msim/axi_dma_v7_1_36
vlib modelsim_lib/msim/axis_infrastructure_v1_1_1
vlib modelsim_lib/msim/axis_data_fifo_v2_0_17
vlib modelsim_lib/msim/proc_sys_reset_v5_0_17
vlib modelsim_lib/msim/xlconstant_v1_1_10
vlib modelsim_lib/msim/smartconnect_v1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_35
vlib modelsim_lib/msim/xbip_utils_v3_0_14
vlib modelsim_lib/msim/axi_utils_v2_0_10
vlib modelsim_lib/msim/cic_compiler_v4_0_21

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_21 modelsim_lib/msim/axi_vip_v1_1_21
vmap zynq_ultra_ps_e_vip_v1_0_21 modelsim_lib/msim/zynq_ultra_ps_e_vip_v1_0_21
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap axi_datamover_v5_1_37 modelsim_lib/msim/axi_datamover_v5_1_37
vmap axi_sg_v4_1_21 modelsim_lib/msim/axi_sg_v4_1_21
vmap axi_dma_v7_1_36 modelsim_lib/msim/axi_dma_v7_1_36
vmap axis_infrastructure_v1_1_1 modelsim_lib/msim/axis_infrastructure_v1_1_1
vmap axis_data_fifo_v2_0_17 modelsim_lib/msim/axis_data_fifo_v2_0_17
vmap proc_sys_reset_v5_0_17 modelsim_lib/msim/proc_sys_reset_v5_0_17
vmap xlconstant_v1_1_10 modelsim_lib/msim/xlconstant_v1_1_10
vmap smartconnect_v1_0 modelsim_lib/msim/smartconnect_v1_0
vmap axi_register_slice_v2_1_35 modelsim_lib/msim/axi_register_slice_v2_1_35
vmap xbip_utils_v3_0_14 modelsim_lib/msim/xbip_utils_v3_0_14
vmap axi_utils_v2_0_10 modelsim_lib/msim/axi_utils_v2_0_10
vmap cic_compiler_v4_0_21 modelsim_lib/msim/cic_compiler_v4_0_21

vlog -work xilinx_vip -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"/tools/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/tools/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/tools/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93  \
"/tools/Xilinx/2025.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr -mfcu  "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_21 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f16f/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_21 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/sim/design_1_zynq_ultra_ps_e_0_0_vip_wrapper.v" \

vcom -work axi_datamover_v5_1_37 -64 -93  \
"../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/d44a/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_21 -64 -93  \
"../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/b193/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_36 -64 -93  \
"../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/cb19/hdl/axi_dma_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/design_1/ip/design_1_axi_dma_0_0/sim/design_1_axi_dma_0_0.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_block.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_por_fsm_top.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_bgt_fsm.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_device_rom.sv" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_por_fsm.sv" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_por_fsm_disabled.sv" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_tile_config.sv" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_constants_config.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_drp_arbiter.v" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_drp_arbiter_adc.v" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_register_decode.v" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_address_decoder.v" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_axi_lite_ipif.v" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_counter_f.v" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_pselect_f.v" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_slave_attachment.v" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_rf_wrapper.v" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_drp_control_top.v" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_drp_control.v" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_drp_access_ctrl.v" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_irq_req_ack.v" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_irq_sync.v" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0bufg_gt_ctrl.v" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_overvol_irq.v" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_powerup_state_irq.v" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_rst_cnt.v" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0_clk_detection.v" \
"../../../bd/design_1/ip/design_1_usp_rf_data_converter_0_0/synth/design_1_usp_rf_data_converter_0_0.v" \
"../../../bd/design_1/ipshared/f9b7/hdl/iq_framer.v" \
"../../../bd/design_1/ip/design_1_iq_framer_0_0/sim/design_1_iq_framer_0_0.v" \

vlog -work axis_infrastructure_v1_1_1 -64 -incr -mfcu  "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work axis_data_fifo_v2_0_17 -64 -incr -mfcu  "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/e1e3/hdl/axis_data_fifo_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axis_data_fifo_0_0/sim/design_1_axis_data_fifo_0_0.v" \

vcom -work proc_sys_reset_v5_0_17 -64 -93  \
"../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/design_1/ip/design_1_proc_sys_reset_0_0/sim/design_1_proc_sys_reset_0_0.vhd" \
"../../../bd/design_1/ip/design_1_proc_sys_reset_1_0/sim/design_1_proc_sys_reset_1_0.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/sim/bd_afc3.v" \

vlog -work xlconstant_v1_1_10 -64 -incr -mfcu  "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a165/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_0/sim/bd_afc3_one_0.v" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_1/sim/bd_afc3_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/3718/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_2/sim/bd_afc3_arinsw_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_3/sim/bd_afc3_rinsw_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_4/sim/bd_afc3_awinsw_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_5/sim/bd_afc3_winsw_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_6/sim/bd_afc3_binsw_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_7/sim/bd_afc3_aroutsw_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_8/sim/bd_afc3_routsw_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_9/sim/bd_afc3_awoutsw_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_10/sim/bd_afc3_woutsw_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_11/sim/bd_afc3_boutsw_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_12/sim/bd_afc3_arni_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_13/sim/bd_afc3_rni_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_14/sim/bd_afc3_awni_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_15/sim/bd_afc3_wni_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_16/sim/bd_afc3_bni_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/d800/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_17/sim/bd_afc3_s00mmu_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/2da8/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_18/sim/bd_afc3_s00tr_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/dce3/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_19/sim/bd_afc3_s00sic_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/cef3/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_20/sim/bd_afc3_s00a2s_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_21/sim/bd_afc3_sarn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_22/sim/bd_afc3_srn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_23/sim/bd_afc3_sawn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_24/sim/bd_afc3_swn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_25/sim/bd_afc3_sbn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_26/sim/bd_afc3_s01mmu_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_27/sim/bd_afc3_s01tr_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_28/sim/bd_afc3_s01sic_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_29/sim/bd_afc3_s01a2s_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_30/sim/bd_afc3_sarn_1.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_31/sim/bd_afc3_srn_1.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_32/sim/bd_afc3_sawn_1.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_33/sim/bd_afc3_swn_1.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_34/sim/bd_afc3_sbn_1.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7f4f/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_35/sim/bd_afc3_m00s2a_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_36/sim/bd_afc3_m00arn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_37/sim/bd_afc3_m00rn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_38/sim/bd_afc3_m00awn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_39/sim/bd_afc3_m00wn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_40/sim/bd_afc3_m00bn_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/0133/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_41/sim/bd_afc3_m00e_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_42/sim/bd_afc3_m01s2a_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_43/sim/bd_afc3_m01arn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_44/sim/bd_afc3_m01rn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_45/sim/bd_afc3_m01awn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_46/sim/bd_afc3_m01wn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_47/sim/bd_afc3_m01bn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_48/sim/bd_afc3_m01e_0.sv" \

vlog -work axi_register_slice_v2_1_35 -64 -incr -mfcu  "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/c5b7/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/sim/design_1_axi_smc_0.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_1_0/bd_0/sim/bd_a878.v" \
"../../../bd/design_1/ip/design_1_axi_smc_1_0/bd_0/ip/ip_0/sim/bd_a878_one_0.v" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/design_1/ip/design_1_axi_smc_1_0/bd_0/ip/ip_1/sim/bd_a878_psr_aclk_0.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_1_0/bd_0/ip/ip_2/sim/bd_a878_s00mmu_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_1_0/bd_0/ip/ip_3/sim/bd_a878_s00tr_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_1_0/bd_0/ip/ip_4/sim/bd_a878_s00sic_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_1_0/bd_0/ip/ip_5/sim/bd_a878_s00a2s_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_1_0/bd_0/ip/ip_6/sim/bd_a878_sawn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_1_0/bd_0/ip/ip_7/sim/bd_a878_swn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_1_0/bd_0/ip/ip_8/sim/bd_a878_sbn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_1_0/bd_0/ip/ip_9/sim/bd_a878_m00s2a_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_1_0/bd_0/ip/ip_10/sim/bd_a878_m00e_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_1_0/sim/design_1_axi_smc_1_0.sv" \

vcom -work xbip_utils_v3_0_14 -64 -93  \
"../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/b27f/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_10 -64 -93  \
"../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7e77/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work cic_compiler_v4_0_21 -64 -93  \
"../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/aef7/hdl/cic_compiler_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/design_1/ip/design_1_cic_compiler_0_0/sim/design_1_cic_compiler_0_0.vhd" \
"../../../bd/design_1/ip/design_1_cic_compiler_0_1/sim/design_1_cic_compiler_0_1.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/7711/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../rfsoc_proj.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+/tools/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

