`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:00:39 01/07/2021 
// Design Name: 
// Module Name:    ALU_Control 
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
module ALU_Control(
	input [3:0] aluop_d, // Opcode resumido
	input funct7_5, // Funct7[5]
	input [2:0] funct3,
	output wire [4:0] alucontrol
	);
	 
	reg [4:0] Y;  // Se crea un registro para guardar el valor de la salida de alucontrol
	assign alucontrol = Y;  // El registro creado se le asigna el valor de alucontrol
	wire [7:0] entradas;  // Se crea nueva variable para concatenar las 3 entradas
	assign entradas[2:0] = funct3;  // Se asignan que bits corresponden a cual entrada
	assign entradas[3] = funct7_5;
	assign entradas[7:4] = aluop_d; 	
	
	always @(entradas)
		begin
			case(entradas)  // Se asigna la salida a cada posible combinación de las entradas 
				8'b00000010: Y <= 5'b00000; // lw con Funct7[5] = 0 
				8'b00001010: Y <= 5'b00000; // lw con Funct7[5] = 1
				8'b00000100: Y <= 5'b00000; // lbu con Funct7[5] = 0
				8'b00001100: Y <= 5'b00000; // lbu con Funct7[5] = 1
				8'b00100000: Y <= 5'b00000; // addi, li y nop con Funct7[5] = 0 
				8'b00101000: Y <= 5'b00000; // addi, li y nop con Funct7[5] = 1 
				8'b00100001: Y <= 5'b00100; // slli 
				8'b00100100: Y <= 5'b10000; // xori con Funct7[5] = 0
				8'b00101100: Y <= 5'b10000; // xori con Funct7[5] = 1
				8'b00100101: Y <= 5'b10100; // srli 
				8'b00101101: Y <= 5'b10110; // srai 
				8'b00100111: Y <= 5'b11100; // andi con Funct7[5] = 0
				8'b00101111: Y <= 5'b11100; // andi con Funct7[5] = 1
				8'b01000000: Y <= 5'b00000; // sb con Funct7[5] = 0
				8'b01001000: Y <= 5'b00000; // sb con Funct7[5] = 1
				8'b01000010: Y <= 5'b00000; // sw con Funct7[5] = 0
				8'b01001010: Y <= 5'b00000; // sw con Funct7[5] = 1
				8'b01100000: Y <= 5'b00000; // add
				8'b01101000: Y <= 5'b00010; // sub
				8'b11000001: Y <= 5'b10000; // bne con Funct7[5] = 0
				8'b11001001: Y <= 5'b10000; // bne con Funct7[5] = 1
				8'b11010000: Y <= 5'b00000; // jal con Funct7[5] = 0 JAL y LUI se definen únicamente con ALUOp
				8'b11010001: Y <= 5'b00000; // jal con Funct7[5] = 0
				8'b11010010: Y <= 5'b00000; // jal con Funct7[5] = 0
				8'b11010011: Y <= 5'b00000; // jal con Funct7[5] = 0
				8'b11010100: Y <= 5'b00000; // jal con Funct7[5] = 0
				8'b11010101: Y <= 5'b00000; // jal con Funct7[5] = 0
				8'b11010110: Y <= 5'b00000; // jal con Funct7[5] = 0
				8'b11010111: Y <= 5'b00000; // jal con Funct7[5] = 0
				8'b11011000: Y <= 5'b00000; // jal con Funct7[5] = 1
				8'b11011001: Y <= 5'b00000; // jal con Funct7[5] = 1
				8'b11011010: Y <= 5'b00000; // jal con Funct7[5] = 1
				8'b11011011: Y <= 5'b00000; // jal con Funct7[5] = 1
				8'b11011100: Y <= 5'b00000; // jal con Funct7[5] = 1
				8'b11011101: Y <= 5'b00000; // jal con Funct7[5] = 1
				8'b11011110: Y <= 5'b00000; // jal con Funct7[5] = 1
				8'b11011111: Y <= 5'b00000; // jal con Funct7[5] = 1
				8'b01110000: Y <= 5'b11111; // lui con Funct7[5] = 0
				8'b01110001: Y <= 5'b11111; // lui con Funct7[5] = 0
				8'b01110010: Y <= 5'b11111; // lui con Funct7[5] = 0
				8'b01110011: Y <= 5'b11111; // lui con Funct7[5] = 0
				8'b01110100: Y <= 5'b11111; // lui con Funct7[5] = 0
				8'b01110101: Y <= 5'b11111; // lui con Funct7[5] = 0
				8'b01110110: Y <= 5'b11111; // lui con Funct7[5] = 0
				8'b01110111: Y <= 5'b11111; // lui con Funct7[5] = 0
				8'b01111000: Y <= 5'b11111; // lui con Funct7[5] = 1
				8'b01111001: Y <= 5'b11111; // lui con Funct7[5] = 1
				8'b01111010: Y <= 5'b11111; // lui con Funct7[5] = 1
				8'b01111011: Y <= 5'b11111; // lui con Funct7[5] = 1
				8'b01111100: Y <= 5'b11111; // lui con Funct7[5] = 1
				8'b01111101: Y <= 5'b11111; // lui con Funct7[5] = 1
				8'b01111110: Y <= 5'b11111; // lui con Funct7[5] = 1
				8'b01111111: Y <= 5'b11111; // lui con Funct7[5] = 1
				default: Y <= 5'b00000;				
			endcase
		end
endmodule
		