`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:04:53 06/09/2022
// Design Name:   CPU
// Module Name:   C:/Users/Lenovo/cpu/cpuTB.v
// Project Name:  cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cpuTB;

	// Inputs
	reg Reset;
	reg Clock;

	// Outputs
	wire [31:0] Result;
	wire [31:0] Addr;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.Reset(Reset), 
		.Clock(Clock), 
		.Result(Result), 
		.Addr(Addr)
	);

	initial begin
		// Initialize Inputs
		Reset = 0;
		Clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		
		Reset = 1;
		#100;
		Reset = 0;
		

	end
	
	always begin Clock = ~Clock; #50; end
      
endmodule

