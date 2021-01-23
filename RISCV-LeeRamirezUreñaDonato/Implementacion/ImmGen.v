`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:21:59 01/16/2021 
// Design Name: 
// Module Name:    ImmGen 
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
module ImmGen(	
	input [31:0] ImmIn,
	output reg [31:0] ImmOut
    );

	reg [6:0] Opcode;

	always @(*) begin
	Opcode <= ImmIn [6:0];
			case (Opcode)
				7'b0000011:
				begin
				case(ImmIn[14:12])
						3'b100://LBU
						begin
						ImmOut <={{20{ImmIn[31]}},ImmIn[31:20]};
						end
						
						3'b010://LW
						begin
						ImmOut <={{20{ImmIn[31]}},ImmIn[31:20]};
						end
						default: ImmOut <= 32'd0;
						
				endcase
				end
				
				7'b0010011: 
				begin
				case(ImmIn[14:12])
					3'b000: //addi, nop
					begin
					ImmOut <={{20{ImmIn[31]}},ImmIn[31:20]}; 
					end
					
					3'b001: //slli
					begin
					ImmOut <={{20{ImmIn[31]}},ImmIn[31:20]};  
					end
					
					3'b100://xori
					begin
					ImmOut <={{20{ImmIn[31]}},ImmIn[31:20]}; 
					end
					
					3'b101:
					begin
					case(ImmIn[30])
						1'b0: //srli
						begin
						ImmOut <={{26{ImmIn[31]}},ImmIn[25:20]};
						end
						
						1'b1: //srai
						begin
						ImmOut <={{26{ImmIn[31]}},ImmIn[25:20]};
						end
						default: ImmOut <= 32'd0;
						
					endcase
					end
					
					3'b111: //andi
					begin
					ImmOut <={{20{ImmIn[31]}},ImmIn[31:20]}; 
					end
					default: ImmOut <= 32'd0;
					
				endcase
				end
				
				7'b0100011: 
				begin 
				case(ImmIn[14:12])
					3'b000: //sb
					begin
					ImmOut <={{21{ImmIn[31]}},ImmIn[31:25],ImmIn[11:7]}; // Num2 y Num3
					end
					
					3'b010: //sw
					begin
					ImmOut <={{21{ImmIn[31]}},ImmIn[31:25],ImmIn[11:7]}; 
					end
					default: ImmOut <= 32'd0;
					
				endcase
				end
				
				7'b0110111: //lui 
				begin 
				ImmOut <={ImmIn[31:12],{12{ImmIn[31]}}}; // ImmNum4   antes{{12{ImmIn[31]}},ImmIn[31:12]}
				end
				
				7'b1100011: //bne
				begin
				ImmOut <={{20{ImmIn[31]}},ImmIn[31:25],ImmIn[11:7]}; 
				end
				
				7'b1101111: //jal
				begin
				ImmOut <={{12{ImmIn[31]}},ImmIn[31:12]}; 
				end
				default: ImmOut <= 32'd0;
				
			endcase
	end
endmodule
