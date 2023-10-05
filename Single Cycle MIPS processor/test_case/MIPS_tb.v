`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2023 09:26:50 PM
// Design Name: 
// Module Name: MIPS_tb
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


module MIPS_tb(
    
    ); 
    
    reg clk , reset_n ;
    wire [15:0] test_value ; 
     
     
    MIPS UUT (
         .clk(clk) , 
         .reset_n(reset_n) ,
         .test_valueO(test_value) 
        ); 
    
      // clock gen 
    /*        localparam T = 10;
     always
     begin
         clk = 1'b0;
         #(T / 2);
         clk = 1'b1;
         #(T / 2);
     end
     
     initial 
        begin 
      reset_n = 0 ;
      #10 
      reset_n = 1 ;
      end  */
      
      always #10 clk=!clk;
          initial
          begin
          clk=1;
          reset_n=0;
          #20
          reset_n=1;
          #900
          $stop;
          
          end
endmodule
