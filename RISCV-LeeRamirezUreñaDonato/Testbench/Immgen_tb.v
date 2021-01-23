`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:12:40 01/22/2021
// Design Name:   ImmGen
// Module Name:   C:/Xilinx/Proyectos/RISCV/Immgen_tb.v
// Project Name:  RISCV
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ImmGen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

//Objetivo de la prueba//
// Se realiza un test del bloque Generador de Inmediatos para verificar que logre dar como señal de salida el inmediato correcto de acuerdo a la instruccion

//Estímulos//
//En la seccion de estimulos se prueban todas las distintas instrucciones en donde se utilicen inmediatos
/*    01) Se prueba la instruccion LBU en donde la estructura que me interesa probar es 101010101011XXXXX100XXXXX0000011 
		02) Se prueba la instruccion LW en donde la estructura que me interesa probar es 101010101011XXXXX010XXXXX0000011
		03) Se prueba la instruccion ADDI en donde la estructura que me interesa probar es 110000000011XXXXX000XXXXX0010011
		04) Se prueba la instruccion SLLI en donde la estructura que me interesa probar es 000000010101XXXXX001XXXXX0010011
		05) Se prueba la instruccion XORI en donde la estructura que me interesa probar es 101010101010XXXXX100XXXXX0010011
		06) Se prueba la instruccion SRLI en donde la estructura que me interesa probar es 000000011011XXXXX101XXXXX0010011
		07) Se prueba la instruccion SRAI en donde la estructura que me interesa probar es 010000010001XXXXX101XXXXX0010011
		08) Se prueba la instruccion ANDI en donde la estructura que me interesa probar es 111000000111XXXXX111XXXXX0010011
		09) Se prueba la instruccion SB en donde la estructura que me interesa probar es 1010101XXXXXXXXXX000101010100011
		10) Se prueba la instruccion SW en donde la estructura que me interesa probar es 1010101XXXXXXXXXX010101010100011
		11) Se prueba la instruccion LUI en donde la estructura que me interesa probar es 10101010101010101010XXXXX000011
		12) Se prueba la instruccion BNE en donde la estructura que me interesa probar es 1010101 XXXXXXXXXXXXX101011100011
		13) Se prueba la instruccion JAL en donde la estructura que me interesa probar es 10000011111010101010XXXXX 1101111*/

//Resultados esperados//
/*	Este modulo solo presenta una unica salida de 32 bits de los que se espera, de acuerdo a la instrucció: 	 
		01) 11111111111111111111101010101011
		02) 11111111111111111111101010101011
		03) 11111111111111111111110000000011
		04) 00000000000000000000000000010101
		05) 11111111111111111111101010101010
		06) 00000000000000000000000000011011
		07) 00000000000000000000010000010001
		08) 11111111111111111111111000000111
		09) 11111111111111111111101010110101
		10) 11111111111111111111101010110101
		11) 11111111111110101010101010101010
		12) 11111111111111111111101010110101
		13) 11111111111110000011111010101010
*/


module ImmGen_TB;

	// Inputs
	reg [31:0] ImmIn;  //Se identifican las 2 entradas ImmIn de 32 bits y Clk que es una señal logica
	reg Clk;

	// Outputs
	wire [31:0] ImmOut; //Se identifica la señal de salida ImmOut de 32 bits

	// Instantiate the Unit Under Test (UUT)
	ImmGen uut (
		.ImmIn(ImmIn), 
		.Clk(Clk), 
		.ImmOut(ImmOut)
	);

	initial begin
		// Initialize Inputs
		ImmIn = 0; //Se inicializan para que tomen un valor inicial y que nunca esten en un valor desconocido
		Clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#50 ImmIn = 32'b10101010101100000100000000000011;//01
		#50 ImmIn = 32'b10101010101100000010000000000011;//02
		#50 ImmIn = 32'b11000000001100000000000000010011;//03
		#50 ImmIn = 32'b00000001010100000001000000010011;//04
		#50 ImmIn = 32'b10101010101000000100000000010011;//05
		#50 ImmIn = 32'b00000001101100000101000000010011;//06
		#50 ImmIn = 32'b01000001000100000101000000010011;//07
		#50 ImmIn = 32'b11100000011100000111000000010011;//08
		#50 ImmIn = 32'b10101010000000000000101010100011;//09
		#50 ImmIn = 32'b10101010000000000010101010100011;//10
		#50 ImmIn = 32'b10101010101010101010000000110111;//11
		#50 ImmIn = 32'b10101010000000000000101011100011;//12
		#50 ImmIn = 32'b10000011111010101010000001101111;//13
		
		/*	
	
		Como se lograron mostrar de esta forma, se puede considerar que el modulo funciona correctamente
		*/

	end
	always #10 Clk = ~Clk;
      
endmodule
