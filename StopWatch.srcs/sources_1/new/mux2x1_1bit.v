`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of New Hampshire
// Engineer: Femi Olugbon
// 
// Create Date: 02/18/2022 08:04:28 AM
// Design Name: mux2x1_1bit 2-xhannel mux.
// Module Name: mux2x1_1bit
// Project Name: StopWatch Design
// Target Devices: XC7A35T-ICpG236C
// Tool Versions: 
// Description: Struyuctural modelling of a one-bit 2-channle multiplexer.
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux2x1_1bit(  input0,
                     input1,
                     sel,
                     out
                     );
    input input0, input1, sel;
    output out;
    
    assign out = (input0 & ~sel) | (input1 & sel);
endmodule
