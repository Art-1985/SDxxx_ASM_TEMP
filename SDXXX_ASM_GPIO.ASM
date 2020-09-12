;ORG 	0x03FF
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

SDxxx_GPIO_OUT_P5 MACRO
	SBANK	0
    MOV		A,@0xFF
	MOV		PORT5,A
    MOV     A,@0x01
    MOV		IOCR5,A
    ;; <<A
    MOV		IOCR5,A
    MOV		IOCR5,A
    MOV		IOCR5,A
    MOV		IOCR5,A
    MOV		IOCR5,A
    MOV		IOCR5,A
    MOV		IOCR5,A
    ENDM

SDxxx_GPIO_OUT_P6 MACRO
	SBANK	0
    MOV		A,@0xFF
	MOV		PORT6,A
    MOV     A,@0x01
    MOV		IOCR6,A
    ;; <<A
    MOV		IOCR6,A
    MOV		IOCR6,A
    MOV		IOCR6,A
    MOV		IOCR6,A
    MOV		IOCR6,A
    MOV		IOCR6,A
    MOV		IOCR6,A
    ENDM

SDxxx_GPIO_OUT_P7 MACRO
	SBANK	0
    MOV		A,@0xFF
	MOV		PORT7,A
    MOV     A,@0x01
    MOV		IOCR7,A
    ;; <<A
    MOV		IOCR7,A
    MOV		IOCR7,A
    MOV		IOCR7,A
    MOV		IOCR7,A
    MOV		IOCR7,A
    MOV		IOCR7,A
    MOV		IOCR7,A
    ENDM