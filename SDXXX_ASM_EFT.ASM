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

SDxxx_EFT_STACK_16 MACRO
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

SDxxx_EFT_INST_ARITHEMATIC MACRO
    INST_DAA:			;-------Instruction Test => DAA , C?
        CALL	STATUS_CLEAR	;-------DAA(0xAA)=10
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
        CALL	STATUS_CLEAR	;-------DAA(0xFF)=65
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
    INST_SUB_A_R:		;-------Instruction Test => SUB A,R
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
    INST_SUB_R_A:		;-------Instruction Test => SUB R,A
        MOV		A,@0x00
        MOV		STATUS,A
        MOV		A,@0x02
        MOV		0x50,A		; [0x50] = 0x02
        MOV		A,@0x01
        SUB		0x50,A		; [0x50] = [0x50] - 0x01
        MOV		A,STATUS
        XOR		A,@0x1B		; for non reset
        ;;XOR		A,@0x13
        CALL	INST_XOR_JUDGE
        BC		Z
        BC		N
        MOV		A,0x50
        XOR		A,@0x01		; Check Result ?
        CALL	INST_XOR_JUDGE
        MOV		A,@0x00
        MOV		STATUS,A
        MOV		A,@0x02
        MOV		0x50,A		; [0x50] = 0x02
        MOV		A,@0x02
        SUB		0x50,A		; [0x50] = [0x50] - 0x02
        MOV		A,STATUS
        XOR		A,@0x1F		; for nono reset
        ;;XOR		A,@0x17
        CALL	INST_XOR_JUDGE
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
        CALL	INST_XOR_JUDGE
        BC		Z
        BC		N
        MOV		A,0x50
        XOR		A,@0x7F		; Check Result ?
        CALL	INST_XOR_JUDGE
    INST_SUB_A_K:		;-------Instruction Test => SUB A,k
        CALL	STATUS_CLEAR
        MOV		A,@0xFF		; 0xFF-0xFF
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
        CALL	INST_XOR_JUDGE
        CALL	STATUS_CLEAR
        MOV		A,@0x7F		; 0x00-0x7F
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
        CALL	INST_XOR_JUDGE
        CALL	STATUS_CLEAR
        MOV		A,@0x01		; 0x80-0x01
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
        CALL	INST_XOR_JUDGE
    INST_SUBB_A_R:		;-------Instruction Test => SUBB A,R
        CALL	STATUS_CLEAR
        BC		C			; B = 1
        MOV		A,@0x00		;0x00-0xF
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
        CALL	INST_XOR_JUDGE	
        CALL	STATUS_CLEAR
        BC		C			; B = 1
        MOV		A,@0x00		; 0x00-0x7F
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
        CALL	INST_XOR_JUDGE
        CALL	STATUS_CLEAR
        BC		C			; B = 1
        MOV		A,@0x80		; 0x80-0x01
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
        CALL	INST_XOR_JUDGE
    INST_SUBB_R_A:      ;-------Instruction Test => SUBB R,A
        CALL	STATUS_CLEAR
        BC		C			; B = 1
        MOV		A,@0x00		; 0x00-0xFF
        MOV		0x50,A		; [0x50] = 0x00
        MOV		A,@0xFF
        SUBB	0x50,A		; [0x50] = 0x00 - 0xFF - B
        MOV		A,STATUS
        XOR		A,@0x1C		; Check Status ?
        ;;XOR		A,@0x14		; Check Status ?
        CALL	INST_XOR_JUDGE
        MOV		A,0x50
        XOR		A,@0x00		; Check Result ?
        CALL	INST_XOR_JUDGE
        CALL	STATUS_CLEAR
        BC		C			; B = 1
        MOV		A,@0x00		; 0x00-0x7F
        MOV		0x50,A		; [0x50] = 0x00
        MOV		A,@0x7F
        SUBB	0x50,A		; [0x50] = 0x00 - 0x7F - B
        MOV		A,STATUS
        XOR		A,@0x58		; Check Status ?
        ;;XOR		A,@0x50		; Check Status ?
        CALL	INST_XOR_JUDGE
        MOV		A,0x50
        XOR		A,@0x80		; Check Result ?
        CALL	INST_XOR_JUDGE
        CALL	STATUS_CLEAR
        BC		C			; B = 1
        MOV		A,@0x80		; ,0x80-0x01
        MOV		0x50,A		; [0x50] = 0x80
        MOV		A,@0x01
        SUBB	0x50,A		; [0x50] = 0x80 - 0x01 - B
        MOV		A,STATUS
        XOR		A,@0x39		; Check Status ?
        ;;XOR		A,@0x31		; Check Status ?
        CALL	INST_XOR_JUDGE
        MOV		A,0x50
        XOR		A,@0x7E		; Check Result ?
        CALL	INST_XOR_JUDGE
    INST_DECA:			;-------Instruction Test => DECA R
        MOV		A,@0x00
        MOV		STATUS,A
        MOV		A,@0x20		; 0x20-1
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
        MOV		A,@0x01		; 0x01-1
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
        MOV		A,@0x00		; 0x00-1
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
        MOV		A,@0x80		; 0x80-1
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
    INST_DEC:			;-------Instruction Test => DEC R
        MOV		A,@0x00
        MOV		STATUS,A
        MOV		A,@0x20		; 0x20-1
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
        MOV		A,@0x01		; 0x01-1
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
        MOV		A,@0x00		; 0x00-1
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
        MOV		A,@0x80		; 0x80-1
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
    INST_ADD_A_R:		;-------Instruction Test => ADD A,R
        CALL	STATUS_CLEAR	; 0x80+0x7F
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
        CALL	STATUS_CLEAR	; 0xFF+0x01
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
        CALL	STATUS_CLEAR	; 0x7F+0x01
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
    INST_ADD_R_A:		;-------Instruction Test => ADD R,A
        CALL	STATUS_CLEAR	; 0x80+0x7F
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
        CALL	STATUS_CLEAR	; 0xFF+0x01
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
        CALL	STATUS_CLEAR	;0x7F+0x01
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
    INST_ADD_A_K:		;-------Instruction Test => ADD A,k
        CALL	STATUS_CLEAR
        MOV		A,@0x7F		;0x7F+0x01
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
        CALL	INST_XOR_JUDGE
        CALL	STATUS_CLEAR
        MOV		A,@0xFF		;0xFF+0x01
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
        CALL	INST_XOR_JUDGE
        CALL	STATUS_CLEAR
        MOV		A,@0x7F		; 0x80+0x7F
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
        CALL	INST_XOR_JUDGE
    INST_ADC_A_R:		;-------Instruction Test => ADC A,R
        CALL	STATUS_CLEAR
        BS		C			; 0x7F+0x00
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
        CALL	INST_XOR_JUDGE
        CALL	STATUS_CLEAR
        BS		C			; 0x80+0x7F
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
        CALL	INST_XOR_JUDGE
    INST_ADC_R_A:		;-------Instruction Test => ADC R,A
        CALL	STATUS_CLEAR
        BS		C			;0x7F+0x00
        MOV		A,@0x7F
        MOV		0x50,A		; [0x50] = 0x7F
        MOV		A,@0x00		; A = 0x00
        BC		Z
        ADC		0x50,A		; TMP1 = A + [0x50] + C
        MOV		A,STATUS
        XOR		A,@0x7A		; Check Status ?
        ;;XOR		A,@0x72		; Check Status ?
        CALL	INST_XOR_JUDGE
        MOV		A,0x50
        XOR		A,@0x80		; Check Result ?
        CALL	INST_XOR_JUDGE
        CALL	STATUS_CLEAR
        BS		C			;0x80+0x7F
        MOV		A,@0x80
        MOV		0x50,A		; [0x50] = 0x80
        MOV		A,@0x7F		; A = 0x7F
        BC		Z
        ADC		0x50,A		; TMP1 = A + [0x50] + C
        MOV		A,STATUS
        XOR		A,@0x1F		; Check Status ?
        ;;XOR		A,@0x17		; Check Status ?
        CALL	INST_XOR_JUDGE
        MOV		A,0x50
        XOR		A,@0x00		; Check Result ?
        CALL	INST_XOR_JUDGE
    INST_INCA:			;-------Instruction Test => INCA R
        CALL	STATUS_CLEAR	; 0x7F+0x01
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
        CALL	STATUS_CLEAR	; 0xFF+0x01
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
    INST_INC:			;-------Instruction Test => INC R
        CALL 	STATUS_CLEAR	; 0x7F+0x01
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
        CALL	STATUS_CLEAR	; 0xFF+0x01
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
    INST_NEG_R:			;-------Instruction Test => NEG R
        CALL	STATUS_CLEAR
        MOV		A,@0x00		; 0x00
        MOV		0x50,A		; [0x50] = 0x00
        NEG		0x50
        MOV		A,STATUS
        XOR		A,@0x1F		; Check Status ?
        ;;XOR		A,@0x17		; Check Status ?
        CALL	INST_XOR_JUDGE
        MOV		A,0x50
        XOR		A,@0x00		; Check Result ?
        CALL	INST_XOR_JUDGE
        CALL	STATUS_CLEAR
        MOV		A,@0x01		; 0x01
        MOV		0x50,A		; [0x50] = 0x01
        NEG		0x50
        MOV		A,STATUS
        XOR		A,@0x58		; Check Status ?
        ;;XOR		A,@0x50		; Check Status ?
        CALL	INST_XOR_JUDGE
        MOV		A,0x50
        XOR		A,@0xFF		; Check Result ?
        CALL	INST_XOR_JUDGE
        CALL	STATUS_CLEAR
        MOV		A,@0x80		; 0x80
        MOV		0x50,A		; [0x50] = 0x80
        NEG		0x50
        MOV		A,STATUS
        XOR		A,@0x7A		; Check Status ?
        ;;XOR		A,@0x72		; Check Status ?
        CALL	INST_XOR_JUDGE
        MOV		A,0x50
        XOR		A,@0x80		; Check Result ?
        CALL	INST_XOR_JUDGE
    ENDM

