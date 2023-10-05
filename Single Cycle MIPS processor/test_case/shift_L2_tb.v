`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2023 09:51:12 PM
// Design Name: 
// Module Name: shift_L2_tb
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


module shift_L2_tb #(parameter width = 32)(
    
    );
    
    wire [width-1 : 0 ] out ;
    reg [width-1 : 0 ] in ;
    
    shift_L2 UUT (
    .in(in), 
    .out(out)
    );
   
   
   initial 
    begin 
    in = 'h03 ; 
    
    #10
     in = 'h01 ;
    
    
    #10
      in = 'h07 ; 
    end
endmodule
