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
INCLUDE		"SDxxx_DEV_TAR.h"

;================ General Purpose Register ===============
	TMP0	== 0x50
	TMP1	== 0x51
	TMP2	== 0x52
	TMP3	== 0x53

;================ Interrupt Vector Table =================
	ORG 	0x0000
		JMP MAIN
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
	ORG		0x0050
MAIN:
	SDxxx_SYS_INIT
	SDxxx_GPIO_INIT
	DELAY_NOP_NO_10
	SDxxx_IAP_WR
	
;====================== Backgroung =======================
BACK_GROUND_LOOP:
	SBANK	0
	NOP
	JMP		BACK_GROUND_LOOP

JMP_FAIL:
	SBANK	0
	JMP		JMP_FAIL

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


