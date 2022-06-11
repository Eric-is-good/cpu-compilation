`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:16 05/31/2022 
// Design Name: 
// Module Name:    D_reg 
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
module D_reg(
		input clk,
		input reset,
		input [31:0] data_in,
		output reg [31:0] data_out
    );

		
		always @ (posedge clk)
			begin
				if(reset) data_out = 0;
				else data_out = data_in;
			end

endmodule
