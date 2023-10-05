`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2023 07:51:23 PM
// Design Name: 
// Module Name: sign_extend_tb
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


module sign_extend_tb(
    );
    reg [15:0] instr ;
    wire [31:0] signimm ;
    
     sign_extend UUT (
     .instr(instr), 
     .signimm(signimm)
     );
      
      initial 
        begin 
         instr = 16'b0101110111010101;
         
         #30 
         
         instr = 16'b1111111111111111;
         
        end 
endmodule
