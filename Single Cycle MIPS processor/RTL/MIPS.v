`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2023 10:02:54 PM
// Design Name: 
// Module Name: MIPS
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


module MIPS(
    input clk , reset_n ,
    output [15:0] test_valueO 
    ); 
    
    wire  MemtoRegO , PCsrcO , ALUsrcO , MemWriteO;
    wire RegDstO , RegWriteO , JMPO , BranchO , zeroO ;
    wire [2:0]  ALUcontrolO;
    wire [31:0] read_dataO , ALUoutO , pcO , instrO , write_dataO  ;
    
    data_path #(.n_bits(32)) DPb (
          .clk(clk) , 
          .reset_n(reset_n) ,
          .read_data(read_dataO) , 
          .instr(instrO) ,  
          .MemtoReg(MemtoRegO)  , 
          .PCsrc(PCsrcO)  , 
          .ALUsrc(ALUsrcO) , 
          .RegDst(RegDstO) , 
          .RegWrite(RegWriteO) , 
          .JMP(JMPO) , 
          .ALUcontrol(ALUcontrolO) , 
          .zero(zeroO) ,
          .pc(pcO) ,
          .ALUout(ALUoutO) , 
          .write_data(write_dataO) 
    );
    
    
    control_unit  CUb(
         .funct(instrO[5:0]) ,
         .opcode(instrO[31:26]) ,
         .MemtoReg(MemtoRegO) ,
         .MemWrite(MemWriteO) , 
         .Branch(BranchO) , 
         .ALUsrc(ALUsrcO) , 
         .RegDst(RegDstO) , 
         .RegWrite(RegWriteO) , 
         .ALUcontrol(ALUcontrolO) ,
         .jmp(JMPO) 
        ); 
        
        assign PCsrcO = BranchO & zeroO ; 
        
        data_mem #( .width(32) , .depth(256)) DMb (
              .A(ALUoutO) ,
              .WD(write_dataO)  , 
              .clk(clk) ,
              .WE(MemWriteO) , 
              .RD(read_dataO) ,
              .test_value(test_valueO)  
            );
            
            inst_mem #(.width(32) , .depth(256)) IMb(
                 .A(pcO[9:2]) ,
                .RD(instrO)
                ); 
endmodule
