`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of New Hampshire
// Engineer: Femi Olugbon
// 
// Create Date: 02/18/2022 08:04:28 AM
// Design Name: Stop Watch Design.
// Module Name: bcdCounter
// Project Name: StopWatch Design
// Target Devices: XC7A35T-ICpG236C
// Tool Versions: 
// Description: This module handles the state transitions of a BCD up counter.
// 
// Dependencies: dflip_flop.v, counterOutput.v, counterStateTrasnsition.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bcdCounter(        clk,        // clock signal
                          enable,     // counter enable pin
                          reset,      // asynchronous rest
                          carryOut,    // counter overflow
                          counterOut
                       );
    input   clk, enable, reset;
    output carryOut;
    output [3:0] counterOut;
    wire async_set = 1'bZ;
    wire [3:0] S_bar;
    wire [3:0] S;  // Counter present state
    wire [3:0] N;  // Counter next state
    

    counterStateTransition trans (S, N); // Instantiate the state transition module to control the states
    
    dflip_flop countBCD [3:0] (N, async_set, reset, enable, clk, S, S_bar);  // instantiate the D flip-flop to pass the next async_set
                                                                             // to the Q @ every clock pulse
    counterOutput cOut(S, carryOut);    // Set carryOut to when when counter state is 4'b1001
    
    assign counterOut = S;

endmodule


