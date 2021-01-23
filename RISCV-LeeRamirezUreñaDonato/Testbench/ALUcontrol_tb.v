`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:02:05 01/08/2021
// Design Name:   ALU_Control
// Module Name:   C:/Xilinx/Proyectos/RISCV/ALUcontrol_tb.v
// Project Name:  RISCV
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_Control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////**Objetivo de la prueba**//
// Se realiza un test del bloque ALU Control para saber si la salida alucontrol que va a la ALU es correcta.
//**Estímulos**//
// A las entradas se les da primero el valor de: aluop_d = 4'b0111, funct7_5 = 1 y funct3 = 3'b000; corresponden
// a la instrucción LUI. Luego de 50ns se reinician los valores y entran: aluop_d = 4'b1100, funct7_5 = 1 y 
// funct3 = 3'b001; los cuales corresponden a BNE.
//**Resultados esperados**//
// Con la concatenación de las entradas escogidas, para la primera prueba se espera un valor de alucontrol = 11111
// y para la segunda se espera un valor de alucontrol = 10000
// Ambas pruebas fueron exitosas por lo que el funcionamiento del bloque ALU Control es correcto. 

module ALUControl_testbench;

	// Inputs
	reg [3:0] aluop_d;
	reg funct7_5;
	reg [2:0] funct3;

	// Outputs
	wire [4:0] alucontrol;

	// Instantiate the Unit Under Test (UUT)
	ALU_Control uut (
		.aluop_d(aluop_d), 
		.funct7_5(funct7_5), 
		.funct3(funct3), 
		.alucontrol(alucontrol)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		aluop_d = 0;
		funct7_5 = 0;
		funct3 = 0;

		// Wait 100 ns for global reset to finish
		#110;
		aluop_d = 4'b0111; // LUI
		funct7_5 = 1;
		funct3 = 3'b000;
		#100; // Espera 50ns y para el siguiente grupo de entradas
		aluop_d = 4'b1100; // BNE
		funct7_5 = 1;
		funct3 = 3'b001;
		
		// Add stimulus here

	end
	
   always #10 clk = ~clk;
	
endmodule
