`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:45:02 01/12/2021
// Design Name:   Data_mem
// Module Name:   C:/Xilinx/Proyectos/RISCV/Datamem_tb.v
// Project Name:  RISCV
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Data_mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////


/*
Objetivos:--------------
verificar que la memoria escriba y lea de su respectivo address y con las banderas de read o write
Estímulos:--------------
PRUEBA 1 *****
address = 36
write = 2
byte = 1111
memread = 0
memwrite = 1
PRUEBA 2 *****
address = 36
write = 2
byte = 1111
memread = 1
memwrite = 0
PRUEBA 3 *****
address = 36
write = 960
byte = 0010
memread = 0
memwrite = 1
seguido de una lectura de la misma direccion para verificar su escritura
Resultados esperados:---  
prueba 1: se espera que escriba un 2 en la direccion 36
prueba 2: se espera que su salida sea un 2
prueba 3: se espera que solo se guarde un 3 en el segundo byte y mantenga el 2 del primer byte
*/

module Datamem_tb;

	// Inputs
	reg [9:0] address_dm;
	reg [31:0] writedata_dm;
	reg [3:0] byte_en;
	reg memread_dm;
	reg memwrite_dm;
	reg clk;

	// Outputs
	wire [31:0] mem_data;

	// Instantiate the Unit Under Test (UUT)
	Data_mem uut (
		.address_dm(address_dm),  // direccion de memoria 
		.writedata_dm(writedata_dm),  // dato a escribir
		.byte_en(byte_en),   //byte a escribir
		.memread_dm(memread_dm),  // bandera lectura
		.memwrite_dm(memwrite_dm),  // bandera escritura
		.clk(clk), 
		.mem_data(mem_data)  // dato leido
	);

	initial begin
		// Initialize Inputs
		address_dm = 0;
		writedata_dm = 0;
		byte_en = 0;
		memread_dm = 0;
		memwrite_dm = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;		
        
		// Add stimulus here
		address_dm = 10'd36;
		writedata_dm = 32'd2;
		byte_en = 4'b1111;
		memread_dm = 1'b0;
		memwrite_dm = 1'b1;
		#100;
		
		address_dm = 10'd36;
		writedata_dm = 32'd2;
		byte_en = 4'b1111;
		memread_dm = 1'b1;
		memwrite_dm = 1'b0;	
		#100;		
		
		address_dm = 10'd36;
		writedata_dm = 32'd960;
		byte_en = 4'b0010;
		memread_dm = 1'b0;
		memwrite_dm = 1'b1;
		#100;
		
		address_dm = 10'd36;
		writedata_dm = 32'd960;
		byte_en = 4'b0010;
		memread_dm = 1'b1;
		memwrite_dm = 1'b0;
		
		

	end
	always #10 clk = ~clk;
      
endmodule

