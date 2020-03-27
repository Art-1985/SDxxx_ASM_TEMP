;============================================================
;	Project:		SD028_ASM_TEMP
;	FILE:			SD028_ASM_TEMP.asm
;  	Target:  		SD028
;	Author:			Arthur (Lu Hungche)
;	Date:			2020/03/11
;------------------------------------------------------------
;	Description:	For SD028 Instruction and EFT Verify
;	Active-Low: P50(Red-PWR)、P51(Yel-PUSH)、
;					
;------------------------------------------------------------
; History:
; Ver  | dd-mmm-yyyy |  Who  | Description of changes
; =====|=============|=======|===============================
;  0.1 | 11 Mat 2020 |Arthur | Original Release.
; -----|-------------|-------|-------------------------------
;  0.2 |
; -----|-------------|-------|-------------------------------
;============================================================

;==================== Project Include ====================
;Include	"SD028.INC"
Include	"SD062.INC"

;================ General Purpose Register ===============
	TMP50	== 0x50
	INST	== 0x50
	TMP51	== 0x51
	TMP52	== 0x52
	TMP53	== 0x53
	TMP54	== 0x54
	TMP55	== 0x55
	TMP56	== 0x56
	TMP57	== 0x57
	TMP58	== 0x58
	TMP59	== 0x59
	TMP5A	== 0x5A
	TMP5B	== 0x5B
	TMP5C	== 0x5C
	TMP5D	== 0x5D
	TMP5E	== 0x5E
	TMP5F	== 0x5F

	TMP80	== 0x80
	TMP81	== 0x81
	TMP82	== 0x82
	TMP83	== 0x83
	TMP84	== 0x84
	TMP85	== 0x85
	TMP86	== 0x86
	TMP87	== 0x87
	TMP88	== 0x88
	TMP89	== 0x89
	TMP8A	== 0x8A
	TMP8B	== 0x8B
	TMP8C	== 0x8C
	TMP8D	== 0x8D
	TMP8E	== 0x8E
	TMP8F	== 0x8F

;================ Interrupt Vector Table =================
	ORG		0x0002
	JMP JMP_FAIL	;0x0046
	JMP JMP_FAIL	;0x0047
	JMP JMP_FAIL	;0x0048
	JMP JMP_FAIL	;0x0049
	JMP JMP_FAIL	;0x004A
	JMP JMP_FAIL	;0x004B
	JMP JMP_FAIL	;0x004C
	JMP JMP_FAIL	;0x004D
	JMP JMP_FAIL	;0x004E
	JMP JMP_FAIL	;0x004F
;==================== Main Function ======================
	ORG 	0x0000
	JMP 	MAIN

	ORG		0x0050
MAIN:
	;CALL 	EFT_INIT
	;CALL	SYS_INIT
	;CALL	GPIO_INIT
	;CALL	WAKE_INIT
	BS		P50	;Off P50
	BS		P51	;On P51
	;CALL	KEY_DEBOUNCE
	CALL	RAM_SHA_INIT
	CALL	RAM_IND_INIT
	CALL	EEPROM_INIT

;====================== BACK_GROUND_LOOP ================
BACK_GROUND_LOOP:
	SBANK	0
	;CALL	RAM_TEST
	;CALL	EEPROM_TEST

	;CALL	TEST_INST
	CALL	TEST_INST_ARITHEMATIC	;ADD, SUB, DAA, DEC, DECA, INC, INCA, ADC, SUBB, NEG
	CALL	TEST_INST_LOGIC			;AND, OR, COM, COMA, XOR, CLR, CLRA, RLC, RLCA, RRC, RRCA, SWAP, SWAPA, BTG, RRA, RR, RLA, RL, XCH
	CALL	TEST_INST_TRANSFER		;MOV
	;CALL	TEST_INST_MANIPULATION	;BC, BS, JBC, JBS
	;CALL	TEST_INST_BRANCH		;JE R, JGE, JLE, JE K, JC, JNC, JZ, JNZ, DJZ, DJZA, JZ, JZA, RETL, CALL, JMP, LCALL, LJMP, RETI, RET, TBRD, TBRDA
	CALL	TEST_INST_CONTROL		;ENI, DISI, WDTC, SLEP, NOP 
	NOP
	JMP		BACK_GROUND_LOOP

;====================== ERROR_LOOP =====================
JMP_PASS:
	JMP		MAIN

JMP_FAIL:
	SBANK	0
	JMP		JMP_FAIL
	
RAM_FAIL:
	SBANK	0
	JMP		RAM_FAIL

INST_FAIL:
	SBANK	0
	JMP		INST_FAIL

;================== PEIPHERAL_INITIAL ==================
	;-------------------------------;
	SYS_INIT:	
		SBANK	0
		BS		CPUS	;FSYS=FM
		BC		IDLE	;SLEEP_MODE
		RETI
	;-------------------------------;		
	GPIO_INIT:
		SBANK	0
		CLR		P5
		MOV		A,@0x0F	;P50~P53 As Input, Other Setting As Output
		MOV		IOCR5,A
		MOV		A,@0xFF	;Turn-Off LED (Active-Low)
		MOV		P5,A
		RETI

	;-------------------------------;
	WAKE_INIT:
		SBANK	0
		JBS		P			; PWR ON reset(1)/RST pin reset(0)
		JMP		$+3
		BC		P5,1		; PWR ON reset,Light PWR_LED
		SLEP
		JBS		P
		JMP		$+3
		BC		P5,1		; PWR ON reset,Light PWR_LED
		SLEP
		JBS		P
		JMP		$+3
		BC		P5,1		; PWR ON reset,Light PWR_LED
		BC		P5,1		; PWR ON reset,Light PWR_LED
		SLEP		
		RETI
	;-------------------------------;
	KEY_DEBOUNCE:
		JBS		P5,2		; Push, or not
		JMP		$+2
		JMP		$-2
		JBS		P5,2
		JMP		KEY_DEBOUNCE
		JBS		P5,2
		JMP		KEY_DEBOUNCE
		JBS		P5,2
		JMP		KEY_DEBOUNCE
		JBS		P5,2
		JMP		KEY_DEBOUNCE
		JBS		P5,2
		JMP		KEY_DEBOUNCE
		JBS		P5,2
		JMP		KEY_DEBOUNCE
		JBS		P5,2
		JMP		KEY_DEBOUNCE
		JBS		P5,2
		JMP		KEY_DEBOUNCE
		JBS		P5,2
		JMP		KEY_DEBOUNCE
		JBS		P5,2
		JMP		$-2
		MOV		A,@0xFF		; Turn Off all LED
		MOV		P5,A		
		RETI
	;-------------------------------;
	RAM_SHA_INIT:
		MOV		A,@0x50
		MOV		RSR,A
		MOV		A,@0xFF		;RAM_SHA_LOOP
		MOV		IAR,A
		INC		RSR
		MOV		A,@0x80
		XOR		RSR,A
		JBS		Z
		JMP		$-6
		RETI
	;-------------------------------;		
	RAM_IND_INIT:
		MOV		A,@0x80
		MOV		RSR,A
		RAM_IND_LOOP_0:
		GBANK	0
		MOV		A,@0xFF
		MOV		IAR,A
		INC		RSR
		MOV		A,@0x00
		XOR		RSR,A
		JBS		Z
		JMP		RAM_IND_LOOP_0
		MOV		A,@0x80
		MOV		RSR,A
		RAM_IND_LOOP_1:
		GBANK	1
		MOV		A,@0xFF
		MOV		IAR,A
		INC		RSR
		MOV		A,@0x00
		XOR		RSR,A
		JBS		Z
		JMP		RAM_IND_LOOP_1
		MOV		A,@0x80
		MOV		RSR,A
		RAM_IND_LOOP_2:
		GBANK	2
		MOV		A,@0xFF
		MOV		IAR,A
		INC		RSR
		MOV		A,@0x00
		XOR		RSR,A
		JBS		Z
		JMP		RAM_IND_LOOP_2
		MOV		A,@0x80
		MOV		RSR,A
		RAM_IND_LOOP_3:
		GBANK	3
		MOV		A,@0xFF
		MOV		IAR,A
		INC		RSR
		MOV		A,@0x00
		XOR		RSR,A
		JBS		Z
		JMP		RAM_IND_LOOP_3
		RETI
	;-------------------------------;
	EEPROM_INIT:
		MOV		A,@0x80
		MOV		EECR2,A
		MOV		A,0x00
		MOV		TMP50,A
		EEPROM_INIT_LOOP:
		MOV		A,TMP50
		MOV		EERA,A
		MOV		A,@0xFF
		MOV		EERD,A
		INC		TMP50
		MOV		A,0x80
		XOR		A,TMP50
		JBS		Z
		JMP		EEPROM_INIT_LOOP
		RETI
	
