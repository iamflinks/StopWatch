`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of New Hampshire
// Engineer: Femi Olugbon
// 
// Create Date: 02/18/2022 08:04:28 AM
// Design Name: Stop Watch Design.
// Module Name: reg_16bit
// Project Name: StopWatch Design
// Target Devices: XC7A35T-ICpG236C
// Tool Versions: 
// Description: Sixteen-bit parallel load register using D flip-flops
// 
// Dependencies: dflip-flop.v, reg_4bit.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module reg_16bit(    D,              // Data input
                     async_set,      // Asynchronous set/preset input
                     async_reset,    // Asynchronous reset input
                     enable,         // enable pin
                     clk,            // clock input
                     Q,              // Output pin 
                     Q_bar           // Not output pin
                     );
    input [15:0] D;
    input async_set, async_reset, enable, clk;
    output [15:0] Q;
    output [15:0] Q_bar;
    
    reg_4bit reg16 [3:0] (D, async_set, async_reset, enable, clk, Q, Q_bar);
    
endmodule