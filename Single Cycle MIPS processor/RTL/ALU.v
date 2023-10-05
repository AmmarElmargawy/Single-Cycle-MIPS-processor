`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2023 09:40:15 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
 input [31:0] scrA ,
 input [31:0] scrB ,
 input [2:0] ALU_control ,
 output [31:0] ALU_result ,
 output zero_F 
    );
    
    reg [31:0] result ;
    
    always @(*) 
      begin 
        casex(ALU_control)
          3'b000: result = scrA & scrB ; 
          3'b001: result = scrA | scrB ; 
          3'b010: result = scrA + scrB ; 
          3'b100: result = scrA - scrB ; 
          3'b101: result = scrA * scrB ; 
          3'b110: result = (scrA < scrB)? 1 : 0 ; 
          default  : result = 'bXX ;
        endcase   
      end
      
    assign  ALU_result = result ;
    assign zero_F = (result == 0) ? 1 : 0 ;
endmodule