;================== Jmp Sub Function ==================
	TEST_INST_ARITHEMATIC:
		INST_DAA:			;-------Instruction Test => DAA , C?
			MOV		A,@0x01
			MOV		INST,A
			MOV		A,@0x00
			MOV		STATUS,A
			;-------DAA(0xAA)=10
			MOV		A,@0xAA
			DAA
			JBS		C			; Check C = 1?
			JMP	INS_FAIL
			JBC		DC			; Check DC = 0?
			JMP	INS_FAIL
			JBC		Z			; Check Z = 0?
			JMP	INS_FAIL
			JBC		OV			; Check OV = 0?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
			XOR		A,@0x10		; Check Result ?
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
			MOV		A,@0x00
			MOV		STATUS,A
			;-------DAA(0xFF)=65
			MOV		A,@0x80
			MOV		0x50,A		; [0x50] = 0x80
			MOV		A,@0x7F		; 
			ADD		A,0x50		; A = 0x7F + 0x80 = 0xFF
			DAA
			JBS		C			; Check C = 1?
			JMP	INS_FAIL
			JBC		DC			; Check DC = 0?
			JMP	INS_FAIL
			JBC		Z			; Check Z = 0?
			JMP	INS_FAIL
			JBC		OV			; Check OV = 0?
			JMP	INS_FAIL
			JBS		N			; Check N = 1?	; Result is Negative
			JMP	INS_FAIL
			BC		Z
			BC		N
			XOR		A,@0x65		; Check Result ?
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
			NOP
			MOV		A,@0x00
			MOV		STATUS,A
			;-------DAA(0x00)=66
			BS		C
			MOV		A,@0x80
			MOV		0x50,A		; [0x50] = 0x80
			MOV		A,@0x7F		; 
			ADC		A,0x50		; A = 0x7F + 0x80
			DAA
			JBS		C			; Check C = 1? 	/ By ADC
			JMP	INS_FAIL
			JBS		DC			; Check DC = 1? / By ADC
			JMP	INS_FAIL
			JBS		Z			; Check Z = 1? 	/ By ADC
			JMP	INS_FAIL
			JBC		OV			; Check OV = 0?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
			XOR		A,@0x66		; Check Result ?
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
			MOV		A,@0x00
			MOV		STATUS,A
			;-------DAA(0x80)=E6
			MOV		A,@0xFF
			MOV		0x50,A		; [0x50] = 0xFF
			MOV		A,@0x7F		; 
			SUB		A,0x50		; A = 0xFF - 0x7F
			DAA
			JBS		C			; Check C = 1? 	/ By SUB
			JMP	INS_FAIL
			JBS		DC			; Check DC = 1? / By SUB
			JMP	INS_FAIL
			JBC		Z			; Check Z = 0?
			JMP	INS_FAIL
			JBC		OV			; Check OV = 0?
			JMP	INS_FAIL
			JBS		N			; Check N = 1?	; Result is Negative
			JMP	INS_FAIL
			BC		Z
			BC		N
			XOR		A,@0xE6		; Check Result ?
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL





		
		INST_CLA:			;-------Instruction Test => CLA
			MOV		A,@0x08
			MOV		INST,A
			MOV		A,@0x5A
			XOR		A,@0x5A		; Check Result ?
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
			MOV		A,@0x5A
			CLRA
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			BC		Z
			XOR		A,@0x00		; Check Result ?
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
		INST_CLR:			;-------Instruction Test => CLR
			MOV		A,@0x09
			MOV		INST,A
			MOV		A,@0xAA
			MOV		0x50,A
			MOV		A,0x50
			XOR		A,@0xAA		; Check Result ?
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
			CLR		0x50
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			BC		Z
			MOV		A,0x50
			XOR		A,@0x00		; Check Result ?
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
		INST_SUB_A_R:			;-------Instruction Test => SUB A,R
			MOV		A,@0x0A
			MOV		INST,A
			MOV		A,@0x00
			MOV		STATUS,A
			MOV		A,@0x02		; SUB(2-1)=1
			MOV		0x50,A		; [0x50] = 0x02
			MOV		A,@0x01
			SUB		A,0x50		; A = [0x50] - A
			JBS		C			; Check C = 1? 	; Resulet is Positive
			JMP	INS_FAIL
			JBS		DC			; Check DC = 1?	; Low-Byte is Positve
			JMP	INS_FAIL
			JBC		Z			; Check Z = 0?
			JMP	INS_FAIL
			JBC		OV			; Check OV = 0?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
			BC		Z
			XOR		A,@0x01		; Check Result ?
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
			MOV		A,@0x00
			MOV		STATUS,A
			MOV		A,@0x02		; SUB(2-2)=0
			MOV		0x50,A		; [0x50] = 0x02
			MOV		A,@0x02
			SUB		A,0x50		; A = [0x50] - A
			JBS		C			; Check C = 1?	; Result is Positive
			JMP	INS_FAIL
			JBS		DC			; Check DC = 1?	; Low-Byte is Positve
			JMP	INS_FAIL
			JBS		Z			; Check Z = 1?	; Result is Zero
			JMP	INS_FAIL
			JBC		OV			; Check OV = 0?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
			BC		Z
			XOR		A,@0x00		; Check Result ?
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
			MOV		A,@0x00
			MOV		STATUS,A
			MOV		A,@0xFF		; SUB(-1-127) = -128(0x80)
			MOV		0x50,A		; [0x50] = 0xFF
			MOV		A,@0x7F
			SUB		A,0x50		; A = [0x50] - A
			JBS		C			; Check C = 1?
			JMP	INS_FAIL
			JBS		DC			; Check DC = 1?
			JMP	INS_FAIL
			JBC		Z			; Check Z = 0?
			JMP	INS_FAIL
			JBC		OV			; Check OV = 0?
			JMP	INS_FAIL
			JBS		N			; Check N = 1?
			JMP	INS_FAIL
			BC		Z
			BC		N
			XOR		A,@0x80		; Check Result ?
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
			MOV		A,@0x00
			MOV		STATUS,A
			MOV		A,@0x80		; SUB(-128-127) = 1(0x01)
			MOV		0x50,A		; [0x50] = 0x80
			MOV		A,@0x7F
			SUB		A,0x50		; A = [0x50] - A
			JBS		C			; Check C = 1?
			JMP	INS_FAIL
			JBC		DC			; Check DC = 0?
			JMP	INS_FAIL
			JBC		Z			; Check Z = 0?
			JMP	INS_FAIL
			JBS		OV			; Check OV = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
			BC		Z
			BC		N
			XOR		A,@0x01		; Check Result ?
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
			MOV		A,@0x00
			MOV		STATUS,A
			MOV		A,@0x01		; SUB(1-3) = -2(0xFE)
			MOV		0x50,A		; [0x50] = 0x01
			MOV		A,@0x03
			SUB		A,0x50		; A = [0x50] - A
			JBC		C			; Check C = 0?
			JMP	INS_FAIL
			JBC		DC			; Check DC = 0?
			JMP	INS_FAIL
			JBC		Z			; Check Z = 0?
			JMP	INS_FAIL
			JBC		OV			; Check OV = 0?
			JMP	INS_FAIL
			JBS		N			; Check N = 1?
			JMP	INS_FAIL
			BC		Z
			BC		N
			XOR		A,@0xFE		; Check Result ?
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
		INST_SUB_R_A:			;-------Instruction Test => SUB R,A
			MOV		A,@0x0B
			MOV		INST,A
			MOV		A,@0x00
			MOV		STATUS,A
			MOV		A,@0x02
			MOV		0x50,A		; [0x50] = 0x02
			MOV		A,@0x01
			SUB		0x50,A		; [0x50] = [0x50] - 0x01
			MOV		A,STATUS
			XOR		A,@0x1B		; for non reset
			;;XOR		A,@0x13
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
			BC		Z
			BC		N
			MOV		A,0x50
			XOR		A,@0x01		; Check Result ?
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
			MOV		A,@0x00
			MOV		STATUS,A
			MOV		A,@0x02
			MOV		0x50,A		; [0x50] = 0x02
			MOV		A,@0x02
			SUB		0x50,A		; [0x50] = [0x50] - 0x02
			MOV		A,STATUS
			XOR		A,@0x1F		; for nono reset
			;;XOR		A,@0x17
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
			BC		Z
			BC		N
			MOV		A,0x50
			XOR		A,@0x00		; Check Result ?
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
			MOV		A,@0x00
			MOV		STATUS,A
			MOV		A,@0x80
			MOV		0x50,A		; [0x50] = 0x80
			MOV		A,@0x01
			SUB		0x50,A		; [0x50] = [0x50] - 0x01
			MOV		A,STATUS
			XOR		A,@0x39	;; for non reset
			;;XOR		A,@0x31
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
			BC		Z
			BC		N
			MOV		A,0x50
			XOR		A,@0x7F		; Check Result ?
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
		RETI
	TEST_INST_LOGIC:
		INST_BTG:			;-------Instruction Test => BTG R,b	
			MOV		A,@0x06
			MOV		INST,A
			MOV		A,@0x00
			MOV		P5,A
			BTG		P5,0
			MOV		A,P5
			XOR		A,@0x01		; Check Result ?
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
			MOV		A,@0xFF
			MOV		RSR,A		; Start Address
			BTG		RSR
			MOV		A,RSR
			XOR		A,@0xFE		; Check Result ?
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
		RETI
	TEST_INST_TRANSFER:
		INST_MOV:			;-------Instruction Test => MOV R,A
			MOV		A,@0x07
			MOV		INST,A
			MOV		A,@0x00
			MOV		STATUS,A
			MOV		A,@0xFF
			MOV		0x50,A
			MOV		A,STATUS
			XOR		A,@0x98		; Check Status ? ;; For not reset
			;;XOR		A,@0x10		; Check Status ?
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
			MOV		A,0x50
			XOR		A,@0xFF		; Check Result ?
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
		RETI
	
	
	TEST_INST_CONTROL:
		INST_ENI:			;-------Instruction Test => ENI , IT?
			MOV		A,@0x04
			MOV		INST,A
			ENI
			JBS		IT		; Check IT = 1?
			JMP	INS_FAIL
		INST_DISI:			;-------Instruction Test => DISI , IT?
			MOV		A,@0x05
			MOV		INST,A
			DISI
			JBC		IT		; Check IT = 0?
			JMP	INS_FAIL
		RETI

