`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of New Hampshire
// Engineer: Femi Olugbon
// 
// Create Date: 02/18/2022 08:04:28 AM
// Design Name: Stop Watch Design.
// Module Name: counter4digit
// Project Name: StopWatch Design
// Target Devices: XC7A35T-ICpG236C
// Tool Versions: 
// Description: This module handles the state transitions of a BCD up counter.
// 
// Dependencies: dflip_flop.v, counterOutput.v, counterStateTrasnsition.v, bcdCounter.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter4digit(     clk,        // clock signal
                          enable,     // counter enable pin
                          reset,      // asynchronous rest
                          counterOut
                       );
    input   clk, enable, reset;
    output [15:0] counterOut;
    
    wire carry0, carry1, carry2, carry3;
    
    // Use four BCD counter to build four digit counter
    bcdCounter digit0 (clk, enable, reset, carry0, counterOut[3:0]);  // Counter for digit zero
    bcdCounter digit1 (clk, carry0, reset, carry1, counterOut[7:4]);  // Counter for digit one, only enabled when digit0 overflow
    bcdCounter digit2 (clk, carry0 & carry1, reset, carry2, counterOut[11:8]);  // Counter for digit two, enabled when digit0 and digit1 overflow
    bcdCounter digit3 (clk, carry0 & carry1 & carry2, reset, carry3, counterOut[15:12]);  // Counter for digit three, enabled when digit0 and digit1 and digit2 overflow

endmodule