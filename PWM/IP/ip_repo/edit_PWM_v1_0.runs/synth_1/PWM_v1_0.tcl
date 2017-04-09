# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir e:/ece532/pwm/ip/ip_repo/edit_PWM_v1_0.cache/wt [current_project]
set_property parent.project_path e:/ece532/pwm/ip/ip_repo/edit_PWM_v1_0.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_repo_paths {
  e:/ECE532/PWM/IP/ip_repo/PWM_1.0
  e:/ECE532/PWM/IP/ip_repo/PWM_1.0
} [current_project]
read_verilog -library xil_defaultlib {
  e:/ece532/pwm/ip/ip_repo/edit_PWM_v1_0.srcs/sources_1/new/PWM_Module.v
  e:/ECE532/PWM/IP/ip_repo/PWM_1.0/hdl/PWM_v1_0_S00_AXI.v
  e:/ECE532/PWM/IP/ip_repo/PWM_1.0/hdl/PWM_v1_0.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}

synth_design -top PWM_v1_0 -part xc7a100tcsg324-1


write_checkpoint -force -noxdef PWM_v1_0.dcp

catch { report_utilization -file PWM_v1_0_utilization_synth.rpt -pb PWM_v1_0_utilization_synth.pb }