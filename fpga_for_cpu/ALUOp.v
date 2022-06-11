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
module ALUOp(
		input [5:0] func,
		input [1:0] ALUctr,

		output reg [2:0] ALU_op
    );
	 
	 always@({func,ALUctr})
		begin
			case({func,ALUctr})
			   // R
				8'b100000_10 : ALU_op = 3'b 000 ;
				8'b100010_10 : ALU_op = 3'b 100 ;
				8'b100100_10 : ALU_op = 3'b 001 ;
				8'b100101_10 : ALU_op = 3'b 101 ;
				8'b100110_10 : ALU_op = 3'b 010 ;

				// I
				8'bxxxxxx_00 : ALU_op = 3'b 000 ;
				8'bxxxxxx_00 : ALU_op = 3'b 000 ;
				8'bxxxxxx_01 : ALU_op = 3'b 100 ;
				8'bxxxxxx_11 : ALU_op = 3'b 110 ;

			endcase

					
		end
	 
	 
	 


endmodule
