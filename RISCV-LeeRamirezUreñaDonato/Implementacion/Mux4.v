`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:37:05 01/14/2021 
// Design Name: 
// Module Name:    Mux4 
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
module Mux4( input [1:0] SEL, input [31:0] Dato, output reg [7:0] Out_Mux
    );
	 
   always @(SEL,Dato)
      case (SEL)
         2'b00: Out_Mux <= Dato [7:0];
         2'b01: Out_Mux <= Dato [15:8];
         2'b10: Out_Mux <= Dato [23:16];
         2'b11: Out_Mux <= Dato [31:24];
			default : Out_Mux <= 1'b0;
      endcase				


endmodule