TEST_INST:	
	;========== Instruction Test => CALL k
	;MOV		A,@0x02
	;MOV		INST,A
	;MOV		A,@0x00
	;MOV		STATUS,A
		;MOV		A,@0x03
		;MOV		0x50,A
		;CALL	CALL_Test
		;MOV		A,0x50
		;XOR		A,@0x04		; Check Result ?
		;JBS		Z			; Check Z = 1?
		;JMP	INS_FAIL
		;JBC		N			; Check N = 0?
		;JMP	INS_FAIL

	;========== Instruction Test => LCALL k
	;MOV		A,@0x03
	;MOV		INST,A
	;MOV		A,@0x00
	;MOV		STATUS,A
		;MOV		A,@0x03
		;MOV		0x51,A
		;LCALL	LCALL_Test
		;MOV		A,0x51
		;XOR		A,@0x04		; Check Result ?
		;JBS		Z			; Check Z = 1?
		;JMP	INS_FAIL
		;JBC		N			; Check N = 0?
		;JMP	INS_FAIL
	




	;========== Instruction Test => DECA R
	;0x20-1,0x01-1,0x00-1,0x80-1
	MOV		A,@0x0C
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x20
		MOV		0x50,A		; [0x50] = 0x20
		DECA	0x50		; A = [0x50] - 1
		JBS		C			; Check C = 1?	; Result is Positive
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBC		Z			; Check Z = 0?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		XOR		A,@0x1F		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x01
		MOV		0x50,A		; [0x50] = 0x01
		DECA	0x50		; A = [0x50] - 1
		JBS		C			; Check C = 1?	; Result is Positive
		JMP	INS_FAIL
		JBS		DC			; Check DC = 1?
		JMP	INS_FAIL
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		BC		Z
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x00
		MOV		0x50,A		; [0x50] = 0x00
		DECA	0x50		; A = [0x50] - 1
		JBC		C			; Check C = 0?
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBC		Z			; Check Z = 0?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBS		N			; Check N = 1?
		JMP	INS_FAIL
		BC		Z
		BC		N
		XOR		A,@0xFF		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x80
		MOV		0x50,A		; [0x50] = 0x80
		DECA	0x50		; A = [0x50] - 1
		JBS		C			; Check C = 1?
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBC		Z			; Check Z = 0?
		JMP	INS_FAIL
		JBS		OV			; Check OV = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		BC		Z
		BC		N
		XOR		A,@0x7F		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

	;========== Instruction Test => DEC R
	;0x20-1,0x01-1,0x00-1,0x80-1
	MOV		A,@0x0D
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x20
		MOV		0x50,A		; [0x50] = 0x20
		DEC		0x50		; [0x50] = [0x50] - 0x01
		MOV		A,STATUS
		XOR		A,@0x19		; Check Status ? for non rest
		;;XOR		A,@0x11		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		BC		Z
		MOV		A,0x50
		XOR		A,@0x1F		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x01
		MOV		0x50,A		; [0x50] = 0x01
		DEC		0x50		; [0x50] = [0x50] - 0x01
		MOV		A,STATUS
		XOR		A,@0x1F		; Check Status ? for non reset
		;;XOR		A,@0x17		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		BC		Z
		MOV		A,0x50
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x00
		MOV		0x50,A		; [0x50] = 0x00
		DEC		0x50		; [0x50] = [0x50] - 0x01
		MOV		A,STATUS
		XOR		A,@0x58		; Check Status ? for non reset
		;;XOR		A,@0x50		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		BC		Z
		MOV		A,0x50
		XOR		A,@0xFF		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x80
		MOV		0x50,A		; [0x50] = 0x80
		DEC		0x50		; [0x50] = [0x50] - 0x01
		MOV		A,STATUS
		XOR		A,@0x39		; Check Status ? for non reset
		;;XOR		A,@0x31		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		BC		Z
		MOV		A,0x50
		XOR		A,@0x7F		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		
	;========== Instruction Test => OR A,R
	MOV		A,@0x0E
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x00
		MOV		0x50,A		; [0x50] = 0x00
		MOV		A,@0x00
		BC		Z
		OR		A,0x50		; A = A | [0x50]
		JBC		C			; Check C = 0?
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		BC		Z
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x55
		MOV		0x50,A		; [0x50] = 0x55
		MOV		A,@0xAA
		BC		Z
		OR		A,0x50		; A = A | [0x50]
		JBC		C			; Check C = 0?
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBC		Z			; Check Z = 0?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBS		N			; Check N = 1?
		JMP	INS_FAIL
		BC		Z
		XOR		A,@0xFF		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

	;========== Instruction Test => OR R,A
	MOV		A,@0x0F
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x00
		MOV		0x50,A		; [0x50] = 0x00
		MOV		A,@0x00		; A = 0x00
		BC		Z
		OR		0x50,A		; [0x50] = A | [0x50]
		MOV		A,STATUS
		XOR		A,@0x1C		; Check Status ? for non reset
		;;XOR		A,@0x14		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50		; A = Result[0x50]
		BC		Z
		BC		N
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x55
		MOV		0x50,A		; [0x50] = 0x55
		MOV		A,@0xAA		; A = 0xAA
		OR		0x50,A		; [0x50] = 0xAA | 0x55
		MOV		A,STATUS
		XOR		A,@0x58		; Check Status ? for non reset
		;;XOR		A,@0x50		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		BC		Z
		BC		N
		XOR		A,@0xFF		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

	;========== Instruction Test => AND A,R
	MOV		A,@0x10
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x55
		MOV		0x50,A		; [0x50] = 0x55
		MOV		A,@0xAA
		AND		A,0x50		; A = 0xAA & 0x55
		JBC		C			; Check C = 0?
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0xF5
		MOV		0x50,A		; [0x50] = 0xF5
		MOV		A,@0xFA
		AND		A,0x50		; A = 0xFA & 0xF5
		JBC		C			; Check C = 0?
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBC		Z			; Check Z = 0?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBS		N			; Check N = 1?
		JMP	INS_FAIL
		XOR		A,@0xF0		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		
	;========== Instruction Test => AND R,A
	MOV		A,@0x11
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x55
		MOV		0x50,A		; [0x50] = 0x55
		MOV		A,@0xAA
		AND		0x50,A		; [0x50] = 0xAA & 0x55
		MOV		A,STATUS
		XOR		A,@0x1C		; Check Status ? for non reset
		;;XOR		A,@0x14		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		BC		Z
		MOV		A,0x50
		BC		Z
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0xF5
		MOV		0x50,A		; [0x50] = 0xF5
		MOV		A,@0xFA
		AND		0x50,A		; [0x50] = 0xFA & 0xF5
		MOV		A,STATUS
		XOR		A,@0x58		; Check Status ? for non reset
		;;XOR		A,@0x50		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		BC		Z
		MOV		A,0x50
		BC		Z
		XOR		A,@0xF0		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		
	;========== Instruction Test => ADD A,R
	;0x80+0x7F,0xFF+0x01,0x7F+0x01
	MOV		A,@0x12
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x80
		MOV		0x50,A		; [0x50] = 0x80
		MOV		A,@0x7F		; 
		ADD		A,0x50		; A = 0x7F + 0x80
		JBC		C			; Check C = 0?
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBC		Z			; Check Z = 0?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBS		N			; Check N = 1?	; Result is Negative
		JMP	INS_FAIL
		BC		Z
		BC		N
		XOR		A,@0xFF		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0xFF
		MOV		0x50,A		; [0x50] = 0xFF
		MOV		A,@0x01		; 
		ADD		A,0x50		; A = 0x01 + 0xFF
		JBS		C			; Check C = 1?
		JMP	INS_FAIL
		JBS		DC			; Check DC = 1?
		JMP	INS_FAIL
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		BC		Z
		BC		N
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x7F
		MOV		0x50,A		; [0x50] = 0x7F
		MOV		A,@0x01		; 
		ADD		A,0x50		; A = 0x01 + 0x7F
		JBC		C			; Check C = 0?
		JMP	INS_FAIL
		JBS		DC			; Check DC = 1?
		JMP	INS_FAIL
		JBC		Z			; Check Z = 0?
		JMP	INS_FAIL
		JBS		OV			; Check OV = 1?
		JMP	INS_FAIL
		JBS		N			; Check N = 1?
		JMP	INS_FAIL
		BC		Z
		BC		N
		XOR		A,@0x80		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		
	;========== Instruction Test => ADD R,A
	;0x80+0x7F,0xFF+0x01,0x7F+0x01
	MOV		A,@0x13
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x80
		MOV		0x50,A		; [0x50] = 0x80
		MOV		A,@0x7F		; A = 0x7F
		ADD		0x50,A		; [0x50] = 0x80 + 0x7F
		MOV		A,STATUS
		XOR		A,@0x58		; Check Status ? for non reset
		;;XOR		A,@0x50		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		XOR		A,@0xFF		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0xFF
		MOV		0x50,A		; [0x50] = 0xFF
		MOV		A,@0x01		; A = 0x01
		ADD		0x50,A		; [0x50] = 0xFF + 0x01
		MOV		A,STATUS
		XOR		A,@0x1F		; Check Status ? for non reset
		;;XOR		A,@0x17		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x7F
		MOV		0x50,A		; [0x50] = 0x7F
		MOV		A,@0x01		; A = 0x01
		ADD		0x50,A		; [0x50] = 0x7F + 0x01
		MOV		A,STATUS
		XOR		A,@0x7A		; Check Status ? for non reset
		;;XOR		A,@0x72		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		XOR		A,@0x80		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

	;========== Instruction Test => MOV R,R ; R=R
	MOV		A,@0x14
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x00
		MOV		0x50,A		; [0x50] = 0x00		
		MOV		0x50,0x50	; [0x50] = [0x50]
		MOV		A,STATUS
		XOR		A,@0x1C		; Check Status ?
		;;XOR		A,@0x14		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		BC		Z
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x00
		MOV		0x50,A		; [0x50] = 0x00		
		MOV		0x50,0x50	; [0x50] = [0x50]
		BS		0x50,0
		MOV		A,0x50
		XOR		A,@0x01		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

	;========== Instruction Test => COMA R
	MOV		A,@0x15
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0xFF
		MOV		0x50,A		; [0x50] = 0xFF
		COMA	0x50		; A = /R
		JBC		C			; Check C = 0?
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL	
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x05
		MOV		0x50,A		; [0x50] = 0x05
		COMA	0x50		; A = /R
		JBC		C			; Check C = 0?
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBC		Z			; Check Z = 0?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBS		N			; Check N = 1?
		JMP	INS_FAIL
		XOR		A,@0xFA		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

	;========== Instruction Test => COM R
	MOV		A,@0x16
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0xFF
		MOV		0x50,A		; [0x50] = 0xFF
		COM		0x50		; [0x50] = /[0x50]
		MOV		A,STATUS
		XOR		A,@0x1C		; Check Status ?
		;;XOR		A,@0x14		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		BC		Z
		BC		N
		MOV		A,0x50
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x00
		MOV		0x50,A		; [0x50] = 0xFF
		COM		0x50		; [0x50] = /[0x50]
		MOV		A,STATUS
		XOR		A,@0x58		; Check Status ?
		;;XOR		A,@0x50		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		BC		Z
		BC		N
		MOV		A,0x50
		XOR		A,@0xFF		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

	;========== Instruction Test => INCA R
	;0x7F+0x01,0xFF+0x01
	MOV		A,@0x17
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x7F
		MOV		0x50,A		; [0x50] = 0x7F
		INCA	0x50		; A = [0x50] +1		
		JBC		C			; Check C = 0?
		JMP	INS_FAIL
		JBS		DC			; Check DC = 1?
		JMP	INS_FAIL
		JBC		Z			; Check Z = 0?
		JMP	INS_FAIL
		JBS		OV			; Check OV = 1?
		JMP	INS_FAIL
		JBS		N			; Check N = 1?
		JMP	INS_FAIL
		BC		Z
		BC		N
		XOR		A,@0x80		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0xFF
		MOV		0x50,A		; [0x50] = 0xFF
		INCA	0x50		; A = [0x50] +1		
		JBS		C			; Check C = 1?
		JMP	INS_FAIL
		JBS		DC			; Check DC = 1?
		JMP	INS_FAIL
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		BC		Z
		BC		N
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

	;========== Instruction Test => INC R
	;0x7F+0x01,0xFF+0x01
	MOV		A,@0x18
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x7F
		MOV		0x50,A		; [0x50] = 0x7F
		INC		0x50		; [0x50] = [0x50] + 0x01
		MOV		A,STATUS
		XOR		A,@0x7A		; Check Status ?
		;;XOR		A,@0x72		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		XOR		A,@0x80		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0xFF
		MOV		0x50,A		; [0x50] = 0x7F
		INC		0x50		; [0x50] = [0x50] + 0x01
		MOV		A,STATUS
		XOR		A,@0x1F		; Check Status ?
		;;XOR		A,@0x17		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		
	;========== Instruction Test => DJZA R
	MOV		A,@0x19
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x01
		MOV		0x50,A		; [0x50] = 0x01
		DJZA	0x50		; A = [0x50] - 0x01,if z,skip
		JMP	INS_FAIL
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x02
		MOV		0x50,A		; [0x50] = 0x02
		DJZA	0x50		; A = [0x50] - 0x01,if z,skip
		JMP		$+2
		JMP	INS_FAIL

	;GBANK   1
	;MOV		A,@0x50
	;MOV		RSR,A			; Start Address
	;MOV		A,@0xAF			; For count from 0x50~0xFF
	;MOV		0xFF,A			; [0xFF] = 0xAF, count value

	;========== Instruction Test => DJZ R
	MOV		A,@0x1A
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x01
		MOV		0x50,A		; [0x50] = 0x01
		DJZ		0x50		; [0x50] = [0x50] - 1,if z,skip
		JMP	INS_FAIL
		MOV		A,0x50
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x02
		MOV		0x50,A		; [0x50] = 0x02
		DJZ		0x50		; [0x50] = [0x50] - 1,if z,skip
		JMP		$+2
		JMP	INS_FAIL

	;========== Instruction Test => RRCA R
	MOV		A,@0x1B
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		BS		C
		MOV		A,@0xAA
		MOV		0x50,A		; [0x50] = 0xAA
		RRCA	0x50		; A = [0x50] >> 1
		JBC		C			; Check C = 0?
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBC		Z			; Check Z = 0?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBS		N			; Check N = 1?
		JMP	INS_FAIL
		XOR		A,@0xD5		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x55
		MOV		0x50,A		; [0x50] = 0x55
		RRCA	0x50		; A = [0x50] >> 1
		JBS		C			; Check C = 1?
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBC		Z			; Check Z = 0?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		XOR		A,@0x2A		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

	;========== Instruction Test => RRC R
	MOV		A,@0x1C
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		BS		C
		MOV		A,@0xAA
		MOV		0x50,A		; [0x50] = 0xAA
		BC		Z
		RRC		0x50		; [0x50] = [0x50] >> 1
		MOV		A,STATUS
		XOR		A,@0x58		; Check Status ?
		;;XOR		A,@0x50		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL	
		MOV		A,0x50
		XOR		A,@0xD5		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x55
		MOV		0x50,A		; [0x50] = 0x55
		BC		Z
		RRC		0x50		; [0x50] = [0x50] >> 1
		MOV		A,STATUS
		XOR		A,@0x19		; Check Status ?
		;;XOR		A,@0x11		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		XOR		A,@0x2A		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

	;========== Instruction Test => RLCA R
	MOV		A,@0x1D
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		BS		C
		MOV		A,@0x55
		MOV		0x50,A		; [0x50] = 0x55
		RLCA	0x50		; A = [0x50] << 1
		JBC		C			; Check C = 0?
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBC		Z			; Check Z = 0?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBS		N			; Check N = 1?
		JMP	INS_FAIL
		XOR		A,@0xAB		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0xAA
		MOV		0x50,A		; [0x50] = 0xAA
		RLCA	0x50		; A = [0x50] << 1
		JBS		C			; Check C = 1?
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBC		Z			; Check Z = 0?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		XOR		A,@0x54		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL


	;========== Instruction Test => RLC R
	MOV		A,@0x1E
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		BS		C
		MOV		A,@0x55
		MOV		0x50,A		; [0x50] = 0x55
		RLC		0x50		; [0x50] = [0x50] << 1
		MOV		A,STATUS
		XOR		A,@0x58		; Check Status ?
		;;XOR		A,@0x50		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		XOR		A,@0xAB		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0xAA
		MOV		0x50,A		; [0x50] = 0xAA
		RLC		0x50		; [0x50] = [0x50] << 1
		MOV		A,STATUS
		XOR		A,@0x19		; Check Status ?
		;;XOR		A,@0x11		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		XOR		A,@0x54		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

	;========== Instruction Test => SWAPA R
	MOV		A,@0x1F
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x5A
		MOV		0x50,A		; [0x50] = 0x5A
		SWAPA	0x50
		XOR		A,@0xA5		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

	;========== Instruction Test => SWAP R
	MOV		A,@0x20
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x5A
		MOV		0x50,A		; [0x50] = 0x5A
		SWAP	0x50
		MOV		A,0x50
		XOR		A,@0xA5		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

	;========== Instruction Test => JZA R
	MOV		A,@0x21
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0xFF
		MOV		0x50,A
		JZA		0x50		; A = [0x50] + 1,if 0 skip
		JMP		INS_FAIL
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x80
		MOV		0x50,A
		JZA		0x50		; A = [0x50] + 1,if 0 skip
		JMP		$+2
		JMP		INS_FAIL
		

	;========== Instruction Test => JZ R
	MOV		A,@0x22
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0xFF
		MOV		0x50,A		; [0x50] = 0xFF
		JZ		0x50		; [0x50] = [0x50] + 1,if 0 skip
		JMP		INS_FAIL
		MOV		A,0x50
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x80
		MOV		0x50,A		; [0x50] = 0xFF
		JZ		0x50		; [0x50] = [0x50] + 1,if 0 skip
		JMP		$+2
		JMP		INS_FAIL
		
	;========== Instruction Test => JE R
	MOV		A,@0x23
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x5A
		MOV		0x50,A		; [0x50] = 0x5A
		JE		0x50		; [0x50] = A?
		JMP		INS_FAIL
		MOV		A,@0x5B
		MOV		0x50,A		; [0x50] = 0x5B
		MOV		A,@0x5C
		JE		0x50		; [0x50] = A(0x5C)?
		JMP		$+2
		JMP		INS_FAIL
		
	;========== Instruction Test => JGE R
	MOV		A,@0x24
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x7F
		MOV		0x50,A		; [0x50] = 0x7F
		MOV		A,@0x00
		JGE		0x50		; [0x50] > A ?
		JMP		INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0xFF
		MOV		0x50,A		; [0x50] = 0xFF
		MOV		A,@0x80
		JGE		0x50		; [0x50] > A ?
		JMP		INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x00
		MOV		0x50,A		; [0x50] = 0x00
		MOV		A,@0xFF
		JGE		0x50		; [0x50] > A(0xFF) ?x
		JMP		$+2
		JMP		INS_FAIL

	;========== Instruction Test => JLE R
	MOV		A,@0x25
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x00
		MOV		0x50,A		; [0x50] = 0x00
		MOV		A,@0x7F
		JLE		0x50		; [0x50] < A ?
		JMP		INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x80
		MOV		0x50,A		; [0x50] = 0x80
		MOV		A,@0xFF
		JLE		0x50		; [0x50] < A ?
		JMP		INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0xFF
		MOV		0x50,A		; [0x50] = 0xFF
		MOV		A,@0x00
		JLE		0x50		; [0x50] < A(0x00) ?x
		JMP		$+2
		JMP		INS_FAIL

	;========== Instruction Test => OR A,k
	MOV		A,@0x26
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0xA5
		OR		A,@0x5A		; A = 0xA5 | 0x5A
		XOR		A,@0xFF		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

	;========== Instruction Test => JE k
	MOV		A,@0x27
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x7F
		JE		@0x7F
		JMP	INS_FAIL
