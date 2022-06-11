`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:46:18 05/17/2022 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
		input [31:0] a,
		input [31:0] b,
		input [2:0] op,
		output reg [31:0] result,
		output reg zero
    );
	 
    always @(a or b or op)
    begin
        case(op)
        3'b000: result = a + b;
        3'b100: result = a - b;
		3'b001: result = a & b;
		3'b101: result = a | b;
		3'b010: result = a ^ b;
		3'b110: result = {b,16'b0000_0000_0000_0000};
		default : result = 0;
        endcase
		  
		  if(result==0) zero = 1;
		  else zero = 0;
     end 



endmodule
