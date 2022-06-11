`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:35:57 12/17/2017 
// Design Name: 
// Module Name:    INST_ROM 
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
module INST_ROM(
	 input [31:0] addr,
	 output [31:0] Inst
    );
	 
	 wire [31:0] ram [31:0];
	 
	 assign ram[5'h00]=32'h3c01_1010;   // lui R1,0x1010 				
	 assign ram[5'h01]=32'h3c02_0101;   // lui R2,0x0101 
	 
	 assign ram[5'h02]=32'h0022_1820;   // add R3,R1,R2
	 assign ram[5'h03]=32'h0022_1822;   // sub R3,R1,R2    
	 assign ram[5'h04]=32'h0022_1824;   // and R3,R1,R2     
 	 assign ram[5'h05]=32'h0022_1825;   // or R3,R1,R2     
	 assign ram[5'h06]=32'h0022_1826;   // xor R3,R1,R2    
	 
	 assign ram[5'h07]=32'hac61_0001;   // sw R1,1(R3)     
	 assign ram[5'h08]=32'h8c64_0001;   // lw R4,1(R3) 
	 
	 assign ram[5'h09]=32'h1022_0000;   // beq R1,R2,0     
	 assign ram[5'h0a]=32'h1021_0015;   // beq R1,R1,0x0015    

	 assign Inst=ram[addr[6:2]];

endmodule
