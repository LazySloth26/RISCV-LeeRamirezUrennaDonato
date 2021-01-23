`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:59:24 01/21/2021 
// Design Name: 
// Module Name:    GPIO 
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
module GPIO(
	input [31:0] address_gpio,
	input [31:0] dato_gpio,
	input clk,
	output reg [31:0] gpio_out
    );
	 
	always @(*)
	begin 
		if (address_gpio == 32'habcd)
			gpio_out <= dato_gpio; 
		else
			gpio_out <= 32'd0;
		
	end

endmodule
