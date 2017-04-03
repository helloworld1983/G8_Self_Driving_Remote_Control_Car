onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L xpm -L microblaze_v10_0_1 -L lmb_v10_v3_0_9 -L lmb_bram_if_cntlr_v4_0_10 -L axi_lite_ipif_v3_0_4 -L axi_intc_v4_1_9 -L mdm_v3_2_8 -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_10 -L blk_mem_gen_v8_3_5 -L dist_mem_gen_v8_0_11 -L lib_pkg_v1_0_2 -L lib_srl_fifo_v1_0_2 -L fifo_generator_v13_1_3 -L lib_fifo_v1_0_7 -L interrupt_control_v3_1_4 -L axi_quad_spi_v3_2_10 -L axi_gpio_v2_0_13 -L axi_timer_v2_0_13 -L axi_uartlite_v2_0_15 -L axi_bram_ctrl_v4_0_10 -L util_vector_logic_v2_0 -L generic_baseblocks_v2_1_0 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_11 -L axi_data_fifo_v2_1_10 -L axi_crossbar_v2_1_12 -L axi_protocol_converter_v2_1_11 -L axi_clock_converter_v2_1_10 -L axi_dwidth_converter_v2_1_11 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.design_1 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {design_1.udo}

run -all

quit -force
