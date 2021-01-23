`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:50:54 01/22/2021
// Design Name:   add_imm
// Module Name:   C:/Xilinx/Proyectos/RISCV/addimm_tb.v
// Project Name:  RISCV
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: add_imm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*
Objetivos:----------------------
Verificar que sume el inmediato con el pc
Estimulos:----------------------
pc = 4
add_imm = 3
Resultados esperados:-----------
Se espera que pc_imm sea 7
*/


module addimm_tb;

	// Inputs
	reg [9:0] pc_d;
	reg [31:0] imm_add;

	// Outputs
	wire [31:0] pc_imm;

	// Instantiate the Unit Under Test (UUT)
	add_imm uut (
		.pc_d(pc_d), 
		.imm_add(imm_add), 
		.pc_imm(pc_imm)
	);

	initial begin
		// Initialize Inputs
		pc_d = 0;
		imm_add = 0;

		// Wait 100 ns for global reset to finish
		#100;
		pc_d = 10'd4;
		imm_add = 32'd3;
        
		// Add stimulus here

	end
      
endmodule

