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
	INTERRUPT_JMP:
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
	;CALL 	EFT_INIT
	CALL	SYS_INIT
	CALL	GPIO_INIT
	;CALL	RAM_SHA_INIT
	;CALL	RAM_IND_INIT
	;CALL	TEST_EEPROM (Do not loop forever)
	;CALL	TEST_FLASH (Do not loop forever)

;====================== BACK_GROUND_LOOP ================
BACK_GROUND_LOOP:
	SBANK	0
	GBANK	0
	SRAM_TOG_TEST:
		MOV		A,@0x00
		MOV		0x50,A
		MOV		0x52,A
		MOV		0x54,A
		MOV		0x56,A
		MOV		0x58,A
		MOV		0x5A,A
		MOV		0x5C,A
        MOV		0x5E,A
		MOV		A,@0xFF
        MOV		0x51,A
        MOV		0x53,A
        MOV		0x55,A
        MOV		0x57,A
        MOV		0x59,A
        MOV		0x5B,A
		MOV		0x5D,A
		MOV		0x5F,A
        ;--------------
		MOV		A,@0x00
		MOV		0x60,A
		MOV		0x62,A
		MOV		0x64,A
		MOV		0x66,A
		MOV		0x68,A
		MOV		0x6A,A
		MOV		0x6C,A
        MOV		0x6E,A
		MOV		A,@0xFF
        MOV		0x61,A
        MOV		0x63,A
        MOV		0x65,A
        MOV		0x67,A
        MOV		0x69,A
        MOV		0x6B,A
		MOV		0x6D,A
		MOV		0x6F,A
        ;--------------
		MOV		A,@0x00
		MOV		0x70,A
		MOV		0x72,A
		MOV		0x74,A
		MOV		0x76,A
		MOV		0x78,A
		MOV		0x7A,A
		MOV		0x7C,A
        MOV		0x7E,A
		MOV		A,@0xFF
        MOV		0x71,A
        MOV		0x73,A
        MOV		0x75,A
        MOV		0x77,A
        MOV		0x79,A
        MOV		0x7B,A
		MOV		0x7D,A
		MOV		0x7F,A
		;-----------------------------------------------------------B0
		GBANK	0
		MOV		A,@0x00
		MOV		0x80,A
		MOV		0x82,A
		MOV		0x84,A
		MOV		0x86,A
        MOV		0x88,A
        MOV		0x8A,A
        MOV		0x8C,A
        MOV		0x8E,A
		MOV		A,@0xFF
        MOV		0x81,A
        MOV		0x83,A
        MOV		0x85,A
        MOV		0x87,A
        MOV		0x89,A
        MOV		0x8B,A
		MOV		0x8D,A
		MOV		0x8F,A
        ;-------------
        MOV		A,@0x00
		MOV		0x90,A
		MOV		0x92,A
		MOV		0x94,A
		MOV		0x96,A
        MOV		0x98,A
        MOV		0x9A,A
        MOV		0x9C,A
        MOV		0x9E,A
		MOV		A,@0xFF
        MOV		0x91,A
        MOV		0x93,A
        MOV		0x95,A
        MOV		0x97,A
        MOV		0x99,A
        MOV		0x9B,A
		MOV		0x9D,A
		MOV		0x9F,A
        ;-------------
		MOV		A,@0x00
		MOV		0xA0,A
		MOV		0xA2,A
		MOV		0xA4,A
		MOV		0xA6,A
        MOV		0xA8,A
        MOV		0xAA,A
        MOV		0xAC,A
        MOV		0xAE,A
		MOV		A,@0xFF
        MOV		0xA1,A
        MOV		0xA3,A
        MOV		0xA5,A
        MOV		0xA7,A
        MOV		0xA9,A
        MOV		0xAB,A
		MOV		0xAD,A
		MOV		0xAF,A
        ;-------------
    	MOV		A,@0x00
		MOV		0xB0,A
		MOV		0xB2,A
		MOV		0xB4,A
		MOV		0xB6,A
        MOV		0xB8,A
        MOV		0xBA,A
        MOV		0xBC,A
        MOV		0xBE,A
		MOV		A,@0xFF
        MOV		0xB1,A
        MOV		0xB3,A
        MOV		0xB5,A
        MOV		0xB7,A
        MOV		0xB9,A
        MOV		0xBB,A
		MOV		0xBD,A
		MOV		0xBF,A
        ;-------------
		MOV		A,@0x00
		MOV		0xC0,A
		MOV		0xC2,A
		MOV		0xC4,A
		MOV		0xC6,A
        MOV		0xC8,A
        MOV		0xCA,A
        MOV		0xCC,A
        MOV		0xCE,A
		MOV		A,@0xFF
        MOV		0xC1,A
        MOV		0xC3,A
        MOV		0xC5,A
        MOV		0xC7,A
        MOV		0xC9,A
        MOV		0xCB,A
		MOV		0xCD,A
		MOV		0xCF,A
        ;-------------
		MOV		A,@0x00
		MOV		0xD0,A
		MOV		0xD2,A
		MOV		0xD4,A
		MOV		0xD6,A
        MOV		0xD8,A
        MOV		0xDA,A
        MOV		0xDC,A
        MOV		0xDE,A
		MOV		A,@0xFF
        MOV		0xD1,A
        MOV		0xD3,A
        MOV		0xD5,A
        MOV		0xD7,A
        MOV		0xD9,A
        MOV		0xDB,A
		MOV		0xDD,A
		MOV		0xDF,A
        ;-------------
		MOV		A,@0x00
		MOV		0xE0,A
		MOV		0xE2,A
		MOV		0xE4,A
		MOV		0xE6,A
        MOV		0xE8,A
        MOV		0xEA,A
        MOV		0xEC,A
        MOV		0xEE,A
		MOV		A,@0xFF
        MOV		0xE1,A
        MOV		0xE3,A
        MOV		0xE5,A
        MOV		0xE7,A
        MOV		0xE9,A
        MOV		0xEB,A
		MOV		0xED,A
		MOV		0xEF,A
        ;-------------
		MOV		A,@0x00
		MOV		0xF0,A
		MOV		0xF2,A
		MOV		0xF4,A
		MOV		0xF6,A
        MOV		0xF8,A
        MOV		0xFA,A
        MOV		0xFC,A
        MOV		0xFE,A
		MOV		A,@0xFF
        MOV		0xF1,A
        MOV		0xF3,A
        MOV		0xF5,A
        MOV		0xF7,A
        MOV		0xF9,A
        MOV		0xFB,A
		MOV		0xFD,A
		MOV		0xFF,A
        ;-----------------------------------------------------------B1
		GBANK	1
		MOV		A,@0x00
		MOV		0x80,A
		MOV		0x82,A
		MOV		0x84,A
		MOV		0x86,A
        MOV		0x88,A
        MOV		0x8A,A
        MOV		0x8C,A
        MOV		0x8E,A
		MOV		A,@0xFF
        MOV		0x81,A
        MOV		0x83,A
        MOV		0x85,A
        MOV		0x87,A
        MOV		0x89,A
        MOV		0x8B,A
		MOV		0x8D,A
		MOV		0x8F,A
        ;-------------
        MOV		A,@0x00
		MOV		0x90,A
		MOV		0x92,A
		MOV		0x94,A
		MOV		0x96,A
        MOV		0x98,A
        MOV		0x9A,A
        MOV		0x9C,A
        MOV		0x9E,A
		MOV		A,@0xFF
        MOV		0x91,A
        MOV		0x93,A
        MOV		0x95,A
        MOV		0x97,A
        MOV		0x99,A
        MOV		0x9B,A
		MOV		0x9D,A
		MOV		0x9F,A
        ;-------------
		MOV		A,@0x00
		MOV		0xA0,A
		MOV		0xA2,A
		MOV		0xA4,A
		MOV		0xA6,A
        MOV		0xA8,A
        MOV		0xAA,A
        MOV		0xAC,A
        MOV		0xAE,A
		MOV		A,@0xFF
        MOV		0xA1,A
        MOV		0xA3,A
        MOV		0xA5,A
        MOV		0xA7,A
        MOV		0xA9,A
        MOV		0xAB,A
		MOV		0xAD,A
		MOV		0xAF,A
        ;-------------
    	MOV		A,@0x00
		MOV		0xB0,A
		MOV		0xB2,A
		MOV		0xB4,A
		MOV		0xB6,A
        MOV		0xB8,A
        MOV		0xBA,A
        MOV		0xBC,A
        MOV		0xBE,A
		MOV		A,@0xFF
        MOV		0xB1,A
        MOV		0xB3,A
        MOV		0xB5,A
        MOV		0xB7,A
        MOV		0xB9,A
        MOV		0xBB,A
		MOV		0xBD,A
		MOV		0xBF,A
        ;-------------
		MOV		A,@0x00
		MOV		0xC0,A
		MOV		0xC2,A
		MOV		0xC4,A
		MOV		0xC6,A
        MOV		0xC8,A
        MOV		0xCA,A
        MOV		0xCC,A
        MOV		0xCE,A
		MOV		A,@0xFF
        MOV		0xC1,A
        MOV		0xC3,A
        MOV		0xC5,A
        MOV		0xC7,A
        MOV		0xC9,A
        MOV		0xCB,A
		MOV		0xCD,A
		MOV		0xCF,A
        ;-------------
		MOV		A,@0x00
		MOV		0xD0,A
		MOV		0xD2,A
		MOV		0xD4,A
		MOV		0xD6,A
        MOV		0xD8,A
        MOV		0xDA,A
        MOV		0xDC,A
        MOV		0xDE,A
		MOV		A,@0xFF
        MOV		0xD1,A
        MOV		0xD3,A
        MOV		0xD5,A
        MOV		0xD7,A
        MOV		0xD9,A
        MOV		0xDB,A
		MOV		0xDD,A
		MOV		0xDF,A
        ;-------------
		MOV		A,@0x00
		MOV		0xE0,A
		MOV		0xE2,A
		MOV		0xE4,A
		MOV		0xE6,A
        MOV		0xE8,A
        MOV		0xEA,A
        MOV		0xEC,A
        MOV		0xEE,A
		MOV		A,@0xFF
        MOV		0xE1,A
        MOV		0xE3,A
        MOV		0xE5,A
        MOV		0xE7,A
        MOV		0xE9,A
        MOV		0xEB,A
		MOV		0xED,A
		MOV		0xEF,A
        ;-------------
		MOV		A,@0x00
		MOV		0xF0,A
		MOV		0xF2,A
		MOV		0xF4,A
		MOV		0xF6,A
        MOV		0xF8,A
        MOV		0xFA,A
        MOV		0xFC,A
        MOV		0xFE,A
		MOV		A,@0xFF
        MOV		0xF1,A
        MOV		0xF3,A
        MOV		0xF5,A
        MOV		0xF7,A
        MOV		0xF9,A
        MOV		0xFB,A
		MOV		0xFD,A
		MOV		0xFF,A
	
    SRAM_TOG_READ:
        MOV     A,0x50
        CALL	INST_XOR_00
        MOV     A,0x51
        CALL	INST_XOR_FF
        MOV     A,0x52
        CALL	INST_XOR_00
        MOV     A,0x53
        CALL	INST_XOR_FF
        MOV     A,0x54
        CALL	INST_XOR_00
        MOV     A,0x55
        CALL	INST_XOR_FF
        MOV     A,0x56
        CALL	INST_XOR_00
        MOV     A,0x57
        CALL	INST_XOR_FF
        MOV     A,0x58
        CALL	INST_XOR_00
        MOV     A,0x59
        CALL	INST_XOR_FF
        MOV     A,0x5A
        CALL	INST_XOR_00
        MOV     A,0x5B
        CALL	INST_XOR_FF
        MOV     A,0x5C
        CALL	INST_XOR_00
        MOV     A,0x5D
        CALL	INST_XOR_FF
        MOV     A,0x5E
        CALL	INST_XOR_00
        MOV     A,0x5F
        CALL	INST_XOR_FF
        ;------------------
        MOV     A,0x60
        CALL	INST_XOR_00
        MOV     A,0x61
        CALL	INST_XOR_FF
        MOV     A,0x62
        CALL	INST_XOR_00
        MOV     A,0x63
        CALL	INST_XOR_FF
        MOV     A,0x64
        CALL	INST_XOR_00
        MOV     A,0x65
        CALL	INST_XOR_FF
        MOV     A,0x66
        CALL	INST_XOR_00
        MOV     A,0x67
        CALL	INST_XOR_FF
        MOV     A,0x68
        CALL	INST_XOR_00
        MOV     A,0x69
        CALL	INST_XOR_FF
        MOV     A,0x6A
        CALL	INST_XOR_00
        MOV     A,0x6B
        CALL	INST_XOR_FF
        MOV     A,0x6C
        CALL	INST_XOR_00
        MOV     A,0x6D
        CALL	INST_XOR_FF
        MOV     A,0x6E
        CALL	INST_XOR_00
        MOV     A,0x6F
        CALL	INST_XOR_FF
        ;------------------
        MOV     A,0x70
        CALL	INST_XOR_00
        MOV     A,0x71
        CALL	INST_XOR_FF
        MOV     A,0x72
        CALL	INST_XOR_00
        MOV     A,0x73
        CALL	INST_XOR_FF
        MOV     A,0x74
        CALL	INST_XOR_00
        MOV     A,0x75
        CALL	INST_XOR_FF
        MOV     A,0x76
        CALL	INST_XOR_00
        MOV     A,0x77
        CALL	INST_XOR_FF
        MOV     A,0x78
        CALL	INST_XOR_00
        MOV     A,0x79
        CALL	INST_XOR_FF
        MOV     A,0x7A
        CALL	INST_XOR_00
        MOV     A,0x7B
        CALL	INST_XOR_FF
        MOV     A,0x7C
        CALL	INST_XOR_00
        MOV     A,0x7D
        CALL	INST_XOR_FF
        MOV     A,0x7E
        CALL	INST_XOR_00
        MOV     A,0x7F
        CALL	INST_XOR_FF
        ;-----------------------------------------------------------B0
        GBANK   0
        MOV     A,0x80
        CALL	INST_XOR_00
        MOV     A,0x81
        CALL	INST_XOR_FF
        MOV     A,0x82
        CALL	INST_XOR_00
        MOV     A,0x83
        CALL	INST_XOR_FF
        MOV     A,0x84
        CALL	INST_XOR_00
        MOV     A,0x85
        CALL	INST_XOR_FF
        MOV     A,0x86
        CALL	INST_XOR_00
        MOV     A,0x87
        CALL	INST_XOR_FF
        MOV     A,0x88
        CALL	INST_XOR_00
        MOV     A,0x89
        CALL	INST_XOR_FF
        MOV     A,0x8A
        CALL	INST_XOR_00
        MOV     A,0x8B
        CALL	INST_XOR_FF
        MOV     A,0x8C
        CALL	INST_XOR_00
        MOV     A,0x8D
        CALL	INST_XOR_FF
        MOV     A,0x8E
        CALL	INST_XOR_00
        MOV     A,0x8F
        CALL	INST_XOR_FF
        ;------------------
        MOV     A,0x90
        CALL	INST_XOR_00
        MOV     A,0x91
        CALL	INST_XOR_FF
        MOV     A,0x92
        CALL	INST_XOR_00
        MOV     A,0x93
        CALL	INST_XOR_FF
        MOV     A,0x94
        CALL	INST_XOR_00
        MOV     A,0x95
        CALL	INST_XOR_FF
        MOV     A,0x96
        CALL	INST_XOR_00
        MOV     A,0x97
        CALL	INST_XOR_FF
        MOV     A,0x98
        CALL	INST_XOR_00
        MOV     A,0x99
        CALL	INST_XOR_FF
        MOV     A,0x9A
        CALL	INST_XOR_00
        MOV     A,0x9B
        CALL	INST_XOR_FF
        MOV     A,0x9C
        CALL	INST_XOR_00
        MOV     A,0x9D
        CALL	INST_XOR_FF
        MOV     A,0x9E
        CALL	INST_XOR_00
        MOV     A,0x9F
        CALL	INST_XOR_FF
        ;------------------
        MOV     A,0xA0
        CALL	INST_XOR_00
        MOV     A,0xA1
        CALL	INST_XOR_FF
        MOV     A,0xA2
        CALL	INST_XOR_00
        MOV     A,0xA3
        CALL	INST_XOR_FF
        MOV     A,0xA4
        CALL	INST_XOR_00
        MOV     A,0xA5
        CALL	INST_XOR_FF
        MOV     A,0xA6
        CALL	INST_XOR_00
        MOV     A,0xA7
        CALL	INST_XOR_FF
        MOV     A,0xA8
        CALL	INST_XOR_00
        MOV     A,0xA9
        CALL	INST_XOR_FF
        MOV     A,0xAA
        CALL	INST_XOR_00
        MOV     A,0xAB
        CALL	INST_XOR_FF
        MOV     A,0xAC
        CALL	INST_XOR_00
        MOV     A,0xAD
        CALL	INST_XOR_FF
        MOV     A,0xAE
        CALL	INST_XOR_00
        MOV     A,0xAF
        CALL	INST_XOR_FF
        ;------------------
        MOV     A,0xB0
        CALL	INST_XOR_00
        MOV     A,0xB1
        CALL	INST_XOR_FF
        MOV     A,0xB2
        CALL	INST_XOR_00
        MOV     A,0xB3
        CALL	INST_XOR_FF
        MOV     A,0xB4
        CALL	INST_XOR_00
        MOV     A,0xB5
        CALL	INST_XOR_FF
        MOV     A,0xB6
        CALL	INST_XOR_00
        MOV     A,0xB7
        CALL	INST_XOR_FF
        MOV     A,0xB8
        CALL	INST_XOR_00
        MOV     A,0xB9
        CALL	INST_XOR_FF
        MOV     A,0xBA
        CALL	INST_XOR_00
        MOV     A,0xBB
        CALL	INST_XOR_FF
        MOV     A,0xBC
        CALL	INST_XOR_00
        MOV     A,0xBD
        CALL	INST_XOR_FF
        MOV     A,0xBE
        CALL	INST_XOR_00
        MOV     A,0xBF
        CALL	INST_XOR_FF
        ;------------------
        MOV     A,0xC0
        CALL	INST_XOR_00
        MOV     A,0xC1
        CALL	INST_XOR_FF
        MOV     A,0xC2
        CALL	INST_XOR_00
        MOV     A,0xC3
        CALL	INST_XOR_FF
        MOV     A,0xC4
        CALL	INST_XOR_00
        MOV     A,0xC5
        CALL	INST_XOR_FF
        MOV     A,0xC6
        CALL	INST_XOR_00
        MOV     A,0xC7
        CALL	INST_XOR_FF
        MOV     A,0xC8
        CALL	INST_XOR_00
        MOV     A,0xC9
        CALL	INST_XOR_FF
        MOV     A,0xCA
        CALL	INST_XOR_00
        MOV     A,0xCB
        CALL	INST_XOR_FF
        MOV     A,0xCC
        CALL	INST_XOR_00
        MOV     A,0xCD
        CALL	INST_XOR_FF
        MOV     A,0xCE
        CALL	INST_XOR_00
        MOV     A,0xCF
        CALL	INST_XOR_FF
        ;------------------
        MOV     A,0xD0
        CALL	INST_XOR_00
        MOV     A,0xD1
        CALL	INST_XOR_FF
        MOV     A,0xD2
        CALL	INST_XOR_00
        MOV     A,0xD3
        CALL	INST_XOR_FF
        MOV     A,0xD4
        CALL	INST_XOR_00
        MOV     A,0xD5
        CALL	INST_XOR_FF
        MOV     A,0xD6
        CALL	INST_XOR_00
        MOV     A,0xD7
        CALL	INST_XOR_FF
        MOV     A,0xD8
        CALL	INST_XOR_00
        MOV     A,0xD9
        CALL	INST_XOR_FF
        MOV     A,0xDA
        CALL	INST_XOR_00
        MOV     A,0xDB
        CALL	INST_XOR_FF
        MOV     A,0xDC
        CALL	INST_XOR_00
        MOV     A,0xDD
        CALL	INST_XOR_FF
        MOV     A,0xDE
        CALL	INST_XOR_00
        MOV     A,0xDF
        CALL	INST_XOR_FF
        ;------------------
        MOV     A,0xE0
        CALL	INST_XOR_00
        MOV     A,0xE1
        CALL	INST_XOR_FF
        MOV     A,0xE2
        CALL	INST_XOR_00
        MOV     A,0xE3
        CALL	INST_XOR_FF
        MOV     A,0xE4
        CALL	INST_XOR_00
        MOV     A,0xE5
        CALL	INST_XOR_FF
        MOV     A,0xE6
        CALL	INST_XOR_00
        MOV     A,0xE7
        CALL	INST_XOR_FF
        MOV     A,0xE8
        CALL	INST_XOR_00
        MOV     A,0xE9
        CALL	INST_XOR_FF
        MOV     A,0xEA
        CALL	INST_XOR_00
        MOV     A,0xEB
        CALL	INST_XOR_FF
        MOV     A,0xEC
        CALL	INST_XOR_00
        MOV     A,0xED
        CALL	INST_XOR_FF
        MOV     A,0xEE
        CALL	INST_XOR_00
        MOV     A,0xEF
        CALL	INST_XOR_FF
        ;------------------
        MOV     A,0xF0
        CALL	INST_XOR_00
        MOV     A,0xF1
        CALL	INST_XOR_FF
        MOV     A,0xF2
        CALL	INST_XOR_00
        MOV     A,0xF3
        CALL	INST_XOR_FF
        MOV     A,0xF4
        CALL	INST_XOR_00
        MOV     A,0xF5
        CALL	INST_XOR_FF
        MOV     A,0xF6
        CALL	INST_XOR_00
        MOV     A,0xF7
        CALL	INST_XOR_FF
        MOV     A,0xF8
        CALL	INST_XOR_00
        MOV     A,0xF9
        CALL	INST_XOR_FF
        MOV     A,0xFA
        CALL	INST_XOR_00
        MOV     A,0xFB
        CALL	INST_XOR_FF
        MOV     A,0xFC
        CALL	INST_XOR_00
        MOV     A,0xFD
        CALL	INST_XOR_FF
        MOV     A,0xFE
        CALL	INST_XOR_00
        MOV     A,0xFF
        CALL	INST_XOR_FF
        ;-----------------------------------------------------------B1
        GBANK   1
        MOV     A,0x80
        CALL	INST_XOR_00
        MOV     A,0x81
        CALL	INST_XOR_FF
        MOV     A,0x82
        CALL	INST_XOR_00
        MOV     A,0x83
        CALL	INST_XOR_FF
        MOV     A,0x84
        CALL	INST_XOR_00
        MOV     A,0x85
        CALL	INST_XOR_FF
        MOV     A,0x86
        CALL	INST_XOR_00
        MOV     A,0x87
        CALL	INST_XOR_FF
        MOV     A,0x88
        CALL	INST_XOR_00
        MOV     A,0x89
        CALL	INST_XOR_FF
        MOV     A,0x8A
        CALL	INST_XOR_00
        MOV     A,0x8B
        CALL	INST_XOR_FF
        MOV     A,0x8C
        CALL	INST_XOR_00
        MOV     A,0x8D
        CALL	INST_XOR_FF
        MOV     A,0x8E
        CALL	INST_XOR_00
        MOV     A,0x8F
        CALL	INST_XOR_FF
        ;------------------
        MOV     A,0x90
        CALL	INST_XOR_00
        MOV     A,0x91
        CALL	INST_XOR_FF
        MOV     A,0x92
        CALL	INST_XOR_00
        MOV     A,0x93
        CALL	INST_XOR_FF
        MOV     A,0x94
        CALL	INST_XOR_00
        MOV     A,0x95
        CALL	INST_XOR_FF
        MOV     A,0x96
        CALL	INST_XOR_00
        MOV     A,0x97
        CALL	INST_XOR_FF
        MOV     A,0x98
        CALL	INST_XOR_00
        MOV     A,0x99
        CALL	INST_XOR_FF
        MOV     A,0x9A
        CALL	INST_XOR_00
        MOV     A,0x9B
        CALL	INST_XOR_FF
        MOV     A,0x9C
        CALL	INST_XOR_00
        MOV     A,0x9D
        CALL	INST_XOR_FF
        MOV     A,0x9E
        CALL	INST_XOR_00
        MOV     A,0x9F
        CALL	INST_XOR_FF
        ;------------------
        MOV     A,0xA0
        CALL	INST_XOR_00
        MOV     A,0xA1
        CALL	INST_XOR_FF
        MOV     A,0xA2
        CALL	INST_XOR_00
        MOV     A,0xA3
        CALL	INST_XOR_FF
        MOV     A,0xA4
        CALL	INST_XOR_00
        MOV     A,0xA5
        CALL	INST_XOR_FF
        MOV     A,0xA6
        CALL	INST_XOR_00
        MOV     A,0xA7
        CALL	INST_XOR_FF
        MOV     A,0xA8
        CALL	INST_XOR_00
        MOV     A,0xA9
        CALL	INST_XOR_FF
        MOV     A,0xAA
        CALL	INST_XOR_00
        MOV     A,0xAB
        CALL	INST_XOR_FF
        MOV     A,0xAC
        CALL	INST_XOR_00
        MOV     A,0xAD
        CALL	INST_XOR_FF
        MOV     A,0xAE
        CALL	INST_XOR_00
        MOV     A,0xAF
        CALL	INST_XOR_FF
        ;------------------
        MOV     A,0xB0
        CALL	INST_XOR_00
        MOV     A,0xB1
        CALL	INST_XOR_FF
        MOV     A,0xB2
        CALL	INST_XOR_00
        MOV     A,0xB3
        CALL	INST_XOR_FF
        MOV     A,0xB4
        CALL	INST_XOR_00
        MOV     A,0xB5
        CALL	INST_XOR_FF
        MOV     A,0xB6
        CALL	INST_XOR_00
        MOV     A,0xB7
        CALL	INST_XOR_FF
        MOV     A,0xB8
        CALL	INST_XOR_00
        MOV     A,0xB9
        CALL	INST_XOR_FF
        MOV     A,0xBA
        CALL	INST_XOR_00
        MOV     A,0xBB
        CALL	INST_XOR_FF
        MOV     A,0xBC
        CALL	INST_XOR_00
        MOV     A,0xBD
        CALL	INST_XOR_FF
        MOV     A,0xBE
        CALL	INST_XOR_00
        MOV     A,0xBF
        CALL	INST_XOR_FF
        ;------------------
        MOV     A,0xC0
        CALL	INST_XOR_00
        MOV     A,0xC1
        CALL	INST_XOR_FF
        MOV     A,0xC2
        CALL	INST_XOR_00
        MOV     A,0xC3
        CALL	INST_XOR_FF
        MOV     A,0xC4
        CALL	INST_XOR_00
        MOV     A,0xC5
        CALL	INST_XOR_FF
        MOV     A,0xC6
        CALL	INST_XOR_00
        MOV     A,0xC7
        CALL	INST_XOR_FF
        MOV     A,0xC8
        CALL	INST_XOR_00
        MOV     A,0xC9
        CALL	INST_XOR_FF
        MOV     A,0xCA
        CALL	INST_XOR_00
        MOV     A,0xCB
        CALL	INST_XOR_FF
        MOV     A,0xCC
        CALL	INST_XOR_00
        MOV     A,0xCD
        CALL	INST_XOR_FF
        MOV     A,0xCE
        CALL	INST_XOR_00
        MOV     A,0xCF
        CALL	INST_XOR_FF
        ;------------------
        MOV     A,0xD0
        CALL	INST_XOR_00
        MOV     A,0xD1
        CALL	INST_XOR_FF
        MOV     A,0xD2
        CALL	INST_XOR_00
        MOV     A,0xD3
        CALL	INST_XOR_FF
        MOV     A,0xD4
        CALL	INST_XOR_00
        MOV     A,0xD5
        CALL	INST_XOR_FF
        MOV     A,0xD6
        CALL	INST_XOR_00
        MOV     A,0xD7
        CALL	INST_XOR_FF
        MOV     A,0xD8
        CALL	INST_XOR_00
        MOV     A,0xD9
        CALL	INST_XOR_FF
        MOV     A,0xDA
        CALL	INST_XOR_00
        MOV     A,0xDB
        CALL	INST_XOR_FF
        MOV     A,0xDC
        CALL	INST_XOR_00
        MOV     A,0xDD
        CALL	INST_XOR_FF
        MOV     A,0xDE
        CALL	INST_XOR_00
        MOV     A,0xDF
        CALL	INST_XOR_FF
        ;------------------
        MOV     A,0xE0
        CALL	INST_XOR_00
        MOV     A,0xE1
        CALL	INST_XOR_FF
        MOV     A,0xE2
        CALL	INST_XOR_00
        MOV     A,0xE3
        CALL	INST_XOR_FF
        MOV     A,0xE4
        CALL	INST_XOR_00
        MOV     A,0xE5
        CALL	INST_XOR_FF
        MOV     A,0xE6
        CALL	INST_XOR_00
        MOV     A,0xE7
        CALL	INST_XOR_FF
        MOV     A,0xE8
        CALL	INST_XOR_00
        MOV     A,0xE9
        CALL	INST_XOR_FF
        MOV     A,0xEA
        CALL	INST_XOR_00
        MOV     A,0xEB
        CALL	INST_XOR_FF
        MOV     A,0xEC
        CALL	INST_XOR_00
        MOV     A,0xED
        CALL	INST_XOR_FF
        MOV     A,0xEE
        CALL	INST_XOR_00
        MOV     A,0xEF
        CALL	INST_XOR_FF
        ;------------------
        MOV     A,0xF0
        CALL	INST_XOR_00
        MOV     A,0xF1
        CALL	INST_XOR_FF
        MOV     A,0xF2
        CALL	INST_XOR_00
        MOV     A,0xF3
        CALL	INST_XOR_FF
        MOV     A,0xF4
        CALL	INST_XOR_00
        MOV     A,0xF5
        CALL	INST_XOR_FF
        MOV     A,0xF6
        CALL	INST_XOR_00
        MOV     A,0xF7
        CALL	INST_XOR_FF
        MOV     A,0xF8
        CALL	INST_XOR_00
        MOV     A,0xF9
        CALL	INST_XOR_FF
        MOV     A,0xFA
        CALL	INST_XOR_00
        MOV     A,0xFB
        CALL	INST_XOR_FF
        MOV     A,0xFC
        CALL	INST_XOR_00
        MOV     A,0xFD
        CALL	INST_XOR_FF
        MOV     A,0xFE
        CALL	INST_XOR_00
        MOV     A,0xFF
        CALL	INST_XOR_FF
	;---------------------------------------------------
	SRAM_TOGbar_TEST:
		MOV		A,@0xFF
		MOV		0x50,A
		MOV		0x52,A
		MOV		0x54,A
		MOV		0x56,A
		MOV		0x58,A
		MOV		0x5A,A
		MOV		0x5C,A
        MOV		0x5E,A
		MOV		A,@0x00
        MOV		0x51,A
        MOV		0x53,A
        MOV		0x55,A
        MOV		0x57,A
        MOV		0x59,A
        MOV		0x5B,A
		MOV		0x5D,A
		MOV		0x5F,A
        ;--------------
		MOV		A,@0xFF
		MOV		0x60,A
		MOV		0x62,A
		MOV		0x64,A
		MOV		0x66,A
		MOV		0x68,A
		MOV		0x6A,A
		MOV		0x6C,A
        MOV		0x6E,A
		MOV		A,@0x00
        MOV		0x61,A
        MOV		0x63,A
        MOV		0x65,A
        MOV		0x67,A
        MOV		0x69,A
        MOV		0x6B,A
		MOV		0x6D,A
		MOV		0x6F,A
        ;--------------
		MOV		A,@0xFF
		MOV		0x70,A
		MOV		0x72,A
		MOV		0x74,A
		MOV		0x76,A
		MOV		0x78,A
		MOV		0x7A,A
		MOV		0x7C,A
        MOV		0x7E,A
		MOV		A,@0x00
        MOV		0x71,A
        MOV		0x73,A
        MOV		0x75,A
        MOV		0x77,A
        MOV		0x79,A
        MOV		0x7B,A
		MOV		0x7D,A
		MOV		0x7F,A
		;-----------------------------------------------------------B0
		GBANK	0
		MOV		A,@0xFF
		MOV		0x80,A
		MOV		0x82,A
		MOV		0x84,A
		MOV		0x86,A
        MOV		0x88,A
        MOV		0x8A,A
        MOV		0x8C,A
        MOV		0x8E,A
		MOV		A,@0x00
        MOV		0x81,A
        MOV		0x83,A
        MOV		0x85,A
        MOV		0x87,A
        MOV		0x89,A
        MOV		0x8B,A
		MOV		0x8D,A
		MOV		0x8F,A
        ;-------------
        MOV		A,@0xFF
		MOV		0x90,A
		MOV		0x92,A
		MOV		0x94,A
		MOV		0x96,A
        MOV		0x98,A
        MOV		0x9A,A
        MOV		0x9C,A
        MOV		0x9E,A
		MOV		A,@0x00
        MOV		0x91,A
        MOV		0x93,A
        MOV		0x95,A
        MOV		0x97,A
        MOV		0x99,A
        MOV		0x9B,A
		MOV		0x9D,A
		MOV		0x9F,A
        ;-------------
		MOV		A,@0xFF
		MOV		0xA0,A
		MOV		0xA2,A
		MOV		0xA4,A
		MOV		0xA6,A
        MOV		0xA8,A
        MOV		0xAA,A
        MOV		0xAC,A
        MOV		0xAE,A
		MOV		A,@0x00
        MOV		0xA1,A
        MOV		0xA3,A
        MOV		0xA5,A
        MOV		0xA7,A
        MOV		0xA9,A
        MOV		0xAB,A
		MOV		0xAD,A
		MOV		0xAF,A
        ;-------------
    	MOV		A,@0xFF
		MOV		0xB0,A
		MOV		0xB2,A
		MOV		0xB4,A
		MOV		0xB6,A
        MOV		0xB8,A
        MOV		0xBA,A
        MOV		0xBC,A
        MOV		0xBE,A
		MOV		A,@0x00
        MOV		0xB1,A
        MOV		0xB3,A
        MOV		0xB5,A
        MOV		0xB7,A
        MOV		0xB9,A
        MOV		0xBB,A
		MOV		0xBD,A
		MOV		0xBF,A
        ;-------------
		MOV		A,@0xFF
		MOV		0xC0,A
		MOV		0xC2,A
		MOV		0xC4,A
		MOV		0xC6,A
        MOV		0xC8,A
        MOV		0xCA,A
        MOV		0xCC,A
        MOV		0xCE,A
		MOV		A,@0x00
        MOV		0xC1,A
        MOV		0xC3,A
        MOV		0xC5,A
        MOV		0xC7,A
        MOV		0xC9,A
        MOV		0xCB,A
		MOV		0xCD,A
		MOV		0xCF,A
        ;-------------
		MOV		A,@0xFF
		MOV		0xD0,A
		MOV		0xD2,A
		MOV		0xD4,A
		MOV		0xD6,A
        MOV		0xD8,A
        MOV		0xDA,A
        MOV		0xDC,A
        MOV		0xDE,A
		MOV		A,@0x00
        MOV		0xD1,A
        MOV		0xD3,A
        MOV		0xD5,A
        MOV		0xD7,A
        MOV		0xD9,A
        MOV		0xDB,A
		MOV		0xDD,A
		MOV		0xDF,A
        ;-------------
		MOV		A,@0xFF
		MOV		0xE0,A
		MOV		0xE2,A
		MOV		0xE4,A
		MOV		0xE6,A
        MOV		0xE8,A
        MOV		0xEA,A
        MOV		0xEC,A
        MOV		0xEE,A
		MOV		A,@0x00
        MOV		0xE1,A
        MOV		0xE3,A
        MOV		0xE5,A
        MOV		0xE7,A
        MOV		0xE9,A
        MOV		0xEB,A
		MOV		0xED,A
		MOV		0xEF,A
        ;-------------
		MOV		A,@0xFF
		MOV		0xF0,A
		MOV		0xF2,A
		MOV		0xF4,A
		MOV		0xF6,A
        MOV		0xF8,A
        MOV		0xFA,A
        MOV		0xFC,A
        MOV		0xFE,A
		MOV		A,@0x00
        MOV		0xF1,A
        MOV		0xF3,A
        MOV		0xF5,A
        MOV		0xF7,A
        MOV		0xF9,A
        MOV		0xFB,A
		MOV		0xFD,A
		MOV		0xFF,A
        ;-----------------------------------------------------------B1
		GBANK	1
		MOV		A,@0xFF
		MOV		0x80,A
		MOV		0x82,A
		MOV		0x84,A
		MOV		0x86,A
        MOV		0x88,A
        MOV		0x8A,A
        MOV		0x8C,A
        MOV		0x8E,A
		MOV		A,@0x00
        MOV		0x81,A
        MOV		0x83,A
        MOV		0x85,A
        MOV		0x87,A
        MOV		0x89,A
        MOV		0x8B,A
		MOV		0x8D,A
		MOV		0x8F,A
        ;-------------
        MOV		A,@0xFF
		MOV		0x90,A
		MOV		0x92,A
		MOV		0x94,A
		MOV		0x96,A
        MOV		0x98,A
        MOV		0x9A,A
        MOV		0x9C,A
        MOV		0x9E,A
		MOV		A,@0x00
        MOV		0x91,A
        MOV		0x93,A
        MOV		0x95,A
        MOV		0x97,A
        MOV		0x99,A
        MOV		0x9B,A
		MOV		0x9D,A
		MOV		0x9F,A
        ;-------------
		MOV		A,@0xFF
		MOV		0xA0,A
		MOV		0xA2,A
		MOV		0xA4,A
		MOV		0xA6,A
        MOV		0xA8,A
        MOV		0xAA,A
        MOV		0xAC,A
        MOV		0xAE,A
		MOV		A,@0x00
        MOV		0xA1,A
        MOV		0xA3,A
        MOV		0xA5,A
        MOV		0xA7,A
        MOV		0xA9,A
        MOV		0xAB,A
		MOV		0xAD,A
		MOV		0xAF,A
        ;-------------
    	MOV		A,@0xFF
		MOV		0xB0,A
		MOV		0xB2,A
		MOV		0xB4,A
		MOV		0xB6,A
        MOV		0xB8,A
        MOV		0xBA,A
        MOV		0xBC,A
        MOV		0xBE,A
		MOV		A,@0x00
        MOV		0xB1,A
        MOV		0xB3,A
        MOV		0xB5,A
        MOV		0xB7,A
        MOV		0xB9,A
        MOV		0xBB,A
		MOV		0xBD,A
		MOV		0xBF,A
        ;-------------
		MOV		A,@0xFF
		MOV		0xC0,A
		MOV		0xC2,A
		MOV		0xC4,A
		MOV		0xC6,A
        MOV		0xC8,A
        MOV		0xCA,A
        MOV		0xCC,A
        MOV		0xCE,A
		MOV		A,@0x00
        MOV		0xC1,A
        MOV		0xC3,A
        MOV		0xC5,A
        MOV		0xC7,A
        MOV		0xC9,A
        MOV		0xCB,A
		MOV		0xCD,A
		MOV		0xCF,A
        ;-------------
		MOV		A,@0xFF
		MOV		0xD0,A
		MOV		0xD2,A
		MOV		0xD4,A
		MOV		0xD6,A
        MOV		0xD8,A
        MOV		0xDA,A
        MOV		0xDC,A
        MOV		0xDE,A
		MOV		A,@0x00
        MOV		0xD1,A
        MOV		0xD3,A
        MOV		0xD5,A
        MOV		0xD7,A
        MOV		0xD9,A
        MOV		0xDB,A
		MOV		0xDD,A
		MOV		0xDF,A
        ;-------------
		MOV		A,@0xFF
		MOV		0xE0,A
		MOV		0xE2,A
		MOV		0xE4,A
		MOV		0xE6,A
        MOV		0xE8,A
        MOV		0xEA,A
        MOV		0xEC,A
        MOV		0xEE,A
		MOV		A,@0x00
        MOV		0xE1,A
        MOV		0xE3,A
        MOV		0xE5,A
        MOV		0xE7,A
        MOV		0xE9,A
        MOV		0xEB,A
		MOV		0xED,A
		MOV		0xEF,A
        ;-------------
		MOV		A,@0xFF
		MOV		0xF0,A
		MOV		0xF2,A
		MOV		0xF4,A
		MOV		0xF6,A
        MOV		0xF8,A
        MOV		0xFA,A
        MOV		0xFC,A
        MOV		0xFE,A
		MOV		A,@0x00
        MOV		0xF1,A
        MOV		0xF3,A
        MOV		0xF5,A
        MOV		0xF7,A
        MOV		0xF9,A
        MOV		0xFB,A
		MOV		0xFD,A
		MOV		0xFF,A


	SRAM_QBbar_READ:
        MOV     A,0x50
        CALL	INST_XOR_FF
        MOV     A,0x51
        CALL	INST_XOR_00
        MOV     A,0x52
        CALL	INST_XOR_FF
        MOV     A,0x53
        CALL	INST_XOR_00
        MOV     A,0x54
        CALL	INST_XOR_FF
        MOV     A,0x55
        CALL	INST_XOR_00
        MOV     A,0x56
        CALL	INST_XOR_FF
        MOV     A,0x57
        CALL	INST_XOR_00
        MOV     A,0x58
        CALL	INST_XOR_FF
        MOV     A,0x59
        CALL	INST_XOR_00
        MOV     A,0x5A
        CALL	INST_XOR_FF
        MOV     A,0x5B
        CALL	INST_XOR_00
        MOV     A,0x5C
        CALL	INST_XOR_FF
        MOV     A,0x5D
        CALL	INST_XOR_00
        MOV     A,0x5E
        CALL	INST_XOR_FF
        MOV     A,0x5F
        CALL	INST_XOR_00
        ;------------------
        MOV     A,0x60
        CALL	INST_XOR_FF
        MOV     A,0x61
        CALL	INST_XOR_00
        MOV     A,0x62
        CALL	INST_XOR_FF
        MOV     A,0x63
        CALL	INST_XOR_00
        MOV     A,0x64
        CALL	INST_XOR_FF
        MOV     A,0x65
        CALL	INST_XOR_00
        MOV     A,0x66
        CALL	INST_XOR_FF
        MOV     A,0x67
        CALL	INST_XOR_00
        MOV     A,0x68
        CALL	INST_XOR_FF
        MOV     A,0x69
        CALL	INST_XOR_00
        MOV     A,0x6A
        CALL	INST_XOR_FF
        MOV     A,0x6B
        CALL	INST_XOR_00
        MOV     A,0x6C
        CALL	INST_XOR_FF
        MOV     A,0x6D
        CALL	INST_XOR_00
        MOV     A,0x6E
        CALL	INST_XOR_FF
        MOV     A,0x6F
        CALL	INST_XOR_00
        ;------------------
        MOV     A,0x70
        CALL	INST_XOR_FF
        MOV     A,0x71
        CALL	INST_XOR_00
        MOV     A,0x72
        CALL	INST_XOR_FF
        MOV     A,0x73
        CALL	INST_XOR_00
        MOV     A,0x74
        CALL	INST_XOR_FF
        MOV     A,0x75
        CALL	INST_XOR_00
        MOV     A,0x76
        CALL	INST_XOR_FF
        MOV     A,0x77
        CALL	INST_XOR_00
        MOV     A,0x78
        CALL	INST_XOR_FF
        MOV     A,0x79
        CALL	INST_XOR_00
        MOV     A,0x7A
        CALL	INST_XOR_FF
        MOV     A,0x7B
        CALL	INST_XOR_00
        MOV     A,0x7C
        CALL	INST_XOR_FF
        MOV     A,0x7D
        CALL	INST_XOR_00
        MOV     A,0x7E
        CALL	INST_XOR_FF
        MOV     A,0x7F
        CALL	INST_XOR_00
        ;-----------------------------------------------------------B0
        GBANK   0
        MOV     A,0x80
        CALL	INST_XOR_FF
        MOV     A,0x81
        CALL	INST_XOR_00
        MOV     A,0x82
        CALL	INST_XOR_FF
        MOV     A,0x83
        CALL	INST_XOR_00
        MOV     A,0x84
        CALL	INST_XOR_FF
        MOV     A,0x85
        CALL	INST_XOR_00
        MOV     A,0x86
        CALL	INST_XOR_FF
        MOV     A,0x87
        CALL	INST_XOR_00
        MOV     A,0x88
        CALL	INST_XOR_FF
        MOV     A,0x89
        CALL	INST_XOR_00
        MOV     A,0x8A
        CALL	INST_XOR_FF
        MOV     A,0x8B
        CALL	INST_XOR_00
        MOV     A,0x8C
        CALL	INST_XOR_FF
        MOV     A,0x8D
        CALL	INST_XOR_00
        MOV     A,0x8E
        CALL	INST_XOR_FF
        MOV     A,0x8F
        CALL	INST_XOR_00
        ;------------------
        MOV     A,0x90
        CALL	INST_XOR_FF
        MOV     A,0x91
        CALL	INST_XOR_00
        MOV     A,0x92
        CALL	INST_XOR_FF
        MOV     A,0x93
        CALL	INST_XOR_00
        MOV     A,0x94
        CALL	INST_XOR_FF
        MOV     A,0x95
        CALL	INST_XOR_00
        MOV     A,0x96
        CALL	INST_XOR_FF
        MOV     A,0x97
        CALL	INST_XOR_00
        MOV     A,0x98
        CALL	INST_XOR_FF
        MOV     A,0x99
        CALL	INST_XOR_00
        MOV     A,0x9A
        CALL	INST_XOR_FF
        MOV     A,0x9B
        CALL	INST_XOR_00
        MOV     A,0x9C
        CALL	INST_XOR_FF
        MOV     A,0x9D
        CALL	INST_XOR_00
        MOV     A,0x9E
        CALL	INST_XOR_FF
        MOV     A,0x9F
        CALL	INST_XOR_00
        ;------------------
        MOV     A,0xA0
        CALL	INST_XOR_FF
        MOV     A,0xA1
        CALL	INST_XOR_00
        MOV     A,0xA2
        CALL	INST_XOR_FF
        MOV     A,0xA3
        CALL	INST_XOR_00
        MOV     A,0xA4
        CALL	INST_XOR_FF
        MOV     A,0xA5
        CALL	INST_XOR_00
        MOV     A,0xA6
        CALL	INST_XOR_FF
        MOV     A,0xA7
        CALL	INST_XOR_00
        MOV     A,0xA8
        CALL	INST_XOR_FF
        MOV     A,0xA9
        CALL	INST_XOR_00
        MOV     A,0xAA
        CALL	INST_XOR_FF
        MOV     A,0xAB
        CALL	INST_XOR_00
        MOV     A,0xAC
        CALL	INST_XOR_FF
        MOV     A,0xAD
        CALL	INST_XOR_00
        MOV     A,0xAE
        CALL	INST_XOR_FF
        MOV     A,0xAF
        CALL	INST_XOR_00
        ;------------------
        MOV     A,0xB0
        CALL	INST_XOR_FF
        MOV     A,0xB1
        CALL	INST_XOR_00
        MOV     A,0xB2
        CALL	INST_XOR_FF
        MOV     A,0xB3
        CALL	INST_XOR_00
        MOV     A,0xB4
        CALL	INST_XOR_FF
        MOV     A,0xB5
        CALL	INST_XOR_00
        MOV     A,0xB6
        CALL	INST_XOR_FF
        MOV     A,0xB7
        CALL	INST_XOR_00
        MOV     A,0xB8
        CALL	INST_XOR_FF
        MOV     A,0xB9
        CALL	INST_XOR_00
        MOV     A,0xBA
        CALL	INST_XOR_FF
        MOV     A,0xBB
        CALL	INST_XOR_00
        MOV     A,0xBC
        CALL	INST_XOR_FF
        MOV     A,0xBD
        CALL	INST_XOR_00
        MOV     A,0xBE
        CALL	INST_XOR_FF
        MOV     A,0xBF
        CALL	INST_XOR_00
        ;------------------
        MOV     A,0xC0
        CALL	INST_XOR_FF
        MOV     A,0xC1
        CALL	INST_XOR_00
        MOV     A,0xC2
        CALL	INST_XOR_FF
        MOV     A,0xC3
        CALL	INST_XOR_00
        MOV     A,0xC4
        CALL	INST_XOR_FF
        MOV     A,0xC5
        CALL	INST_XOR_00
        MOV     A,0xC6
        CALL	INST_XOR_FF
        MOV     A,0xC7
        CALL	INST_XOR_00
        MOV     A,0xC8
        CALL	INST_XOR_FF
        MOV     A,0xC9
        CALL	INST_XOR_00
        MOV     A,0xCA
        CALL	INST_XOR_FF
        MOV     A,0xCB
        CALL	INST_XOR_00
        MOV     A,0xCC
        CALL	INST_XOR_FF
        MOV     A,0xCD
        CALL	INST_XOR_00
        MOV     A,0xCE
        CALL	INST_XOR_FF
        MOV     A,0xCF
        CALL	INST_XOR_00
        ;------------------
        MOV     A,0xD0
        CALL	INST_XOR_FF
        MOV     A,0xD1
        CALL	INST_XOR_00
        MOV     A,0xD2
        CALL	INST_XOR_FF
        MOV     A,0xD3
        CALL	INST_XOR_00
        MOV     A,0xD4
        CALL	INST_XOR_FF
        MOV     A,0xD5
        CALL	INST_XOR_00
        MOV     A,0xD6
        CALL	INST_XOR_FF
        MOV     A,0xD7
        CALL	INST_XOR_00
        MOV     A,0xD8
        CALL	INST_XOR_FF
        MOV     A,0xD9
        CALL	INST_XOR_00
        MOV     A,0xDA
        CALL	INST_XOR_FF
        MOV     A,0xDB
        CALL	INST_XOR_00
        MOV     A,0xDC
        CALL	INST_XOR_FF
        MOV     A,0xDD
        CALL	INST_XOR_00
        MOV     A,0xDE
        CALL	INST_XOR_FF
        MOV     A,0xDF
        CALL	INST_XOR_00
        ;------------------
        MOV     A,0xE0
        CALL	INST_XOR_FF
        MOV     A,0xE1
        CALL	INST_XOR_00
        MOV     A,0xE2
        CALL	INST_XOR_FF
        MOV     A,0xE3
        CALL	INST_XOR_00
        MOV     A,0xE4
        CALL	INST_XOR_FF
        MOV     A,0xE5
        CALL	INST_XOR_00
        MOV     A,0xE6
        CALL	INST_XOR_FF
        MOV     A,0xE7
        CALL	INST_XOR_00
        MOV     A,0xE8
        CALL	INST_XOR_FF
        MOV     A,0xE9
        CALL	INST_XOR_00
        MOV     A,0xEA
        CALL	INST_XOR_FF
        MOV     A,0xEB
        CALL	INST_XOR_00
        MOV     A,0xEC
        CALL	INST_XOR_FF
        MOV     A,0xED
        CALL	INST_XOR_00
        MOV     A,0xEE
        CALL	INST_XOR_FF
        MOV     A,0xEF
        CALL	INST_XOR_00
        ;------------------
        MOV     A,0xF0
        CALL	INST_XOR_FF
        MOV     A,0xF1
        CALL	INST_XOR_00
        MOV     A,0xF2
        CALL	INST_XOR_FF
        MOV     A,0xF3
        CALL	INST_XOR_00
        MOV     A,0xF4
        CALL	INST_XOR_FF
        MOV     A,0xF5
        CALL	INST_XOR_00
        MOV     A,0xF6
        CALL	INST_XOR_FF
        MOV     A,0xF7
        CALL	INST_XOR_00
        MOV     A,0xF8
        CALL	INST_XOR_FF
        MOV     A,0xF9
        CALL	INST_XOR_00
        MOV     A,0xFA
        CALL	INST_XOR_FF
        MOV     A,0xFB
        CALL	INST_XOR_00
        MOV     A,0xFC
        CALL	INST_XOR_FF
        MOV     A,0xFD
        CALL	INST_XOR_00
        MOV     A,0xFE
        CALL	INST_XOR_FF
        MOV     A,0xFF
        CALL	INST_XOR_00
        ;-----------------------------------------------------------B1
        GBANK   1
        MOV     A,0x80
        CALL	INST_XOR_FF
        MOV     A,0x81
        CALL	INST_XOR_00
        MOV     A,0x82
        CALL	INST_XOR_FF
        MOV     A,0x83
        CALL	INST_XOR_00
        MOV     A,0x84
        CALL	INST_XOR_FF
        MOV     A,0x85
        CALL	INST_XOR_00
        MOV     A,0x86
        CALL	INST_XOR_FF
        MOV     A,0x87
        CALL	INST_XOR_00
        MOV     A,0x88
        CALL	INST_XOR_FF
        MOV     A,0x89
        CALL	INST_XOR_00
        MOV     A,0x8A
        CALL	INST_XOR_FF
        MOV     A,0x8B
        CALL	INST_XOR_00
        MOV     A,0x8C
        CALL	INST_XOR_FF
        MOV     A,0x8D
        CALL	INST_XOR_00
        MOV     A,0x8E
        CALL	INST_XOR_FF
        MOV     A,0x8F
        CALL	INST_XOR_00
        ;------------------
        MOV     A,0x90
        CALL	INST_XOR_FF
        MOV     A,0x91
        CALL	INST_XOR_00
        MOV     A,0x92
        CALL	INST_XOR_FF
        MOV     A,0x93
        CALL	INST_XOR_00
        MOV     A,0x94
        CALL	INST_XOR_FF
        MOV     A,0x95
        CALL	INST_XOR_00
        MOV     A,0x96
        CALL	INST_XOR_FF
        MOV     A,0x97
        CALL	INST_XOR_00
        MOV     A,0x98
        CALL	INST_XOR_FF
        MOV     A,0x99
        CALL	INST_XOR_00
        MOV     A,0x9A
        CALL	INST_XOR_FF
        MOV     A,0x9B
        CALL	INST_XOR_00
        MOV     A,0x9C
        CALL	INST_XOR_FF
        MOV     A,0x9D
        CALL	INST_XOR_00
        MOV     A,0x9E
        CALL	INST_XOR_FF
        MOV     A,0x9F
        CALL	INST_XOR_00
        ;------------------
        MOV     A,0xA0
        CALL	INST_XOR_FF
        MOV     A,0xA1
        CALL	INST_XOR_00
        MOV     A,0xA2
        CALL	INST_XOR_FF
        MOV     A,0xA3
        CALL	INST_XOR_00
        MOV     A,0xA4
        CALL	INST_XOR_FF
        MOV     A,0xA5
        CALL	INST_XOR_00
        MOV     A,0xA6
        CALL	INST_XOR_FF
        MOV     A,0xA7
        CALL	INST_XOR_00
        MOV     A,0xA8
        CALL	INST_XOR_FF
        MOV     A,0xA9
        CALL	INST_XOR_00
        MOV     A,0xAA
        CALL	INST_XOR_FF
        MOV     A,0xAB
        CALL	INST_XOR_00
        MOV     A,0xAC
        CALL	INST_XOR_FF
        MOV     A,0xAD
        CALL	INST_XOR_00
        MOV     A,0xAE
        CALL	INST_XOR_FF
        MOV     A,0xAF
        CALL	INST_XOR_00
        ;------------------
        MOV     A,0xB0
        CALL	INST_XOR_FF
        MOV     A,0xB1
        CALL	INST_XOR_00
        MOV     A,0xB2
        CALL	INST_XOR_FF
        MOV     A,0xB3
        CALL	INST_XOR_00
        MOV     A,0xB4
        CALL	INST_XOR_FF
        MOV     A,0xB5
        CALL	INST_XOR_00
        MOV     A,0xB6
        CALL	INST_XOR_FF
        MOV     A,0xB7
        CALL	INST_XOR_00
        MOV     A,0xB8
        CALL	INST_XOR_FF
        MOV     A,0xB9
        CALL	INST_XOR_00
        MOV     A,0xBA
        CALL	INST_XOR_FF
        MOV     A,0xBB
        CALL	INST_XOR_00
        MOV     A,0xBC
        CALL	INST_XOR_FF
        MOV     A,0xBD
        CALL	INST_XOR_00
        MOV     A,0xBE
        CALL	INST_XOR_FF
        MOV     A,0xBF
        CALL	INST_XOR_00
        ;------------------
        MOV     A,0xC0
        CALL	INST_XOR_FF
        MOV     A,0xC1
        CALL	INST_XOR_00
        MOV     A,0xC2
        CALL	INST_XOR_FF
        MOV     A,0xC3
        CALL	INST_XOR_00
        MOV     A,0xC4
        CALL	INST_XOR_FF
        MOV     A,0xC5
        CALL	INST_XOR_00
        MOV     A,0xC6
        CALL	INST_XOR_FF
        MOV     A,0xC7
        CALL	INST_XOR_00
        MOV     A,0xC8
        CALL	INST_XOR_FF
        MOV     A,0xC9
        CALL	INST_XOR_00
        MOV     A,0xCA
        CALL	INST_XOR_FF
        MOV     A,0xCB
        CALL	INST_XOR_00
        MOV     A,0xCC
        CALL	INST_XOR_FF
        MOV     A,0xCD
        CALL	INST_XOR_00
        MOV     A,0xCE
        CALL	INST_XOR_FF
        MOV     A,0xCF
        CALL	INST_XOR_00
        ;------------------
        MOV     A,0xD0
        CALL	INST_XOR_FF
        MOV     A,0xD1
        CALL	INST_XOR_00
        MOV     A,0xD2
        CALL	INST_XOR_FF
        MOV     A,0xD3
        CALL	INST_XOR_00
        MOV     A,0xD4
        CALL	INST_XOR_FF
        MOV     A,0xD5
        CALL	INST_XOR_00
        MOV     A,0xD6
        CALL	INST_XOR_FF
        MOV     A,0xD7
        CALL	INST_XOR_00
        MOV     A,0xD8
        CALL	INST_XOR_FF
        MOV     A,0xD9
        CALL	INST_XOR_00
        MOV     A,0xDA
        CALL	INST_XOR_FF
        MOV     A,0xDB
        CALL	INST_XOR_00
        MOV     A,0xDC
        CALL	INST_XOR_FF
        MOV     A,0xDD
        CALL	INST_XOR_00
        MOV     A,0xDE
        CALL	INST_XOR_FF
        MOV     A,0xDF
        CALL	INST_XOR_00
        ;------------------
        MOV     A,0xE0
        CALL	INST_XOR_FF
        MOV     A,0xE1
        CALL	INST_XOR_00
        MOV     A,0xE2
        CALL	INST_XOR_FF
        MOV     A,0xE3
        CALL	INST_XOR_00
        MOV     A,0xE4
        CALL	INST_XOR_FF
        MOV     A,0xE5
        CALL	INST_XOR_00
        MOV     A,0xE6
        CALL	INST_XOR_FF
        MOV     A,0xE7
        CALL	INST_XOR_00
        MOV     A,0xE8
        CALL	INST_XOR_FF
        MOV     A,0xE9
        CALL	INST_XOR_00
        MOV     A,0xEA
        CALL	INST_XOR_FF
        MOV     A,0xEB
        CALL	INST_XOR_00
        MOV     A,0xEC
        CALL	INST_XOR_FF
        MOV     A,0xED
        CALL	INST_XOR_00
        MOV     A,0xEE
        CALL	INST_XOR_FF
        MOV     A,0xEF
        CALL	INST_XOR_00
        ;------------------
        MOV     A,0xF0
        CALL	INST_XOR_FF
        MOV     A,0xF1
        CALL	INST_XOR_00
        MOV     A,0xF2
        CALL	INST_XOR_FF
        MOV     A,0xF3
        CALL	INST_XOR_00
        MOV     A,0xF4
        CALL	INST_XOR_FF
        MOV     A,0xF5
        CALL	INST_XOR_00
        MOV     A,0xF6
        CALL	INST_XOR_FF
        MOV     A,0xF7
        CALL	INST_XOR_00
        MOV     A,0xF8
        CALL	INST_XOR_FF
        MOV     A,0xF9
        CALL	INST_XOR_00
        MOV     A,0xFA
        CALL	INST_XOR_FF
        MOV     A,0xFB
        CALL	INST_XOR_00
        MOV     A,0xFC
        CALL	INST_XOR_FF
        MOV     A,0xFD
        CALL	INST_XOR_00
        MOV     A,0xFE
        CALL	INST_XOR_FF
        MOV     A,0xFF
        CALL	INST_XOR_00


	NOP
	BS		P5,3
	BC		P5,2
	JMP		BACK_GROUND_LOOP

