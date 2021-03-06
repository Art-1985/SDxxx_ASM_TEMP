;============================================================
;	Project:		SD062_ASM_TEMP
;	FILE:			SD062_ASM_TEMP.asm
;  	Target:  		SD062
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
INCLUDE		"SDXXX_DEV_TAR.h"

;================ General Purpose Register ===============
	TMP0	== 0x50
	TMP1	== 0x51
	TMP2	== 0x52
	TMP3	== 0x53

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
	ORG		0x0014
		JMP	_Int_PWMPAINT
	ORG		0x0016
		JMP	_Int_PWMDAINT
	ORG		0x0018
		JMP	_Int_CMP3INT
	ORG		0x0024
		JMP	_Int_PWMPBINT
	ORG		0x0026
		JMP	_Int_PWMDBINT
	ORG		0x002A
		JMP	_Int_PWMPCINT
	ORG		0x002C
		JMP	_Int_PWMDCINT
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
		JMP	_Int_AFPWMINT
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
	DW		0x0101
	DW		0x0102
	DW		0x0103
	DW		0x0104
	ORG		0x0060
MAIN:
	SDxxx_SYS_INIT
	SDxxx_GPIO_INIT
	;SDxxx_EFT_KEY_TRIG
	SDxxx_EFT_TES_JMP
	SDxxx_WDT_SET
	SDxxx_RAM_SHA_INIT
	SDxxx_RAM_IND_INIT 0

;====================== Backgroung =======================
BACK_GROUND_LOOP:
	SBANK	0
	SDxxx_EFT_STACK
	SDxxx_EFT_INST_ARITHEMATIC
	SDxxx_EFT_INST_LOGIC_I
	SDxxx_EFT_INST_LOGIC_II
	SDxxx_EFT_INST_TRANSFER
	SDxxx_EFT_INST_MANIPULATION	0x50
	SDxxx_EFT_BRANCH_I
	SDxxx_EFT_BRANCH_II
	;SDxxx_EFT_BRANCH_III
	SDxxx_EFT_SHORT_BRANCH
	SDxxx_EFT_CONTROL
	SDxxx_EFT_READ_ROM
	SDxxx_RAM_WR_ALL 0,0x55
	SDxxx_RAM_WR_ALL 1,0xAA
	CAlL	JMP_PASS
	JMP		BACK_GROUND_LOOP

JMP_PASS:
	BTG		P5,1
	WDTC
	RET

JMP_FAIL:
	SBANK	0
	JMP		JMP_FAIL

INS_FAIL:
	SBANK	0
	JMP		INS_FAIL

RAM_FAIL:
	SBANK	0
	JMP		RAM_FAIL
;================== Jmp Sub Function ==================
	INST_XOR_JUDGE:
		JBS		Z			; IF(Z=1) BRANCH
		JMP		INS_FAIL
		JBC		N			; IF(N=0) BRANCH
		JMP		INS_FAIL
		RET

	STATUS_CLEAR:
		MOV		A,@0x00
		MOV		STATUS,A
		RET


ORG	0x0EF0	; ADDR(3824)
	INST_RETL_TABLE:
		ADD		PCL, A	;BackUp PC to STACK,then SEARCH TABLE By PC
		RETL	@0xA1
		RETL	@0xA2
		RETL	@0xA4
		RETL	@0xA8
		RETL	@0x1A
		RETL	@0x2A
		RETL	@0x4A
		RETL	@0x8A
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
	_Int_PWMPAINT:
		SBANK	0
		RETI
	;================================
	_Int_PWMDAINT:
		SBANK	0
		RETI
	;================================
	_Int_CMP3INT:
		SBANK	0
		JBS 	CMP3SF
		JMP 	JMP_FAIL
		BC		CMP3SF
		RETI
	;================================
	_Int_PWMPBINT:
		SBANK	0
		RETI

	;================================
	_Int_PWMDBINT:
		SBANK	0
		RETI

	;================================
	_Int_PWMPCINT:
		SBANK	0
		RETI

	;================================
	_Int_PWMDCINT:
		SBANK	0
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
	_Int_AFPWMINT:
		SBANK	0
		;JBS 	IGSF
		;JMP 	JMP_FAIL
		;BC		IGSF
		RETI



