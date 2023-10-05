`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2023 09:47:41 PM
// Design Name: 
// Module Name: shift_L2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module shift_L2 #(parameter in_bit = 32 , out_bit=32)(
  input [in_bit-1 : 0] in , 
  output [out_bit-1 : 0] out 
    );
    
    assign out = in << 2 ;
endmodule
