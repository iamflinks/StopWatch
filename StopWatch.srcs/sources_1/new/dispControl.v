`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of New Hampshire
// Engineer: Femi Olugbon
// 
// Create Date: 02/18/2022 08:35:46 AM
// Design Name: StopWatch
// Module Name: dispControl
// Project Name: StopWathc Design
// Target Devices: Xilinx Artix-7 FPGA
// Tool Versions: 
// Description: 
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dispControl(  inputNumber,
                     segmentPin,
                     controlPin
                     );

    input  [15:0] inputNumber;
    output reg [8:0] segmentPin;
    output reg [3:0] controlPin;
    
    //Anode activating signals
    always @ (*) 
        begin
//            case
        end
    
    // BCD to seven segment decoder, common anode
    always @(*)
        begin
            case(ledBCD)
                4'b0000: ledOut = 7'b0000001; // "0"     
                4'b0001: ledOut = 7'b1001111; // "1" 
                4'b0010: ledOut = 7'b0010010; // "2" 
                4'b0011: ledOut = 7'b0000110; // "3" 
                4'b0100: ledOut = 7'b1001100; // "4" 
                4'b0101: ledOut = 7'b0100100; // "5" 
                4'b0110: ledOut = 7'b0100000; // "6" 
                4'b0111: ledOut = 7'b0001111; // "7" 
                4'b1000: ledOut = 7'b0000000; // "8"     
                4'b1001: ledOut = 7'b0000100; // "9" 
                default: ledOut = 7'b0000001; // "0"
            endcase
        end
    
//    input   input0, input1, input2, input3;
//    output  output0, output1, output2, output3, output4, output5, output6;
    
//    assign output0 = input3 | (~input1 & input2) | (~input0 & input1) | (input1 & ~input2);
    
//    assign output1 = (~input0 & ~input1 & ~input2) | (~input1 & input2 & ~input3) | (~input0 & input1 & input2) | (input0 & ~input2 & input3) | (input0 & input1 & input3);
    
//    assign output2 = (~input0 & ~input2) | (~input1 & ~input2 & input3) | (~input3 & input1) | (input1 & input2) | (input0 & input2 & ~input3);
    
//    assign output3 = (~input0 & ~input1 & ~input3) | (~input0 & ~input2) | (~input1 & ~input2) | (input0 & ~input1 & input3) | (input0 & input1 & ~input3);
    
//    assign output4 = (~input1 | ~input2) | (~input2 & input3) | (input2 & ~input3) | (input0 & ~input1) | (input0 & ~input2);
    
//    assign output5 = (~input0 & ~input2) | (~input1 & input3) | (~input0 & input1) | (input1 & ~input2) | (input0 & ~input1 & input2);
    
//    assign output6 = (~input0 & ~input2) | (input2 & input3) | (~input0 & input1) | (input1 & input3);

endmodule
