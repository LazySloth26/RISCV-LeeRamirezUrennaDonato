`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:00:54 01/12/2021 
// Design Name: 
// Module Name:    Mux21 
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
module Mux21( input [1:0] SEL, input [31:0] Dato , output reg [31:0] Out_Mux
    );
	 
   always @(SEL, Dato)
      case (SEL)
         2'b00: Out_Mux <= {16'b0, Dato [15:0]};
         2'b01: Out_Mux <= {Dato [15:0],16'b0};
			default : Out_Mux <= 1'b0;
      endcase				


endmodule