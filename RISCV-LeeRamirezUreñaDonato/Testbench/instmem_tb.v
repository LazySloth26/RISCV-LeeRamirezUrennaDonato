`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:04:45 01/18/2021
// Design Name:   Inst_mem
// Module Name:   C:/Xilinx/Proyectos/RISCV/instmem_tb.v
// Project Name:  RISCV
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Inst_mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*Objetivo de la prueba:-------------
Se verifica que la memoria de instrucciones varie el contenido de
su salida dependiendo de la dirección que se le ingrese desde el PC.
Estímulos:---------------------------
Se le suma de 4 en 4 a la dirección de memoria cada 50 ns.
Resultados esperados:----------------
Al variar la direccion de memoria se espera que por cada multiplo
de 4 el contenido de su salida varie de forma ordenada con respecto al
contenido en el archivo .txt que utiliza la memoria.
*/

module instmem_tb;

	// Inputs
	reg [9:0] address;

	// Outputs
	wire [31:0] inst_f;

	// Instantiate the Unit Under Test (UUT)
	Inst_mem uut ( 
		.address(address), 
		.inst_f(inst_f)
	);

	initial begin
		// Initialize Inputs
		address = 0;  // Inicializa el valor en la dirección 0

		// Wait 100 ns for global reset to finish
		#100;
		       
		// Add stimulus here
		#50 address = address + 4'd4;  // Suma 4 al address
		#50 address = address + 4'd4;
		#50 address = address + 4'd4;
		#50 address = address + 4'd4;
		#50 address = address + 4'd4;
		#50 address = address + 4'd4;
		#50 address = address + 4'd4;
		#50 address = address + 4'd4;
		#50 address = address + 4'd4;
		#50 address = address + 4'd4;
		#50 address = address + 4'd4;
		#50 address = address + 4'd4;
		#50 address = address + 4'd4;
		#50 address = address + 4'd4;
		#50 address = address + 4'd4;
		#50 address = address + 4'd4;
		#50 address = address + 4'd4;

	end
	
      
endmodule