SDxxx_EFT_INST_LOGIC_I MACRO
    INST_BTG:			;-------Instruction Test => BTG R,b	
        CALL	STATUS_CLEAR
        MOV		A,@0xFF
        MOV		RSR,A		; Start Address
        BTG		RSR
        MOV		A,RSR
        XOR		A,@0xFE		; Check Result ?
        CALL	INST_XOR_JUDGE
    INST_OR_A_R:		;-------Instruction Test => OR A,R
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

    INST_OR_R_A:		;-------Instruction Test => OR R,A
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

    INST_AND_A_R:		;-------Instruction Test => AND A,R
        CALL	STATUS_CLEAR
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
        CALL	STATUS_CLEAR
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
    INST_AND_R_A:		;-------Instruction Test => AND R,A
        CALL	STATUS_CLEAR
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
        CALL	STATUS_CLEAR
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
    INST_AND_A_K:		;-------Instruction Test => AND A,k
        CALL	STATUS_CLEAR
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
        CALL	STATUS_CLEAR
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
        CALL	INST_XOR_JUDGE

    INST_COMA:			;-------Instruction Test => COMA R
        CALL	STATUS_CLEAR
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
        CALL	STATUS_CLEAR
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
    INST_COM:			;-------Instruction Test => COM R
        CALL	STATUS_CLEAR
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
        CALL	STATUS_CLEAR
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
    INST_OR_A_K:		;-------Instruction Test => OR A,k
        CALL	STATUS_CLEAR
        MOV		A,@0xA5
        OR		A,@0x5A		; A = 0xA5 | 0x5A
        XOR		A,@0xFF		; Check Result ?
        CALL	INST_XOR_JUDGE
    ENDM

