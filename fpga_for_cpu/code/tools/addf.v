`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:16 05/31/2022 
// Design Name: 
// Module Name:    addf
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
module addf(
		input [31:0] a,
    input [31:0] b,
		output reg [31:0] data_out
    );

		always @(*) begin
            data_out = a + b;
        end
		

endmodule
