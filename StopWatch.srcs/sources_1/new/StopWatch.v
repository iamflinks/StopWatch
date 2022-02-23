`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of New Hampshire
// Engineer: Femi Olugbon
// 
// Create Date: 02/22/2022 02:10:16 PM
// Design Name: StopWatch
// Module Name: StopWatch
// Project Name: Stopwatch design
// Target Devices: Xilinx Artix-7 FPGA
// Tool Versions: 
// Description: Top-level module for stopwatch implementation
// 
// Dependencies: stopWatchOutput.v, dispControl.v, stopWatchControl.v, StopWatchTransition.v, ucomb_16bit.v, counter4digit.v,
//               reg_16bit.v,ucomp_4bit.v, ucomp_1bit.v, reg_4bit.v, dflip_flop.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module StopWatch(   Start,
                    Stop,
                    Store,
                    Reset,
                    clock_100Mhz,
                    segmentPin,
                    controlPin,
                    dotDisplay
                 );
                 
    input Start, Stop, Store, Reset, clock_100Mhz;
    output reg dotDisplay;
    output reg [6:0] segmentPin;
    output reg [3:0] controlPin;
   
   // Declare internal signal/nets here
    wire clk;  // stopwatch clock signal
    wire NewRecordFlag, DisplayInputSel, RegisterEN, RegisterInputSel, CounterEN, CounterReset;
    wire Equal, Less;
    wire [15:0] MuxOut_1, CounterOut, RegisterOut, RegisterOut_bar, displayOut;
    reg [3:0] ledBCD;
    //reg [15:0] displayOut;
    
    // count          0    ->  1   ->    2   ->   3
    // activates    LED3      LED2      LED1    LED0
    wire [1:0] ledSequence;
    
    // 20-bit counter  for creating 10.5ms (380Hz) clock for counter and display refresh
    reg  [22:0] refresh_counter; 
    
    always @(posedge clock_100Mhz)
        begin
            refresh_counter <= refresh_counter + 1;
        end
     assign ledSequence = refresh_counter[16:15];
     assign clk         = refresh_counter[22];
    
    // instantiate the stop watch control module
    stopWatchControl contrl_st ( Start, Stop, Store, Reset, NewRecordFlag, clk,
                                 DisplayInputSel, RegisterEN, RegisterInputSel, CounterEN, CounterReset);
    
    // instantiate the 4-digit counter
    counter4digit st_count( clk, CounterEN, CounterReset, CounterOut );
    
    // instantiate the first mux
    mux2x1_16bit mux_1 (CounterOut, 16'h9999, RegisterInputSel, MuxOut_1);  // connects t othe register
    // instantiate register
    reg_16bit reg_16 (MuxOut_1, 1'b0, 1'b0, RegisterEN, clk, RegisterOut, RegisterOut_bar);
    
    // instantiate the second mux
    mux2x1_16bit mux_2 (CounterOut, RegisterOut, DisplayInputSel, displayOut);  //connects to the display conrtol
    
    // isntantiate the comparator
    ucomp_16bit comp (RegisterOut, CounterOut, NewRecordFlag, Equal, Less);
    
    
    always @(*)
    begin
        case(ledSequence)
        2'b00: begin
            controlPin <= 4'b0111; 
            // activate LED1 and Deactivate LED2, LED3, LED4
            ledBCD <= displayOut[15:12];
            // the third digit of the 16-bit number
            dotDisplay <= 1'b1;
              end
        2'b01: begin
            controlPin <= 4'b1011; 
            // activate LED2 and Deactivate LED1, LED4, LED4
            ledBCD <= displayOut[11:8];
            // the secpnd digit of the 16-bit number
            dotDisplay <= 1'b0;
              end
        2'b10: begin
            controlPin <= 4'b1101; 
            // activate LED3 and Deactivate LED1, LED2, LED4
            ledBCD <= displayOut[7:4];
            // the first digit of the 16-bit number
            dotDisplay <= 1'b1;
                end
        2'b11: begin   
            controlPin <= 4'b1110; 
            // activate LED4 and Deactivate LED2, LED3, LED1
            ledBCD <= displayOut[3:0];
            // the zeroth digit of the 16-bit number
            dotDisplay <= 1'b1;
               end
        endcase
     end
     
     // BCD to seven segment decoder, common anode
    always @(*)
        begin
            case(ledBCD)
                4'b0000: segmentPin = 7'b0000001; // "0"     
                4'b0001: segmentPin = 7'b1001111; // "1" 
                4'b0010: segmentPin = 7'b0010010; // "2" 
                4'b0011: segmentPin = 7'b0000110; // "3" 
                4'b0100: segmentPin = 7'b1001100; // "4" 
                4'b0101: segmentPin = 7'b0100100; // "5" 
                4'b0110: segmentPin = 7'b0100000; // "6" 
                4'b0111: segmentPin = 7'b0001111; // "7" 
                4'b1000: segmentPin = 7'b0000000; // "8"     
                4'b1001: segmentPin = 7'b0000100; // "9" 
                default: segmentPin = 7'b0000001; // "0"
            endcase
        end
//    // instantiate dsiplay control
//    dispControl digit3 ( MuxOut_2[15],MuxOut_2[14], MuxOut_2[13], MuxOut_2[12],
//                         displayPin[27], displayPin[26], displayPin[25], displayPin[24], displayPin[23], displayPin[22], displayPin[21]);
                         
//    dispControl digit2( MuxOut_2[11],MuxOut_2[10], MuxOut_2[9], MuxOut_2[8],
//                         displayPin[20], displayPin[19], displayPin[18], displayPin[17], displayPin[16], displayPin[15], displayPin[14]);
                         
//    dispControl digit1 ( MuxOut_2[7],MuxOut_2[6], MuxOut_2[5], MuxOut_2[4],
//                         displayPin[13], displayPin[12], displayPin[11], displayPin[10], displayPin[9], displayPin[8], displayPin[7]);
                         
//    dispControl digit0 ( MuxOut_2[3],MuxOut_2[2], MuxOut_2[1], MuxOut_2[0],
//                         displayPin[6], displayPin[5], displayPin[4], displayPin[3], displayPin[2], displayPin[1], displayPin[0]);

    
endmodule
