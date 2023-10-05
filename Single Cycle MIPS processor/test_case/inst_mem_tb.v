`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2023 03:14:58 AM
// Design Name: 
// Module Name: inst_mem_tb
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


module inst_mem_tb(
    
    );
        localparam width = 32 ;
        reg [width-1 : 0] A ;
        wire [width-1 : 0] RD ;
        
        inst_mem #( .width(32) , .depth(256)) UUT (
            .A(A) ,
            .RD(RD)
            ); 
            
            initial 
              begin 
                A = 32'd1 ;
                #50
                A = 32'd3 ;
              end  
endmodule
