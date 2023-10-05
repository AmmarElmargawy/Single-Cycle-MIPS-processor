`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2023 01:11:10 AM
// Design Name: 
// Module Name: control_unit_tb
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


module control_unit_tb(
  
    );  
        
       reg [5:0] opcodeO , functO ;
       wire MemtoRegO , MemWriteO , BranchO ; 
       wire ALUsrcO , RegDstO , RegWriteO ; 
       wire [2:0] ALUcontrolO ;
       wire jmpO  ; 
       
       control_unit UUT (
          .funct(functO) ,
          .opcode(opcodeO) ,
          .MemtoReg(MemtoRegO) ,
          .MemWrite(MemWriteO) , 
          .Branch(BranchO) , 
          .ALUsrc(ALUsrcO) , 
          .RegDst(RegDstO) , 
          .RegWrite(RegWriteO) , 
          .ALUcontrol(ALUcontrolO) ,
          .jmp(jmpO) );
          
          
          initial 
            begin
            opcodeO=6'b100011;
            functO=6'b100011;
            #10
            opcodeO=6'b101011;
            functO=6'b100111;
            #10
            opcodeO=6'b000000;
            functO=6'b100000;
            #10
            opcodeO=6'b000000;
            functO=6'b100010;
            #10
            opcodeO=6'b00_0000;
            functO=6'b10_1010 ;
            #10
            opcodeO=6'b000000;
            functO=6'b011100;
            #10
            opcodeO=6'b001000;
            functO=6'b100000;
            #10
            opcodeO=6'b00_0100;
            functO=6'b10_0000;
            #10
            opcodeO=6'b000010;
            functO=6'b100000;
            #10
            opcodeO=6'b011010;
            functO=6'b100000; 
            #10
                 opcodeO=6'b100000;
                  functO=6'b000000;
                  
              #10
                        opcodeO=6'b000111;
                        functO=6'b001000;     
            end
endmodule
