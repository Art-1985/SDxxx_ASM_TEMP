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
Include	"SD028.INC"

;================ General Purpose Register ===============
	TMP50	== 0x50
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
		JMP	_Int_EXINT
	ORG		0x0004
		JMP	_Int_ICINT
	ORG		0x000A
		JMP	_Int_CMP1INT
	ORG		0x000E
		JMP	_Int_CMP2INT
	ORG		0x0010
		JMP	_Int_ADINT
	ORG		0x0018
		JMP	_Int_CMP3INT
	ORG		0x002E
		JMP	_Int_UERRINT
	ORG		0x0030
		JMP	_Int_URINT
	ORG		0x0032
		JMP	_Int_UTINT
	ORG		0x003A
		JMP	_Int_SHINT
	ORG		0x003C
		JMP	_Int_TM1INT
	ORG		0x003E
		JMP	_Int_TM2INT
	ORG		0x0040
		JMP	_Int_TM1OFINT
	ORG		0x0042
		JMP	_Int_TXTMINT
	ORG		0x0044
		JMP	_Int_IGINT
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
	CALL	SYS_INIT
	CALL	GPIO_INIT
	CALL	WAKE_INIT
	BS		P50	;Off P50
	BS		P51	;On P51
	CALL	KEY_DEBOUNCE
	CALL	RAM_SHA_INIT
	CALL	RAM_IND_INIT
	CALL	EEPROM_INIT
	CALL	TEST_INST_JMP
	CALL	TEST_INST_1	;DAA,ENI,DISI
	CALL	TEST_INST_1	;BTG,MOV,CLRA,CLR

;====================== BACK_GROUND_LOOP ================
BACK_GROUND_LOOP:
	SBANK	0
	;CALL	INST_TEST
	;CALL	RAM_TEST
	;CALL	EEPROM_TEST
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
		JMP		KEY_TRG
		JBS		P5,2
		JMP		KEY_TRG
		JBS		P5,2
		JMP		KEY_TRG
		JBS		P5,2
		JMP		KEY_TRG
		JBS		P5,2
		JMP		KEY_TRG
		JBS		P5,2
		JMP		KEY_TRG
		JBS		P5,2
		JMP		KEY_TRG
		JBS		P5,2
		JMP		KEY_TRG
		JBS		P5,2
		JMP		KEY_TRG
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
	TEST_INST_JMP:
		MOV		A,@0x00
		MOV		STATUS,A		;Clear Status
		CLR 	0x50
		INC 	0x50			;[0x50] = 0x01
		JMP 	JP1
		JMP 	JMP_FAIL
		JP1:
		INC 	0x50			;[0x50] = 0x02
		JMP 	JP2
		JMP 	JMP_FAIL
		JP2:
		INC 	0x50			;[0x50] = 0x03
		JMP 	JP3
		JMP 	JMP_FAIL
		JP3:
		INC 	0x50			;[0x50] = 0x04
		JMP 	JP4
		JMP 	JMP_FAIL
		JP4:
		INC 	0x50			;[0x50] = 0x05
		JMP 	JP5
		JMP 	JMP_FAIL
		JP5:
		INC 	0x50			;[0x50] = 0x06
		JMP 	JP6
		JMP 	JMP_FAIL
		JP6:
		INC 	0x50			;[0x50] = 0x07
		JMP 	JP7
		JMP 	JMP_FAIL
		JP7:
		INC 	0x50			;[0x50] = 0x08
		JMP 	JP8
		JMP 	JMP_FAIL
		JP8:
		INC 	0x50			;[0x50] = 0x09
		JMP 	JP9
		JMP 	JMP_FAIL
		JP9:
		INC 	0x50			;[0x50] = 0x0A
		JMP 	JPA
		JMP 	JMP_FAIL
		JPA:
		INC 	0x50			;[0x50] = 0x0B
		JMP 	JPB
		JMP 	JMP_FAIL
		JPB:
		INC 	0x50			;[0x50] = 0x0C
		JMP 	JPC
		JMP 	JMP_FAIL
		JPC:
		INC 	0x50			;[0x50] = 0x0D
		JMP 	JPD
		JMP 	JMP_FAIL
		JPD:
		INC 	0x50			;[0x50] = 0x0E
		JMP 	JPE
		JMP 	JMP_FAIL
		JPE:
		INC 	0x50			;[0x50] = 0x0F
		JMP 	JPF
		JMP 	JMP_FAIL
		JPF:
		INC 	0x50
		JMP 	JP10			;[0x50] = 0x10
		JMP 	JMP_FAIL
		JP10:
		MOV 	A,@0x10
		XOR 	0x50,A			;[0x50] = 0x10 ?
		JBS		Z			; Check Z = 1?
		JMP	JMP_FAIL
		JBC		N			; Check N = 0?
		JMP	JMP_FAIL
		RETI



	TEST_INST_1:
		;========== Instruction Test => DAA , C?
		MOV		A,@0x01
		MOV		INST,A
		MOV		A,@0x00
		MOV		STATUS,A
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
		;========== Instruction Test => ENI
		MOV		A,@0x04
		MOV		INST,A
		ENI
		JBS		IT			; Check IT = 1?
		JMP	INS_FAIL
		;========== Instruction Test => DISI
		MOV		A,@0x05
		MOV		INST,A
		DISI
		JBC		IT			; Check IT = 0?
		JMP	INS_FAIL
		RETI
	TEST_INT_2:
		;========== Instruction Test => BTG R,b	
		MOV		A,@0x06
		MOV		INST,A
			MOV		A,@0x00
			MOV		P6,A
			BTG		P6,0
			BTG		P6,2
			BTG		P6,4
			BTG		P6,6
			MOV		A,P6
			XOR		A,@0x55		; Check Result ?
			JBS		Z			; Check Z = 1?
			JMP	INS_FAIL
			JBC		N			; Check N = 0?
			JMP	INS_FAIL
		;========== Instruction Test => MOV R,A
		MOV		A,@0x07
		MOV		INST,A
		MOV		A,@0x00
		MOV		STATUS,A
			MOV		A,@0xFF
			MOV		0x50,A
			MOV		A,STATUS
			;XOR		A,@0x10		; Check Status ?
			XOR		A,@0x18
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
		;========== Instruction Test => CLRA
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

		;========== Instruction Test => CLR R
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
		RETI
