;==================== Project Include ====================
Include	"MTF351.INC"		;;Include the MTF351 define

;================ General Purpose Register ===============
	TMP0	== 0x50
	TMP1	== 0x51
	TMP2	== 0x52
	TMP3	== 0x53
	TMP4	== 0x54
	TMP5	== 0x55
	TMP6	== 0x56
	TMP7	== 0x57

	Data1_HB	== 0x60
	Data1_LB	== 0x61
	Data2_HB	== 0x62
	Data2_LB	== 0x63
	Data3_HB	== 0x64
	Data3_LB	== 0x65
	Data4_HB	== 0x66
	Data4_LB	== 0x67
	Data5_HB	== 0x68
	Data5_LB	== 0x69
	Data6_HB	== 0x6A
	Data6_LB	== 0x6B
	Data7_HB	== 0x6C
	Data7_LB	== 0x6D
	
;================ Interrupt Vector Table =================	
	ORG 	0x0000
	JMP 	MAIN
	ORG		0x0002
		JMP 	JMP_FAIL
		JMP 	JMP_FAIL
	ORG		0x0010
		JMP	_Int_ADC	
;==================== Main Function ======================
	ORG		0x0050
MAIN:
	SBANK	0
	CLR		P5
	CLR		P6
	CLR		P7
	SBANK	0
	BS		CPUS
	BC		IDLE	
	BC 		ADSF
	BS		ADIE
	;BS		ADWK
	;ENI

;==================== Mode Selection =====================
ADC_Buffer:
	;CALL		ADC_CONTROL_050
	;CALL		ADC_CONTROL_051	; Single,Buffer*4
	;CALL		ADC_CONTROL_053	; Single,Buffer*8
	
BACK_GROUND_LOOP:
	SBANK	0
	CALL		ADC_CONTROL_050
	
	MOV		A,ADDH		; ADC Hi-Byte
	MOV 	Data1_HB,A
	MOV		A,ADDL		; ADC Lo-Byte
	MOV 	Data1_LB,A

	JMP		BACK_GROUND_LOOP

;====================== ERROR_LOOP =====================
JMP_FAIL:
	SBANK	0
	JMP		JMP_FAIL

RAM_FAIL:
	SBANK	0
	JMP		RAM_FAIL
	
INS_FAIL:
	SBANK	0
	JMP		INS_FAIL


;================== Jmp Sub Function =====================
	ADC_CONTROL_050:
		SBANK	0
		MOV		A,@0x29
		MOV		ADER1,A
		MOV		A,@0xAB
		MOV		ADCR1,A
		MOV		A,@0x00
		MOV		ADCR2,A

		MOV		A,@0x80
		MOV		ADCONBUF,A
		MOV		A,@0x00
		MOV		ADISR,A
		
		;MOV		A,@0x81
		;MOV		ADCONBUF,A
		;MOV		A,@0x80
		;MOV		ADISR,A

		BS		ADRUN
		JBC		ADRUN
        JMP		$-1
        BC		ADSF
		RET


;============== Interrupt Service Routine ================
	;================================
	_Int_ADC:
		SBANK	0
		JBS 	ADSF
		JMP 	JMP_FAIL
		
		
		MOV		A,@0x80		; ADC Buffer Enable,PTR=0
		MOV		ADCONBUF,A
 		MOV		A,ADDH		; ADC Hi-Byte
 		MOV 	Data1_HB,A
 		MOV		A,ADDL		; ADC Lo-Byte
 		MOV 	Data1_LB,A

		MOV		A,@0x81		; ADC Buffer Enable,PTR=1
		MOV		ADCONBUF,A
 		MOV		A,ADDH		; ADC Hi-Byte
 		MOV 	Data2_HB,A
 		MOV		A,ADDL		; ADC Lo-Byte
 		MOV 	Data2_LB,A

		MOV		A,@0x82		; ADC Buffer Enable,PTR=2
		MOV		ADCONBUF,A
 		MOV		A,ADDH		; ADC Hi-Byte
 		MOV 	Data3_HB,A
 		MOV		A,ADDL		; ADC Lo-Byte
 		MOV 	Data3_LB,A

		MOV		A,@0x83		; ADC Buffer Enable,PTR=3
		MOV		ADCONBUF,A
 		MOV		A,ADDH		; ADC Hi-Byte
 		MOV 	Data4_HB,A
 		MOV		A,ADDL		; ADC Lo-Byte
 		MOV 	Data4_LB,A
/*
		MOV		A,@0x84		; ADC Buffer Enable,PTR=4
		MOV		ADCONBUF,A
 		MOV		A,ADDH		; ADC Hi-Byte
 		MOV 	Data5_HB,A
 		MOV		A,ADDL		; ADC Lo-Byte
 		MOV 	Data5_LB,A

		MOV		A,@0x85		; ADC Buffer Enable,PTR=5
		MOV		ADCONBUF,A
 		MOV		A,ADDH		; ADC Hi-Byte
 		MOV 	Data6_HB,A
 		MOV		A,ADDL		; ADC Lo-Byte
 		MOV 	Data6_LB,A

		MOV		A,@0x86		; ADC Buffer Enable,PTR=6
		MOV		ADCONBUF,A
 		MOV		A,ADDH		; ADC Hi-Byte
 		MOV 	Data7_HB,A
 		MOV		A,ADDL		; ADC Lo-Byte
 		MOV 	Data7_LB,A
*/

		BC		ADSF
		;BS		ADRUN
		RETI