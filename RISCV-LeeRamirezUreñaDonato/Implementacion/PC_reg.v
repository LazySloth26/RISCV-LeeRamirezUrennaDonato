`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:35:54 01/16/2021 
// Design Name: 
// Module Name:    PC_reg 
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
module PC_reg( //puede que aqui vaya el reset
	input [9:0] pc_antes,
	input clk,
	input rst,
	output reg [9:0] pc_desp
    );
	

	always @(posedge clk)
		if (rst)
			pc_desp <= 0;
		else 
			pc_desp <= pc_antes;

endmodule
