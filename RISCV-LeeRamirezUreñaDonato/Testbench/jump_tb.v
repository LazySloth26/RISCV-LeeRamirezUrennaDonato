`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:39:41 01/22/2021
// Design Name:   Jump
// Module Name:   C:/Xilinx/Proyectos/RISCV/jump_tb.v
// Project Name:  RISCV
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Jump
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*Objetivo:-----------------
Verificar que la salida del bloque jump se tire en alto cuando el bne y las otras banderas de salto se tiren en alto.
Estímulo:-------------------
Todo en cero seguido de bne_uc y jumpctrl_uc en alto mientras que zero sigue en cero
y por ultimo solo se baja jumpctrl_uc
Resultados esperados:-------
si todo esta en cero un cero como salida
si ocurre la otra instancia la salida se espera en alto
si ocurre la ultima la salida se tira en cero
*/

module jump_tb;

	// Inputs
	reg bne_uc;
	reg jumpctrl_uc;
	reg zero_alu;

	// Outputs
	wire jumpctrl;

	// Instantiate the Unit Under Test (UUT)
	Jump uut (
		.bne_uc(bne_uc), 
		.jumpctrl_uc(jumpctrl_uc), 
		.zero_alu(zero_alu), 
		.jumpctrl(jumpctrl)
	);

	initial begin
		// Initialize Inputs
		bne_uc = 0;
		jumpctrl_uc = 0;
		zero_alu = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		bne_uc = 1;
		jumpctrl_uc = 1;
		#100
		jumpctrl_uc = 0;

	end
      
endmodule

