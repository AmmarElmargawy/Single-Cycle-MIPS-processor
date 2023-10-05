`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2023 03:54:55 PM
// Design Name: 
// Module Name: PC
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


module PC #(parameter n_bit = 32)(
    
    input clk , reset_n ,
    input  [n_bit-1 : 0] pc_bar ,
    output  [n_bit-1 : 0]  pc 
    ); 
    
    reg [n_bit-1 : 0] pc_reg , pc_next ;
    
    // state logic 
    always @(posedge clk , negedge reset_n) 
       begin
       if ( ~reset_n )
             pc_reg <= 32'b0 ;
          else
             pc_reg <= pc_next ; 
       end
           
      // next state
      always @(*) 
         pc_next = pc_bar ; 
         
         
         // output logic 
         assign pc = pc_reg ; 
         
endmodule
