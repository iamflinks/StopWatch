`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of New Hampshire
// Engineer: Femi Olugbon
// 
// Create Date: 02/18/2022 08:04:28 AM
// Design Name: Stop Watch Design.
// Module Name: dflip_flop
// Project Name: StopWatch Design
// Target Devices: XC7A35T-ICpG236C
// Tool Versions: 
// Description: Rising edge D flip-flop wit asynchronous set and rest, the output will not be triggered if enable is not active.
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dflip_flop(   D,              // Data input
                     async_set,      // Asynchronous set/preset input
                     async_reset,    // Asynchronous reset input
                     enable,         // enable pin
                     clk,            // clock input
                     Q,              // Output pin 
                     Q_bar           // Not output pin
                     );
    input D, async_set, async_reset, enable, clk;
    output reg Q, Q_bar;

    always @ (posedge clk or posedge async_reset or posedge async_set)
        begin
            if (async_reset== 1'b1)begin
                Q     <= 1'b0;
                Q_bar <= 1'b1;
            end
            else if (async_set==1'b1) begin
                Q     <= 1'b1;
                Q_bar <= 1'b0;
            end
            else if (enable== 1'b1) begin
                Q <= D;
                Q_bar <= ~D;
            end 
        end   

endmodule

//// FPGA projects using Verilog/ VHDL 
//// fpga4student.com
//// Verilog code for D Flip FLop
//// Verilog code for Rising edge D flip flop with Asynchronous Reset high
//module RisingEdge_DFlipFlop_AsyncResetHigh(D,clk,async_reset,Q);
//input D; // Data input 
//input clk; // clock input 
//input async_reset; // asynchronous reset high level
//output reg Q; // output Q 
//always @(posedge clk or posedge async_reset) 
//begin
// if(async_reset==1'b1)
//  Q <= 1'b0; 
// else 
//  Q <= D; 
//end 
//endmodule