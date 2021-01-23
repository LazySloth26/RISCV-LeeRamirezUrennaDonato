`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:33:31 01/12/2021 
// Design Name: 
// Module Name:    Jump 
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
module Jump(
    input bne_uc,
    input jumpctrl_uc,
    input zero_alu,
    output jumpctrl
    );

	assign jumpctrl = ~zero_alu & jumpctrl_uc & bne_uc;


endmodule
