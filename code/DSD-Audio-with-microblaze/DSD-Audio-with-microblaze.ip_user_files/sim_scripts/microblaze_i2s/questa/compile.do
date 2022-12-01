vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/microblaze_v11_0_2
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/i2s_receiver_v1_0_3
vlib questa_lib/msim/i2s_transmitter_v1_0_3
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/lib_pkg_v1_0_2
vlib questa_lib/msim/lib_srl_fifo_v1_0_2
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/axi_uartlite_v2_0_24
vlib questa_lib/msim/axi_timer_v2_0_22
vlib questa_lib/msim/lmb_v10_v3_0_10
vlib questa_lib/msim/lmb_bram_if_cntlr_v4_0_17
vlib questa_lib/msim/blk_mem_gen_v8_4_4
vlib questa_lib/msim/mdm_v3_2_17
vlib questa_lib/msim/proc_sys_reset_v5_0_13
vlib questa_lib/msim/generic_baseblocks_v2_1_0
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_register_slice_v2_1_20
vlib questa_lib/msim/fifo_generator_v13_2_5
vlib questa_lib/msim/axi_data_fifo_v2_1_19
vlib questa_lib/msim/axi_crossbar_v2_1_21

vmap xpm questa_lib/msim/xpm
vmap microblaze_v11_0_2 questa_lib/msim/microblaze_v11_0_2
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap i2s_receiver_v1_0_3 questa_lib/msim/i2s_receiver_v1_0_3
vmap i2s_transmitter_v1_0_3 questa_lib/msim/i2s_transmitter_v1_0_3
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap lib_pkg_v1_0_2 questa_lib/msim/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 questa_lib/msim/lib_srl_fifo_v1_0_2
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap axi_uartlite_v2_0_24 questa_lib/msim/axi_uartlite_v2_0_24
vmap axi_timer_v2_0_22 questa_lib/msim/axi_timer_v2_0_22
vmap lmb_v10_v3_0_10 questa_lib/msim/lmb_v10_v3_0_10
vmap lmb_bram_if_cntlr_v4_0_17 questa_lib/msim/lmb_bram_if_cntlr_v4_0_17
vmap blk_mem_gen_v8_4_4 questa_lib/msim/blk_mem_gen_v8_4_4
vmap mdm_v3_2_17 questa_lib/msim/mdm_v3_2_17
vmap proc_sys_reset_v5_0_13 questa_lib/msim/proc_sys_reset_v5_0_13
vmap generic_baseblocks_v2_1_0 questa_lib/msim/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_20 questa_lib/msim/axi_register_slice_v2_1_20
vmap fifo_generator_v13_2_5 questa_lib/msim/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_19 questa_lib/msim/axi_data_fifo_v2_1_19
vmap axi_crossbar_v2_1_21 questa_lib/msim/axi_crossbar_v2_1_21

vlog -work xpm -64 -sv "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/4fba" "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/ec67/hdl" \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v11_0_2 -64 -93 \
"../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/f871/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/microblaze_i2s/ip/microblaze_i2s_microblaze_0_0/sim/microblaze_i2s_microblaze_0_0.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/4fba" "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/ec67/hdl" \
"../../../bd/microblaze_i2s/ip/microblaze_i2s_clk_wiz_0_0/microblaze_i2s_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/microblaze_i2s/ip/microblaze_i2s_clk_wiz_0_0/microblaze_i2s_clk_wiz_0_0.v" \

vlog -work i2s_receiver_v1_0_3 -64 -sv "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/4fba" "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/ec67/hdl" \
"../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/d9e6/hdl/i2s_receiver_v1_0_rfs.sv" \

vlog -work xil_defaultlib -64 -sv "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/4fba" "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/ec67/hdl" \
"../../../bd/microblaze_i2s/ip/microblaze_i2s_i2s_receiver_0_0/sim/microblaze_i2s_i2s_receiver_0_0.sv" \

vlog -work i2s_transmitter_v1_0_3 -64 -sv "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/4fba" "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/ec67/hdl" \
"../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/1bfe/hdl/i2s_transmitter_v1_0_rfs.sv" \

vlog -work xil_defaultlib -64 -sv "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/4fba" "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/ec67/hdl" \
"../../../bd/microblaze_i2s/ip/microblaze_i2s_i2s_transmitter_0_0/sim/microblaze_i2s_i2s_transmitter_0_0.sv" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -64 -93 \
"../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_24 -64 -93 \
"../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/d8db/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/microblaze_i2s/ip/microblaze_i2s_axi_uartlite_0_0/sim/microblaze_i2s_axi_uartlite_0_0.vhd" \

vcom -work axi_timer_v2_0_22 -64 -93 \
"../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/a141/hdl/axi_timer_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/microblaze_i2s/ip/microblaze_i2s_axi_timer_0_0/sim/microblaze_i2s_axi_timer_0_0.vhd" \

vcom -work lmb_v10_v3_0_10 -64 -93 \
"../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/2e88/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/microblaze_i2s/ip/microblaze_i2s_dlmb_v10_0/sim/microblaze_i2s_dlmb_v10_0.vhd" \
"../../../bd/microblaze_i2s/ip/microblaze_i2s_ilmb_v10_0/sim/microblaze_i2s_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_17 -64 -93 \
"../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/db6f/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/microblaze_i2s/ip/microblaze_i2s_dlmb_bram_if_cntlr_0/sim/microblaze_i2s_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/microblaze_i2s/ip/microblaze_i2s_ilmb_bram_if_cntlr_0/sim/microblaze_i2s_ilmb_bram_if_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_4 -64 "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/4fba" "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/ec67/hdl" \
"../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/4fba" "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/ec67/hdl" \
"../../../bd/microblaze_i2s/ip/microblaze_i2s_lmb_bram_0/sim/microblaze_i2s_lmb_bram_0.v" \

vcom -work mdm_v3_2_17 -64 -93 \
"../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/f9aa/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/microblaze_i2s/ip/microblaze_i2s_mdm_1_0/sim/microblaze_i2s_mdm_1_0.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/microblaze_i2s/ip/microblaze_i2s_rst_clk_wiz_0_100M_0/sim/microblaze_i2s_rst_clk_wiz_0_100M_0.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/4fba" "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/ec67/hdl" \
"../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0 -64 "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/4fba" "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/ec67/hdl" \
"../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_20 -64 "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/4fba" "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/ec67/hdl" \
"../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/72d4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5 -64 "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/4fba" "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/ec67/hdl" \
"../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -64 -93 \
"../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5 -64 "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/4fba" "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/ec67/hdl" \
"../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_19 -64 "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/4fba" "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/ec67/hdl" \
"../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/60de/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_21 -64 "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/4fba" "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/ec67/hdl" \
"../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/6b0d/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/4fba" "+incdir+../../../../DSD-Audio-with-microblaze.srcs/sources_1/bd/microblaze_i2s/ipshared/ec67/hdl" \
"../../../bd/microblaze_i2s/ip/microblaze_i2s_xbar_0/sim/microblaze_i2s_xbar_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/microblaze_i2s/ip/microblaze_i2s_axi_timer_1_0/sim/microblaze_i2s_axi_timer_1_0.vhd" \
"../../../bd/microblaze_i2s/sim/microblaze_i2s.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

