`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:57:15 01/22/2021
// Design Name:   PC_reg
// Module Name:   C:/Xilinx/Proyectos/RISCV/RegPC_tb.v
// Project Name:  RISCV
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC_reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*
Objetivos:
verificar que el dato pase a la salida despues de un ciclo de reloj y 
el rst funcione
Estimulos:
pc_antes = 0
pc_antes = 3
rst = 1
Resultados esperados:
Se espera que su salida este desfasada con su entrada un ciclo de reloj
y que cuando el rst se tire arriba su salida sea cero
*/

module RegPC_tb;

	// Inputs
	reg [9:0] pc_antes;
	reg clk;
	reg rst;

	// Outputs
	wire [9:0] pc_desp;

	// Instantiate the Unit Under Test (UUT)
	PC_reg uut (
		.pc_antes(pc_antes), 
		.clk(clk), 
		.rst(rst), 
		.pc_desp(pc_desp)
	);

	initial begin
		// Initialize Inputs
		pc_antes = 0;
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
	
        
		// Add stimulus here
		
		pc_antes = 10'd3;
		#100;
		rst = 1'b1;
		
		
	end
	always #10 clk = ~clk;
      
endmodule

