connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Nexys4DDR 210292646030A"} -index 0
loadhw W:/temp532/project_1/project_1.sdk/design_1_wrapper_hw_platform_2/system.hdf
targets -set -nocase -filter {name =~ "microblaze*#1" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Nexys4DDR 210292646030A"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "microblaze*#1" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Nexys4DDR 210292646030A"} -index 0
dow W:/temp532/project_1/project_1.sdk/MB1/Debug/MB1.elf
targets -set -nocase -filter {name =~ "microblaze*#1" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Nexys4DDR 210292646030A"} -index 0
con
