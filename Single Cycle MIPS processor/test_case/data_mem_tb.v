`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2023 02:39:21 AM
// Design Name: 
// Module Name: data_mem_tb
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


module data_mem_tb (
    );
    
    localparam width = 32 , depth = 256 ;
    
    reg clk , WE ;
    reg [width-1 :0] A , WD ;
    wire [width-1 :0] RDO ;
    wire [15:0] test_valueO ;
    
    data_mem #(.width(width) , .depth(depth)) UUT (
    .A(A),
    .RD(RDO),
    .test_value(test_valueO),
    .clk(clk),
    .WD(WD),
    .WE(WE)
   );
   
       // Generating a clk signal
     localparam T = 10;
     always
     begin
         clk = 1'b0;
         #(T / 2);
         clk = 1'b1;
         #(T / 2);
     end 
     
      integer i ;
     initial 
      begin 
      WE=1'b1;
      A=32'b0;
      WD=32'd1;
      
      for (i =0 ;i<35 ;i=i+1 )
        begin
        #T
        A= A + 1;
        WD=WD+1;
      end
      
      #20 
            WE=1'b0;
            A=32'b0;
       #T
            A=32'b1;
        #T
            A=32'd3;     
    end
endmodule
