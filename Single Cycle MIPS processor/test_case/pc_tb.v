`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2023 04:09:51 PM
// Design Name: 
// Module Name: pc_tb
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


module pc_tb(
     
    );  
    localparam n_bit=8;
    reg clk ;
    reg reset_n;
    reg [n_bit-1:0] pc_bar;
    wire [n_bit-1 : 0] pc;
    PC #(.n_bit(n_bit)) UUT (
      .clk(clk),
      .reset_n(reset_n),
      .pc(pc),
      .pc_bar(pc_bar)
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
    
    initial begin
      reset_n=0;
      #7
      reset_n=1;
      pc_bar='b00011100;
      #50
      reset_n=0;
      #17
      reset_n=1;
      pc_bar='b00101010;
      #17
      pc_bar = pc_bar+2;
    end

endmodule
