INCLUDE ".\inc\SD028.INC"
/*CHECK_FLAG == 0X53		;BIT		7		6		5		4		3			2		1		0
						;CHECK									LCALL & LJMP 	STACK	INS		RAM
TEST_RAM_TIME == 0x54	
*/	
	ORG	0X00
	JMP	START

 	ORG	0X50
START:

	SBANK 	0
	MOV		A,@0x00
	MOV		IOCR5,A
	MOV		P5,A
	;BS		PERCS	;idle and green mode open Fm
	BC		PERCS	;0:Fs, 1:Fm
	BS		IIPS	;0:快速起震, 1:慢速起震(省電)
	BC		IDLE	;O:sleep, 1:idle
	BS		LDOI	;0:normal, 1:idle, LDO 1.5V 
	CALL	RX_Initial
	CALL	TX_Initial
	CALL	DC_Initial
	;SBANK 0
	;BC		CPUS	;Green
	;SLEP
	NOP
	JMP $
;	CLR P5
;-----------RX Initial---------------------------------------------------
RX_Initial:
	SBANK   2
	MOV     A, @0X15	;RX1E[7]->1:使能RX1, RX1ES[6:5]->edge interrupt
	MOV     RX1CR1, A	;RX1HV[4:0]->10101:RX1接收參考高電壓設11V
	
	MOV     A, @0X14	;RX1OPE[7]->1:使能RX1O (P53/RX1O)引腳
	MOV     RX1CR2, A	;RX1LV[4:0]->10100:RX1接收參考低電壓設10.5V
	
	MOV     A, @0X15	;RX2E[7]->1:使能RX2, RX2ES[6:5]->edge interrupt
	MOV     RX2CR1, A	;RX2HV[4:0]->10101:RX2接收參考高電壓設11V
	
	MOV     A, @0X14	;RX2OPE[7]->1:使能RX2O (P52/RX2O)引腳
	MOV     RX2CR2, A	;RX2LV[4:0]->10100:RX2接收參考低電壓設10.5V
	
	;RX1/RX2接收參考低電壓對照表如下：
	
	;00010->1.5V;  00011->2.0V;  00100->2.5V;  00101->3.0V;  00110->3.5V;  00111->4.0V;
	
	;01111->8.0V;  10000->8.5V;  10001->9.0V;  10010->9.5V;  10011->10.0V; 10100->10.5V;
	;10101->11.0V; 10110->11.5V; 10111->12.0V; 11000->12.5V; 11001->13.0V; 11010->13.5V;
	;11011->14.0V; 11100->14.5V; 11101->15.0V;
		
	MOV     A, @0XBB	;RX1DS[7]->1: RX1抗尖峰脈沖時鐘源Fm
	MOV     RXDCR, A	;RX1DT[6:4]->011:RX1輸出抗尖峰脈沖時間設4CLK
						;RX2DS[3]->1: RX2抗尖峰脈沖時鐘源Fm
						;RX2DT[2:0]->011:RX2輸出抗尖峰脈沖時間設4CLK
						;RXDCR: 0X99->0CLK, 0XBB->4CLK, 0XDD->16CLK, 0XFF->64CLK
	BS      RX1E		;Enable RX1
	BS      RX2E		;Enable RX2
	RET;RXIVE在TXSC[7]
;-----------TX Initial---------------------------------------------------
TX_Initial:
	SBANK	2
	MOV		A,@0X07		;TXCS[3:0]->0111:TX sink current is 40mA
	MOV		TXSC,A		;TXCS[3:0]:
						;1000->45mA, 1001->50mA, 1010->55mA, 1011->60mA
						;1100->65mA, 1101->70mA, 1110->75mA, 1111->80mA
	
	MOV     A, @0X07	;TXE[7]->1:TX on
	MOV     TXCR1, A	;TXTM[5]->0:Disable TX timer output to TXIN
						;TXSR[4:3]->00:TX Slew Rate is 0.25us
						;TXM[2:0]->111:Mode7(P62用于TXIN,測試時接地TX一直拉電流)
						
	MOV     A, @0X40	;TXS[7]->1:Start TX timer
	MOV     TXCR2, A	;TXCLK[6]->1:TX clock is Fm
						;TXDP[5:3]->000:TX delay timer prescal is 1:1
						;TXCP[2:0]->000:TX sink timer prescal is 1:1
	BS      TXE			;Enable TX
	RET
;-----------Discharge Initial---------------------------------------------------
DC_Initial:
	SBANK   2
	MOV     A, @0XB1	;CMP3DS[7]->1: CMP3抗尖峰脈沖時鐘源Fm
	MOV     LRR, A		;CMP3DT[6:4]->011:RX1輸出抗尖峰脈沖時間設4CLK
						;CL0[0]->1:2.5K, 0:1K
						;RXDCR: 0X90->0CLK, 0XB0->4CLK, 0XD0->16CLK, 0XF0->64CLK
	MOV     A, @0X0D	;CMP3E[7]->1:使能CMP3, 0:Stop CMP3
	MOV     DCCR, A		;MCDC[6]->0:Disable manual control discharge
						;DCT[4:2]->011:Discharge Time is 16CLK(16/Fm)
						;DCT[4:2]: 000->0CLK; 001->4CLK; 010->8CLK; 011->16CLK; 100->32CLK; 101->64CLK; 
						;DCR[1:0]->01:Discharge Resistance is 200K
						;DCR[1:0]: 00->400K; 01->200K; 10->100K; 11->50K; 
						
	MOV     A, @0X02;A	;DCP[3]->1:Discharge Power is VregIN pin
	MOV     DCVS, A		;DCV[2:0]->010:Discharge Voltage as LV 80%VIN,HV 90%VIN
						;DCV[2:0]: 001->85%VregIN/95%VregIN; 011->75%VregIN/85%VregIN
						;CMP3OPE[7]->1:使能CMP3O (P54/CMP3O)引腳
						;CMP3OUT[6]
	BS      CMP3E		;Enable CMP3
	RET
/*;==============================================
; RAM TEST
;==============================================
	CLR TEST_RAM_TIME

	RAM_WRITE 0,0x55,0x55		;GBANK,START_ADDRESS,VALUE
	RAM_CHECK 0,0x55,0x55		;GBANK,START_ADDRESS,VALUE
	RAM_WRITE 1,0x80,0x55		;GBANK,START_ADDRESS,VALUE
	RAM_CHECK 1,0x80,0x55		;GBANK,START_ADDRESS,VALUE

	;BS	PERCS
	BC	PERCS
	BS	IIPS
	;BC	IDLE
	BS	LDOI
	SLEP
	JMP $
	
;==============================================
; RAM FUNCTION
;==============================================
RAM_WRITE MACRO G_BANK,START_ADDR,VALUE
 GBANK G_BANK
 MOV A,@START_ADDR
 MOV RSR,A
 MOV A,@VALUE
 MOV IAR,A
 INC RSR
 JBS Z
 JMP $-3
ENDM
 
/*RAM_CHECK MACRO G_BANK,START_ADDR,VALUE
 MOV A, TEST_RAM_TIME
 AND A, @0X01
 JBC Z
 JMP $+3
 JBS CHECK_FLAG, 0
 JMP $+15
 GBANK G_BANK
 MOV A,@START_ADDR
 MOV RSR,A
 MOV A,IAR
 XOR A,@VALUE
 JBC Z 
 JMP $+3
 BC CHECK_FLAG,0
 JMP $+5  
 BS CHECK_FLAG,0 
 INC RSR
 JBS Z
 JMP $-9
 BS TEST_RAM_TIME,G_BANK
ENDM*/