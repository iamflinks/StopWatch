`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of New Hampshire
// Engineer: Femi Olugbon
// 
// Create Date: 02/18/2022 08:04:28 AM
// Design Name: Stop Watch Design.
// Module Name: stopWatchOutput
// Project Name: StopWatch Design
// Target Devices: XC7A35T-ICpG236C
// Tool Versions: 
// Description: This module handles the output control of the stopwatch.
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module stopWatchOutput(   S,                  // Stopwatch present state
                          DisplayInputSel,    // display data DisplayInputSel
                          RegisterEN,         // register enable pin
                          RegisterInputSel,   // register data select pin
                          CounterEN,          // counter enable constraint_mode
                          CounterReset        // counter reset pin
                       );
    input  [2:0] S;
    output reg  DisplayInputSel, RegisterEN, RegisterInputSel, CounterEN, CounterReset;
    
    
    
    always begin
         case (S) 
            4'b000: begin
                DisplayInputSel  <= 1'b0;
                CounterEN        <= 1'b0;
                RegisterEN       <= 1'b1;
                CounterReset     <= 1'b0;
                RegisterInputSel <= 1'b1;
            end
            
            4'b001: begin
                DisplayInputSel  <= 1'b0;
                CounterEN        <= 1'b1;
                RegisterEN       <= 1'b0;
                CounterReset     <= 1'b1;
                RegisterInputSel <= 1'b0;
            end
            
            4'b010: begin
                DisplayInputSel  <= 1'b0;
                CounterEN        <= 1'b1;
                RegisterEN       <= 1'b0;
                CounterReset     <= 1'b0;
                RegisterInputSel <= 1'b0;
            end
            
            4'b011: begin
                DisplayInputSel  <= 1'b0;
                CounterEN        <= 1'b0;
                RegisterEN       <= 1'b0;
                CounterReset     <= 1'b0;
                RegisterInputSel <= 1'b0;
            end
            
            4'b100: begin
                DisplayInputSel  <= 1'b1;
                CounterEN        <= 1'b0;
                RegisterEN       <= 1'b1;
                CounterReset     <= 1'b0;
                RegisterInputSel <= 1'b0;
            end
            
            4'b101: begin
                DisplayInputSel  <= 1'b1;
                CounterEN        <= 1'b0;
                RegisterEN       <= 1'b0;
                CounterReset     <= 1'b0;
                RegisterInputSel <= 1'b0;
            end
            
            4'b110: begin
                DisplayInputSel  <= 1'b0;
                CounterEN        <= 1'b0;
                RegisterEN       <= 1'b1;
                CounterReset     <= 1'b1;
                RegisterInputSel <= 1'b1;
            end
            
            4'b111: begin
                DisplayInputSel  <= 1'b0;
                CounterEN        <= 1'b0;
                RegisterEN       <= 1'b1;
                CounterReset     <= 1'b0;
                RegisterInputSel <= 1'b1;
            end
            
//            default: begin
//                DisplayInputSel  <= 1'b0;
//                CounterEN        <= 1'b0;
//                RegisterEN       <= 1'b1;
//                CounterReset     <= 1'b0;
//                RegisterInputSel <= 1'b1;
//            end
         endcase
    end
    
//    assign DisplayInputSel  = S[2] & ~S[1];
    
//    assign CounterEN        = (~S[2] & ~S[1] & S[0]) | (S[1] & ~S[0]);
    
//    assign RegisterEN       = (~S[1] & ~S[0]) | (S[2] & S[1]);
    
//    assign CounterReset     = (~S[2] & ~S[1] & S[0]) | (S[2] & S[1] & ~S[0]);
    
//    assign RegisterInputSel = (~S[2] & ~S[1] & ~S[0]) | (S[2] & S[1]);

endmodule