/*
	;========== Instruction Test => TBLRD R
	MOV		A,@0x28
	MOV		INST,A
		SBANK	1
		MOV		A,@0xFF
		MOV		TBPTL,A
		MOV		A,@0x01
		MOV		TBPTH,A
		SBANK	0
		TBRDA	0x50		; [0x50]+ A = [TABPTR] 
		XOR		A,@0x40		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		XOR		A,@0x58		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

		SBANK	1
		MOV		A,@0xFF
		MOV		TBPTL,A
		MOV		A,@0x01
		MOV		TBPTH,A
		INC		TBPTH
		SBANK	0
		TBRDA	0x50		; [0x50]+ A = [TABPTR] 
		XOR		A,@0x40		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		XOR		A,@0x58		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

		SBANK	1
		MOV		A,@0xFF
		MOV		TBPTL,A
		MOV		A,@0xFF
		MOV		TBPTH,A
		SBANK	0
		TBRDA	0x50		; [0x50]+ A = [TABPTR] 
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
*/
	;========== Instruction Test => AND A,k
	MOV		A,@0x29
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0xAA
		AND		A,@0x55		; A = 0xAA & 0x55
		JBC		C			; Check C = 0?
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0xAA
		AND		A,@0xFF		; A = A & 0xFF
		JBC		C			; Check C = 0?
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBC		Z			; Check Z = 0?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBS		N			; Check N = 1?
		JMP	INS_FAIL
		XOR		A,@0xAA		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

	;========== Instruction Test => RRA R
	MOV		A,@0x2A
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x55
		MOV		0x50,A		; [0x50] = 0x55
		RRA		0x50		; A = [0x50] >> 1
		JBC		C			; Check C = 0?
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBC		Z			; Check Z = 0?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBS		N			; Check N = 1?
		JMP	INS_FAIL
		XOR		A,@0xAA		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		
	;========== Instruction Test => RR R
	MOV		A,@0x2B
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A	
		MOV		A,@0x55
		MOV		0x50,A		; [0x50] = 0x55
		RR		0x50		; [0x50] = [0x50] >> 1
		MOV		A,STATUS
		XOR		A,@0x58		; Check Status ?
		;;XOR		A,@0x50		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		XOR		A,@0xAA		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

	;========== Instruction Test => XCH R
	MOV		A,@0x2D
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x55
		MOV		0x50,A		; [0x50] = 0x55
		MOV		A,@0xAA
		XCH		0x50		; [0x50] <-> A
		XOR		A,@0x55		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		XOR		A,@0xAA		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

	;========== Instruction Test => RLA R
	MOV		A,@0x2E
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A	
		MOV		A,@0x5A
		MOV		0x50,A		; [0x50] = 0x5A
		RLA		0x50		; A = [0x50] << 1
		JBC		C			; Check C = 0?
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBC		Z			; Check Z = 0?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBS		N			; Check N = 1?
		JMP	INS_FAIL
		XOR		A,@0xB4		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

	;========== Instruction Test => RL R
	MOV		A,@0x2F
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x5A
		MOV		0x50,A		; [0x50] = 0xA5
		RL		0x50		; [0x50] = [0x50] << 1
		MOV		A,STATUS
		XOR		A,@0x58		; Check Status ?
		;;XOR		A,@0x50		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		XOR		A,@0xB4		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

	;========== Instruction Test => SUB A,k
	;0xFF-0xFF,0x00-0x7F,0x80-0x01
	MOV		A,@0x30
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0xFF
		SUB		A,@0xFF		; A = 0xFF - 0xFF
		JBS		C			; Check C = 1?
		JMP	INS_FAIL
		JBS		DC			; Check DC = 1?
		JMP	INS_FAIL
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x7F
		SUB		A,@0x00		; A = 0x00 - 0x7F
		JBC		C			; Check C = 0?
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBC		Z			; Check Z = 0?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBS		N			; Check N = 1?
		JMP	INS_FAIL
		XOR		A,@0x81		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x01
		SUB		A,@0x80		; A = 0x80 - 0x01
		JBS		C			; Check C = 1?
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBC		Z			; Check Z = 0?
		JMP	INS_FAIL
		JBS		OV			; Check OV = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		XOR		A,@0x7F		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		
	;========== Instruction Test => SUBB A,R
	;0x00-0xFF,0x00-0x7F,0x80-0x01
	MOV		A,@0x31
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		BC		C			; B = 1
		MOV		A,@0x00
		MOV		0x50,A		; [0x50] = 0x00
		MOV		A,@0xFF		; A = 0x01
		SUBB	A,0x50		; A = [0x50] - A - B
		JBC		C			; Check C = 0?
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL	
	MOV		A,@0x00
	MOV		STATUS,A
		BC		C			; B = 1
		MOV		A,@0x00
		MOV		0x50,A		; [0x50] = 0x00
		MOV		A,@0x7F		; A = 0x01
		SUBB	A,0x50		; A = [0x50] - A - B
		JBC		C			; Check C = 0?
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBC		Z			; Check Z = 0?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBS		N			; Check N = 1?
		JMP	INS_FAIL
		XOR		A,@0x80		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		BC		C			; B = 1
		MOV		A,@0x80
		MOV		0x50,A		; [0x50] = 0x80
		MOV		A,@0x01		; A = 0x01
		SUBB	A,0x50		; A = [0x50] - A - B
		JBS		C			; Check C = 1?
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBC		Z			; Check Z = 0?
		JMP	INS_FAIL
		JBS		OV			; Check OV = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		XOR		A,@0x7E		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

	;========== Instruction Test => SUBB R,A
	;0x00-0xFF,0x00-0x7F,0x80-0x01
	MOV		A,@0x32
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		BC		C			; B = 1
		MOV		A,@0x00
		MOV		0x50,A		; [0x50] = 0x00
		MOV		A,@0xFF
		SUBB	0x50,A		; [0x50] = 0x00 - 0xFF - B
		MOV		A,STATUS
		XOR		A,@0x1C		; Check Status ?
		;;XOR		A,@0x14		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		BC		C			; B = 1
		MOV		A,@0x00
		MOV		0x50,A		; [0x50] = 0x00
		MOV		A,@0x7F
		SUBB	0x50,A		; [0x50] = 0x00 - 0x7F - B
		MOV		A,STATUS
		XOR		A,@0x58		; Check Status ?
		;;XOR		A,@0x50		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		XOR		A,@0x80		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		BC		C			; B = 1
		MOV		A,@0x80
		MOV		0x50,A		; [0x50] = 0x80
		MOV		A,@0x01
		SUBB	0x50,A		; [0x50] = 0x80 - 0x01 - B
		MOV		A,STATUS
		XOR		A,@0x39		; Check Status ?
		;;XOR		A,@0x31		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		XOR		A,@0x7E		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
