`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:37:04 05/31/2022
// Design Name:   Fetch
// Module Name:   C:/Users/Lenovo/Fetch/FetchTB.v
// Project Name:  Fetch
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Fetch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FetchTB;

	// Inputs
	reg reset;
	reg clk;
	reg [31:0] b_addr;
	reg z;
	reg b;

	// Outputs
	wire [31:0] addr;

	// Instantiate the Unit Under Test (UUT)
	Fetch uut (
		.reset(reset), 
		.clk(clk), 
		.b_addr(b_addr), 
		.z(z), 
		.b(b), 
		.addr(addr)
	);

	initial begin
		// Initialize Inputs
		reset = 0;
		clk = 0;
		b_addr = 0;
		z = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		// reset
		reset = 1;
		b_addr = 0;
		z = 0;
		b = 0;
		#100;
		
		
		// auto rise
		reset = 0;
		b_addr = 0;
		z = 0;
		b = 0;
		#100;
		
		reset = 0;
		b_addr = 0;
		z = 0;
		b = 0;
		#100;
		
		reset = 0;
		b_addr = 0;
		z = 0;
		b = 0;
		#100;
		
		/////////////////////////////////////////////////////////
		//     beq  (reset and jump)
		
		// reset
		reset = 1;
		b_addr = 0;
		z = 0;
		b = 0;
		#100;
		
		
		// beq test
		reset = 0;
		b_addr = 8;
		z = 1;
		b = 1;
		#100;
		
		
		// beq test
		reset = 0;
		b_addr = 16;
		z = 1;
		b = 1;
		#100;

		// reset
		reset = 1;
		b_addr = 0;
		z = 0;
		b = 0;
		#100;
		
		
		// beq test
		reset = 0;
		b_addr = 0;
		z = 1;
		b = 1;
		#100;

	end
	
	always begin clk = ~clk; #50; end
      
endmodule

