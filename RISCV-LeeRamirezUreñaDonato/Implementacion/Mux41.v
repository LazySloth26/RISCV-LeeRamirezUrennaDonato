`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:01:37 01/12/2021 
// Design Name: 
// Module Name:    Mux41 
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
module Mux41( input [1:0] SEL, input [31:0] Dato, output reg [31:0] Out_Mux
    );
	 
always @(SEL, Dato)
      case (SEL)
         2'b00: Out_Mux <= {24'b0, Dato [7:0]};
         2'b01: Out_Mux <= {16'b0, Dato [15:8], 8'b0};
         2'b10: Out_Mux <= {8'b0, Dato [23:16], 16'b0};
         2'b11: Out_Mux <= {Dato [31:24], 24'b0};
      endcase


endmodule