/*
	;========== Instruction Test => TBRD R
	MOV		A,@0x33
	MOV		INST,A
		SBANK	1
		MOV		A,@0xFF
		MOV		TBPTL,A
		MOV		A,@0x01
		MOV		TBPTH,A
		SBANK	0
		TBRD	0x50
		MOV		A,0x50
		XOR		A,@0x40		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		
		SBANK	1
		MOV		A,@0x00
		MOV		TBPTL,A
		MOV		A,@0x02
		MOV		TBPTH,A
		DEC		TBPTL
		SBANK	0
		TBRD	0x50
		MOV		A,0x50
		XOR		A,@0x40		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
*/	
	;========== Instruction Test => ADD A,k
	;0x7F+0x01,0xFF+0x01,0x80+0x7F
	MOV		A,@0x34
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x7F
		ADD		A,@0x01		; A = 0x01 + A
		JBC		C			; Check C = 0?
		JMP	INS_FAIL
		JBS		DC			; Check DC = 1?
		JMP	INS_FAIL
		JBC		Z			; Check Z = 0?
		JMP	INS_FAIL
		JBS		OV			; Check OV = 1?
		JMP	INS_FAIL
		JBS		N			; Check N = 1?
		JMP	INS_FAIL
		XOR		A,@0x80		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0xFF
		ADD		A,@0x01		; A = 0x01 + A
		JBS		C			; Check C = 1?
		JMP	INS_FAIL
		JBS		DC			; Check DC = 1?
		JMP	INS_FAIL
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x7F
		ADD		A,@0x80		; A = 0x80 + A
		JBC		C			; Check C = 0?
		JMP	INS_FAIL
		JBC		DC			; Check DC = 0?
		JMP	INS_FAIL
		JBC		Z			; Check Z = 0?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBS		N			; Check N = 1?
		JMP	INS_FAIL
		XOR		A,@0xFF		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

	;========== Instruction Test => NEG R
	; 0x00,0x01,0x80,0xFF
	MOV		A,@0x35
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x00
		MOV		0x50,A		; [0x50] = 0x00
		NEG		0x50
		MOV		A,STATUS
		XOR		A,@0x1F		; Check Status ?
		;;XOR		A,@0x17		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x01
		MOV		0x50,A		; [0x50] = 0x01
		NEG		0x50
		MOV		A,STATUS
		XOR		A,@0x58		; Check Status ?
		;;XOR		A,@0x50		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		XOR		A,@0xFF		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		MOV		A,@0x80
		MOV		0x50,A		; [0x50] = 0x80
		NEG		0x50
		MOV		A,STATUS
		XOR		A,@0x7A		; Check Status ?
		;;XOR		A,@0x72		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		XOR		A,@0x80		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		
	;========== Instruction Test => ADC A,R
	;0x7F+0x00,0x80+0x7F
	MOV		A,@0x36
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		BS		C
		MOV		A,@0x7F
		MOV		0x50,A		; [0x50] = 0x7F
		MOV		A,@0x00		; A = 0x00
		ADC		A,0x50		; A = A + [0x50] + C
		JBC		C			; Check C = 0?
		JMP	INS_FAIL
		JBS		DC			; Check DC = 1?
		JMP	INS_FAIL
		JBC		Z			; Check Z = 0?
		JMP	INS_FAIL
		JBS		OV			; Check OV = 1?
		JMP	INS_FAIL
		JBS		N			; Check N = 1?
		JMP	INS_FAIL
		XOR		A,@0x80		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		BS		C
		MOV		A,@0x80
		MOV		0x50,A		; [0x50] = 0x80
		MOV		A,@0x7F		; A = 0x7F
		ADC		A,0x50		; A = A + [0x50] + C
		JBS		C			; Check C = 1?
		JMP	INS_FAIL
		JBS		DC			; Check DC = 1?
		JMP	INS_FAIL
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		OV			; Check OV = 0?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL

	;========== Instruction Test => ADC R,A
	;0x7F+0x00,0x80+0x7F
	MOV		A,@0x37
	MOV		INST,A
	MOV		A,@0x00
	MOV		STATUS,A
		BS		C
		MOV		A,@0x7F
		MOV		0x50,A		; [0x50] = 0x7F
		MOV		A,@0x00		; A = 0x00
		BC		Z
		ADC		0x50,A		; TMP1 = A + [0x50] + C
		MOV		A,STATUS
		XOR		A,@0x7A		; Check Status ?
		;;XOR		A,@0x72		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		XOR		A,@0x80		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
	MOV		A,@0x00
	MOV		STATUS,A
		BS		C
		MOV		A,@0x80
		MOV		0x50,A		; [0x50] = 0x80
		MOV		A,@0x7F		; A = 0x7F
		BC		Z
		ADC		0x50,A		; TMP1 = A + [0x50] + C
		MOV		A,STATUS
		XOR		A,@0x1F		; Check Status ?
		;;XOR		A,@0x17		; Check Status ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		MOV		A,0x50
		XOR		A,@0x00		; Check Result ?
		JBS		Z			; Check Z = 1?
		JMP	INS_FAIL
		JBC		N			; Check N = 0?
		JMP	INS_FAIL
		NOP
		NOP
		;JMP	IAJ_TEST
		NOP
		NOP
