-makelib xcelium_lib/xpm -sv \
  "C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/microblaze_v11_0_2 \
  "../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/f871/hdl/microblaze_v11_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/microblaze_i2s/ip/microblaze_i2s_microblaze_0_0/sim/microblaze_i2s_microblaze_0_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/microblaze_i2s/ip/microblaze_i2s_clk_wiz_0_0/microblaze_i2s_clk_wiz_0_0_clk_wiz.v" \
  "../../../bd/microblaze_i2s/ip/microblaze_i2s_clk_wiz_0_0/microblaze_i2s_clk_wiz_0_0.v" \
-endlib
-makelib xcelium_lib/i2s_receiver_v1_0_3 -sv \
  "../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/d9e6/hdl/i2s_receiver_v1_0_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/microblaze_i2s/ip/microblaze_i2s_i2s_receiver_0_0/sim/microblaze_i2s_i2s_receiver_0_0.sv" \
-endlib
-makelib xcelium_lib/i2s_transmitter_v1_0_3 -sv \
  "../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/1bfe/hdl/i2s_transmitter_v1_0_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/microblaze_i2s/ip/microblaze_i2s_i2s_transmitter_0_0/sim/microblaze_i2s_i2s_transmitter_0_0.sv" \
-endlib
-makelib xcelium_lib/axi_lite_ipif_v3_0_4 \
  "../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_pkg_v1_0_2 \
  "../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_srl_fifo_v1_0_2 \
  "../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_uartlite_v2_0_24 \
  "../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/d8db/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/microblaze_i2s/ip/microblaze_i2s_axi_uartlite_0_0/sim/microblaze_i2s_axi_uartlite_0_0.vhd" \
-endlib
-makelib xcelium_lib/axi_timer_v2_0_22 \
  "../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/a141/hdl/axi_timer_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/microblaze_i2s/ip/microblaze_i2s_axi_timer_0_0/sim/microblaze_i2s_axi_timer_0_0.vhd" \
-endlib
-makelib xcelium_lib/lmb_v10_v3_0_10 \
  "../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/2e88/hdl/lmb_v10_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/microblaze_i2s/ip/microblaze_i2s_dlmb_v10_0/sim/microblaze_i2s_dlmb_v10_0.vhd" \
  "../../../bd/microblaze_i2s/ip/microblaze_i2s_ilmb_v10_0/sim/microblaze_i2s_ilmb_v10_0.vhd" \
-endlib
-makelib xcelium_lib/lmb_bram_if_cntlr_v4_0_17 \
  "../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/db6f/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/microblaze_i2s/ip/microblaze_i2s_dlmb_bram_if_cntlr_0/sim/microblaze_i2s_dlmb_bram_if_cntlr_0.vhd" \
  "../../../bd/microblaze_i2s/ip/microblaze_i2s_ilmb_bram_if_cntlr_0/sim/microblaze_i2s_ilmb_bram_if_cntlr_0.vhd" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_4 \
  "../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/microblaze_i2s/ip/microblaze_i2s_lmb_bram_0/sim/microblaze_i2s_lmb_bram_0.v" \
-endlib
-makelib xcelium_lib/mdm_v3_2_17 \
  "../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/f9aa/hdl/mdm_v3_2_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/microblaze_i2s/ip/microblaze_i2s_mdm_1_0/sim/microblaze_i2s_mdm_1_0.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/microblaze_i2s/ip/microblaze_i2s_rst_clk_wiz_0_100M_0/sim/microblaze_i2s_rst_clk_wiz_0_100M_0.vhd" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_20 \
  "../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/72d4/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_19 \
  "../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/60de/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_crossbar_v2_1_21 \
  "../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/6b0d/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/microblaze_i2s/ip/microblaze_i2s_xbar_0/sim/microblaze_i2s_xbar_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/microblaze_i2s/ip/microblaze_i2s_axi_timer_1_0/sim/microblaze_i2s_axi_timer_1_0.vhd" \
  "../../../bd/microblaze_i2s/sim/microblaze_i2s.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

