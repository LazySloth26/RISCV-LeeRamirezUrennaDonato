`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:42:27 01/22/2021
// Design Name:   Mux4
// Module Name:   C:/Xilinx/Proyectos/RISCV/Mux4Load_tb.v
// Project Name:  RISCV
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

//*Objetivo de la prueba*//
// Se realiza un test del bloque Mux 4 entradas del Load para verificar que seleccione
// correctamente el dato deseado 
//
//*Estímulos*//
// La SEL cambia a los 4 estados del mux 
// La entrada Dato se asigna ABCDEF17 para verificar que la salida sea la correcta
//	
//
//*Resultados esperados*//
// Se espera recibir 8'h17 en el caso 1
// Se espera recibir 8'hEF en el caso 2
// Se espera recibir 8'hCD en el caso 3
// Se espera recibir 8'hAB en el caso 4


module Mux4Load_tb;

	// Inputs
	reg [1:0] SEL;
	reg [31:0] Dato;

	// Outputs
	wire [7:0] Out_Mux;

	// Instantiate the Unit Under Test (UUT)
	Mux4 uut (
		.SEL(SEL), 
		.Dato(Dato), 
		.Out_Mux(Out_Mux)
	);

	initial begin
		// Initialize Inputs
		SEL = 0;
		Dato = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		SEL = 2'b00;
		Dato = 32'hABCDEF17;
		
		#100;
		SEL = 2'b01;
		Dato = 32'hABCDEF17;
		
		#100;
		SEL = 2'b10;
		Dato = 32'hABCDEF17;
		
		#100;
		SEL = 2'b11;
		Dato = 32'hABCDEF17;
		
		#100;

	end
      
endmodule