SDxxx_EFT_INST_LOGIC_II MACRO
    INST_RR_R:			;-------Instruction Test => RR R
        CALL	STATUS_CLEAR
        MOV		A,@0x55
        MOV		0x50,A		; [0x50] = 0x55
        RR		0x50		; [0x50] = [0x50] >> 1
        MOV		A,STATUS
        XOR		A,@0x58		; Check Status ?
        ;;XOR		A,@0x50		; Check Status ?
        CALL	INST_XOR_JUDGE
        MOV		A,0x50
        XOR		A,@0xAA		; Check Result ?
        CALL	INST_XOR_JUDGE

    INST_RRA_R:			;-------Instruction Test => RRA R
        CALL 	STATUS_CLEAR
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
        CALL	INST_XOR_JUDGE

    INST_RRCA_R:		;-------Instruction Test => RRCA R
        CALL	STATUS_CLEAR
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
        CALL	INST_XOR_JUDGE
        CALL	STATUS_CLEAR
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
        CALL	INST_XOR_JUDGE
    INST_RRC_R:			;-------Instruction Test => RRC R
        CALL	STATUS_CLEAR
        BS		C
        MOV		A,@0xAA
        MOV		0x50,A		; [0x50] = 0xAA
        BC		Z
        RRC		0x50		; [0x50] = [0x50] >> 1
        MOV		A,STATUS
        XOR		A,@0x58		; Check Status ?
        ;;XOR		A,@0x50		; Check Status ?
        CALL	INST_XOR_JUDGE
        MOV		A,0x50
        XOR		A,@0xD5		; Check Result ?
        CALL	INST_XOR_JUDGE
        CALL	STATUS_CLEAR
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
        CALL	INST_XOR_JUDGE
    INST_RLCA_R:		;-------Instruction Test => RLCA R
        CALL STATUS_CLEAR
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
        CALL	INST_XOR_JUDGE
        CALL	STATUS_CLEAR
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
        CALL	INST_XOR_JUDGE
    INST_RLC_R:			;-------Instruction Test => RLC R
        CALL	STATUS_CLEAR
        BS		C
        MOV		A,@0x55
        MOV		0x50,A		; [0x50] = 0x55
        RLC		0x50		; [0x50] = [0x50] << 1
        MOV		A,STATUS
        XOR		A,@0x58		; Check Status ?
        ;;XOR		A,@0x50		; Check Status ?
        CALL	INST_XOR_JUDGE
        MOV		A,0x50
        XOR		A,@0xAB		; Check Result ?
        CALL	INST_XOR_JUDGE
        CALL	STATUS_CLEAR
        MOV		A,@0xAA
        MOV		0x50,A		; [0x50] = 0xAA
        RLC		0x50		; [0x50] = [0x50] << 1
        MOV		A,STATUS
        XOR		A,@0x19		; Check Status ?
        ;;XOR		A,@0x11		; Check Status ?
        CALL	INST_XOR_JUDGE
        MOV		A,0x50
        XOR		A,@0x54		; Check Result ?
        CALL	INST_XOR_JUDGE

    INST_RLA_A:			;-------Instruction Test => RLA R
        CALL	STATUS_CLEAR
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
        CALL	INST_XOR_JUDGE

    INST_RL_R:			;-------Instruction Test => RL R
        CALL	STATUS_CLEAR
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
        CALL	INST_XOR_JUDGE
    INST_XCH:			;-------Instruction Test => XCH R
			CALL	STATUS_CLEAR
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
			CALL	INST_XOR_JUDGE
    ENDM

