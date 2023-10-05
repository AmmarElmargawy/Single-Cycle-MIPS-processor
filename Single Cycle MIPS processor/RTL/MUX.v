`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2023 02:32:08 AM
// Design Name: 
// Module Name: MUX
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


module MUX #(parameter nbits = 32)(
       input [nbits-1 :0] in1 , in2 ,
       output [nbits - 1 : 0 ] res ,
       input sel 
    );
    
    assign res = (sel)? in2 : in1 ;
    
endmodule
