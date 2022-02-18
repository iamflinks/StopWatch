`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of New Hampshire
// Engineer: Femi Olugbon
// 
// Create Date: 02/18/2022 08:35:46 AM
// Design Name: StopWatch
// Module Name: mux2x1_16bit
// Project Name: StopWathc Design
// Target Devices: Xilinx Artix-7 FPGA
// Tool Versions: 
// Description: 
// 
// Dependencies: mux2x1_1bit
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux2x1_16bit(  input0,
                      input1,
                      sel,
                      out
                      );
    input  [15:0]  input0;
    input  [15:0]  input1;
    input          sel;
    output [15:0]  out;
    
    mux2x1_1bit mux16[15:0] (input0, input1, sel, out);


endmodule