SDxxx_EFT_INST_TRANSFER MACRO
    INST_MOV_R_A:		;-------Instruction Test => MOV R,A
        CALL	STATUS_CLEAR
        MOV		A,@0xFF
        MOV		0x50,A
        MOV		A,STATUS
        XOR		A,@0x18		;At  OCDS
        ;XOR		A,@0x98		; Check Status ? ;; For not reset
        ;;XOR		A,@0x10		; Check Status ?
        CALL	INST_XOR_JUDGE
        MOV		A,0x50
        XOR		A,@0xFF		; Check Result ?
        CALL	INST_XOR_JUDGE
    INST_MOV_R_R:		;-------Instruction Test => MOV R,R
        CALL	STATUS_CLEAR
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
        CALL	STATUS_CLEAR
        MOV		A,@0x00
        MOV		0x50,A		; [0x50] = 0x00		
        MOV		0x50,0x50	; [0x50] = [0x50]
        BS		0x50,0
        MOV		A,0x50
        XOR		A,@0x01		; Check Result ?
        CALL	INST_XOR_JUDGE

    INST_SWAPA_R:		;-------Instruction Test => SWAPA R
        CALL	STATUS_CLEAR
        MOV		A,@0x5A
        MOV		0x50,A		; [0x50] = 0x5A
        SWAPA	0x50
        XOR		A,@0xA5		; Check Result ?
        CALL	INST_XOR_JUDGE
    INST_SWAP_R:		;-------Instruction Test => SWAP R
        CALL	STATUS_CLEAR
        MOV		A,@0x5A
        MOV		0x50,A		; [0x50] = 0x5A
        SWAP	0x50
        MOV		A,0x50
        XOR		A,@0xA5		; Check Result ?
        CALL	INST_XOR_JUDGE
    ENDM

