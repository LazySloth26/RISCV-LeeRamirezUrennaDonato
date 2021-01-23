`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:02:39 01/07/2021 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile #(parameter RAM_WIDTH = 32, RAM_ADDR_BITS = 10)(
    input [4:0] ReadRegister1,
    input [4:0] ReadRegister2,
    input [4:0] WriteRegister,
    input [31:0] Writedata,
	 input rst,
    output [31:0] Readdata1,
    output [31:0] Readdata2,
    input RegWrite_D,
    input clk
    );
	 
	

	reg [RAM_WIDTH-1:0] ram_regfile [(2**RAM_ADDR_BITS)-1:0];

   initial begin
      $readmemh("Registro_RAM.txt", ram_regfile, 0, ((2**RAM_ADDR_BITS)-1));
   end
   integer i;

   always @(posedge clk) begin
		if (rst) 
		begin
			for(i = 0; i < 1024; i = i +1)
				ram_regfile[i] = 0;	
		end 		
		else if (WriteRegister == 32'h00000000)
			ram_regfile[WriteRegister] = 32'h00000000;
      else if (RegWrite_D)
         ram_regfile[WriteRegister] = Writedata;

		   
   end
	assign Readdata1 = ram_regfile[ReadRegister1];
	assign Readdata2 = ram_regfile[ReadRegister2];

endmodule
