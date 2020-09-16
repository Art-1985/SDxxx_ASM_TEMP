;ORG 	0x03FF
;SDxxx_RAM_INIT:	
    ;SDxxx_RAM_INIT
    ;RET

;;====== For IC Application =================================================;;
SDxxx_RAM_INIT MACRO
    SBANK	0
    ;clear all ram
    ENDM

;Write(WR_VAL=0xFF)
SDxxx_RAM_SHA_INIT MACRO
    SBANK	0
    MOV		A,@0x50     ;Write Start
    MOV		RSR,A
    MOV		A,@0xFF		;RAM_SHA_LOOP
    MOV		IAR,A
    INC		RSR
    MOV		A,@0x80
    XOR		A,RSR
    JBS		Z
    JMP		$-6
    MOV		A,@0x50     ;Read Back Start
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
    ENDM

;Write(WR_VAL=0xFF)
SDxxx_RAM_IND_INIT MACRO RAM_BANK
    MOV		A,@0x80
    MOV		RSR,A
    GBANK	RAM_BANK
    MOV		A,@0xFF
    MOV		IAR,A
    INC		RSR
    MOV		A,@0x00
    XOR		A,RSR
    JBS		Z
    JMP		$-7
    ENDM

;;====== For IC Function Verify =============================================;;

;Write(WR_VAL),Read(WR_VAL),Clear(0x00)
SDxxx_RAM_WR_ALL MACRO RAM_BANK,WR_VAL
    MOV		A,@0x80		; Write Start SRAM(WR_VAL)
    MOV		RSR,A
    GBANK	RAM_BANK
    MOV		A,@WR_VAL
    MOV		IAR,A
    INC		RSR
    MOV		A,@0x00
    XOR		A,RSR		; INC(0x80),UNTIL(0x00)
    JBS		Z
    JMP		$-6
    MOV		A,@0x80		; Read Start SRAM(WR_VAL)
    MOV		RSR,A
    GBANK	RAM_BANK
    MOV		A,@WR_VAL
    XOR		IAR,A
    JBS		Z
    JMP		RAM_FAIL
    INC		RSR
    MOV		A,@0x00
    XOR		A,RSR		; INC(0x80),UNTIL(0x00)
    JBS		Z
    JMP		$-8
    ENDM

;Write(0x00,0xFF)
SDxxx_RAM_SHA_WORD_QB MACRO
    MOV		A,@0x00
    MOV		0x50,A
    MOV		0x51,A
    MOV		0x52,A
    MOV		0x53,A
    MOV		A,@0xFF
    MOV		0x54,A
    MOV		0x55,A
    MOV		0x56,A
    MOV		0x57,A
    MOV		A,@0x00
    MOV		0x58,A
    MOV		0x59,A
    MOV		0x5A,A
    MOV		0x5B,A
    MOV		A,@0xFF
    MOV		0x5C,A
    MOV		0x5D,A
    MOV		0x5E,A
    MOV		0x5F,A
    ;-------------
    MOV		A,@0x00
    MOV		0x60,A
    MOV		0x61,A
    MOV		0x62,A
    MOV		0x63,A
    MOV		A,@0xFF
    MOV		0x64,A
    MOV		0x65,A
    MOV		0x66,A
    MOV		0x67,A
    MOV		A,@0x00
    MOV		0x68,A
    MOV		0x69,A
    MOV		0x6A,A
    MOV		0x6B,A
    MOV		A,@0xFF
    MOV		0x6C,A
    MOV		0x6D,A
    MOV		0x6E,A
    MOV		0x6F,A
    ;-------------
    MOV		A,@0x00
    MOV		0x70,A
    MOV		0x71,A
    MOV		0x72,A
    MOV		0x73,A
    MOV		A,@0xFF
    MOV		0x74,A
    MOV		0x75,A
    MOV		0x76,A
    MOV		0x77,A
    MOV		A,@0x00
    MOV		0x78,A
    MOV		0x79,A
    MOV		0x7A,A
    MOV		0x7B,A
    MOV		A,@0xFF
    MOV		0x7C,A
    MOV		0x7D,A
    MOV		0x7E,A
    MOV		0x7F,A
    ENDM
