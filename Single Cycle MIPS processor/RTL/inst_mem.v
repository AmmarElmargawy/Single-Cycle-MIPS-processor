`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2023 06:47:46 PM
// Design Name: 
// Module Name: inst_mem
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


module inst_mem #(parameter width = 32 , depth = 256)(
    input [7 : 0] A ,
    output [width-1 : 0] RD
    ); 
    
    reg [0 : width-1 ] ROM [0 : depth-1 ] ; 
      // FIND GCD FOR 120 and 180 
       /*
      initial 
                       begin
                          ROM[0] = 32'h00008020;
                          ROM[1] = 32'h20100078; // change the least two significant decimals with the number
                          ROM[2] = 32'h00008820;
                          ROM[3] = 32'h201100B4; // change the least two significant decimals with the number.
                          ROM[4] = 32'h00009020;
                          ROM[5] = 32'h12110006;
                          ROM[6] = 32'h0211482A;
                          ROM[7] = 32'h11200002;
                          ROM[8] = 32'h02308822;
                          ROM[9] = 32'h08000005;
                          ROM[10] = 32'h02118022;
                          ROM[11] = 32'h08000005;
                          ROM[12] = 32'h00109020;
                          ROM[13] = 32'hAC120000;
                       end 
         */             
       // FIND FACTORIAL OF NUMBER 7 
       
        initial
          begin 
              
              ROM[0]  = 32'h00008020;    //add $s0, $0, $0
              ROM [1]  = 32'h20100007;    //addi $s0, $0, 7
              ROM [2]  = 32'h00008820;    //add $s1, $0, $0
              ROM [3]  = 32'h20110001;    //addi $s1, $0, 1
              ROM [4]  = 32'h12000003;    //beq $s1, $0, 3
              ROM [5]  = 32'h0230881C;    //mul $s1, $s1, $s0
              ROM [6]  = 32'h2210FFFF;    //addi $s0, $s0, -1
              ROM [7]  = 32'h08000004;    //J  4
              ROM [8]  = 32'hAC110000;    //sw $s1, 0($0)
           end  
                     
           
           assign  RD = ROM[A] ;  
           
endmodule
