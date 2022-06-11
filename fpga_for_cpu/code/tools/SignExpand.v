`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:31:38 05/17/2022 
// Design Name: 
// Module Name:    SignExpand 
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
module SignExpand(
		input [15:0] data_16bit,
		output reg [31:0] data_32bit
    );
	 
	 always @(data_16bit)
			if (data_16bit[15] == 0)
				data_32bit = {16'b0000_0000_0000_0000,data_16bit};
			else
			   data_32bit = {16'b1111_1111_1111_1111,data_16bit};

endmodule