;===== Indirect Address Jump Intruction Test Routine ======
IAJ_TEST:
;ORG	0x800
	MOV		A,@0x00
	MOV		STATUS,A
		BS	C
		SJC		@0x03
		JMP	JMP_FAIL
		JMP	JMP_FAIL
		JMP	JMP_FAIL
		BC	C
		;SJNC	@0x03
		SJNC	bbb
		JMP	JMP_FAIL
		JMP	JMP_FAIL
		JMP	JMP_FAIL
bbb:		
		BS	Z
		SJZ		@0x03
		JMP	JMP_FAIL
		JMP	JMP_FAIL
		JMP	JMP_FAIL
		CLRA
		SJZ		@0x03
		JMP	JMP_FAIL
		JMP	JMP_FAIL
		JMP	JMP_FAIL

;; JMP back Test as below
		JMP	IATEST1
aaa:	
		JMP	IATEST2		; -9
		JMP	JMP_FAIL	; -8
		JMP	JMP_FAIL	; -7
		JMP	JMP_FAIL	; -6
		JMP	JMP_FAIL	; -5
		JMP	JMP_FAIL	; -4
		JMP	JMP_FAIL	; -3
IATEST1:	
		BS		C		; -2
		SJC		aaa		; -1
		SJC		@0xF7	; -1
		JMP	JMP_FAIL
		JMP	JMP_FAIL
		JMP	JMP_FAIL

		JMP	IATEST3		; -9
		JMP	JMP_FAIL	; -8
		JMP	JMP_FAIL	; -7
		JMP	JMP_FAIL	; -6
		JMP	JMP_FAIL	; -5
		JMP	JMP_FAIL	; -4
		JMP	JMP_FAIL	; -3
