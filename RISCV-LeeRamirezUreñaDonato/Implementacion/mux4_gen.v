`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:05:26 01/16/2021 
// Design Name: 
// Module Name:    mux4_gen 
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
module mux4_gen(
	input [1:0] SEL,
   input [31:0] Dato1,
   input [31:0] Dato2,
   input [9:0] Dato3,
	input [31:0] Dato4,
   output reg [31:0] Out_Mux
    );

   always @(SEL, Dato1, Dato2, Dato3, Dato4)
      case (SEL)
         2'b00: Out_Mux <= Dato1;
         2'b01: Out_Mux <= Dato2;
         2'b10: Out_Mux <= Dato3;
         2'b11: Out_Mux <= Dato4;
      endcase

endmodule
