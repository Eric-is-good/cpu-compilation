`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:27:50 05/24/2022 
// Design Name: 
// Module Name:    Control_Unit 
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
module Control_Unit(
		input [5:0] op,
		input [5:0] func,
		
		output  RegDst,
		output  RegWrite,
		output  ALUSrc,
		output  MemWrite,
		output  MemRead,
		output  MemtoReg,
		output  [2:0] ALU_op,
		output  Branch
    );
	 
	 wire [1:0] ALUctr;

	 Control Control(
		 .op(op),
		 .RegDst(RegDst),
		 .RegWrite(RegWrite),
		 .ALUSrc(ALUSrc),
		 .MemWrite(MemWrite),
		 .MemRead(MemRead),
		 .MemtoReg(MemtoReg),
		 .ALUctr(ALUctr),
		 .Branch(Branch)

	 );


	 ALUOp ALUOp(
		 .func(func),
		 .ALUctr(ALUctr),
		 .ALU_op(ALU_op)
	 );


endmodule
