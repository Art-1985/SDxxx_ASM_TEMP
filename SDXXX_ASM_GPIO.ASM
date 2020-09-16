;ORG 	0x03FF
;SDxxx_GPIO_INIT:
    ;SDxxx_GPIO_INIT
    ;RET



;SDxxx_SYS_INIT:	
    ;SBANK	0
    ;BS		CPUS
    ;BS		IDLE
    ;RET
	;CALL		GPIO_Control_01	; O/P:P5,P6,P7
	;CALL		GPIO_Control_011; I/P:P5,P6,P7
	;CALL		GPIO_Control_02	; O/P: P5,P6,P7 , Pull-Hi
	;CALL		GPIO_Control_03	; O/P: P5,P6,P7 , Pull-Lo
	;CALL		GPIO_Control_04	; O/P: P5,P6,P7 , Pull-HSCR
	;CALL		GPIO_Control_05	; O/P: P5,P6,P7 , Pull-OD

;;====== For IC Application =================================================;;
SDxxx_GPIO_INIT MACRO
	SBANK	0
	CLR		P5
	MOV		A,@0x0F
	MOV		IOCR5,A
    ENDM

;;====== For IC Function Verify =============================================;;
SDxxx_GPIO_OUT_P5 MACRO
	SBANK	0
    MOV		A,@0xFF
	MOV		PORT5,A
    MOV     0x50,@0xFE
    MOV     A,0x50
    MOV		IOCR5,A
    RL      0x50
    MOV     A,0x50
    MOV		IOCR5,A
    RL      0x50
    MOV     A,0x50
    MOV		IOCR5,A
    RL      0x50
    MOV     A,0x50
    MOV		IOCR5,A
    RL      0x50
    MOV     A,0x50
    MOV		IOCR5,A
    RL      0x50
    MOV     A,0x50    
    MOV		IOCR5,A
    RL      0x50
    MOV     A,0x50
    MOV		IOCR5,A
    RL      0x50
    MOV     A,0x50
    MOV		IOCR5,A
    ENDM

SDxxx_GPIO_OUT_P6 MACRO
	SBANK	0
    MOV		A,@0xFF
	MOV		PORT6,A
    MOV     A,@0xFF
    MOV		IOCR6,A
    MOV     0x50,@0xFE
    MOV     A,0x50
    MOV		IOCR6,A
    RL      0x50
    MOV     A,0x50
    MOV		IOCR6,A
    RL      0x50
    MOV     A,0x50
    MOV		IOCR6,A
    RL      0x50
    MOV     A,0x50
    MOV		IOCR6,A
    RL      0x50
    MOV     A,0x50
    MOV		IOCR6,A
    RL      0x50
    MOV     A,0x50
    MOV		IOCR6,A
    RL      0x50
    MOV     A,0x50
    MOV		IOCR6,A
    ENDM

SDxxx_GPIO_OUT_P7 MACRO
	SBANK	0
    MOV		A,@0xFF
	MOV		PORT7,A
    MOV     A,@0xFF
    MOV		IOCR7,A
    MOV     0x50,@0xFE
    MOV     A,0x50
    MOV		IOCR7,A
    RL      0x50
    MOV     A,0x50
    MOV		IOCR7,A
    RL      0x50
    MOV     A,0x50
    MOV		IOCR7,A
    RL      0x50
    MOV     A,0x50
    MOV		IOCR7,A
    RL      0x50
    MOV     A,0x50
    MOV		IOCR7,A
    RL      0x50
    MOV     A,0x50
    MOV		IOCR7,A
    RL      0x50
    MOV     A,0x50
    MOV		IOCR7,A
    ENDM

SDxxx_GPIO_PH_P5 MACRO
	SBANK	0
    ENDM

SDxxx_GPIO_PL_P5 MACRO
	SBANK	0
    ENDM

SDxxx_GPIO_OD_P5 MACRO
	SBANK	0
    ENDM

SDxxx_GPIO_HD_P5 MACRO
	SBANK	0
    ENDM