IATEST2:	
		BC		C		; -2
		SJNC		@0xF7	; -1
		JMP	_IPass
		JMP	_IPass
		JMP	_IPass

		JMP	IATEST4		; -9
		JMP	JMP_FAIL	; -8
		JMP	JMP_FAIL	; -7
		JMP	JMP_FAIL	; -6
		JMP	JMP_FAIL	; -5
		JMP	JMP_FAIL	; -4
		JMP	JMP_FAIL	; -3
IATEST3:	
		BS		Z		; -2
		SJZ		@0xF7	; -1
		JMP	JMP_FAIL
		JMP	JMP_FAIL
		JMP	JMP_FAIL

		JMP	_IPass		; -9
		JMP	JMP_FAIL	; -8
		JMP	JMP_FAIL	; -7
		JMP	JMP_FAIL	; -6
		JMP	JMP_FAIL	; -5
		JMP	JMP_FAIL	; -4
		JMP	JMP_FAIL	; -3
IATEST4:	
		BC		Z		; -2
		SJNZ	@0xF7	; -1
		JMP	JMP_FAIL
		JMP	JMP_FAIL
		JMP	JMP_FAIL
_IPass:
		NOP

;============= Combineation Instruction Test==============

	;========== Instruction Test => RETL k
	;MOV		A,@0x2C
	;MOV		INST,A
	;MOV		A,@0x00
	;MOV		STATUS,A
		;CALL	RETL_Test	; BackUp PC(only)	
		;XOR		A,@0x5A		; Check Result ?
		;JBS		Z			; Check Z = 1?	
		;JMP	INS_FAIL
		;JBC		N			; Check N = 0?
		;JMP	INS_FAIL
		
