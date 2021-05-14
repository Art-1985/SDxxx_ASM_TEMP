INCLUDE "EM88F758N.INC"
	TEMP == 0x50
	TC1A == 0x51
	TC2A == 0x52
	TC1B == 0x53
	TC2B == 0x54
	COUNT == 0x55
	
	ORG	0X00
	JMP	START
 
 	ORG	0X12
 	JMP	TC1_INT
 	
 	;ORG	0X28
 	;JMP	TC2_INT
 	
 	ORG	0X50
START:
;	SBANK 0
;	CLR IOCR6
	SBANK 0
	CLR IOCR5
 	MOV A,@0xFF
	MOV IOCR7,A
	;CLR P7
 	BS TC1IE     		;Enble TC1 interrupt
	CLR COUNT
	;CLR P7			;BIT7~5	
	ENI
	JMP     TC1_CONTROL_0
TC1_CONTROL_0:
 			SBANK	0
            CLR     TC1DA
            CLR     TC1DB
 			MOV     A, @0X02
 			MOV     TC1CR1, A			;Set pre-scaler1:1, Fm
  			MOV     A, @0X51
  			MOV     TC1CR2, A
 /* 			MOV     A, @0XFF
  			MOV     TC1DA, A
  			MOV     A, @0X7F
  			MOV     TC1DB, A*/
			BS      TC1MOD
 		
 			ENI

 			BS      TC1S

 			NOP
 			NOP
 			JMP		$-3
 			
 TC1_INT:
		SBANK	0
		BC      TC1S
	;	btg P5,7
	;	COM TEMP
		;JBC TC1DASF
		;JMP DA
		;JBC TC1DBSF
		;JMP DBD
		RETI
DA:
		;BC TC1DASF
		;btg P5,7
		;MOV A,TC2DA
		;MOV A,TC1DA
		RETI
DBD:
		;BC TC1DBSF
		;btg P5,6
		;MOV A,TC2DB
		;MOV A,TC1DB
		RETI
		
	