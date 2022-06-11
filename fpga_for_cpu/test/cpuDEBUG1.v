`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:18:42 06/09/2022
// Design Name:   CPU
// Module Name:   C:/Users/Lenovo/cpu/cpuDEBUG1.v
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

module cpuDEBUG1;

	// Inputs
	reg Reset;
	reg Clock;

	// Outputs
	wire [31:0] Result;
	wire [31:0] Addr;
	wire [31:0] ALUin11;
	wire [31:0] ALUin22;
	wire [31:0] ALUoutt;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.Reset(Reset), 
		.Clock(Clock), 
		.Result(Result), 
		.Addr(Addr), 
		.ALUin11(ALUin11), 
		.ALUin22(ALUin22), 
		.ALUoutt(ALUoutt)
	);

	initial begin
		// Initialize Inputs
		Reset = 0;
		Clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Reset = 1;
		#1;
		Reset = 0;
		
	  end
	
	always begin Clock = ~Clock; #50; end
      
endmodule

