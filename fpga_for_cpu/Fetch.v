`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:18:29 05/31/2022 
// Design Name: 
// Module Name:    Fetch 
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
module Fetch(
		input reset,
		input clk,
		input [31:0] b_addr,
		input z,b,
		output [31:0] addr
		
    );
	 
	 
	 wire [31:0] mux_out;
	 wire [31:0] add1;
	 wire [31:0] add2;

	 D_reg d(
			.clk(clk),
			.reset(reset),
			.data_in(mux_out),
			.data_out(addr)
	 );


	addf a1(
		.a(4),
		.b(addr),
		.data_out(add1)
	);
	 
	addf a2(
		.a(add1),
		.b(b_addr << 2),
		.data_out(add2)
	);


	 MUX m (
			.in1(add1),
			.in2(add2),
			.sel(z & b),
			.out_data(mux_out)
			
	 );
	 
	 


endmodule
