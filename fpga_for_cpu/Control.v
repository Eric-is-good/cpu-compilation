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
module Control(
		input [5:0] op,
		
		output reg RegDst,
		output reg RegWrite,
		output reg ALUSrc,
		output reg MemWrite,
		output reg MemRead,
		output reg MemtoReg,
		output reg Branch,

		output reg [1:0] ALUctr
    );
	 
	 always@(op)
		begin
			case(op)
				6'b000000 : {RegDst,RegWrite,ALUSrc,MemWrite,MemRead,MemtoReg,Branch,ALUctr}
								= 9'b1100000_10;
				6'b100011 : {RegDst,RegWrite,ALUSrc,MemWrite,MemRead,MemtoReg,Branch,ALUctr}
								= 9'b0110110_00;
				6'b101011 : {RegDst,RegWrite,ALUSrc,MemWrite,MemRead,MemtoReg,Branch,ALUctr}
								= 9'bx0110x0_00;
				6'b000100 : {RegDst,RegWrite,ALUSrc,MemWrite,MemRead,MemtoReg,Branch,ALUctr}
								= 9'bx0000x1_01;
				6'b001111 : {RegDst,RegWrite,ALUSrc,MemWrite,MemRead,MemtoReg,Branch,ALUctr}
								= 9'b0110000_11;
			endcase

					
		end
	 
	 
	 


endmodule
