`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of New Hampshire
// Engineer: Femi Olugbon
// 
// Create Date: 02/18/2022 08:04:28 AM
// Design Name: Stop Watch Design.
// Module Name: counterStateTransition
// Project Name: StopWatch Design
// Target Devices: XC7A35T-ICpG236C
// Tool Versions: 
// Description: This module handles the state transitions of a BCD up counter.
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counterStateTransition(   s3,     // MSB of the current state
                                 s2,
                                 s1,
                                 s0,     // LSB of the current state
                                 n3,     // MSB of the next state
                                 n2,
                                 n1,
                                 n0      // MSB of the next state
                              );
    input   s3, s2, s1, s0;
    output  n3, n2, n1, n0;
    
    assign n3 = (~s3 & s2 & s1 & s0) | (s3 & ~s2 & ~s1 & ~s0);
    
    assign n2 = (~s3 & ~s2 & s1 & s0) | (~s3 & s2 & ~s1) | (~s3 & s2 & ~s0);
    
    assign n1 = (~s3 & ~s1 & s0) | (~s3 & s1 & ~s0);
    
    assign n0 = (~s3 & ~s0) | (~s2 & ~s1 & ~s0);

endmodule