SDxxx_EFT_INST_MANIPULATION MACRO   TMP50
    INST_BS_R:		;-------Instruction Test => BS	R
        CALL	STATUS_CLEAR
        SBANK	0
        MOV		A,ADCR1
        MOV		TMP50,A
        BS		ADCR1.0
        MOV		A,TMP50
        XOR		A,ADCR1
        JBC		Z
        JMP		INS_FAIL
        JBC		N
        JMP		INS_FAIL
        MOV		A,ADCR1
        MOV		TMP50,A
        BS		ADCR1.1
        MOV		A,TMP50
        XOR		A,ADCR1
        JBC		Z
        JMP		INS_FAIL
        JBC		N
        JMP		INS_FAIL
    INST_BC_R:		;-------Instruction Test => BC	R
        MOV		A,ADCR1
        MOV		TMP50,A
        BC		ADCR1.0
        MOV		A,TMP50
        XOR		A,ADCR1
        JBC		Z
        JMP		INS_FAIL
        JBC		N
        JMP		INS_FAIL
        MOV		A,ADCR1
        MOV		TMP50,A
        BC		ADCR1.1
        MOV		A,TMP50
        XOR		A,ADCR1
        JBC		Z
        JMP		INS_FAIL
        JBC		N
        JMP		INS_FAIL
    ENDM

SDxxx_EFT_BRANCH_I MACRO
    INST_DJZ_R:			;------- Instruction Test => DJZ R
        CALL	STATUS_CLEAR
        MOV		A,@0x01
        MOV		0x50,A		; [0x50] = 0x01
        DJZ		0x50		; [0x50] = [0x50] - 1,if z,skip
        JMP		INS_FAIL
        MOV		A,0x50
        XOR		A,@0x00		; Check Result ?
        CALL	INST_XOR_JUDGE	
        CALL	STATUS_CLEAR
        MOV		A,@0x02
        MOV		0x50,A		; [0x50] = 0x02
        DJZ		0x50		; [0x50] = [0x50] - 1,if z,skip
        JMP		$+2
        JMP		INS_FAIL
    INST_DJZA_R:		;------- Instruction Test => DJZA R
        CALL	STATUS_CLEAR
        MOV		A,@0x01
        MOV		0x50,A		; [0x50] = 0x01
        DJZA	0x50		; A = [0x50] - 0x01,if z,skip
        JMP	INS_FAIL
        XOR		A,@0x00		; Check Result ?
        CALL	INST_XOR_JUDGE
        CALL	STATUS_CLEAR
        MOV		A,@0x02
        MOV		0x50,A		; [0x50] = 0x02
        DJZA	0x50		; A = [0x50] - 0x01,if z,skip
        JMP		$+2
        JMP	INS_FAIL
    INST_JZA_R:			;-------Instruction Test => JZA R
        CALL	STATUS_CLEAR
        MOV		A,@0xFF
        MOV		0x50,A
        JZA		0x50		; A = [0x50] + 1,if 0 skip
        JMP		INS_FAIL
        XOR		A,@0x00		; Check Result ?
        CALL	INST_XOR_JUDGE
        CALL	STATUS_CLEAR
        MOV		A,@0x80
        MOV		0x50,A
        JZA		0x50		; A = [0x50] + 1,if 0 skip
        JMP		$+2
        JMP		INS_FAIL
    INST_JZ_R:			;-------Instruction Test => JZ R
        CALL	STATUS_CLEAR
        MOV		A,@0xFF
        MOV		0x50,A		; [0x50] = 0xFF
        JZ		0x50		; [0x50] = [0x50] + 1,if 0 skip
        JMP		INS_FAIL
        MOV		A,0x50
        XOR		A,@0x00		; Check Result ?
        CALL	INST_XOR_JUDGE
        CALL	STATUS_CLEAR
        MOV		A,@0x80
        MOV		0x50,A		; [0x50] = 0xFF
        JZ		0x50		; [0x50] = [0x50] + 1,if 0 skip
        JMP		$+2
        JMP		INS_FAIL
    
    ENDM

