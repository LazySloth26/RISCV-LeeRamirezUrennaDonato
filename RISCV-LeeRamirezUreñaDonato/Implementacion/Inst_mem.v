`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:31:37 01/08/2021 
// Design Name: 
// Module Name:    Inst_mem 
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
module Inst_mem # (parameter ROM_WIDTH = 32, ROM_ADDR_BITS = 10)( 
	input rst,
	input [ROM_ADDR_BITS-1:0] address,
	output reg [ROM_WIDTH-1:0] inst_f
   );
   
   reg [ROM_WIDTH-1:0] rom_instmem [(2**ROM_ADDR_BITS)-1:0];   
      
   initial begin
      $readmemh("pm_ev_5_while.txt", rom_instmem, 0, ((2**ROM_ADDR_BITS)-1));
	end	

   always @(rst, address)
		if(rst)
			inst_f <= 32'd0;
		else 
         inst_f <= rom_instmem[address/4];
			
			
endmodule
