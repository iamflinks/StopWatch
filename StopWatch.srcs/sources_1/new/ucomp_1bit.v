`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of New Hampshire
// Engineer: Femi Olugbon
// 
// Create Date: 02/18/2022 08:35:46 AM
// Design Name: StopWatch
// Module Name: ucomp_1bit
// Project Name: StopWathc Design
// Target Devices: Xilinx Artix-7 FPGA
// Tool Versions: 
// Description: 
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ucomp_1bit(  a0,
                    b0,
                    Greater,
                    Equal,
                    Less
                    );

    input a0, b0;
    output Greater, Equal, Less;
    
    assign Greater = a0 & ~b0;
    assign Equal   = (~a0 & ~b0) | (a0 & b0);
    assign Less    = ~a0 & b0;
endmodule
