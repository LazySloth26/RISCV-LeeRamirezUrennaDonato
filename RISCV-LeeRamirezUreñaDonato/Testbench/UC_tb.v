`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:10:31 01/08/2021
// Design Name:   UC
// Module Name:   C:/Xilinx/Proyectos/RISCV/UC_tb.v
// Project Name:  RISCV
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*Objetivo:-----------------
Verificar que todas las salidas varíen con respecto a la tabla de verdad
dependiendo del opcode que se le ingrese y que durante el opcode en cero
se tenga una salida del nop que esta es igual al addi x0, x0, 0
Estímulo:-------------------
Se le ingresa el opcode de un add/sub
Resultados esperados:-------
add/sub
regwrite=1
aluop=0110	
luisrc=1	
alusrc=0	
memwrite=0	
memread=0	
memtoreg00	
jumppc=0	
jumpcontrol=0	
bne=0
*/

module UC_tb;

	// Inputs
	reg [6:0] opcode_d;

	// Outputs
	wire regwrite_d;
	wire [3:0] aluop_d;
	wire luisrc_d;
	wire alusrc_d;
	wire memwrite_d;
	wire memread_d;
	wire [1:0] memtoreg_d;
	wire jumppc_d;
	wire jumpcontrol_d;
	wire bne_d;

	// Instantiate the Unit Under Test (UUT)
	UC uut (
		.opcode_d(opcode_d), 
		.regwrite_d(regwrite_d), 
		.aluop_d(aluop_d), 
		.luisrc_d(luisrc_d), 
		.alusrc_d(alusrc_d), 
		.memwrite_d(memwrite_d), 
		.memread_d(memread_d), 
		.memtoreg_d(memtoreg_d), 
		.jumppc_d(jumppc_d), 
		.jumpcontrol_d(jumpcontrol_d), 
		.bne_d(bne_d)
	);

	initial begin
		// Initialize Inputs
		opcode_d = 7'd0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		opcode_d = 7'b0110011; // corresponde a un add o sub

	end
      
endmodule