;================== RAM Test Routine =====================
TEST_RAM:
;=======================
; Write 55 Bank0
;=======================
	;BS		P5,2  			; Working
	GBANK   1
	MOV		A,@0x50
	MOV		RSR,A			; Start Address
	MOV		A,@0xAF			; For count from 0x50~0xFF
	MOV		0xFF,A			; [0xFF] = 0xAF, count value
	
LOOP1:
	MOV		A,@0x55			; IAR = 0x55
	MOV		IAR,A			; Write IAR to [RSR]
	INC		RSR				; RSR = RSR + 1
	DJZ		0xFF			; [0xFF] = [0xFF] - 1
	JMP		LOOP1			; Until [0xFF] = 0
	
	MOV		A,@0x50
	MOV		RSR,A
	MOV		A,@0xAF
	MOV		0xFF,A
CHECK1:
	MOV		A,@0xAA
	COM		IAR				; IAR = ~IAR
	XOR		IAR,A
	JBS		Z
	JMP		RAM_FAIL
	INC		RSR				; RSR = RSR + 1
	DJZ		0xFF			; [0xFF] = [0xFF] - 1
	JMP		CHECK1			; Until [0xFF] = 0
	
;=======================
; Write AA  Bank0
;=======================
	MOV		A,@0x50
	MOV		RSR,A			; Start Address
	MOV		A,@0xAF			; For count from 0x50~0xFF
	MOV		0xFF,A			; [0xFF] = 0xAF, count value
LOOP2:
	MOV		A,@0xAA			; IAR = 0xAA
	MOV		IAR,A			; Write IAR to [RSR]
	INC		RSR				; RSR = RSR + 1
	DJZ		0xFF			; [0xFF] = [0xFF] - 1
	JMP		LOOP2			; Until  [0xFF] = 0	
	
	MOV		A,@0x50
	MOV		RSR,A			; RSR = 0x50
	MOV		A,@0xAF
	MOV		0xFF,A			; [0xFF] = 0xAF
CHECK2:
	MOV		A,@0xAA
	XOR		IAR,A
	JBS		Z
	JMP		RAM_FAIL
	INC		RSR
	DJZ		0xFF
	JMP		CHECK2			; Until [0xFF] = 0
	NOP
;================= LED Display Routine ===================
PASS:
	BTG		P5,1
	JMP		TEST_INST
	

INS_FAIL:
	BC		P5,4
	JMP		INS_FAIL
;===================== Sub Routine =======================
;CALL_Test:
	;INC		0x50
	;RET
;RETL_Test:
	;BC		N
	;NOP
	;RETL	@0x5A

;================== Long Sub Routine =====================
;LCALL_Test:
	;INC		0x51
	;RET