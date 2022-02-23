##Buttons
set_property PACKAGE_PIN T18 [get_ports Stop]						
	set_property IOSTANDARD LVCMOS33 [get_ports Stop]
set_property PACKAGE_PIN W19 [get_ports Start]						
	set_property IOSTANDARD LVCMOS33 [get_ports Start]
set_property PACKAGE_PIN T17 [get_ports Store]						
	set_property IOSTANDARD LVCMOS33 [get_ports Store]
set_property PACKAGE_PIN U17 [get_ports Reset]						
	set_property IOSTANDARD LVCMOS33 [get_ports Reset]



# Clock signal
set_property PACKAGE_PIN W5 [get_ports clock_100Mhz]							
	set_property IOSTANDARD LVCMOS33 [get_ports clock_100Mhz]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clock_100Mhz]

#seven-segment LED display
set_property PACKAGE_PIN W7 [get_ports {segmentPin[6]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {segmentPin[6]}]
set_property PACKAGE_PIN W6 [get_ports {segmentPin[5]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {segmentPin[5]}]
set_property PACKAGE_PIN U8 [get_ports {segmentPin[4]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {segmentPin[4]}]
set_property PACKAGE_PIN V8 [get_ports {segmentPin[3]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {segmentPin[3]}]
set_property PACKAGE_PIN U5 [get_ports {segmentPin[2]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {segmentPin[2]}]
set_property PACKAGE_PIN V5 [get_ports {segmentPin[1]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {segmentPin[1]}]
set_property PACKAGE_PIN U7 [get_ports {segmentPin[0]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {segmentPin[0]}]
   
// Dot display
set_property PACKAGE_PIN V7 [get_ports dotDisplay]							
	set_property IOSTANDARD LVCMOS33 [get_ports dotDisplay]

#// Control pins
set_property PACKAGE_PIN U2 [get_ports {controlPin[0]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {controlPin[0]}]
set_property PACKAGE_PIN U4 [get_ports {controlPin[1]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {controlPin[1]}]
set_property PACKAGE_PIN V4 [get_ports {controlPin[2]}]               
   set_property IOSTANDARD LVCMOS33 [get_ports {controlPin[2]}]
set_property PACKAGE_PIN W4 [get_ports {controlPin[3]}]          
   set_property IOSTANDARD LVCMOS33 [get_ports {controlPin[3]}]