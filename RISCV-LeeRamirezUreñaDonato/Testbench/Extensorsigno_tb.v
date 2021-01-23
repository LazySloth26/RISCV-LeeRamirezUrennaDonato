`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:49:11 01/22/2021
// Design Name:   sign_ext2
// Module Name:   C:/Xilinx/Proyectos/RISCV/Extensorsigno_tb.v
// Project Name:  RISCV
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sign_ext2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

//*Objetivo de la prueba*//
// Se realiza un test del bloque Extensor de signo para verificar que extiende correctamente
// el signo necesario es decir extiende con 0 o con 1
//
//*Estímulos*//
// La entrada signo inicia con 1 100ns después cambia a 0
// La entrada unextend se prubea con valores aleatorios de 7 bits para verificar que extienda 
//  correctamente el bit necesario 
//	
//
//*Resultados esperados*//
// Se espera recibir el mismo dato de unextend pero con los 20 bits extendidos con 0 o con 1 según sea el caso


module Extensorsigno_tb;

	// Inputs
	reg [7:0] unextend;
	reg signo;

	// Outputs
	wire [31:0] extended;

	// Instantiate the Unit Under Test (UUT)
	sign_ext2 uut (
		.unextend(unextend), 
		.extended(extended), 
		.signo(signo)
	);

	initial begin
		// Initialize Inputs
		unextend = 0;
		signo = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		unextend = 8'b01001100;
		signo = 1'b1; // bit de signo en 1
		
		#100;
		unextend = 8'b11001100;
		signo = 1'b0; // bit de signo en 0
		#100;
		$finish;

	end
      
endmodule
