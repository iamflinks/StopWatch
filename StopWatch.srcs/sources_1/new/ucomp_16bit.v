`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of New Hampshire
// Engineer: Femi Olugbon
// 
// Create Date: 02/18/2022 08:35:46 AM
// Design Name: StopWatch
// Module Name: ucomp_16bit
// Project Name: StopWathc Design
// Target Devices: Xilinx Artix-7 FPGA
// Tool Versions: 
// Description: 
// 
// Dependencies: ucomp_1bit, ucomp_4bit
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ucomp_16bit(  a0,
                     b0,
                     Greater,
                     Equal,
                     Less
                     );

    input  [15:0] a0;
    input  [15:0] b0;
    output       Greater, Equal, Less;
    wire [15:0] G, E, L;
    
    ucomp_4bit comp[3:0] (a0, b0, G, E, L);
    
    assign Greater = G[3] | (E[3] & G[2]) | (E[3] & E[2] & G[1]) | (E[3] & E[2] & E[1] & G[0]);
    assign Equal   = E[3] &  E[2] & E[1]  & E[0];
    assign Less    = L[3] | (E[3] & L[2]) | (E[3] & E[2] & L[1]) | (E[3] & E[2] & E[1] & L[0]);
    

endmodule
