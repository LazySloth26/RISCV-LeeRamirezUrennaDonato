`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:06:17 01/07/2021 
// Design Name: 
// Module Name:    UC 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module UC(
	input [6:0] opcode_d, // creo que podemos quitar las primeros 2 bits del opcode
	output regwrite_d,
	output [3:0] aluop_d, // revisar puede que sea reg
	output luisrc_d,
	output alusrc_d,
	output memwrite_d,
	output memread_d,
	output [1:0]memtoreg_d, // revisar puede que sea reg 
	output jumppc_d,
	output jumpcontrol_d,
	output bne_d
    );
	
	
	reg [13:0]temp_uc = 14'd0;
		
	always @(*) // creo que mejor ponerlo driven by opcode
		case(opcode_d)
			7'b0000011: temp_uc <= 14'b10000110101000; // lw y lbu
			7'b0010011: temp_uc <= 14'b10010110000000; // aritmeticas se implementa li
			7'b0100011: temp_uc <= 14'b00100111000000; // sb y sw
			7'b0110011: temp_uc <= 14'b10110100000000; // add y sub
			7'b0110111: temp_uc <= 14'b10111010000000; // lui
			7'b1100011: temp_uc <= 14'b11100100010011; // bne
			7'b1100111: temp_uc <= 14'b11101110010100; // jalr
			7'b1101111: temp_uc <= 14'b11101110010010; // jal se implementa j
				default: temp_uc <= 14'b00010110000000; // nop como default 
			endcase
			
	assign regwrite_d = temp_uc[13];
	assign aluop_d[3] = temp_uc [12]; // revisar
	assign aluop_d[2] = temp_uc [11];
	assign aluop_d[1] = temp_uc [10];
	assign aluop_d[0] = temp_uc [9];
	assign luisrc_d = temp_uc[8];
	assign alusrc_d = temp_uc [7];
	assign memwrite_d = temp_uc[6];
	assign memread_d = temp_uc[5];
	assign memtoreg_d[1] = temp_uc[4]; // revisar
	assign memtoreg_d[0] = temp_uc[3]; // revisar
	assign jumppc_d = temp_uc[2];
	assign jumpcontrol_d = temp_uc[1];
	assign bne_d = temp_uc[0];
	
	
endmodule
