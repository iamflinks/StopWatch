`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of New Hampshire
// Engineer: Femi Olugbon
// 
// Create Date: 02/18/2022 08:04:28 AM
// Design Name: Stop Watch Design.
// Module Name: counterOutput
// Project Name: StopWatch Design
// Target Devices: XC7A35T-ICpG236C
// Tool Versions: 
// Description: The module detetct when to roll the counter back and also trigger the next counter in the stack.
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counterStateTransition(   S,           // Counter present state
                                 carryOut      // Counter overflow
                              );
    input  [3:0] S;
    output  carryOut;
    
    assign carryOut = S[3] & ~S[2} & ~S[1] & S[0]; 

endmodule