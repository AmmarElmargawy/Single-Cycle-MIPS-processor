`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2023 02:49:59 AM
// Design Name: 
// Module Name: data_path_tb
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


module data_path_tb (
    ); 
        localparam n_bits = 32 ;
       reg clk , reset_n ;
       reg [n_bits-1 : 0] read_data , instr ;  
       reg MemtoReg  , PCsrc  , ALUsrc , RegDst , RegWrite , JMP ;
       reg [2:0] ALUcontrol ;
       wire zero ;
       wire [n_bits-1 : 0] pc , ALUout , write_data ;
       
       data_path #(.n_bits(n_bits)) UUT (
            .clk(clk) , 
            .reset_n(reset_n) ,
           .read_data(read_data) , 
           .instr(instr) ,  
            .MemtoReg(MemtoReg)  , 
            .PCsrc(PCsrc)  , 
            .ALUsrc(ALUsrc) , 
            .RegDst(RegDst) , 
            .RegWrite(RegWrite) , 
            .JMP(JMP) , 
           .ALUcontrol(ALUcontrol) , 
            .zero(zero) ,
            .pc(pc) , 
           .ALUout(ALUout) , 
           .write_data(write_data) 
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
           
           initial 
            begin 
             
                reset_n =0 ;
                read_data = 32'b0 ;
                instr = 32'b0;  
                MemtoReg = 0 ;
                PCsrc = 0 ;
                ALUsrc =0 ;
                RegDst = 0 ;
               RegWrite  = 0;
               JMP = 0 ;
              ALUcontrol = 3'b0 ;
            
            #T 
            
             reset_n = 1 ; 
             read_data = 32'd30 ;
             instr = 32'h00008020 ;
              ALUcontrol = 3'd2 ;
              
              
              #T
              instr = 32'h20100007 ; 
            end
endmodule
