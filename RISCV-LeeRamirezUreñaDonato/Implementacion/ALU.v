`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:59:00 12/07/2020 
// Design Name: 
// Module Name:    ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(
	input [31:0] A,B,  // ALU 32-bit Inputs                 
   input [4:0] ALU_Sel,// ALU Selection
   output [31:0] ALU_Out, // ALU 32-bit Output
   output reg zero_flag // Zero Flag
    );
    reg [31:0] ALU_Result;
    assign ALU_Out = ALU_Result; // ALU out
	 
	 always @(*)
    begin
        case(ALU_Sel)
        5'b00000: // Suma
           ALU_Result = A + B ; 
        5'b00010: // Resta
           ALU_Result = A - B ;
        5'b11100: // AND
           ALU_Result = A & B;
        5'b10000: // XOR
           ALU_Result = A ^ B;
        5'b00100: // logical shift left
           ALU_Result = A << B;
        5'b10100: // logical shift right
           ALU_Result = A >> B;
        5'b10110: // arithmetic shift right
           ALU_Result = A >>> B;
          default: ALU_Result = A + B; 
        endcase
		  
		  if (ALU_Result == 0) zero_flag <= 1'b1; // Detección de la bandera zero
		  else zero_flag <= 1'b0;

    end

endmodule
