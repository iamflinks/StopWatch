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


module dispControl(  input0,
                     input1,
                     input2,
                     input3,
                     output0,
                     output1,
                     output2,
                     output3,
                     output4,
                     output5,
                     output6,
                     );

    input   input0, input1, input2, input3;
    output  output0, output1, output2, output3, output4, output5, output6;
    
    assign output0 = input3 | (~input1 & input2) | (~input0 & input1) | (input1 & ~input2);
    
    assign output1 = (~input0 & ~input1 & ~input2) | (~input1 & input2 & ~input3) | (~input0 & input1 & input2) | (input0 & ~input2 & input3) | (input0 & input1 & input3);
    
    assign output2 = (~input0 & ~input2) | (~input1 & ~input2 & input3) | (~input3 & input1) | (input1 & input2) | (input0 & input2 & ~input3);
    
    assign output3 = (~input0 & ~input1 & ~input3) | (~input0 & ~input2) | (~input1 & ~input2) | (input0 & ~input1 & input3) | (input0 & input1 & ~input3);
    
    assign output4 = (~input1 | ~input2) | (~input2 & input3) | (input2 & ~input3) | (input0 & ~input1) | (input0 & ~input2);
    
    assign output5 = (~input0 & ~input2) | (~input1 & input3) | (~input0 & input1) | (input1 & ~input2) | (input0 & ~input1 & input2);
    
    assign output6 = (~input0 & ~input2) | (input2 & input3) | (~input0 & input1) | (input1 & input3);

endmodule
