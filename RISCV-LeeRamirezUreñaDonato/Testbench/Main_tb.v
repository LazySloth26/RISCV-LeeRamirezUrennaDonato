`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:34:56 01/20/2021
// Design Name:   Main
// Module Name:   C:/ProyectosXilinx/RISCV/Main_tb.v
// Project Name:  RISCV
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

//*Objetivo de la prueba*//
// Se realiza un test del bloque Main_tb para probar el funcionamiento del circuito entero


//*Estímulos*//
// A las entradas se les da primero el valor de:
// reset = 1 y luego se cambia a 0 100ns despues
// reloj CLK que varia cada 15ns

//*Resultados esperados*//
// La única salida presente en este módulo es e GPIO que muestra ek contenido
// que apunta la direcciòn ABCD

module Main_tb;

	// Inputs
	reg clock;
	reg reset;

	// Outputs
	wire [31:0] gpio;

	// Instantiate the Unit Under Test (UUT)
	Main uut (
		.clock(clock), 
		.reset(reset), 
		.gpio(gpio)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 1;

		// Wait 90 ns for global reset to finish
		#90;
		reset = 0;
        
		// Add stimulus here	

	end
      
   always #10 clock = ~clock;
			
	integer f;
	integer i;
	initial begin
	  f = $fopen("dump.txt","w");
	  #1000; // <== simulation run time
	  $fclose(f);
	  $finish; // <== end simulation
	end

	always @(posedge clock) 
	begin
		if (uut.instruction_mem.inst_f == 32'h00000793)
		begin
			$fwrite(f, "Dirección de memoria  Valor hexadecimal\n","");
			for(i=0; i<1024; i=i+1)
			begin
				$fwrite(f, "0x%h            ", i*4, "0x%h\n", uut.data_memory.ram_datamem[i]);
			end
		end
	end

endmodule
