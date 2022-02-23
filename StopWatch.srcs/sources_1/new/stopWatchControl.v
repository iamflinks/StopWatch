`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of New Hampshire
// Engineer: Femi Olugbon
// 
// Create Date: 02/18/2022 08:04:28 AM
// Design Name: Stop Watch Design.
// Module Name: stopWatchControl
// Project Name: StopWatch Design
// Target Devices: XC7A35T-ICpG236C
// Tool Versions: 
// Description: This module handles the control of the stopwatch.
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module stopWatchControl(  Start,
                          Stop,
                          Store,
                          Reset,
                          NewRecordFlag,
                          clk,
                          DisplayInputSel,    // display data DisplayInputSel
                          RegisterEN,         // register enable pin
                          RegisterInputSel,   // register data select pin
                          CounterEN,          // counter enable constraint_mode
                          CounterReset        // counter reset pin
                        );
                         
    input Start, Stop, Store, Reset, NewRecordFlag, clk;
    output DisplayInputSel, RegisterEN, RegisterInputSel, CounterEN, CounterReset;
    
    // Pass the inputs to the pin combination vector
    wire [4:0] pinCombs;
    assign pinCombs[4] = Start;
    assign pinCombs[3] = Stop;
    assign pinCombs[2] = Store;
    assign pinCombs[1] = Reset;
    assign pinCombs[0] = NewRecordFlag;
    
    
    wire [2:0] S;
    wire [2:0] S_bar;
    wire [2:0] N;
    wire async_set, reset;
    wire enable = 1'b1;
    
    StopWatchTransition st_state (pinCombs, S, N); // instantiate the state transition module to handle the states
 
    dflip_flop st_contrl [2:0] (N, async_set, reset, enable, clk, S, S_bar);  // instantiate the D flip-flop to pass the next states.   
    
    stopWatchOutput st_out (S, DisplayInputSel, RegisterEN, RegisterInputSel, CounterEN, CounterReset);                   
endmodule


