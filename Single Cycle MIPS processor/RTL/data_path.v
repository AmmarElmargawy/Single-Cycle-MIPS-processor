`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2023 10:30:13 PM
// Design Name: 
// Module Name: data_path
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


module data_path #( parameter n_bits = 32)(
     input clk , reset_n ,
     input [n_bits-1 : 0] read_data , instr ,  
     input MemtoReg  , PCsrc  , ALUsrc , RegDst , RegWrite , JMP , 
     input [2:0] ALUcontrol , 
     output zero ,
     output [n_bits-1 : 0] pc , ALUout , write_data 
    ); 
      
      wire [n_bits-1 : 0] PCplus4 , PCBranch , mux1_res ;
      wire [n_bits-1 : 0]  PCbar , Shift_2 ;
      wire [27:0] Shift_mux ;
      wire [n_bits-1 : 0] PCJump = {PCplus4[31:28],Shift_mux}  ;
      wire [n_bits-1 : 0] PCres , Result , SrcA ;
      wire [4:0] writeReg ;
      wire [n_bits-1 : 0] signimm_res , SrcB ;
      
      
      MUX #(.nbits(32)) pcsrc2mux (
      .in1(PCplus4),
      .in2(PCBranch),
      .res(mux1_res),
      .sel(PCsrc)
      ); 
      
       MUX #(.nbits(32)) jmp2mux (
       .in1(mux1_res),
       .in2(PCJump),
       .res(PCbar),
       .sel(JMP)
       );
       
       PC #(.n_bit(n_bits)) B1 (
       .clk(clk) ,
       .reset_n(reset_n),
       .pc(PCres),
       .pc_bar(PCbar)
       );
       
       reg_file B2(
       .A1(instr[25:21]),
       .A2(instr[20:16]),
       .A3(writeReg),
       .WD3(Result),
       .RD1(SrcA),
       .RD2(write_data),
       .WE3(RegWrite),
       .clk(clk)
       );
        
        sign_extend B3(
        .instr(instr[15:0]),
        .signimm(signimm_res)
        );
        
        shift_L2 #( .in_bit(26), .out_bit(28) ) SHb (
        .in(instr[25:0]),
        .out(Shift_mux)
        );
        
        MUX #(.nbits(5)) write2mux (
               .in1(instr[20:16]),
               .in2(instr[15:11]),
               .res(writeReg),
               .sel(RegDst)
        ); 
        
        MUX #(.nbits(32)) ScrB2mux (
                       .in1(write_data),
                       .in2(signimm_res),
                       .res(SrcB),
                       .sel(ALUsrc)
                ); 
         
         shift_L2 #(.in_bit(32) , .out_bit(32)) SHb2 (
                        .in(signimm_res),
                        .out(Shift_2)
                        );
                        
        ALU B4(
        .scrA(SrcA),
        .scrB(SrcB),
        .ALU_control(ALUcontrol),
        .ALU_result(ALUout),
        .zero_F(zero)
        );        
                
         Adder #( .width(32) ) B5(
         .in1(Shift_2),
         .in2(PCplus4),
         .res(PCBranch)
         );     
         
          Adder #( .width(32) ) B6(
                 .in1(PCres),
                 .in2(32'd4), 
                 .res(PCplus4)
                 );  
                 
          MUX #(.nbits(32)) res2mux (
                              .in1(ALUout),
                              .in2(read_data),
                              .res(Result),
                              .sel(MemtoReg)
                                 );        
                 
        assign  pc = PCres ; 
        
endmodule
