`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2023 02:33:36 PM
// Design Name: 
// Module Name: control_unit
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


module control_unit(
   input [5:0] funct ,
   input [5:0] opcode ,
   output reg MemtoReg , MemWrite , Branch , 
   output reg ALUsrc , RegDst , RegWrite , 
   output reg [2:0] ALUcontrol ,
   output reg jmp 
    );
    
    reg [1:0] ALUop ; 
    
    localparam add = 6'b100000 , sub = 6'b100010 ,
               slt = 6'b101010 , mul = 6'b011100 ;
    
     always@(opcode) 
        begin  
        // default values 
         jmp = 1'b0 ;
         ALUop = 2'b00 ;
         MemWrite = 1'b0 ;
         RegWrite = 1'b0 ;
         RegDst = 1'b0 ; 
         ALUsrc = 1'b0 ; 
         MemtoReg = 1'b0 ;
         Branch = 1'b0 ;
        
         case(opcode) 
            6'b100011 :
             begin 
             RegWrite = 1'b1 ;
             ALUsrc = 1'b1 ; 
             MemtoReg = 1'b1 ;
            end
            
            6'b101011 :
            begin 
               MemWrite = 1'b1 ;
                ALUsrc = 1'b1 ; 
               MemtoReg = 1'b1 ;
             end
             
        6'b000000 :
                begin 
                   ALUop = 2'b10 ;
                  RegWrite = 1'b1 ;
                   RegDst = 1'b1 ; 
                  end     
         
         6'b001000 :
              begin 
             RegWrite = 1'b1 ;
                ALUsrc = 1'b1 ; 
               end     
               
         6'b000100 :
            begin 
                  ALUop = 2'b01 ;
                  Branch = 1'b1 ;
            end 
            
          6'b000010 :
              begin 
                  jmp = 1'b1 ;
              end         
              
       default :
             begin 
                       jmp = 1'b0 ;
                    ALUop = 2'b00 ;
                  MemWrite = 1'b0 ;
                  RegWrite = 1'b0 ;
                    RegDst = 1'b0 ; 
                    ALUsrc = 1'b0 ; 
                  MemtoReg = 1'b0 ;
                    Branch = 1'b0 ;
             end                     
         endcase
        end
        
        always@(funct or ALUop )
           begin 
            case(ALUop) 
            
              2'b00 : ALUcontrol = 3'b010 ;
              2'b01 : ALUcontrol = 3'b100 ;
               2'b10 : 
               begin 
                 if ( funct == add )  
                   ALUcontrol = 3'b010 ;
      
                 if ( funct == sub )  
                 ALUcontrol = 3'b100 ; 
               
               if ( funct == slt )  
                  ALUcontrol = 3'b110 ;
                  
              if ( funct == mul )  
                   ALUcontrol = 3'b101 ;    
               end 
              default : ALUcontrol = 3'b010 ;
             endcase
           end 
endmodule
