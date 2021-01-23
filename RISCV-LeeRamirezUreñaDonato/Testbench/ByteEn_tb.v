`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:03:25 01/22/2021
// Design Name:   Byte_Enable
// Module Name:   C:/Xilinx/Proyectos/RISCV/ByteEn_tb.v
// Project Name:  RISCV
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Byte_Enable
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
verificar que dependiendo del resultado de datatype y de aluresult se seleccione o la palabra entera o el byte a cambiar
Estimulos:
prueba 1
todo en cero
prueba 2
DataType = 0;
ALUResult = 2;
prueba 3
DataType = 3
Resultados esperados:
prueba 1: selecciona el bit 1 de byteenable
prueba 2: tiene que seleccionar el bit 3 de byteenable
prueba 3: tiene que dar 15 byteenable

*/

module ByteEn_tb;

	// Inputs
	reg [1:0] ALUResult;
	reg [1:0] DataType;

	// Outputs
	wire [3:0] ByteEnable;

	// Instantiate the Unit Under Test (UUT)
	Byte_Enable uut (
		.ALUResult(ALUResult), 
		.DataType(DataType), 
		.ByteEnable(ByteEnable)
	);

	initial begin
		// Initialize Inputs
		ALUResult = 0;
		DataType = 0;

		// Wait 100 ns for global reset to finish
		#100;

		// Add stimulus here
				
		DataType = 2'b00;
		ALUResult = 2'b10;
		#100;
		DataType = 2'b11;
		
        

	end
      
endmodule

