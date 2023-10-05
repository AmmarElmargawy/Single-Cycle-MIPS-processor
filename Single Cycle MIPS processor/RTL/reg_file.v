`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2023 02:32:12 AM
// Design Name: 
// Module Name: reg_file
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


module reg_file(
   input [4:0] A1 , A2 , A3 ,
   input [31:0] WD3 ,
   input WE3 , clk ,
   output [31:0] RD1 , RD2 
    );
    
    reg [31:0] in [31:0] ;
    
    integer i;
    initial begin
      for ( i=0 ;i<32 ;i=i+1 ) begin
        in[i] = 32'b0 ;
      end
    end
    
    assign RD1 = in[A1] ;
    assign RD2 = in[A2] ;
    
    always @( posedge clk )
      if(WE3) in[A3] = WD3 ; 
      
endmodule
