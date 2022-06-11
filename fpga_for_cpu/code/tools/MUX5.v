`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:21:15 06/09/2022 
// Design Name: 
// Module Name:    MUX5 
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
module MUX5(
      input [4:0] in1,
		input [4:0] in2,
		input sel,
		output reg [4:0] out_data
    );
	 
	 
	 always @(in1,in2,sel)       if(!sel)  out_data=in1;            else out_data=in2;




endmodule