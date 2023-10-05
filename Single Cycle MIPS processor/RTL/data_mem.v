`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2023 01:25:50 AM
// Design Name: 
// Module Name: data_mem
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


module data_mem #(parameter width = 32 , depth = 256  )(
     input [width-1 : 0] A ,
     input [width-1 : 0] WD  , 
     input clk , WE , 
     output  [width-1 : 0]  RD ,
     output  [15:0] test_value 
    );
         
     reg [0 : width-1 ] RAM [ 0 : depth-1 ] ;
     
     integer i ;
     initial 
      begin 
        for (i = 0 ; i < depth ; i = i+1 ) 
            RAM[i] <= 32'b0 ;
      end  
      
      always@(posedge clk) 
       begin 
         if(WE)
             RAM[A] <= WD ;
         else 
           RAM[A] <= RAM[A] ;    
       end
       
     
       assign RD = RAM[A] ;
       assign test_value = RAM[0] ; 
endmodule
