`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:45:30 01/22/2021
// Design Name:   Mux2
// Module Name:   C:/Xilinx/Proyectos/RISCV/Mux2Generico_tb.v
// Project Name:  RISCV
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

//*Objetivo de la prueba*//
// Se realiza un test del bloque Mux 2 entradas utilizado a lo largo del circuito para verificar que seleccione
// correctamente el dato deseado 
//
//*Estímulos*//
// La SEL cambia a los 2 estados del mux 
// La entrada Dato1 se asigna ABCDEF20 para verificar que la salida sea la correcta
// La entrada Dato2 se asigna ABCDEF17 para verificar que la salida sea la correcta
//	
//
//*Resultados esperados*//
// Se espera recibir 8'hABCDEF20 en el caso 1
// Se espera recibir 8'hABCDEF17 en el caso 2


module Mux2Generico_tb;

	// Inputs
	reg SEL;
	reg [31:0] Dato1;
	reg [31:0] Dato2;

	// Outputs
	wire [31:0] Out_Mux;

	// Instantiate the Unit Under Test (UUT)
	Mux2 uut (
		.SEL(SEL), 
		.Dato1(Dato1), 
		.Dato2(Dato2), 
		.Out_Mux(Out_Mux)
	);

	initial begin
		// Initialize Inputs
		SEL = 0;
		Dato1 = 0;
		Dato2 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		SEL = 1'b0;
		Dato1 = 32'hABCDEF20;
		
		#100;
		SEL = 1'b1;
		Dato2 = 32'hABCDEF17;
		
		
		#100;

	end
      
endmodule
