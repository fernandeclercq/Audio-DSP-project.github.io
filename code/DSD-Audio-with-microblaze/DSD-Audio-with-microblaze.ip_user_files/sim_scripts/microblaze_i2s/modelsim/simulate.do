onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xpm -L microblaze_v11_0_2 -L xil_defaultlib -L i2s_receiver_v1_0_3 -L i2s_transmitter_v1_0_3 -L axi_lite_ipif_v3_0_4 -L lib_pkg_v1_0_2 -L lib_srl_fifo_v1_0_2 -L lib_cdc_v1_0_2 -L axi_uartlite_v2_0_24 -L axi_timer_v2_0_22 -L lmb_v10_v3_0_10 -L lmb_bram_if_cntlr_v4_0_17 -L blk_mem_gen_v8_4_4 -L mdm_v3_2_17 -L proc_sys_reset_v5_0_13 -L generic_baseblocks_v2_1_0 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_20 -L fifo_generator_v13_2_5 -L axi_data_fifo_v2_1_19 -L axi_crossbar_v2_1_21 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.microblaze_i2s xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {microblaze_i2s.udo}

run -all

quit -force