SDxxx_EFT_BRANCH_II MACRO
    INST_JE_R:			;-------Instruction Test => JE R
        CALL	STATUS_CLEAR
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
    INST_JGE_R:			;-------Instruction Test => JGE R
        CALL	STATUS_CLEAR
        MOV		A,@0x7F
        MOV		0x50,A		; [0x50] = 0x7F
        MOV		A,@0x00
        JGE		0x50		; [0x50] > A ?
        JMP		INS_FAIL
        CALL	STATUS_CLEAR
        MOV		A,@0xFF
        MOV		0x50,A		; [0x50] = 0xFF
        MOV		A,@0x80
        JGE		0x50		; [0x50] > A ?
        JMP		INS_FAIL
        CALL	STATUS_CLEAR
        MOV		A,@0x00
        MOV		0x50,A		; [0x50] = 0x00
        MOV		A,@0xFF
        JGE		0x50		; [0x50] > A(0xFF) ?x
        JMP		$+2
        JMP		INS_FAIL

    INST_JLE_R:			;-------Instruction Test => JLE R
        CALL	STATUS_CLEAR
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
        CALL	STATUS_CLEAR
        MOV		A,@0xFF
        MOV		0x50,A		; [0x50] = 0xFF
        MOV		A,@0x00
        JLE		0x50		; [0x50] < A(0x00) ?x
        JMP		$+2
        JMP		INS_FAIL
    INST_JE_K:			;-------Instruction Test => JE k
        CALL	STATUS_CLEAR
        MOV		A,@0x7F
        JE		@0x7F
        JMP	INS_FAIL
    ENDM

;;需建立遠程呼叫程式位址(CALL_TEST)，才可測試
SDxxx_EFT_BRANCH_III MACRO
    INST_CALL_K:		;-------Instruction Test => CALL k
        CALL	STATUS_CLEAR
        MOV		A,@0x03
        MOV		0x50,A
        CALL	CALL_TEST
        MOV		A,0x50
        XOR		A,@0x04
        CALL	INST_XOR_JUDGE

    INST_LCALL_K:		;-------Instruction Test => LCALL k
        CALL	STATUS_CLEAR
        MOV		A,@0x03
        MOV		0x51,A
        LCALL	LCALL_Test
        MOV		A,0x51
        XOR		A,@0x04		; Check Result ?
        CALL	INST_XOR_JUDGE

    INST_RETL_K:		;-------Instruction Test => RETL k
        CALL	STATUS_CLEAR
        MOV		A,@0x00
        CALL	INST_RETL_TABLE
        XOR		A,@0xA1
        CALL	INST_XOR_JUDGE
        MOV		A,@0x01
        CALL	INST_RETL_TABLE
        XOR		A,@0xA2
        CALL	INST_XOR_JUDGE
        MOV		A,@0x02
        CALL	INST_RETL_TABLE
        XOR		A,@0xA4
        CALL	INST_XOR_JUDGE
        MOV		A,@0x03
        CALL	INST_RETL_TABLE
        XOR		A,@0xA8
        CALL	INST_XOR_JUDGE
    ENDM

