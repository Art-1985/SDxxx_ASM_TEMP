;============================================================
;	Project:		MTF351_ASM_TEMP
;	FILE:			MTF351_ASM_TEMP.asm
;  	Target:  		MTF351
;	Author:			Arthur (Lu Hungche)
;	Date:			2020/03/11
;------------------------------------------------------------
;	Description:	For MTF351 Instruction and EFT Verify
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
Include	"MTF351.INC"

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
	
	INST	== 0x5A

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
	ORG 	0x0000
	JMP 	MAIN
	ORG		0x0002
	JMP 	JMP_FAIL	;0x0002
	JMP 	JMP_FAIL	;0x0003
	JMP 	JMP_FAIL	;0x0004
	JMP 	JMP_FAIL	;0x0005
	JMP 	JMP_FAIL	;0x0006
	JMP 	JMP_FAIL	;0x0007
	JMP 	JMP_FAIL	;0x0008
	JMP 	JMP_FAIL	;0x0009
	JMP 	JMP_FAIL	;0x000A
	JMP 	JMP_FAIL	;0x000B
	JMP 	JMP_FAIL	;0x000C
	JMP 	JMP_FAIL	;0x000D
	JMP 	JMP_FAIL	;0x000E
	JMP 	JMP_FAIL	;0x000F
	JMP 	JMP_FAIL	;0x0010
	JMP 	JMP_FAIL	;0x0011
	JMP 	JMP_FAIL	;0x0012
	JMP 	JMP_FAIL	;0x0013
	JMP 	JMP_FAIL	;0x0014
	JMP 	JMP_FAIL	;0x0015
	JMP 	JMP_FAIL	;0x0016
	JMP 	JMP_FAIL	;0x0017
	JMP 	JMP_FAIL	;0x0018
	JMP 	JMP_FAIL	;0x0019
	JMP 	JMP_FAIL	;0x001A
	JMP 	JMP_FAIL	;0x001B
	JMP 	JMP_FAIL	;0x001C
	JMP 	JMP_FAIL	;0x001D
	JMP 	JMP_FAIL	;0x001E
	JMP 	JMP_FAIL	;0x001F
	JMP 	JMP_FAIL	;0x0020
	JMP 	JMP_FAIL	;0x0021
	JMP 	JMP_FAIL	;0x0022
	JMP 	JMP_FAIL	;0x0023
	JMP 	JMP_FAIL	;0x0024
	JMP 	JMP_FAIL	;0x0025
	JMP 	JMP_FAIL	;0x0026
	JMP 	JMP_FAIL	;0x0027
	JMP 	JMP_FAIL	;0x0028
	JMP 	JMP_FAIL	;0x0029
	JMP 	JMP_FAIL	;0x002A
	JMP 	JMP_FAIL	;0x002B
	JMP 	JMP_FAIL	;0x002C
	JMP 	JMP_FAIL	;0x002D
	JMP 	JMP_FAIL	;0x002E
	JMP 	JMP_FAIL	;0x002F
	JMP 	JMP_FAIL	;0x0030
	JMP 	JMP_FAIL	;0x0031
	JMP 	JMP_FAIL	;0x0032
	JMP 	JMP_FAIL	;0x0033
	JMP 	JMP_FAIL	;0x0034
	JMP 	JMP_FAIL	;0x0035
	JMP 	JMP_FAIL	;0x0036
	JMP 	JMP_FAIL	;0x0037
	JMP 	JMP_FAIL	;0x0038
	JMP 	JMP_FAIL	;0x0039
	JMP 	JMP_FAIL	;0x003A
	JMP 	JMP_FAIL	;0x003B
	JMP 	JMP_FAIL	;0x003C
	JMP 	JMP_FAIL	;0x003D
	JMP 	JMP_FAIL	;0x003E
	JMP 	JMP_FAIL	;0x003F
	JMP 	JMP_FAIL	;0x0040
	JMP 	JMP_FAIL	;0x0041
	JMP 	JMP_FAIL	;0x0042
	JMP 	JMP_FAIL	;0x0043
	JMP 	JMP_FAIL	;0x0044
	JMP 	JMP_FAIL	;0x0045
	JMP 	JMP_FAIL	;0x0046
	JMP 	JMP_FAIL	;0x0047
	JMP 	JMP_FAIL	;0x0048
	JMP 	JMP_FAIL	;0x0049
	JMP 	JMP_FAIL	;0x004A
	JMP 	JMP_FAIL	;0x004B
	JMP 	JMP_FAIL	;0x004C
	JMP 	JMP_FAIL	;0x004D
	JMP 	JMP_FAIL	;0x004E
	JMP 	JMP_FAIL	;0x004F
;==================== Main Function ======================
	ORG		0x0050
MAIN:
	CALL	SYS_INIT
	CALL	GPIO_INIT	
	CALL	RAM_SHA_INIT
	CALL	RAM_IND_INIT

;====================== BACK_GROUND_LOOP ================
BACK_GROUND_LOOP:
	SBANK	0
	CALL	TEST_RAM_BANK_0_5		;Write(0x55),Read(0x55),Clear(0x00)
	CALL	TEST_RAM_BANK_0_A		;Write(0xAA),Read(0xAA),Clear(0x00)
	CALL	TEST_RAM_BANK_1_3		;Write(0x33),Read(0x33),Clear(0x00)
	CALL	TEST_RAM_BANK_1_C		;Write(0xCC),Read(0xCC),Clear(0x00)
	JMP_PASS:
	BTG		P5,0
	BC		P5,1
	BS		P5,2
	BC		P5,3
	BS		P5,4
	WDTC
	JMP		BACK_GROUND_LOOP

