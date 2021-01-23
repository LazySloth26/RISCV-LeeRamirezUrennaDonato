`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:10:43 01/22/2021
// Design Name:   addPC4
// Module Name:   C:/Xilinx/Proyectos/RISCV/addpc4_tb.v
// Project Name:  RISCV
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: addPC4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////


/*
Objetivos:-----------
verificar que el sumador sume 4 con cada variante en input y que se su contenido se tire a cero con el rst
Estimulos:-----------
PC = 0
PC = 3
PC =5
rst = 1
Resultados esperados:
Se espera que se le sumen 4 a cada input y que cuando el rst se suba su salida sea cero

*/

module addpc4_tb;

	// Inputs
	reg [9:0] PC;
	reg rst;

	// Outputs
	wire [9:0] siguiente;

	// Instantiate the Unit Under Test (UUT)
	addPC4 uut (
		.PC(PC),  // pc de entrada
		.rst(rst),  // bandera rst
		.siguiente(siguiente)  // salida del pc mas 4
	);

	initial begin
		// Initialize Inputs
		PC = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100 PC = 10'd0;
		#100 PC = 10'd3;
		#100 PC = 10'd5;
		
		#100 rst = 1'b1;
		

	end
      
endmodule

