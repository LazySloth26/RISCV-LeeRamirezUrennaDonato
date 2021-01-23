`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:44:03 01/22/2021
// Design Name:   mux4_gen
// Module Name:   C:/Xilinx/Proyectos/RISCV/Mux4Generico_tb.v
// Project Name:  RISCV
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux4_gen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////


//*Objetivo de la prueba*//
// Se realiza un test del bloque Mux 4 entradas Genérico para verificar que seleccione
// correctamente el dato deseado, este Mux se utiliza para seleccionar el dato que va
// hacia Write Data del register file
//
//*Estímulos*//
// La SEL cambia a los 4 estados del mux 
// La entrada Dato se asigna ABCDEF17 para verificar que la salida sea la correcta
// La entrada Dato3 se asigna 10'b 1111111111
//	
//
//*Resultados esperados*//
// Se espera recibir 32'h ABCDEF17 en el caso 1
// Se espera recibir 32'h ABCDEF17 en el caso 2
// Se espera recibir 10'b 1111111111 en el caso 3
// Se espera recibir 32'h 00 en el caso 4



module Mux4Generico_tb;

	// Inputs
	reg [1:0] SEL;
	reg [31:0] Dato1;
	reg [31:0] Dato2;
	reg [9:0] Dato3;
	reg [31:0] Dato4;

	// Outputs
	wire [31:0] Out_Mux;

	// Instantiate the Unit Under Test (UUT)
	mux4_gen uut (
		.SEL(SEL), 
		.Dato1(Dato1), 
		.Dato2(Dato2), 
		.Dato3(Dato3), 
		.Dato4(Dato4), 
		.Out_Mux(Out_Mux)
	);

	initial begin
		// Initialize Inputs
		SEL = 0;
		Dato1 = 0;
		Dato2 = 0;
		Dato3 = 0;
		Dato4 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		SEL = 2'b00;
		Dato1 = 32'hABCDEF17;
		
		#100;
		SEL = 2'b01;
		Dato2 = 32'hABCDEF17;
		
		#100;
		SEL = 2'b10;
		Dato3 = 10'b1111111111;
		
		#100;
		SEL = 2'b11;
		Dato4 = 32'h00;

	end
      
endmodule