;====================== ERROR_LOOP =====================
JMP_FAIL:
	SBANK	0
	JMP		JMP_FAIL
RAM_FAIL:
	SBANK	0
	BC		P5,3
	BS		P5,2
	JMP		RAM_FAIL
INS_FAIL:
	SBANK	0	
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
		CLR		P5
		MOV		A,@0xE0
		MOV		IOCR5,A
		MOV		A,@0xFF	;Turn-Off LED (Active-Low)
		MOV		P5,A
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
		
		MOV		A,@0x50
		MOV		RSR,A
		MOV		A,@0xFF
		XOR		A,IAR
		JBS		Z
		JMP		RAM_FAIL
		INC		RSR
		MOV		A,@0x80
		XOR		A,RSR
		JBS		Z
		JMP		$-8
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

	INST_XOR_00:
		XOR		A,@0x00
		JBS		Z			; IF(Z=1) BRANCH
		JMP		RAM_FAIL
		JBC		N			; IF(N=0) BRANCH
		JMP		RAM_FAIL
		RET
	INST_XOR_FF:
		XOR		A,@0xFF
		JBS		Z			; IF(Z=1) BRANCH
		JMP		RAM_FAIL
		JBC		N			; IF(N=0) BRANCH
		JMP		RAM_FAIL
		RET

;================== SRAM_TEST ==================