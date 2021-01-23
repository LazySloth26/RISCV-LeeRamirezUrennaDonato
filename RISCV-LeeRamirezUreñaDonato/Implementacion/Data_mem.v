`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:27:06 01/12/2021 
// Design Name: 
// Module Name:    Data_mem 
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
module Data_mem # (parameter RAM_WIDTH = 32, RAM_ADDR_BITS = 10)(
    input [9:0] address_dm,
    input [31:0] writedata_dm,
    input [3:0] byte_en, 
	 input memread_dm,
	 input memwrite_dm,
	 input clk,
	 output reg [31:0] mem_data
    );
	
   reg [RAM_WIDTH-1:0] ram_datamem [(2**RAM_ADDR_BITS)-1:0];
	
	reg [(RAM_WIDTH/4)-1:0] di0, di1, di2, di3;
	
	
	initial begin
      $readmemh("RAM_datamem.txt", ram_datamem, 0, ((2**RAM_ADDR_BITS)-1));
	end
	
	always @(byte_en, writedata_dm, address_dm, memwrite_dm, memread_dm) begin // intentar con *
      if (byte_en[0]) // 0001
         di0 = writedata_dm[(RAM_WIDTH/4)-1:0];
      else
         di0 = ram_datamem[address_dm][(RAM_WIDTH/4)-1:0];
      if (byte_en[1])
         di1 = writedata_dm[(RAM_WIDTH/2)-1:RAM_WIDTH/4];
      else
         di1 = ram_datamem[address_dm][(RAM_WIDTH/2)-1:RAM_WIDTH/4];
      if (byte_en[2])
         di2 = writedata_dm[(3*RAM_WIDTH/4)-1:RAM_WIDTH/2];
      else
         di2 = ram_datamem[address_dm][(3*RAM_WIDTH/4)-1:RAM_WIDTH/2];
      if (byte_en[3])
         di3 = writedata_dm[RAM_WIDTH-1:(3*RAM_WIDTH/4)];
      else
         di3 = ram_datamem[address_dm][RAM_WIDTH-1:(3*RAM_WIDTH/4)];
		if (memread_dm)
			mem_data <= ram_datamem[address_dm];
		else
			mem_data <= 32'd0;
   end

   always @(posedge clk)begin
      if (memwrite_dm)
         ram_datamem[address_dm] <= {di3,di2,di1,di0};
	end	

endmodule
