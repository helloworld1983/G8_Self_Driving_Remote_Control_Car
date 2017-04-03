proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  create_project -in_memory -part xc7a100tcsg324-1
  set_property board_part digilentinc.com:nexys4_ddr:part0:1.1 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.cache/wt [current_project]
  set_property parent.project_path C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.xpr [current_project]
  set_property ip_repo_paths {
  C:/Users/yy/Desktop/to_be_sped_up/v2/vivado-library-master/if/pmod_v1_0
  C:/Users/yy/Desktop/to_be_sped_up/v2/vivado-library-master/ip/Pmods/PmodWIFI_v1_0
  C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/img_proc_full
  C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/vivado-library-master/if/pmod_v1_0
  C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/vivado-library-master/ip/Pmods/PmodWIFI_v1_0
  C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/vivado-library-master/ip/Pmods/Pmod_Bridge_v1_0
  C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/Downloads/vivado-library-master/if/pmod_v1_0
  C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/Downloads/vivado-library-master/ip/Pmods/Pmod_Bridge_v1_0
  C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/Downloads/vivado-library-master/ip/Pmods/PmodWIFI_v1_0
  C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/PWM
} [current_project]
  set_property ip_cache_permissions disable [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.runs/synth_1/design_1_wrapper.dcp
  read_edif C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/imports/coregen/check_FF_fifo/jpeg_checkff_fifo_fifo_generator_v2_3_xst_1.ngc
  read_edif C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/imports/coregen/check_FF_fifo/jpeg_checkff_fifo_fifo_generator_v2_3_xst_1_blkmemdp_v6_2_xst.edn
  read_edif C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/imports/coregen/upsampling_buffer/jpeg_upsampling_buffer.ngc
  read_edif C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/imports/coregen/qt_table/jpeg_qt_sr.edn
  read_edif C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/imports/coregen/idct/jpeg_idct_core_12.edn
  read_edif C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/imports/coregen/huffman_input_sr/jpeg_huffman_input_sr.edn
  read_edif C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/imports/coregen/ht_tables/jpeg_ht_tables.ngc
  read_edif C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/imports/coregen/ht_nr_of_symbols/jpeg_ht_nr_of_symbols.edn
  read_edif C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/imports/coregen/dequantize_multiplier/jpeg_dequant_multiplier.edn
  read_edif C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/imports/coregen/input_fifo/jpeg_input_fifo.edn
  read_edif C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/imports/src/jpeg_checkff_fifo.edn
  read_edif C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/imports/coregen/qt_table/jpeg_qt_sr_c_shift_ram_v8_0_xst_1.ngc
  read_edif C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/imports/coregen/input_fifo/jpeg_input_fifo_fifo_generator_v2_3_xst_1_blkmemdp_v6_2_xst.edn
  read_edif C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/imports/coregen/input_fifo/jpeg_input_fifo_fifo_generator_v2_3_xst_1.ngc
  read_edif C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/imports/coregen/idct/jpeg_idct_core_6.edn
  read_edif C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/imports/coregen/dequantize_multiplier/jpeg_dequant_multiplier_mult_gen_v8_0_xst_1.ngc
  read_edif C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/imports/coregen/check_FF_fifo/jpeg_checkff_fifo.edn
  read_edif C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/imports/coregen/vga_memory/vga_memory.ngc
  read_edif c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_stream_jpg_yy_nv_mn_v1_0_wed2_0_0/jpeg.srcs/sources_1/imports/mjpeg/coregen/upsampling_buffer/jpeg_upsampling_buffer.ngc
  read_edif c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_stream_jpg_yy_nv_mn_v1_0_wed2_0_0/jpeg.srcs/sources_1/imports/mjpeg/coregen/qt_table/jpeg_qt_sr.edn
  read_edif c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_stream_jpg_yy_nv_mn_v1_0_wed2_0_0/jpeg.srcs/sources_1/imports/mjpeg/coregen/idct/jpeg_idct_core_12.edn
  read_edif c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_stream_jpg_yy_nv_mn_v1_0_wed2_0_0/jpeg.srcs/sources_1/imports/mjpeg/coregen/huffman_input_sr/jpeg_huffman_input_sr.edn
  read_edif c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_stream_jpg_yy_nv_mn_v1_0_wed2_0_0/jpeg.srcs/sources_1/imports/mjpeg/coregen/ht_tables/jpeg_ht_tables.ngc
  read_edif c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_stream_jpg_yy_nv_mn_v1_0_wed2_0_0/jpeg.srcs/sources_1/imports/mjpeg/coregen/ht_nr_of_symbols/jpeg_ht_nr_of_symbols.edn
  read_edif c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_stream_jpg_yy_nv_mn_v1_0_wed2_0_0/jpeg.srcs/sources_1/imports/mjpeg/coregen/dequantize_multiplier/jpeg_dequant_multiplier.edn
  read_edif c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_stream_jpg_yy_nv_mn_v1_0_wed2_0_0/jpeg.srcs/sources_1/imports/mjpeg/coregen/input_fifo/jpeg_input_fifo.edn
  read_edif c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_stream_jpg_yy_nv_mn_v1_0_wed2_0_0/jpeg.srcs/sources_1/imports/mjpeg/coregen/check_FF_fifo/jpeg_checkff_fifo.edn
  add_files -quiet c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/PmodWIFI_pmod_bridge_0_0/PmodWIFI_pmod_bridge_0_0.dcp
  set_property netlist_only true [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/PmodWIFI_pmod_bridge_0_0/PmodWIFI_pmod_bridge_0_0.dcp]
  add_files -quiet c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.dcp
  set_property netlist_only true [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.dcp]
  add_files -quiet c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/blk_mem_gen_2/blk_mem_gen_2.dcp
  set_property netlist_only true [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/blk_mem_gen_2/blk_mem_gen_2.dcp]
  add_files -quiet c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/blk_mem_gen_3/blk_mem_gen_3.dcp
  set_property netlist_only true [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/blk_mem_gen_3/blk_mem_gen_3.dcp]
  add_files -quiet c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/blk_mem_gen_4/blk_mem_gen_4.dcp
  set_property netlist_only true [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/blk_mem_gen_4/blk_mem_gen_4.dcp]
  add_files -quiet c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/img_proc_full/jpeg.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0.dcp
  set_property netlist_only true [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/img_proc_full/jpeg.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0.dcp]
  add_files C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/design_1.bmm
  set_property SCOPED_TO_REF design_1 [get_files -all C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/design_1.bmm]
  add_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_microblaze_0_0/data/mb_bootloop_le.elf
  set_property SCOPED_TO_REF design_1 [get_files -all c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_microblaze_0_0/data/mb_bootloop_le.elf]
  set_property SCOPED_TO_CELLS microblaze_0 [get_files -all c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_microblaze_0_0/data/mb_bootloop_le.elf]
  add_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_microblaze_1_0/data/mb_bootloop_le.elf
  set_property SCOPED_TO_REF design_1 [get_files -all c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_microblaze_1_0/data/mb_bootloop_le.elf]
  set_property SCOPED_TO_CELLS microblaze_1 [get_files -all c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_microblaze_1_0/data/mb_bootloop_le.elf]
  read_xdc -ref design_1_microblaze_0_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_microblaze_0_0/design_1_microblaze_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_microblaze_0_0/design_1_microblaze_0_0.xdc]
  read_xdc -ref design_1_dlmb_v10_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_dlmb_v10_0/design_1_dlmb_v10_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_dlmb_v10_0/design_1_dlmb_v10_0.xdc]
  read_xdc -ref design_1_ilmb_v10_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_ilmb_v10_0/design_1_ilmb_v10_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_ilmb_v10_0/design_1_ilmb_v10_0.xdc]
  read_xdc -ref design_1_microblaze_0_axi_intc_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_microblaze_0_axi_intc_0/design_1_microblaze_0_axi_intc_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_microblaze_0_axi_intc_0/design_1_microblaze_0_axi_intc_0.xdc]
  read_xdc -ref design_1_mdm_1_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_mdm_1_0/design_1_mdm_1_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_mdm_1_0/design_1_mdm_1_0.xdc]
  read_xdc -prop_thru_buffers -ref design_1_clk_wiz_1_0 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0_board.xdc]
  read_xdc -ref design_1_clk_wiz_1_0 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0.xdc]
  read_xdc -prop_thru_buffers -ref design_1_rst_clk_wiz_1_100M_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_rst_clk_wiz_1_100M_0/design_1_rst_clk_wiz_1_100M_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_rst_clk_wiz_1_100M_0/design_1_rst_clk_wiz_1_100M_0_board.xdc]
  read_xdc -ref design_1_rst_clk_wiz_1_100M_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_rst_clk_wiz_1_100M_0/design_1_rst_clk_wiz_1_100M_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_rst_clk_wiz_1_100M_0/design_1_rst_clk_wiz_1_100M_0.xdc]
  read_xdc -ref design_1_mig_7series_0_0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_mig_7series_0_0/design_1_mig_7series_0_0/user_design/constraints/design_1_mig_7series_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_mig_7series_0_0/design_1_mig_7series_0_0/user_design/constraints/design_1_mig_7series_0_0.xdc]
  read_xdc -prop_thru_buffers -ref design_1_rst_mig_7series_0_81M_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_rst_mig_7series_0_81M_0/design_1_rst_mig_7series_0_81M_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_rst_mig_7series_0_81M_0/design_1_rst_mig_7series_0_81M_0_board.xdc]
  read_xdc -ref design_1_rst_mig_7series_0_81M_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_rst_mig_7series_0_81M_0/design_1_rst_mig_7series_0_81M_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_rst_mig_7series_0_81M_0/design_1_rst_mig_7series_0_81M_0.xdc]
  read_xdc -ref design_1_stream_jpg_yy_nv_mn_v1_0_wed2_0_0 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_stream_jpg_yy_nv_mn_v1_0_wed2_0_0/jpeg.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0/fifo_generator_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_stream_jpg_yy_nv_mn_v1_0_wed2_0_0/jpeg.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0/fifo_generator_0.xdc]
  read_xdc -prop_thru_buffers -ref design_1_PmodWIFI_0_0 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_PmodWIFI_0_0/design_1_PmodWIFI_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_PmodWIFI_0_0/design_1_PmodWIFI_0_0_board.xdc]
  read_xdc -prop_thru_buffers -ref PmodWIFI_pmod_bridge_0_0 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_PmodWIFI_0_0/src/PmodWIFI_pmod_bridge_0_0/PmodWIFI_pmod_bridge_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_PmodWIFI_0_0/src/PmodWIFI_pmod_bridge_0_0/PmodWIFI_pmod_bridge_0_0_board.xdc]
  read_xdc -prop_thru_buffers -ref PmodWIFI_axi_quad_spi_0_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_PmodWIFI_0_0/src/PmodWIFI_axi_quad_spi_0_0/PmodWIFI_axi_quad_spi_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_PmodWIFI_0_0/src/PmodWIFI_axi_quad_spi_0_0/PmodWIFI_axi_quad_spi_0_0_board.xdc]
  read_xdc -ref PmodWIFI_axi_quad_spi_0_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_PmodWIFI_0_0/src/PmodWIFI_axi_quad_spi_0_0/PmodWIFI_axi_quad_spi_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_PmodWIFI_0_0/src/PmodWIFI_axi_quad_spi_0_0/PmodWIFI_axi_quad_spi_0_0.xdc]
  read_xdc -prop_thru_buffers -ref PmodWIFI_axi_gpio_0_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_PmodWIFI_0_0/src/PmodWIFI_axi_gpio_0_0/PmodWIFI_axi_gpio_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_PmodWIFI_0_0/src/PmodWIFI_axi_gpio_0_0/PmodWIFI_axi_gpio_0_0_board.xdc]
  read_xdc -ref PmodWIFI_axi_gpio_0_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_PmodWIFI_0_0/src/PmodWIFI_axi_gpio_0_0/PmodWIFI_axi_gpio_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_PmodWIFI_0_0/src/PmodWIFI_axi_gpio_0_0/PmodWIFI_axi_gpio_0_0.xdc]
  read_xdc -prop_thru_buffers -ref PmodWIFI_axi_gpio_1_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_PmodWIFI_0_0/src/PmodWIFI_axi_gpio_1_0/PmodWIFI_axi_gpio_1_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_PmodWIFI_0_0/src/PmodWIFI_axi_gpio_1_0/PmodWIFI_axi_gpio_1_0_board.xdc]
  read_xdc -ref PmodWIFI_axi_gpio_1_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_PmodWIFI_0_0/src/PmodWIFI_axi_gpio_1_0/PmodWIFI_axi_gpio_1_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_PmodWIFI_0_0/src/PmodWIFI_axi_gpio_1_0/PmodWIFI_axi_gpio_1_0.xdc]
  read_xdc -ref PmodWIFI_axi_timer_0_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_PmodWIFI_0_0/src/PmodWIFI_axi_timer_0_0/PmodWIFI_axi_timer_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_PmodWIFI_0_0/src/PmodWIFI_axi_timer_0_0/PmodWIFI_axi_timer_0_0.xdc]
  read_xdc -prop_thru_buffers -ref design_1_axi_uartlite_0_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_axi_uartlite_0_0/design_1_axi_uartlite_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_axi_uartlite_0_0/design_1_axi_uartlite_0_0_board.xdc]
  read_xdc -ref design_1_axi_uartlite_0_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_axi_uartlite_0_0/design_1_axi_uartlite_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_axi_uartlite_0_0/design_1_axi_uartlite_0_0.xdc]
  read_xdc -ref design_1_microblaze_1_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_microblaze_1_0/design_1_microblaze_1_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_microblaze_1_0/design_1_microblaze_1_0.xdc]
  read_xdc -ref design_1_dlmb_v10_1 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_dlmb_v10_1/design_1_dlmb_v10_1.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_dlmb_v10_1/design_1_dlmb_v10_1.xdc]
  read_xdc -ref design_1_ilmb_v10_1 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_ilmb_v10_1/design_1_ilmb_v10_1.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_ilmb_v10_1/design_1_ilmb_v10_1.xdc]
  read_xdc -ref design_1_microblaze_1_axi_intc_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_microblaze_1_axi_intc_0/design_1_microblaze_1_axi_intc_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_microblaze_1_axi_intc_0/design_1_microblaze_1_axi_intc_0.xdc]
  read_xdc -prop_thru_buffers -ref design_1_axi_gpio_0_1 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_1/design_1_axi_gpio_0_1_board.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_1/design_1_axi_gpio_0_1_board.xdc]
  read_xdc -ref design_1_axi_gpio_0_1 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_1/design_1_axi_gpio_0_1.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_1/design_1_axi_gpio_0_1.xdc]
  read_xdc -prop_thru_buffers -ref design_1_MB1_GPIO_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_MB1_GPIO_0/design_1_MB1_GPIO_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_MB1_GPIO_0/design_1_MB1_GPIO_0_board.xdc]
  read_xdc -ref design_1_MB1_GPIO_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_MB1_GPIO_0/design_1_MB1_GPIO_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_MB1_GPIO_0/design_1_MB1_GPIO_0.xdc]
  read_xdc -ref PmodWIFI_axi_timer_0_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/PmodWIFI_axi_timer_0_0/PmodWIFI_axi_timer_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/PmodWIFI_axi_timer_0_0/PmodWIFI_axi_timer_0_0.xdc]
  read_xdc -prop_thru_buffers -ref PmodWIFI_axi_gpio_1_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/PmodWIFI_axi_gpio_1_0/PmodWIFI_axi_gpio_1_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/PmodWIFI_axi_gpio_1_0/PmodWIFI_axi_gpio_1_0_board.xdc]
  read_xdc -ref PmodWIFI_axi_gpio_1_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/PmodWIFI_axi_gpio_1_0/PmodWIFI_axi_gpio_1_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/PmodWIFI_axi_gpio_1_0/PmodWIFI_axi_gpio_1_0.xdc]
  read_xdc -prop_thru_buffers -ref PmodWIFI_axi_quad_spi_0_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/PmodWIFI_axi_quad_spi_0_0/PmodWIFI_axi_quad_spi_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/PmodWIFI_axi_quad_spi_0_0/PmodWIFI_axi_quad_spi_0_0_board.xdc]
  read_xdc -ref PmodWIFI_axi_quad_spi_0_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/PmodWIFI_axi_quad_spi_0_0/PmodWIFI_axi_quad_spi_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/PmodWIFI_axi_quad_spi_0_0/PmodWIFI_axi_quad_spi_0_0.xdc]
  read_xdc -prop_thru_buffers -ref PmodWIFI_axi_gpio_0_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/PmodWIFI_axi_gpio_0_0/PmodWIFI_axi_gpio_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/PmodWIFI_axi_gpio_0_0/PmodWIFI_axi_gpio_0_0_board.xdc]
  read_xdc -ref PmodWIFI_axi_gpio_0_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/PmodWIFI_axi_gpio_0_0/PmodWIFI_axi_gpio_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/PmodWIFI_axi_gpio_0_0/PmodWIFI_axi_gpio_0_0.xdc]
  read_xdc -mode out_of_context -ref PmodWIFI_pmod_bridge_0_0 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/PmodWIFI_pmod_bridge_0_0/src/pmod_concat_ooc.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/PmodWIFI_pmod_bridge_0_0/src/pmod_concat_ooc.xdc]
  read_xdc -prop_thru_buffers -ref PmodWIFI_pmod_bridge_0_0 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/PmodWIFI_pmod_bridge_0_0/PmodWIFI_pmod_bridge_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/PmodWIFI_pmod_bridge_0_0/PmodWIFI_pmod_bridge_0_0_board.xdc]
  read_xdc -mode out_of_context -ref blk_mem_gen_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_ooc.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_gen_2 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/blk_mem_gen_2/blk_mem_gen_2_ooc.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/blk_mem_gen_2/blk_mem_gen_2_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_gen_3 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/blk_mem_gen_3/blk_mem_gen_3_ooc.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/blk_mem_gen_3/blk_mem_gen_3_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_gen_4 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/blk_mem_gen_4/blk_mem_gen_4_ooc.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/blk_mem_gen_4/blk_mem_gen_4_ooc.xdc]
  read_xdc -mode out_of_context -ref fifo_generator_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/img_proc_full/jpeg.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0_ooc.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/img_proc_full/jpeg.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0_ooc.xdc]
  read_xdc -ref fifo_generator_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/img_proc_full/jpeg.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0/fifo_generator_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/img_proc_full/jpeg.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0/fifo_generator_0.xdc]
  read_xdc C:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/constrs_1/imports/const.xdc
  read_xdc -ref design_1_microblaze_0_axi_intc_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_microblaze_0_axi_intc_0/design_1_microblaze_0_axi_intc_0_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_microblaze_0_axi_intc_0/design_1_microblaze_0_axi_intc_0_clocks.xdc]
  read_xdc -ref PmodWIFI_axi_quad_spi_0_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_PmodWIFI_0_0/src/PmodWIFI_axi_quad_spi_0_0/PmodWIFI_axi_quad_spi_0_0_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_PmodWIFI_0_0/src/PmodWIFI_axi_quad_spi_0_0/PmodWIFI_axi_quad_spi_0_0_clocks.xdc]
  read_xdc -ref design_1_microblaze_1_axi_intc_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_microblaze_1_axi_intc_0/design_1_microblaze_1_axi_intc_0_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_microblaze_1_axi_intc_0/design_1_microblaze_1_axi_intc_0_clocks.xdc]
  read_xdc -ref design_1_auto_ds_0 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_0_1/design_1_auto_ds_0_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_0_1/design_1_auto_ds_0_clocks.xdc]
  read_xdc -ref design_1_auto_ds_1 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_1_1/design_1_auto_ds_1_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_1_1/design_1_auto_ds_1_clocks.xdc]
  read_xdc -ref design_1_auto_ds_2 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_2_1/design_1_auto_ds_2_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_2_1/design_1_auto_ds_2_clocks.xdc]
  read_xdc -ref design_1_auto_ds_3 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_3_1/design_1_auto_ds_3_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_3_1/design_1_auto_ds_3_clocks.xdc]
  read_xdc -ref design_1_auto_ds_4 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_4_1/design_1_auto_ds_4_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_4_1/design_1_auto_ds_4_clocks.xdc]
  read_xdc -ref design_1_auto_us_0 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_us_0_1/design_1_auto_us_0_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_us_0_1/design_1_auto_us_0_clocks.xdc]
  read_xdc -ref design_1_auto_ds_5 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_5_1/design_1_auto_ds_5_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_5_1/design_1_auto_ds_5_clocks.xdc]
  read_xdc -ref design_1_auto_us_1 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_us_1_1/design_1_auto_us_1_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_us_1_1/design_1_auto_us_1_clocks.xdc]
  read_xdc -ref design_1_auto_us_2 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_us_2_1/design_1_auto_us_2_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_us_2_1/design_1_auto_us_2_clocks.xdc]
  read_xdc -ref design_1_auto_ds_6 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_6_1/design_1_auto_ds_6_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_6_1/design_1_auto_ds_6_clocks.xdc]
  read_xdc -ref design_1_auto_cc_0 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_cc_0_1/design_1_auto_cc_0_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_cc_0_1/design_1_auto_cc_0_clocks.xdc]
  read_xdc -ref design_1_auto_ds_7 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_7_1/design_1_auto_ds_7_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_7_1/design_1_auto_ds_7_clocks.xdc]
  read_xdc -ref design_1_auto_ds_8 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_8_1/design_1_auto_ds_8_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_8_1/design_1_auto_ds_8_clocks.xdc]
  read_xdc -ref design_1_auto_ds_9 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_9_1/design_1_auto_ds_9_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_9_1/design_1_auto_ds_9_clocks.xdc]
  read_xdc -ref design_1_auto_ds_10 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_10_1/design_1_auto_ds_10_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_10_1/design_1_auto_ds_10_clocks.xdc]
  read_xdc -ref design_1_auto_ds_11 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_11_1/design_1_auto_ds_11_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_ds_11_1/design_1_auto_ds_11_clocks.xdc]
  read_xdc -ref design_1_auto_us_3 -cells inst c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_us_3_1/design_1_auto_us_3_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_auto_us_3_1/design_1_auto_us_3_clocks.xdc]
  read_xdc -ref PmodWIFI_axi_quad_spi_0_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/PmodWIFI_axi_quad_spi_0_0/PmodWIFI_axi_quad_spi_0_0_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/project_1/project_1.srcs/sources_1/ip/PmodWIFI_axi_quad_spi_0_0/PmodWIFI_axi_quad_spi_0_0_clocks.xdc]
  read_xdc -ref fifo_generator_0 -cells U0 c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/img_proc_full/jpeg.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0/fifo_generator_0_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/yy/Desktop/to_be_sped_up/v2/temp532/img_proc_full/jpeg.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0/fifo_generator_0_clocks.xdc]
  link_design -top design_1_wrapper -part xc7a100tcsg324-1
  write_hwdef -file design_1_wrapper.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force design_1_wrapper_opt.dcp
  catch { report_drc -file design_1_wrapper_drc_opted.rpt }
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design -directive ExtraTimingOpt
  write_checkpoint -force design_1_wrapper_placed.dcp
  catch { report_io -file design_1_wrapper_io_placed.rpt }
  catch { report_utilization -file design_1_wrapper_utilization_placed.rpt -pb design_1_wrapper_utilization_placed.pb }
  catch { report_control_sets -verbose -file design_1_wrapper_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step phys_opt_design
set ACTIVE_STEP phys_opt_design
set rc [catch {
  create_msg_db phys_opt_design.pb
  phys_opt_design -directive Explore
  write_checkpoint -force design_1_wrapper_physopt.dcp
  close_msg_db -file phys_opt_design.pb
} RESULT]
if {$rc} {
  step_failed phys_opt_design
  return -code error $RESULT
} else {
  end_step phys_opt_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design -directive Explore
  write_checkpoint -force design_1_wrapper_routed.dcp
  catch { report_drc -file design_1_wrapper_drc_routed.rpt -pb design_1_wrapper_drc_routed.pb -rpx design_1_wrapper_drc_routed.rpx }
  catch { report_methodology -file design_1_wrapper_methodology_drc_routed.rpt -rpx design_1_wrapper_methodology_drc_routed.rpx }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file design_1_wrapper_timing_summary_routed.rpt -rpx design_1_wrapper_timing_summary_routed.rpx }
  catch { report_power -file design_1_wrapper_power_routed.rpt -pb design_1_wrapper_power_summary_routed.pb -rpx design_1_wrapper_power_routed.rpx }
  catch { report_route_status -file design_1_wrapper_route_status.rpt -pb design_1_wrapper_route_status.pb }
  catch { report_clock_utilization -file design_1_wrapper_clock_utilization_routed.rpt }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force design_1_wrapper_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  catch { write_mem_info -force design_1_wrapper.mmi }
  catch { write_bmm -force design_1_wrapper_bd.bmm }
  write_bitstream -force -no_partial_bitfile design_1_wrapper.bit 
  catch { write_sysdef -hwdef design_1_wrapper.hwdef -bitfile design_1_wrapper.bit -meminfo design_1_wrapper.mmi -file design_1_wrapper.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