;====================== ERROR_LOOP =====================
JMP_FAIL:
	SBANK	0
	BS		P5,1
	BC		P5,2
	BS		P5,3
	BC		P5,4
	JMP		JMP_FAIL
RAM_FAIL:
	SBANK	0
	BS		P5,1
	BC		P5,2
	BS		P5,3
	BC		P5,4
	JMP		RAM_FAIL
INS_FAIL:
	SBANK	0
	BS		P5,1
	BC		P5,2
	BS		P5,3
	BC		P5,4	
	JMP		INS_FAIL

;================== PEIPHERAL_INITIAL ==================
	;-------------------------------;
	SYS_INIT:	
		SBANK	0
		;BS		CPUS	;FSYS=FM
		BC		IDLE	;SLEEP_MODE
		MOV		A,@0x00
		MOV		SFR1,A
		MOV		SFR4,A
		MOV		SFR6,A
		SBANK	3
		MOV		A,@0x00
		MOV		SFR9,A
		MOV		SFR10,A
		RET
	;-------------------------------;		
	GPIO_INIT:
		SBANK	0
		MOV		A,@0x00
		MOV		IOCR5,A
		MOV		IOCR6,A
		MOV		IOCR7,A
		CLR		P5
		CLR		P6
		CLR		P7
		RET

	;-------------------------------;
	RAM_SHA_INIT:
		MOV		A,@0x50
		MOV		RSR,A
		MOV		A,@0xFF		;RAM_SHA_LOOP
		MOV		IAR,A
		INC		RSR
		MOV		A,@0x80
		XOR		A,RSR
		JBS		Z
		JMP		$-6
		RET
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
		XOR		A,RSR
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
		XOR		A,RSR
		JBS		Z
		JMP		RAM_IND_LOOP_1
		MOV		A,@0x80
		MOV		RSR,A
		RET
	;-------------------------------;
	STATUS_CLEAR:
		MOV		A,@0x00
		MOV		STATUS,A
		RET
	;-------------------------------;
	INST_XOR_JUDGE:
		JBS		Z			; IF(Z=1) BRANCH
		JMP		INS_FAIL
		JBC		N			; IF(N=0) BRANCH
		JMP		INS_FAIL
		RET

;================== RAM Test Routine ========================
ORG	0x0F00	; ADDR(3840)
	TEST_RAM_BANK_0_5:
		MOV		A,@0x80		; Write Start SRAM(0x55)
		MOV		RSR,A
		GBANK	0
		MOV		A,@0x55
		MOV		IAR,A
		INC		RSR
		MOV		A,@0x00
		XOR		A,RSR		; INC(0x80),UNTIL(0x00)
		JBS		Z
		JMP		$-6
		MOV		A,@0x80		; Read Start SRAM(0x55)
		MOV		RSR,A
		GBANK	0
		MOV		A,@0x55
		XOR		IAR,A
		JBS		Z
		JMP		RAM_FAIL
		INC		RSR
		MOV		A,@0x00
		XOR		A,RSR		; INC(0x80),UNTIL(0x00)
		JBS		Z
		JMP		$-8
		RET
	TEST_RAM_BANK_0_A:
		MOV		A,@0x80		; Write Start SRAM(0xAA)
		MOV		RSR,A
		GBANK	0
		MOV		A,@0xAA		; SRAM(0xAA)
		MOV		IAR,A
		INC		RSR
		MOV		A,@0x00
		XOR		A,RSR		; INC(0x80),UNTIL(0x00)
		JBS		Z
		JMP		$-6
		MOV		A,@0x80
		MOV		RSR,A
		GBANK	0
		MOV		A,@0xAA
		XOR		IAR,A
		JBS		Z
		JMP		RAM_FAIL
		INC		RSR
		MOV		A,@0x00
		XOR		A,RSR		; INC(0x80),UNTIL(0x00)
		JBS		Z
		JMP		$-8
		RET
	TEST_RAM_BANK_1_3:
		MOV		A,@0x80		; Write Start SRAM(0x33)
		MOV		RSR,A
		GBANK	1
		MOV		A,@0x33		; SRAM(0x33)
		MOV		IAR,A
		INC		RSR
		MOV		A,@0x00
		XOR		A,RSR		; INC(0x80),UNTIL(0x00)
		JBS		Z
		JMP		$-6
		MOV		A,@0x80
		MOV		RSR,A
		GBANK	1
		MOV		A,@0x33
		XOR		IAR,A
		JBS		Z
		JMP		RAM_FAIL
		INC		RSR
		MOV		A,@0x00
		XOR		A,RSR		; INC(0x80),UNTIL(0x00)
		JBS		Z
		JMP		$-8
		RET
	TEST_RAM_BANK_1_C:
		MOV		A,@0x80		; Write Start SRAM(0xCC)
		MOV		RSR,A
		GBANK	1
		MOV		A,@0xCC		; SRAM(0xCC)
		MOV		IAR,A
		INC		RSR
		MOV		A,@0x00
		XOR		A,RSR		; INC(0x80),UNTIL(0x00)
		JBS		Z
		JMP		$-6
		MOV		A,@0x80
		MOV		RSR,A
		GBANK	1
		MOV		A,@0xCC
		XOR		IAR,A
		JBS		Z
		JMP		RAM_FAIL
		INC		RSR
		MOV		A,@0x00
		XOR		A,RSR		; INC(0x80),UNTIL(0x00)
		JBS		Z
		JMP		$-8
		RET
