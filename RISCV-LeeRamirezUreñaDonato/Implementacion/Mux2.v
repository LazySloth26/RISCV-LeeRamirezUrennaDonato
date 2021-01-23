`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:35:54 01/14/2021 
// Design Name: 
// Module Name:    Mux2 
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
module Mux2( 
	input SEL, 
	input [31:0] Dato1, 
	input [31:0] Dato2, 
	output reg [31:0] Out_Mux
	 );
	 
   always @(SEL, Dato1, Dato2)
      case (SEL)
         1'b0: Out_Mux <= Dato1;
         1'b1: Out_Mux <= Dato2;
      endcase				


endmodule
