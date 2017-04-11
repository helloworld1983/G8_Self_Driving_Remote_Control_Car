#G8_Self_Driving_Remote_Control_Car: Grand Theft Auto

###Authors:
Neil Veira
Yaron Milwid
Milos Nikolic

This project implements a self driving remote control car using a Xilinx
Artix 7 FPGA on the Nexys4 DDR board. 

To use this design, the following hardware is needed:
- Nexy4 DDR board 
- PMOD wifi module
- VGA monitor
- New Bright 1:16 F-150 toy car with remote controller 
- Smartphone with camera and IP webcam app

##Description

The purpose of this design is to have the car autonomously navigate through 
an obstacle course. A destination is defined by a white object while obstacles
are defined by red objects. 

The design operates as follows:
- The smartphone camera is affixed to the top of the car and transmits video 
  over wifi in mjpeg format using the IP webcam app. 
- The PMOD wifi module receives jpeg images using http get requests and sends 
  them to the image processing component via the first microblaze. 
- The image processor decodes the jpeg image into RGB values for every pixel (x,y)
- The image processor performs colour thresholding to identify red and white 
  regions in the image.
- The image processor detects the edges of these regions and writes the edge 
  pixels to a bram as a list of (x,y) coordinates. It also picks a white edge
  pixel to use as a destination. 
- The second microblaze reads these edges and destination and runs a weight A* 
  algorithm to find the best path to the destination while avoiding obstacles. 
- The second microblaze sends a signal to the PWM controller module to move the 
  car in a certain direction. 
- The PWM module outputs the Forward, Backward, Left, and Right signals to the 
  car's physical remote controller in a series of pulses to move the car at 
  a controlled speed. 
- Flip switch V10 to enable human-controlled mode. The car can then bo controlled
  directly from the board using the pushbuttons. 
  
##How to use
- Compile the design and write it to the Nexys4 DDR board
- "Hijack" the car's remote controller by wiring the Forward, Backward, Left, 
  and Right signals to the pins C17, D18, E18, and G17.
- Connect the VGA monitor to VGA output port on the board
- Attach the smartphone camera to the top of the car. 
- Run the IP webcam app. Create a wifi hotspot and transmit video to it. 
- Run the design and microblazes on the board  


##Repository Structure

* src: Vivado project files
  * project_1: Main project 
    * project_1.sdk: software files 
      * MB0_n: SDK project for wifi microblaze 
        * src/main.cc: Contains all relevant code for this component
      * MB1: SDK project for path-finding microblaze
        * src/hellowworld.c: Contains all relevant code for this component
    * project_1.srcs: hardware source files
    
  * img_proc_full: Packaged project containing the image processing IP 
    * jpeg.srcs/sim_1/imports/vhdl/jpeg_testbench.vhd: 
      * sources_1: verilog & vhdl source files
        * stream_jpg_yy_nv_mn_v1_0.v: top-level source file for sending data from 
          this microblaze
        * image_processor_wrapper.v: top-level file for testing only. It gives 
          input data from a pre-initialized bram. 
        * image_processor.v: top-level file of image processor
        * imports/mjpeg/: files for jpeg decoder
        * edge_detector.v: self-explanatory
        * vga_controller.v: controls RGB values to display
        * vga_driver.vhd: IP from Rob Chapman, Altera University Program
        * ip/: Xilinx ip 
        
      * sim_1: simulation files 
        * imports/vhdl/jpeg_testbench.vhd: testbench for jpeg decoder
        * wrapper_tb.v: testbench for image_processor_wrapper
        
  * PWM: Packaged project containing the PWM controller IP
  
  * vivado-library-master: Files needed for the wifi module
  
* doc: Documentation including final report and presentation slides


