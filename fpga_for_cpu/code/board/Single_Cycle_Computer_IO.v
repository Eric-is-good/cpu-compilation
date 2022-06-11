`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:14:34 11/13/2015 
// Design Name: 
// Module Name:    Single_Cycle_Computer_IO 
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
module Single_Cycle_Computer_IO(
    input sys_Clock , 		//����ʱ��
	 input BTN_Clock, BTN_Reset,		//�����ź�����
	 
	 output [7:0] seg,		//�����λ������
	 output [5:0] AN_SEL,		//����ܶ�������
    output LED0 , LED1		//��������ָʾ��
    );
	 
	 reg  [31:0] clockdiv = 0;		//ʱ�ӷ�Ƶ
	 wire  Clock, Reset;		//�����ź����
	 wire [31:0] Result, addr;

	 always @ (posedge sys_Clock)  clockdiv <= clockdiv + 1;		//ʱ�ӷ�Ƶ
	 BTN_Anti_Jitter Clk ( clockdiv[16] , BTN_Clock , Clock); //��ťȥ����
	 BTN_Anti_Jitter Rst ( clockdiv[16] , BTN_Reset , Reset); //��ťȥ����
	
	 assign LED0 = BTN_Clock;		//���������ź�
	 assign LED1 = BTN_Reset;		//��λ�����ź�
 
	 //�������ʾ
	 wire [23:0] disp;
	 assign disp = {addr[7:0],Result[31:16]};		//PC��8λ+ALU�����16λ
	 Hex7seg_decode hex7(disp , clockdiv[18:16] , seg , AN_SEL);
	 
 	 //************************************************************************************************
	 //�˿��ź�˵����
	 //Reset-��λ�ź����룻Clock-ʱ���ź����룻Result-ALU�����������addr-ָ���ַ
	 //ʵ����������
	 //Single_Cycle_Computer CPU (.Reset(Reset), .Clock(Clock), .Result(Result), .addr(addr));
 	 //************************************************************************************************

		CPU CPU (.Reset(Reset), .Clock(Clock), .Result(Result), .Addr(addr));

endmodule
