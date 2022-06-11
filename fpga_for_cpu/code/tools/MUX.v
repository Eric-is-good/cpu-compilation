`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:14:27 05/31/2022 
// Design Name: 
// Module Name:    MUX 
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
module MUX(
      input [31:0] in1,
		input [31:0] in2,
		input sel,
		output reg [31:0] out_data
    );
	 
	 
	 always @(in1,in2,sel)       if(!sel)  out_data=in1;            else out_data=in2;




endmodule
