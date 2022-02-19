`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of New Hampshire
// Engineer: Femi Olugbon
// 
// Create Date: 02/18/2022 08:04:28 AM
// Design Name: Stop Watch Design.
// Module Name: stopWatchStateTransition
// Project Name: StopWatch Design
// Target Devices: XC7A35T-ICpG236C
// Tool Versions: 
// Description: This module handles the state transitions of the stopwatch.
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module stopWatchStateTransition(   Start,
                                   Stop,
                                   Store,
                                   Reset,
                                   NewRecordFlag,
                                   S,     // The current state vector
                                   N,     // The vector of next state
                                );
    input Start, Stop, Store, Reset, NewRecordFlag;
    input   [2:0] S;
    output  [2:0] N;
    
    
    assign N[2] = (~Start & Store) | (Stop & Store) | (Reset) | (S[2] & ~Start & ~Stop);
    
    assign N[1] = (Stop & ~Store) | (~Start & S[1] & ~Store) | (Reset) | (~S[2] & Start & ~S[1] & ~Stop & S[0]) | (~S[2] & Start & S[1] & ~Stop & ~S[0]);
    
    assign N[0] = (~Start & ~Reset & ~S[0] &  Store) | (~Start & ~Reset & ~S[1] & S[0]) | (~Start & ~Reset & ~NewRecordFlag & S[0]) | (~Reset & ~S[1] & Stop) | 
                  (~Reset & Stop & ~NewRecordFlag) | (~Reset & Stop & ~S[0]) | (~Reset & S[1] & S[0] & ~Store) | (Start & ~Reset & ~S[1] & ~S[0]) | 
                  (Start & ~Reset & S[1] & ~Stop & S[0]) | (S[2] & ~Reset & S[0]) | (S[2] & Reset & S[1]) | (S[2] & Start & ~Reset);
    

endmodule