;============== Interrupt Service Routine ================
	;================================
	_Int_EXINT:
		SBANK	0
		BC		EXSF0
		BC		EXSF1
		RETI
	;================================
	_Int_ICINT:
		SBANK	0
		BC		P5ICSF
		RETI
	;================================
	_Int_CMP1INT:
		SBANK	0
		JBS 	CMP1SF
		JMP 	JMP_FAIL
		BC		CMP1SF
		RETI
	;================================
	_Int_CMP2INT:
		SBANK	0
		JBS 	CMP2SF
		JMP 	JMP_FAIL
		BC		CMP2SF
		RETI
	;================================
	_Int_ADINT:
		SBANK	0
		JBS 	ADSF
		JMP 	JMP_FAIL
		BC		ADSF
		RETI
	;================================
	_Int_CMP3INT:
		SBANK	0
		JBS 	CMP3SF
		JMP 	JMP_FAIL
		BC		CMP3SF
		RETI
	;================================
	_Int_UERRINT:
		SBANK	0
		JBS 	UERRSF
		JMP 	JMP_FAIL
		BC		UERRSF
		RETI
	;================================
	_Int_URINT:
		SBANK	0
		JBS 	URSF
		JMP 	JMP_FAIL
		BC		URSF
		RETI
	;================================
	_Int_UTINT:
		SBANK	0
		JBS 	UTSF
		JMP 	JMP_FAIL
		BC		UTSF
		RETI
	;================================
	_Int_SHINT:
		SBANK	0
		JBS 	SHSF
		JMP 	JMP_FAIL
		BC		SHSF
		RETI
	;================================
	_Int_TM1INT:
		SBANK	0
		BC		TM1DASF
		BC		TM1DBSF
		RETI
	;================================
	_Int_TM2INT:
		SBANK	0
		BC		TM2DASF
		BC		TM2DBSF
		RETI
	;================================
	_Int_TM1OFINT:
		SBANK	0
		JBS 	TM1OFSF
		JMP 	JMP_FAIL
		BC		TM1OFSF
		RETI
	;================================
	_Int_TXTMINT:
		SBANK	0
		BC		TXDSF
		BC		TXCSF
		RETI
	;================================
	_Int_IGINT:
		SBANK	0
		JBS 	IGSF
		JMP 	JMP_FAIL
		BC		IGSF
		RETI



