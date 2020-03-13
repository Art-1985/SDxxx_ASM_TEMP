;============================================================
;	Project:		SD028_ASM_TEMP
;	FILE:			SD028_ASM_TEMP.asm
;  	Target:  		SD028
;	Author:			Arthur (Lu Hungche)
;	Date:			2020/03/11
;------------------------------------------------------------
;	Description:	For SD028 Template
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
	CALL	RAM_SHA_INIT
	CALL	RAM_IND_INIT
	CALL	EEPROM_INIT

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
		MOV		A,@0x00
		MOV		IOCR5,A
		RETI
	;-------------------------------;
	RAM_SHA_INIT:
		MOV		A,@0x50
		MOV		RSR,A
	RAM_SHA_LOOP:
		MOV		A,@0xFF
		MOV		IAR,A
		INC		RSR
		MOV		A,@0x80
		XOR		RSR,A
		JBS		Z
		JMP		RAM_SHA_LOOP
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