SDxxx_EFT_SHORT_BRANCH MACRO
    INST_SJX:
        CALL	STATUS_CLEAR
        BS	C
        SJC		@0x03
        JMP		JMP_FAIL
        JMP		JMP_FAIL
        JMP		JMP_FAIL
        BC	C
        SJNC	bbb		;@0x03
        JMP		JMP_FAIL
        JMP		JMP_FAIL
        JMP		JMP_FAIL
        bbb:		
            BS		Z
            SJZ		@0x03
            JMP		JMP_FAIL
            JMP		JMP_FAIL
            JMP		JMP_FAIL
            CLRA
            SJZ		@0x03
            JMP		JMP_FAIL
            JMP		JMP_FAIL
            JMP		JMP_FAIL
        JMP		IATEST1		;JMP back Test as below
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
            JMP		JMP_FAIL
            JMP		JMP_FAIL
            JMP		JMP_FAIL
            JMP		IATEST3		; -9
            JMP		JMP_FAIL	; -8
            JMP		JMP_FAIL	; -7
            JMP		JMP_FAIL	; -6
            JMP		JMP_FAIL	; -5
            JMP		JMP_FAIL	; -4
            JMP		JMP_FAIL	; -3
        IATEST2:	
            BC		C		; -2
            SJNC		@0xF7	; -1
            JMP		_IPass
            JMP		_IPass
            JMP		_IPass
            JMP		IATEST4		; -9
            JMP		JMP_FAIL	; -8
            JMP		JMP_FAIL	; -7
            JMP		JMP_FAIL	; -6
            JMP		JMP_FAIL	; -5
            JMP		JMP_FAIL	; -4
            JMP		JMP_FAIL	; -3
        IATEST3:	
            BS		Z		; -2
            SJZ		@0xF7	; -1
            JMP		JMP_FAIL
            JMP		JMP_FAIL
            JMP		JMP_FAIL

            JMP		_IPass		; -9
            JMP		JMP_FAIL	; -8
            JMP		JMP_FAIL	; -7
            JMP		JMP_FAIL	; -6
            JMP		JMP_FAIL	; -5
            JMP		JMP_FAIL	; -4
            JMP		JMP_FAIL	; -3
        IATEST4:	
            BC		Z		; -2
            SJNZ	@0xF7	; -1
            JMP		JMP_FAIL
            JMP		JMP_FAIL
            JMP		JMP_FAIL
        _IPass:
            NOP
    ENDM

SDxxx_EFT_CONTROL MACRO
    INST_ENI:			;-------Instruction Test => ENI , IT?
        ENI
        JBS		IT		; Check IT = 1?
        JMP	INS_FAIL
    INST_DISI:			;-------Instruction Test => DISI , IT?
        DISI
        JBC		IT		; Check IT = 0?
        JMP	INS_FAIL
    ENDM

;;需更新給定位址之內容，才可測試
SDxxx_EFT_READ_ROM MACRO
    INST_TBLRD_R:
        SBANK	1
        MOV		A,@0xF1		;ADDR(0x0EF1)
        MOV		TBPTL,A
        MOV		A,@0x0E
        MOV		TBPTH,A
        SBANK	0
        TBRDA	0x50		; [0x50]+ A = [TABPTR] 
        XOR		A,@0xA1
        CALL	INST_XOR_JUDGE
        MOV		A,0x50
        XOR		A,@0x70
        CALL	INST_XOR_JUDGE
        SBANK	1
        INC		TBPTL		;ADDR(0x0EF2)
        SBANK	0
        TBRDA	0x50		; [0x50]+ A = [TABPTR] 
        XOR		A,@0xA2
        CALL	INST_XOR_JUDGE
        MOV		A,0x50
        XOR		A,@0x70
        CALL	INST_XOR_JUDGE
    INST_TBRD_R:		;-------Instruction Test => TBRD R
        SBANK	1
        MOV		A,@0xF3		;ADDR(0x0EF3)
        MOV		TBPTL,A
        MOV		A,@0x0E
        MOV		TBPTH,A
        SBANK	0
        TBRD	0x50
        MOV		A,0x50
        XOR		A,@0xA4
        CALL	INST_XOR_JUDGE
        SBANK	1
        INC		TBPTL		;ADDR(0x0EF4)
        SBANK	0
        TBRD	0x50
        MOV		A,0x50
        XOR		A,@0xA8
        CALL	INST_XOR_JUDGE
    ENDM
