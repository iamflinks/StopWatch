`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of New Hampshire
// Engineer: Femi Olugbon
// 
// Create Date: 02/18/2022 08:04:28 AM
// Design Name: Stop Watch Design.
// Module Name: StopWatchTransition
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
// Stopwatch states:
//      State           Name            Function
//      000             Unused          Do nothing
//      001             Start1          Clear the dis
//      010             Start2          Count continuously
//      011             Stop            Stop counting and show counter result
//      100             Store1          Update the best record 
//      101             Store2          Show the best record
//      110             Reset1          Reset counter to 0
//      111             Reset2          Reset the best record to 99.99
//////////////////////////////////////////////////////////////////////////////////


module StopWatchTransition(   pinCombs,
                              S,     // The current state vector
                              N,     // The vector of next state
                           );
    input [4:0] pinCombs;  // pinCOmbs[4]=Start, pinCombs[3]=Stop, pinCombs[2]=Store, pinCombs[1]=Reset, pinCombs[0]=NewRecordFlag
    input   [2:0] S;
    output reg  [2:0] N;
    
    always @*  //(pinCombs[4] or pinCombs[3] or pinCombs[2] or pinCombs[1] or pinCombs[0]) // re-evaluate the state whenever the input changes
        begin
            case(pinCombs)
            
                5'b00000:   begin  // No inputs, next state will be the same and the current state
                                case(S)
                                    3'b000: N <= 3'b000;
                                    3'b001: N <= 3'b001;
                                    3'b010: N <= 3'b010;
                                    3'b011: N <= 3'b011;
                                    3'b100: N <= 3'b100;
                                    3'b101: N <= 3'b101;
                                    3'b110: N <= 3'b110;
                                    3'b111: N <= 3'b111;
                                endcase
                            end
                5'b00001:   begin  // No inputs, next state will be the same and the current state
                                case(S)
                                    3'b000: N <= 3'b000;
                                    3'b001: N <= 3'b001;
                                    3'b010: N <= 3'b010;
                                    3'b011: N <= 3'b011;
                                    3'b100: N <= 3'b100;
                                    3'b101: N <= 3'b101;
                                    3'b110: N <= 3'b110;
                                    3'b111: N <= 3'b111;
                                endcase
                            end
                5'b00010:   begin  // Reset is 1, next state will be the Reset1, execep when present state is aalready Reset1
                                case(S)
                                    3'b000: N <= 3'b110;
                                    3'b001: N <= 3'b110;
                                    3'b010: N <= 3'b110;
                                    3'b011: N <= 3'b110;
                                    3'b100: N <= 3'b110;
                                    3'b101: N <= 3'b110;
                                    3'b110: N <= 3'b111;
                                    3'b111: N <= 3'b111;
                                endcase
                            end
                5'b00011:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b110;
                                    3'b001: N <= 3'b110;
                                    3'b010: N <= 3'b110;
                                    3'b011: N <= 3'b110;
                                    3'b100: N <= 3'b110;
                                    3'b101: N <= 3'b110;
                                    3'b110: N <= 3'b111;
                                    3'b111: N <= 3'b111;
                                endcase
                            end
                5'b00100:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b101;
                                    3'b001: N <= 3'b101;
                                    3'b010: N <= 3'b101;
                                    3'b011: N <= 3'b101;
                                    3'b100: N <= 3'b101;
                                    3'b101: N <= 3'b101;
                                    3'b110: N <= 3'b101;
                                    3'b111: N <= 3'b101;
                                endcase
                            end
                5'b00101:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b101;
                                    3'b001: N <= 3'b101;
                                    3'b010: N <= 3'b101;
                                    3'b011: N <= 3'b100;
                                    3'b100: N <= 3'b101;
                                    3'b101: N <= 3'b101;
                                    3'b110: N <= 3'b101;
                                    3'b111: N <= 3'b101;
                                endcase
                            end
                5'b00110:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b110;
                                    3'b001: N <= 3'b110;
                                    3'b010: N <= 3'b110;
                                    3'b011: N <= 3'b110;
                                    3'b100: N <= 3'b110;
                                    3'b101: N <= 3'b110;
                                    3'b110: N <= 3'b111;
                                    3'b111: N <= 3'b111;
                                endcase
                            end
                5'b00111:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b110;
                                    3'b001: N <= 3'b110;
                                    3'b010: N <= 3'b110;
                                    3'b011: N <= 3'b110;
                                    3'b100: N <= 3'b110;
                                    3'b101: N <= 3'b110;
                                    3'b110: N <= 3'b111;
                                    3'b111: N <= 3'b111;
                                endcase
                            end
                5'b01000:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b011;
                                    3'b001: N <= 3'b011;
                                    3'b010: N <= 3'b011;
                                    3'b011: N <= 3'b011;
                                    3'b100: N <= 3'b011;
                                    3'b101: N <= 3'b011;
                                    3'b110: N <= 3'b011;
                                    3'b111: N <= 3'b011;
                                endcase
                            end
                5'b01001:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b011;
                                    3'b001: N <= 3'b011;
                                    3'b010: N <= 3'b011;
                                    3'b011: N <= 3'b011;
                                    3'b100: N <= 3'b011;
                                    3'b101: N <= 3'b011;
                                    3'b110: N <= 3'b011;
                                    3'b111: N <= 3'b011;
                                endcase
                            end
                5'b01010:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b110;
                                    3'b001: N <= 3'b110;
                                    3'b010: N <= 3'b110;
                                    3'b011: N <= 3'b110;
                                    3'b100: N <= 3'b110;
                                    3'b101: N <= 3'b110;
                                    3'b110: N <= 3'b111;
                                    3'b111: N <= 3'b111;
                                endcase
                            end
                5'b01011:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b110;
                                    3'b001: N <= 3'b110;
                                    3'b010: N <= 3'b110;
                                    3'b011: N <= 3'b110;
                                    3'b100: N <= 3'b110;
                                    3'b101: N <= 3'b110;
                                    3'b110: N <= 3'b111;
                                    3'b111: N <= 3'b111;
                                endcase
                            end
                5'b01100:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b101;
                                    3'b001: N <= 3'b101;
                                    3'b010: N <= 3'b101;
                                    3'b011: N <= 3'b101;
                                    3'b100: N <= 3'b101;
                                    3'b101: N <= 3'b101;
                                    3'b110: N <= 3'b101;
                                    3'b111: N <= 3'b101;
                                endcase
                            end
                5'b01101:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b101;
                                    3'b001: N <= 3'b101;
                                    3'b010: N <= 3'b101;
                                    3'b011: N <= 3'b100;
                                    3'b100: N <= 3'b101;
                                    3'b101: N <= 3'b101;
                                    3'b110: N <= 3'b101;
                                    3'b111: N <= 3'b101;
                                endcase
                            end
                5'b00110:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b110;
                                    3'b001: N <= 3'b110;
                                    3'b010: N <= 3'b110;
                                    3'b011: N <= 3'b110;
                                    3'b100: N <= 3'b110;
                                    3'b101: N <= 3'b110;
                                    3'b110: N <= 3'b111;
                                    3'b111: N <= 3'b111;
                                endcase
                            end
                5'b00111:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b110;
                                    3'b001: N <= 3'b110;
                                    3'b010: N <= 3'b110;
                                    3'b011: N <= 3'b110;
                                    3'b100: N <= 3'b110;
                                    3'b101: N <= 3'b110;
                                    3'b110: N <= 3'b111;
                                    3'b111: N <= 3'b111;
                                endcase
                            end
                5'b10000:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b001;
                                    3'b001: N <= 3'b010;
                                    3'b010: N <= 3'b010;
                                    3'b011: N <= 3'b001;
                                    3'b100: N <= 3'b001;
                                    3'b101: N <= 3'b001;
                                    3'b110: N <= 3'b001;
                                    3'b111: N <= 3'b001;
                                endcase
                            end
                5'b10001:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b001;
                                    3'b001: N <= 3'b010;
                                    3'b010: N <= 3'b010;
                                    3'b011: N <= 3'b001;
                                    3'b100: N <= 3'b001;
                                    3'b101: N <= 3'b001;
                                    3'b110: N <= 3'b001;
                                    3'b111: N <= 3'b001;
                                endcase
                            end
                5'b10010:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b110;
                                    3'b001: N <= 3'b110;
                                    3'b010: N <= 3'b110;
                                    3'b011: N <= 3'b110;
                                    3'b100: N <= 3'b110;
                                    3'b101: N <= 3'b110;
                                    3'b110: N <= 3'b111;
                                    3'b111: N <= 3'b111;
                                endcase
                            end
                5'b10011:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b110;
                                    3'b001: N <= 3'b110;
                                    3'b010: N <= 3'b110;
                                    3'b011: N <= 3'b110;
                                    3'b100: N <= 3'b110;
                                    3'b101: N <= 3'b110;
                                    3'b110: N <= 3'b111;
                                    3'b111: N <= 3'b111;
                                endcase
                            end
                5'b10100:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b001;
                                    3'b001: N <= 3'b010;
                                    3'b010: N <= 3'b010;
                                    3'b011: N <= 3'b001;
                                    3'b100: N <= 3'b001;
                                    3'b101: N <= 3'b001;
                                    3'b110: N <= 3'b001;
                                    3'b111: N <= 3'b001;
                                endcase
                            end
                5'b10101:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b001;
                                    3'b001: N <= 3'b010;
                                    3'b010: N <= 3'b010;
                                    3'b011: N <= 3'b001;
                                    3'b100: N <= 3'b001;
                                    3'b101: N <= 3'b001;
                                    3'b110: N <= 3'b001;
                                    3'b111: N <= 3'b001;
                                endcase
                            end
                5'b10110:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b110;
                                    3'b001: N <= 3'b110;
                                    3'b010: N <= 3'b110;
                                    3'b011: N <= 3'b110;
                                    3'b100: N <= 3'b110;
                                    3'b101: N <= 3'b110;
                                    3'b110: N <= 3'b111;
                                    3'b111: N <= 3'b111;
                                endcase
                            end
                5'b10111:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b110;
                                    3'b001: N <= 3'b110;
                                    3'b010: N <= 3'b110;
                                    3'b011: N <= 3'b110;
                                    3'b100: N <= 3'b110;
                                    3'b101: N <= 3'b110;
                                    3'b110: N <= 3'b111;
                                    3'b111: N <= 3'b111;
                                endcase
                            end
                5'b11000:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b011;
                                    3'b001: N <= 3'b011;
                                    3'b010: N <= 3'b011;
                                    3'b011: N <= 3'b011;
                                    3'b100: N <= 3'b011;
                                    3'b101: N <= 3'b011;
                                    3'b110: N <= 3'b011;
                                    3'b111: N <= 3'b011;
                                endcase
                            end
                5'b11001:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b011;
                                    3'b001: N <= 3'b011;
                                    3'b010: N <= 3'b011;
                                    3'b011: N <= 3'b011;
                                    3'b100: N <= 3'b011;
                                    3'b101: N <= 3'b011;
                                    3'b110: N <= 3'b011;
                                    3'b111: N <= 3'b011;
                                endcase
                            end
                5'b11010:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b110;
                                    3'b001: N <= 3'b110;
                                    3'b010: N <= 3'b110;
                                    3'b011: N <= 3'b110;
                                    3'b100: N <= 3'b110;
                                    3'b101: N <= 3'b110;
                                    3'b110: N <= 3'b111;
                                    3'b111: N <= 3'b111;
                                endcase
                            end
                5'b11011:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b110;
                                    3'b001: N <= 3'b110;
                                    3'b010: N <= 3'b110;
                                    3'b011: N <= 3'b110;
                                    3'b100: N <= 3'b110;
                                    3'b101: N <= 3'b110;
                                    3'b110: N <= 3'b111;
                                    3'b111: N <= 3'b111;
                                endcase
                            end
                5'b11100:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b101;
                                    3'b001: N <= 3'b101;
                                    3'b010: N <= 3'b101;
                                    3'b011: N <= 3'b101;
                                    3'b100: N <= 3'b101;
                                    3'b101: N <= 3'b101;
                                    3'b110: N <= 3'b101;
                                    3'b111: N <= 3'b101;
                                endcase
                            end
                5'b11101:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b101;
                                    3'b001: N <= 3'b101;
                                    3'b010: N <= 3'b101;
                                    3'b011: N <= 3'b100;
                                    3'b100: N <= 3'b101;
                                    3'b101: N <= 3'b101;
                                    3'b110: N <= 3'b101;
                                    3'b111: N <= 3'b101;
                                endcase
                            end
                5'b11110:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b110;
                                    3'b001: N <= 3'b110;
                                    3'b010: N <= 3'b110;
                                    3'b011: N <= 3'b110;
                                    3'b100: N <= 3'b110;
                                    3'b101: N <= 3'b110;
                                    3'b110: N <= 3'b111;
                                    3'b111: N <= 3'b111;
                                endcase
                            end
                5'b11111:   begin  // 
                                case(S)
                                    3'b000: N <= 3'b110;
                                    3'b001: N <= 3'b110;
                                    3'b010: N <= 3'b110;
                                    3'b011: N <= 3'b110;
                                    3'b100: N <= 3'b110;
                                    3'b101: N <= 3'b110;
                                    3'b110: N <= 3'b111;
                                    3'b111: N <= 3'b111;
                                endcase
                            end
                default:    N <= 3'b000;
            endcase
        end
     
endmodule    
//    always @ (Start, Stop, Store, Reset, NewRecordFlag) begin
//    N[2] <= (~Start & Store) | (Stop & Store) | (Reset) | (S[2] & ~Start & ~Stop);
    
//    N[1] <= (Stop & ~Store) | (~Start & S[1] & ~Store) | (Reset) | (~S[2] & Start & ~S[1] & ~Stop & S[0]) | (~S[2] & Start & S[1] & ~Stop & ~S[0]);
    
//    N[0] <= (~Start & ~Reset & ~S[0] &  Store) | (~Start & ~Reset & ~S[1] & S[0]) | (~Start & ~Reset & ~NewRecordFlag & S[0]) | (~Reset & ~S[1] & Stop) | 
//                  (~Reset & Stop & ~NewRecordFlag) | (~Reset & Stop & ~S[0]) | (~Reset & S[1] & S[0] & ~Store) | (Start & ~Reset & ~S[1] & ~S[0]) | 
//                  (Start & ~Reset & S[1] & ~Stop & S[0]) | (S[2] & ~Reset & S[0]) | (S[2] & Reset & S[1]) | (S[2] & Start & ~Reset);
//    end

//endmodule
