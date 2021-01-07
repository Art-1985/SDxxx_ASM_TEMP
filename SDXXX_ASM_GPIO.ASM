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
	MOV		A,@0x00
	MOV		IOCR5,A
    ENDM

;;====== For IC Function Verify =============================================;;


;CALL		GPIO_Control_02 ; I/P:P5,P6,P7
;CALL		GPIO_Control_03	; O/P: P5,P6,P7 , Pull-Hi
;CALL		GPIO_Control_04	; O/P: P5,P6,P7 , Pull-Lo
;CALL		GPIO_Control_05	; O/P: P5,P6,P7 , Pull-HSCR
;CALL		GPIO_Control_06	; O/P: P5,P6,P7 , Pull-OD


;輸出預設為H，依序控制IOCR，每次一個BIT
SDxxx_GPIO_OUT_P5 MACRO
	SBANK	0
    MOV		A,@0xFF
	MOV		PORT5,A
    MOV     0x50,@0xFE
    MOV     A,0x50
    MOV		IOCR5,A ;P50
    RL      0x50
    MOV     A,0x50
    MOV		IOCR5,A ;P51
    RL      0x50
    MOV     A,0x50
    MOV		IOCR5,A ;P52
    RL      0x50
    MOV     A,0x50
    MOV		IOCR5,A ;P53
    RL      0x50
    MOV     A,0x50
    MOV		IOCR5,A ;P54
    RL      0x50
    MOV     A,0x50    
    MOV		IOCR5,A ;P55
    RL      0x50
    MOV     A,0x50
    MOV		IOCR5,A ;P56
    RL      0x50
    MOV     A,0x50
    MOV		IOCR5,A ;P57
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
;輸入，依序PH每一個BIT
SDxxx_GPIO_PH_P5 MACRO
	SBANK	0
	MOV		A,@0xFF
	MOV		IOCR5,A
    MOV		A,@0x00
	MOV		PORT5,A
    SBANK	1
    MOV     0x50,@0xFE
    MOV     A,0x50
    MOV		P5PHCR,A    ;PH50
    RL      0x50
    MOV     A,0x50
    MOV		P5PHCR,A    ;PH51
    RL      0x50
    MOV     A,0x50
    MOV		P5PHCR,A    ;PH52
    RL      0x50
    MOV     A,0x50
    MOV		P5PHCR,A    ;PH53
    RL      0x50
    MOV     A,0x50
    MOV		P5PHCR,A    ;PH54
    RL      0x50
    MOV     A,0x50
    MOV		P5PHCR,A    ;PH55
    RL      0x50
    MOV     A,0x50
    MOV		P5PHCR,A    ;PH56
    RL      0x50
    MOV     A,0x50
    MOV		P5PHCR,A    ;PH57
    ENDM
SDxxx_GPIO_PL_P5 MACRO
	SBANK	0
	SBANK	1
	MOV		A,@0xFE
    MOV		P5PLCR,A
    ENDM

;輸出
SDxxx_GPIO_OD_P5 MACRO
	SBANK	0
    SBANK	1
    MOV		A,@0x01
	MOV		P5ODCR,A

    ENDM
;輸出
SDxxx_GPIO_HD_P5 MACRO
	SBANK	0
    ENDM
