`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:50:09 01/22/2021
// Design Name:   ALU
// Module Name:   C:/Xilinx/Proyectos/RISCV/ALU_tb.v
// Project Name:  RISCV
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

//*Objetivo de la prueba*//
// Se realiza un test del bloque ALU para verificar si los selectores de operaciones
// funcionan correctamente y realiza las operaciones indicadas, esta ser� probada con
// la segunda instrucci�n del c�digo pm_ev_1_basic_ops con la instrucci�n 
// sw s0, 44(sp)
//
//*Est�mulos*//
// A la entrada A se le asigna un valor de -48 y a la entrada B se le asigna un valor de 44
//  en la selecci�n de la operaci�n se selecciona la suma ALU_Sel = 5'b00000, tambien se varia
//	 el selector de alu para probar todas las funciones de la ALU variando el selectroe casa 100ns
//	
//
//*Resultados esperados*//
// Se espera recibir un -4 a la salida de la primera prueba, en la segunda se espera recibir un -92
//  y as� con cada prueba 




module ALU_tb;

	// Inputs
	reg [31:0] A, B;
	reg [4:0] ALU_Sel;

	// Outputs
	wire [31:0] ALU_Out;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A(A), 
		.B(B), 
		.ALU_Sel(ALU_Sel), 
		.ALU_Out(ALU_Out), 
		.Zero(Zero)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		ALU_Sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		
		A = 32'hffffffd0;
      B = 32'h0000002c;
		ALU_Sel = 5'b00000; // suma
		
		#100;
		A = 32'hffffffd0;
      B = 32'h0000002c;
		ALU_Sel = 5'b00010; // resta
		
		#100;
		A = 32'hffffffd0;
      B = 32'h0000002c;
		ALU_Sel = 5'b11100; // or
		
		#100;
		A = 32'hffffffd0;
      B = 32'h0000002c;
		ALU_Sel = 5'b10000; // XOR
		
		#100;
		A = 32'hffffffd0;
      B = 32'h0000002c;
		ALU_Sel = 5'b00100; // LSL
		
		#100;
		A = 32'hffffffd0;
      B = 32'h0000002c;
		ALU_Sel = 5'b10100; // LSR
		
		#100;
		A = 32'hffffffd0;
      B = 32'h0000002c;
		ALU_Sel = 5'b10110; // ASR

	end
      
endmodule
