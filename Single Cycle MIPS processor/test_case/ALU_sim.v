`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2023 10:07:53 PM
// Design Name: 
// Module Name: ALU_sim
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


module ALU_sim(

    ); 
    
    reg [31:0] scrA ;
    reg [31:0] scrB ;
    reg [2:0] ALU_control ;
    wire [31:0] ALU_result ;
    wire zero_F ;
    
    ALU uut (
    .scrA(scrA),
    .scrB(scrB),
    .ALU_control(ALU_control),
    .ALU_result(ALU_result),
    .zero_F(zero_F)
    );
    
    initial #80 $finish; 
    
    initial 
     begin 
      scrA = 32'b110 ;
      scrB = 32'b001 ;
      ALU_control = 3'b000;
      
      #10 
           ALU_control = 3'b001;
       
      #10 
            scrA = 32'd500 ;
            scrB = 32'd300 ;
            ALU_control = 3'b010;   
            
       #10       
           ALU_control = 3'b100;   
           
       #10 
              scrA = 32'd10 ;
              scrB = 32'd10 ;
             ALU_control = 3'b101;     
             
       #10 
                    scrA = 32'd10 ;
                    scrB = 32'd00 ;
                   ALU_control = 3'b101;  
                   
                #10 
                          scrA = 32'd100 ;
                          scrB = 32'd200 ;
                         ALU_control = 3'b110;   
              #10 
                          ALU_control = 3'b111;            
     end 
endmodule
