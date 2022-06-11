`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:03:15 05/24/2022
// Design Name:   Control_Unit
// Module Name:   C:/Users/Lenovo/Control/control_tb.v
// Project Name:  Control
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control_Unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module control_tb;

	// Inputs
	reg [5:0] op;
	reg [5:0] func;

	// Outputs
	wire RegDst;
	wire RegWrite;
	wire ALUSrc;
	wire MemWrite;
	wire MemRead;
	wire MemtoReg;
	wire [2:0] ALU_op;
	wire Branch;

	// Instantiate the Unit Under Test (UUT)
	Control_Unit uut (
		.op(op), 
		.func(func), 
		.RegDst(RegDst), 
		.RegWrite(RegWrite), 
		.ALUSrc(ALUSrc), 
		.MemWrite(MemWrite), 
		.MemRead(MemRead), 
		.MemtoReg(MemtoReg), 
		.ALU_op(ALU_op), 
		.Branch(Branch)
	);

	initial begin
		// Initialize Inputs
		op = 0;
		func = 0;
		#100;
		
		
		// R
		op = 6'b000000;
		func = 6'b100000;
		#100;
		
		op = 6'b000000;
		func = 6'b100010;
		#100;
		
		op = 6'b000000;
		func = 6'b100100;
		#100;
		
		op = 6'b000000;
		func = 6'b100101;
		#100;
		
		op = 6'b000000;
		func = 6'b100110;
		#100;
		
		// not R
		op = 6'b100011;
		func = 6'bxxxxxx;
		#100;
		
		op = 6'b101011;
		func = 6'bxxxxxx;
		#100;
		
		op = 6'b000100;
		func = 6'bxxxxxx;
		#100;
		
		op = 6'b001111;
		func = 6'bxxxxxx;
		#100;
      op = 0;
		func = 0;
		#100;

	end
      
endmodule

