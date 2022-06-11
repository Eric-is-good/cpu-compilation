`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:37:18 06/09/2022 
// Design Name: 
// Module Name:    CPU 
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
module CPU(
		input Reset, 
		input Clock, 
		output reg [31:0] Result, 
		output reg [31:0] Addr,
		
		// debug
		output reg [31:0] ALUin11,
		output reg [31:0] ALUin22,
		output reg [31:0] ALUoutt
		
		
    );
	 
		
		// Control_Unit
		wire  RegDst;
		wire  RegWrite;
		wire  ALUSrc;
		wire  MemWrite;
		wire  MemRead;
		wire  MemtoReg;
		wire  [2:0] ALU_op;
		wire  Branch;
		
		// instruction rom
		wire [31:0] addr;
		wire [31:0] Inst;
		
		// Fetch
		wire [31:0] b_addr;
		wire zero;
		
		// reg
		wire [4:0]  Wn;
	    wire [31:0]  Wd;
		wire [31:0] A,B;
		
		// ALU
		wire [31:0] ALUin2;
		wire [31:0] ALUout;
		
		// MEM
		wire [31:0] MEMout;
		
	
    Fetch Fetch(
		.reset(Reset),
		.clk(Clock),
		.b_addr(b_addr),
		.z(zero),
		.b(Branch),
		.addr(addr)
    );
	 
	
		
	 INST_ROM INST_ROM(
		.addr(addr),
		.Inst(Inst)
    );
		
	 
	 
	 Control_Unit Control_Unit(
		.func(Inst[5:0]),
		.op(Inst[31:26]),
		.RegDst(RegDst),
		.RegWrite(RegWrite),
		.ALUSrc(ALUSrc),
		.MemWrite(MemWrite),
		.MemRead(MemRead),
		.MemtoReg(MemtoReg),
		.ALU_op(ALU_op),
		.Branch(Branch)
    );
	 
	 
	 
	 MUX5 MUX5(
      .in1(Inst[20:16]),
		.in2(Inst[15:11]),
		.sel(RegDst),
		.out_data(Wn)
    );
	 
	 
	 RegFile RegFile(
			 .Rn1(Inst[25:21]),
			 .Rn2(Inst[20:16]),
			 .Wn(Wn),
			 .Write(RegWrite),
			 .Wd(Wd),
			 .A(A),
			 .B(B),
			 .Clock(Clock)
    );
	 
	 
	 SignExpand SignExpand(
		.data_16bit(Inst[15:0]),
		.data_32bit(b_addr)
    );
	 
	 
	 MUX MUX(
      .in1(B),
		.in2(b_addr),
		.sel(ALUSrc),
		.out_data(ALUin2)
    );
	 
	 
	 ALU ALU(
		.a(A),
		.b(ALUin2),
		.op(ALU_op),
		.result(ALUout),
		.zero(zero)
    );
	 
	 
	 DATA_RAM DATA_RAM(
		.Clock(Clock),
		.dataout(MEMout),
		.datain(B),
		.addr(ALUout),
		.write(MemWrite),
		.read(MemRead)
    );
	 
	 
	 MUX MUX2(
        .in1(ALUout),
		.in2(MEMout),
		.sel(MemtoReg),
		.out_data(Wd)
    );
	 
	 
	 always @ (*)
		begin
			Addr = addr;
			Result = ALUout;
			
			// debug
			ALUin11 = A;
			ALUin22 = ALUin2;
			ALUoutt = ALUout;
		
		end
	 


endmodule
