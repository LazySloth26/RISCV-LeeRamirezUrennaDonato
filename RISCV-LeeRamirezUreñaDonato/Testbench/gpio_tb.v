`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:15:18 01/22/2021
// Design Name:   GPIO
// Module Name:   C:/Xilinx/Proyectos/RISCV/gpio_tb.v
// Project Name:  RISCV
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: GPIO
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
verificar que el bloque tenga como output el valor a escribir en memoria cuando
el address apunta a 0xABCD
Estimulos:
prueba 1
address_gpio = 16
dato_gpio = 96
prueba 2
address_gpio = 0xabcd
dato_gpio = 96
resultados esperados:
se espera que solo tenga la salida cuando el address sea abcd, de lo contrario en cero
*/


module gpio_tb;

	// Inputs
	reg [31:0] address_gpio;
	reg [31:0] dato_gpio;
	reg clk;

	// Outputs
	wire [31:0] gpio_out;

	// Instantiate the Unit Under Test (UUT)
	GPIO uut (
		.address_gpio(address_gpio), 
		.dato_gpio(dato_gpio), 
		.clk(clk), 
		.gpio_out(gpio_out)
	);

	initial begin
		// Initialize Inputs
		address_gpio = 0;
		dato_gpio = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		address_gpio = 32'd16;
		dato_gpio = 32'd96;		
		#100;
		
		address_gpio = 32'habcd;
		dato_gpio = 32'd96;
		

	end
	always #10 clk = ~clk;
      
endmodule

