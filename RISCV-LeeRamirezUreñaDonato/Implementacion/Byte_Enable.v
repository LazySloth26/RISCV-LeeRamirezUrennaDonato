`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:25:38 01/16/2021 
// Design Name: 
// Module Name:    Byte_ 
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
module Byte_Enable(
   input [1:0] ALUResult, // 
   input [1:0] DataType,
   output reg [3:0] ByteEnable
    );

	always @(*) // puede que este malo, tenga piedad 
		if (DataType == 2'b00)
		begin
			if(ALUResult == 2'b00)
				ByteEnable = 4'b0001;
			else if (ALUResult == 2'b01)
				ByteEnable = 4'b0010;
			else if (ALUResult == 2'b10)
				ByteEnable = 4'b0100;
			else 
				ByteEnable = 4'b1000;
		end
		else
			ByteEnable = 4'b1111;
	 

endmodule

