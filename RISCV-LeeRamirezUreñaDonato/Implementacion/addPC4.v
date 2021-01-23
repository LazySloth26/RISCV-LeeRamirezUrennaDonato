`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:46:52 12/07/2020 
// Design Name: 
// Module Name:    addPC 
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
module addPC4(
    input [9:0] PC,
	 input rst,
    output [9:0] siguiente
    
);

	reg signed [9:0] Sum;
	
	always @(*)
		if (~rst)
			Sum <= PC + 3'd4;
		else 
			Sum <= 3'd0;
		
	assign siguiente = Sum[9:0];

endmodule
