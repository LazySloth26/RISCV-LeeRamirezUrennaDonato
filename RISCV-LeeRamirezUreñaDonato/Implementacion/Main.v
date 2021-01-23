`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:27:53 01/16/2021 
// Design Name: 
// Module Name:    Main 
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
module Main(
	input clock,
	input reset,
	output [31:0] gpio
	 );	 
	 
	wire [9:0] next_pc, pc, pc_4;
	
	wire [31:0] instruction;
	
	wire [3:0] aluop;
	wire regwrite, luisrc, alusrc, memread, memwrite, jumppc, jumpcontrol, bne; // cables de la uc que son solo 1 bit
	wire [1:0] memtoreg;
	
	wire [31:0] write_data;
	wire [31:0] data1, data2;
	
	wire [31:0]srca, srcb, imm;
	
	wire [4:0] aluctrl;
	wire [31:0] alu_result;
	wire zero;
	
	wire [31:0]mux4store_out, fixed_data1;
	wire [3:0] be;
	
	wire [31:0] data, fixed_data2, ext;
	wire [7:0] unext;
	
	wire [31:0] pcimm_out;
	
	wire jumpctrl_mux;
	
	wire [31:0] jumpout;
	 
	PC_reg registro_pc (
	 .pc_antes(next_pc), 
	 .clk(clock), 
	 .rst(reset),
	 .pc_desp(pc)
	 );
	
	Inst_mem instruction_mem (
	 .rst(reset),
    .address(pc), 
    .inst_f(instruction)
    );
	 
	UC unidad_ctrl (  
    .opcode_d(instruction[6:0]), 
    .regwrite_d(regwrite), 
    .aluop_d(aluop), 
    .luisrc_d(luisrc), 
    .alusrc_d(alusrc), 
    .memwrite_d(memwrite), 
    .memread_d(memread), 
    .memtoreg_d(memtoreg), 
    .jumppc_d(jumppc), 
    .jumpcontrol_d(jumpcontrol), // este 
    .bne_d(bne) // este otro
    );	 

	RegisterFile register_file (
    .ReadRegister1(instruction[19:15]), 
    .ReadRegister2(instruction[24:20]), 
    .WriteRegister(instruction[11:7]), 
    .Writedata(write_data),
	 .rst(reset),
    .Readdata1(data1), 
    .Readdata2(data2), 
    .RegWrite_D(regwrite), 
    .clk(clock)
    );
	 
	ImmGen imm_generator (
    .ImmIn(instruction), 
    .ImmOut(imm)
    ); 
	 
	Mux2 luimux (
    .SEL(luisrc), 
    .Dato1(0), 
    .Dato2(data1), 
    .Out_Mux(srca)
    );
	 
	Mux2 alumux (
    .SEL(alusrc), 
    .Dato1(data2), 
    .Dato2(imm), 
    .Out_Mux(srcb)
    );
	 
	ALU_Control alu_ctrl ( // ----------------------------------------------------
    .aluop_d(aluop), 
    .funct7_5(instruction[30]), 
    .funct3(instruction[14:12]), 
    .alucontrol(aluctrl)
    ); 	 
	 
	ALU ALU_alu (
    .A(srca), 
    .B(srcb), 
    .ALU_Sel(aluctrl), 
    .ALU_Out(alu_result), 
    .zero_flag(zero)
    );

	// begin store	 
	Mux41 mux4store (
    .SEL(alu_result[1:0]), 
    .Dato(data2), 
    .Out_Mux(mux4store_out)
    );
	
	Mux2 mux2store (
    .SEL(instruction[13]), // antes estaba 12 
    .Dato1(mux4store_out), 
    .Dato2(data2), 
    .Out_Mux(fixed_data1)
    );
	 
	Byte_Enable bloque_byteen (
    .ALUResult(alu_result[1:0]), 
    .DataType(instruction[13:12]), 
    .ByteEnable(be)
    );
	// end store
	
	
	GPIO patilla_gpio (
    .address_gpio(alu_result[31:0]), 
    .dato_gpio(fixed_data1), 
    .clk(clock), 
    .gpio_out(gpio)
    );

	
	// begin load
	Mux4 mux4load (
    .SEL(alu_result[1:0]), 
    .Dato(data), 
    .Out_Mux(unext)
    );
	 
	Mux2 mux2load (
    .SEL(instruction[13]), // antes estaba 12
    .Dato1(ext), 
    .Dato2(data), 
    .Out_Mux(fixed_data2)
    );
	 
	sign_ext2 extensor_load (
    .unextend(unext), 
    .extended(ext), 
    .signo(instruction[14])
    );
	// end load
	
	Data_mem data_memory (
    .address_dm(alu_result[9:0]), 
    .writedata_dm(fixed_data1), 
    .byte_en(be), 
    .memread_dm(memread), 
    .memwrite_dm(memwrite), 
    .clk(clock), 
    .mem_data(data)
    );
	 
	mux4_gen mux_wb (
    .SEL(memtoreg), 
    .Dato1(alu_result), 
    .Dato2(fixed_data2), 
    .Dato3(pc_4), 
    .Dato4(0), 
    .Out_Mux(write_data)
    );
	 
	addPC4 pcmas4 (
    .PC(pc),
	 .rst(reset),
    .siguiente(pc_4)
    );
		 
   add_imm add_inmediato (
    .pc_d(pc), 
    .imm_add(imm), 
    .pc_imm(pcimm_out)
    );
	 
	Jump bloque_jump (
    .bne_uc(bne), 
    .jumpctrl_uc(jumpcontrol), 
    .zero_alu(zero), 
    .jumpctrl(jumpctrl_mux)
    );
	
	Mux2_PcJump muxjump (
    .SEL(jumpctrl_mux), // antes estaba 12
    .Dato1(pc_4), 
    .Dato2(pcimm_out), 
    .Out_Mux(jumpout)
    );
	 
	Mux2_PcJump muxpc (
    .SEL(jumppc), // antes estaba 12
    .Dato1(jumpout), 
    .Dato2(alu_result[9:0]), 
    .Out_Mux(next_pc)
    );
	 	 

endmodule
