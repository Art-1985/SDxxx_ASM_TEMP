SDxxx_EFT_INIT MACRO

    ENDM

SDxxx_EFT_WAKE MACRO
	WAKE_INIT:
		SBANK	0
		JBS		P			; PWR ON reset(1)/RST pin reset(0)
		JMP		$+3
		BC		P5,0		; PWR ON reset,Light PWR_LED
		SLEP
		JBS		P
		JMP		$+3
		BC		P5,0		; PWR ON reset,Light PWR_LED
		SLEP
		JBS		P
		JMP		$+3
		BC		P5,0		; PWR ON reset,Light PWR_LED
		BC		P5,0		; PWR ON reset,Light PWR_LED
		SLEP		
    ENDM

SDxxx_EFT_KEY_TRIG MACRO
    KEY_TRG:
        JBS		P5,0		; Push,or not
        JMP		DEBOUNCE
        JMP		KEY_TRG
    DEBOUNCE:
        JBS		P5,0
        JMP		KEY_TRG
        JBS		P5,0
        JMP		KEY_TRG
        JBS		P5,0
        JMP		KEY_TRG
        JBS		P5,0
        JMP		KEY_TRG
        JBS		P5,0
        JMP		KEY_TRG
        JBS		P5,0
        JMP		KEY_TRG
        JBS		P5,0
        JMP		KEY_TRG
        JBS		P5,0
        JMP		KEY_TRG
        JBS		P5,0
        JMP		KEY_TRG
        JBS		P5,0
        JMP		$-2
        MOV		A,@0xFF
        MOV		P5,A
        MOV		A,@0xFF		; Turn Off all LED
        MOV		P5,A
    ENDM

SDxxx_EFT_TES_JMP MACRO
    TEST_JMP:
        MOV		A,@0x00
        MOV		STATUS,A
        CLR 	0x50
        INC 	0x50                ;[0x50] = 0x01
        JMP 	$+2
        JMP 	JMP_FAIL
        INC 	0x50                ;[0x50] = 0x02
        JMP 	$+2
        JMP 	JMP_FAIL
        INC 	0x50                ;[0x50] = 0x03
        JMP 	$+2
        JMP 	JMP_FAIL
        INC 	0x50                ;[0x50] = 0x04
        JMP 	$+2
        JMP 	JMP_FAIL
        INC 	0x50                ;[0x50] = 0x05
        JMP 	$+2
        JMP 	JMP_FAIL
        INC 	0x50                ;[0x50] = 0x06
        JMP 	$+2
        JMP 	JMP_FAIL
        INC 	0x50                ;[0x50] = 0x07
        JMP 	$+2
        JMP 	JMP_FAIL
        INC 	0x50                ;[0x50] = 0x08
        JMP 	$+2
        JMP 	JMP_FAIL
        INC 	0x50                ;[0x50] = 0x09
        JMP 	$+2
        JMP 	JMP_FAIL
        INC 	0x50                ;[0x50] = 0x0A
        JMP 	$+2
        JMP 	JMP_FAIL
        INC 	0x50                ;[0x50] = 0x0B
        JMP 	$+2
        JMP 	JMP_FAIL
        INC 	0x50                ;[0x50] = 0x0C
        JMP 	$+2
        JMP 	JMP_FAIL
        INC 	0x50                ;[0x50] = 0x0D
        JMP 	$+2
        JMP 	JMP_FAIL
        INC 	0x50                ;[0x50] = 0x0E
        JMP 	$+2
        JMP 	JMP_FAIL
        INC 	0x50                ;[0x50] = 0x0F
        JMP 	$+2
        JMP 	JMP_FAIL
        INC 	0x50
        JMP 	$+2                ;[0x50] = 0x10
        JMP 	JMP_FAIL
        MOV 	A,@0x10
        XOR 	0x50,A				;[0x50] = 0x10 ?
        JBS		Z			; Check Z = 1?
        JMP	JMP_FAIL
        JBC		N			; Check N = 0?
        JMP	JMP_FAIL
    ENDM

SDxxx_EFT_STACK MACRO
	TEST_STACK:
		SBANK	1
		MOV		A,STKMON
		XOR		A,@0x00
		CALL	INST_XOR_JUDGE
		CALL	STACK1
		JMP		TEST_STACK_END
	STACK1:
		MOV		A,STKMON
		XOR		A,@0x01
		CALL	INST_XOR_JUDGE
		CALL	STACK2
		RET
	STACK2:
		MOV		A,STKMON
		XOR		A,@0x02
		CALL	INST_XOR_JUDGE
		CALL	STACK3
		RET
	STACK3:
		MOV		A,STKMON
		XOR		A,@0x03
		CALL	INST_XOR_JUDGE
		CALL	STACK4
		RET
	STACK4:
		MOV		A,STKMON
		XOR		A,@0x04
		CALL	INST_XOR_JUDGE
		CALL	STACK5
		RET
	STACK5:
		MOV		A,STKMON
		XOR		A,@0x05
		CALL	INST_XOR_JUDGE
		CALL	STACK6
		RET
	STACK6:
		MOV		A,STKMON
		XOR		A,@0x06
		CALL	INST_XOR_JUDGE
		CALL	STACK7
		RET
	STACK7:
		NOP
		;CALL	INST_XOR_JUDGE ;Sack Over(Shut Down Tst)
		RET
	TEST_STACK_END:
		NOP
    ENDM

