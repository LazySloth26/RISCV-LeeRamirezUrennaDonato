`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:42:13 12/10/2020 
// Design Name: 
// Module Name:    add_imm 
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
module add_imm(
   input [9:0] pc_d,
	input [31:0] imm_add,
   output reg[31:0] pc_imm
    );
	
	
	
	always @(*)begin
		pc_imm <= pc_d + imm_add;
	end

endmodule
