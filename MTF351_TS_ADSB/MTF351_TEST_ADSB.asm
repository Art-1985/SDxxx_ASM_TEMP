;============================================================   ; for sram.pat of test pattern
;	Project:		MTF351_TEST_SPEED                                 ; run xx ms
;                                                               ; check sram
;	FILE:			MTF351_TEST_SPEED.asm                               
;                                                               
;  	Target:  		MTF351                                          
;                                                               
;	Author:			J. L. Kuo                                         
;                                                               
;	Date:			2015/12/08                                          
;------------------------------------------------------------   
;	Description:	For MTF351 Function SPEED Test                  
;			PWR_ON		Port6 CC 33                                     
;			JMP_FAIL	Port5 Port6 FF FF                               
;			TEST OK   Port6 TMP55 AA                                  
;------------------------------------------------------------   
; History:                                                      
; Ver  | dd-mmm-yyyy |  Who  | Description of changes           
; =====|=============|=======|===============================   
;  0.1 | 24 Aug 2015 |Arthur | Original Release.                
; -----|-------------|-------|-------------------------------   
;  0.2 |                                                        
; -----|-------------|-------|-------------------------------   
;============================================================   
                                                                
;==================== Project Include ====================      
Include	"MTF351.INC"	;;Include the MTF351 define               
                                                                
;================ General Purpose Register ===============      
                                                                                                                                                                                
;==================== Main Function ======================                                                                                                                                                                        
org 0x0000
jmp MAIN
	ORG		0x0002
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
org 0x0050
MAIN:                              
	MOV A,@0x00                                           
	MOV PORT5,A                                          
	MOV PORT6,A                                          
	MOV PORT7,A                                          
	MOV IOCR5,A
	NOP
	NOP     
	MOV IOCR6,A     ; 
	BS  IOCR6,2
	NOP                                                                                    
	MOV IOCR7,A

	BS  PORT5,0
	NOP
	NOP
	BS  PORT5,1
	NOP
	NOP
	BS  PORT5,2	
	NOP
	NOP
	NOP
	NOP
	BC		P6,0
	NOP
	NOP
	NOP
	NOP	
	BC		P6,1
	NOP
	NOP
	NOP
	NOP
	BS  PORT6,3	;P61-P62@1PAD
	NOP
	NOP
	NOP
	NOP
	BC  PORT5,2
	NOP
	NOP	
	BC  PORT5,1
	NOP
	NOP
	BC  PORT5,0	
	NOP
	NOP
	CALL TESTREG
	NOP
	NOP
    SBANK 00
    BC              P6,0
    BC              P6,1
    CLR P5
    CALL SBANK0REG
	SBANK 00	
	BS		P6,0	
	BS		P6,1
	CLR P5
	CALL SBANK3REG
	SBANK 00
	BC		P6,0	
	BS		P6,1
	CLR P5
	CALL SBANK2REG
	SBANK 00
	BS		P6,0	
	BC		P6,1
	CLR P5
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP	
	CALL SBANK1REG
;	SBANK 00
;	BC		P6,0	
;	BC		P6,1
;	CLR P5
;	CALL SBANK0REG
	SBANK 00
	CLR P5
	CALL ENDDISPLAY
;====================== PASS_LOOP =====================
	JMP_PASS:
	BTG		P6,0
	BS		P6,1
	BTG		P6,0
	BC		P6,1
	BTG		P6,0
	BS		P6,1
	BTG		P6,0
	BC		P6,1
	JMP_PASSLOOP:	
	JMP		JMP_PASSLOOP

;====================== FAIL_LOOP =====================
JMP_FAIL:
	SBANK	0
	BC		P6,0	
	BC		P6,1
	BC		P6,3
	BS		P6,3
	BC		P6,3
	BS		P6,3	
	BC		P6,3
	JMP_FAILLOOP:	
	JMP		JMP_FAILLOOP

	;----------- END DISPLAY	-----------
	ENDDISPLAY:		
	SBANK	0
	BC		P5,0
	NOP
	NOP	
	BC		P5,1
	NOP
	NOP
	BC		P5,2
	NOP
	NOP
	BC		P5,3
	NOP
	NOP
	BC		P5,4
	NOP
	NOP
;	BS		P5,5
;	NOP
;	NOP	
	BC		P5,6
	NOP
	NOP
	BC		P5,7
	NOP
	NOP
	BC		P6,0
	NOP
	NOP	
	BC		P6,1
	NOP
	NOP
	BC		P6,2
	NOP
	NOP
	BC		P6,3
	NOP
	NOP
	BC		P6,4
	NOP
	NOP
	BS		P6,5
	NOP
	NOP	
 	BC		P6,6
 	NOP
	NOP
	BC		P6,7
	NOP
	NOP
	BS  PORT6,0
	NOP
	BS  PORT6,1
	NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        BC  PORT6,0
	NOP
	BC  PORT6,1
ENDRUN:	
	JMP ENDRUN
	JMP ENDRUN
	JMP ENDRUN
	JMP ENDRUN
	JMP ENDRUN
	JMP ENDRUN		  	  

	;====================== BANK 0 Registers ADC A R TEST =====================
TESTREG:
	SBANK 02
	COM EI01NCR		;mask INT1,2
	BS STATUS,0		;C=1
	MOV A,@0xFF
	MOV PRODH,A		;R=FF
	MOV A,@0x00		;ACC=00
	ADC A,PRODH 	;00+FF+1	
	CALL B2P5_DSP   ; ACC & STATUS
	CLR  PRODH  		  

	BC STATUS,0		
	MOV A,@0xFF		;R=00
	MOV RSR,A		
	COMA RSR		 	;ACC=00 ;DO=FF	
	SUBB A,PRODH 	;00-00-1	
	XOR A,@0xFF
	CALL B2P5_DSP

	  
	BS STATUS,0		 
	MOV A,@0xFF
	MOV PRODL,A		;R=FF
	MOV A,@0x00		;ACC=00
	ADC A,PRODL 	;00+FF+1	
	CALL B2P5_DSP
	CLR  PRODL 
  		  
	BC STATUS,0
	MOV A,@0xFF		;R=00
	MOV RSR,A		
	COMA RSR		 	;ACC=00 ;DO=FF
	SUBB A,PRODL 	;00-00-1 		
	XOR A,@0xFF
	CALL B2P5_DSP

	SBANK 00	
;====== SFR1 	 0x14  ====== 
  BS STATUS,0
  MOV A,@0xFF  ;is 00
  MOV SFR1,A
  MOV A,@0xFF  ;ia FF
  ADC A,SFR1 	
  CALL B0P5_DSP
  CLR SFR1 	

  BC STATUS,0
  MOV A,@0xFF		;R=00
  MOV RSR,A		
  COMA RSR		 	;ACC=00 ;DO=FF
  SUBB A,SFR1 	
  XOR A,@0xFF
  CALL B0P5_DSP 	

;====== SFR4	 0x17  ====== 
  BS STATUS,0
  MOV A,@0xFF		;R=00
  MOV SFR4,A
  MOV A,@0xFF		;ACC=FF DO=FF
  ADC A,SFR4	
  CALL B0P5_DSP
  CLR SFR4	

  BC STATUS,0
  MOV A,@0xFF		
  MOV RSR,A		
  COMA RSR		 	;ACC=00 ;DO=FF
  SUBB A,SFR4	
  XOR A,@0xFF
  CALL B0P5_DSP
  CLR SFR4	

;====== SFR6	 0x19  ====== 
  BS STATUS,0
  MOV A,@0xFF		;R=00
  MOV SFR6,A
  MOV A,@0xFF		;ACC=00 ;DO=FF
  ADC A,SFR6	
  CALL B0P5_DSP
  CLR SFR6	

  BC STATUS,0
  MOV A,@0xFF		;R=00
  MOV RSR,A		
  COMA RSR			;ACC=00 ;DO=FF
  SUBB A,SFR6	
  XOR A,@0xFF
  CALL B0P5_DSP
  CLR SFR6	

;====== IMR1 	 0x1B  ====== 
;  BS STATUS,0
;  MOV A,@0xFF
;  MOV IMR1 	,A
;  MOV A,@0x03
;  ADC A,IMR1 	
;  CALL B0P5_DSP
;  CLR IMR1 	

;  BC STATUS,0
;  MOV A,@0xFF		;R=00
;  MOV RSR,A		
;  COMA RSR		 ;ACC=00 ;DO=FF
;  SUBB A,IMR1 	
;  XOR A,@0xFF
;  CALL B0P5_DSP	

;====== IMR4 	 0x1E  ====== 
;  BS STATUS,0		;R=70
;  MOV A,@0x70
;  MOV IMR4,A
;  MOV A,@0x8F		;ACC=8F ;DO=8F
;  ADC A,IMR4 	
;  CALL B0P5_DSP
;  CLR IMR4 	

;  BC STATUS,0
;  MOV A,@0xFF		;R=00
;  MOV RSR,A		
;  COMA RSR		;ACC=00 ;DO=FF
;  SUBB A,IMR4 	
;  XOR A,@0xFF
;  CALL B0P5_DSP	

;====== IMR6 	 0x20  ====== 
;  BS STATUS,0		;R=80
;  MOV A,@0xFF
;  MOV IMR6 	,A
;  MOV A,@0x7F		;ACC=7F ;DO=7F
;  ADC A,IMR6 	
;  CALL B0P5_DSP
;  CLR IMR6 	

; BC STATUS,0
; MOV A,@0xFF		;R=00
; MOV RSR,A		
; COMA RSR		;ACC=00 ;DO=FF
; SUBB A,IMR6 	
; XOR A,@0xFF
; CALL B0P5_DSP	
        	  		
	RET 	
SBANK0REG:

;====== BSR      0x01  ======
        SBANK 00
        BS STATUS,0
        MOV A,@0xFF
        MOV BSR,A
        MOV A,@0x00
        ADC A,BSR     
        SBANK 00
        CALL B0P5_DSP
        CLR BSR
        
        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		 	;ACC=00 ;DO=FF
        SUBB A,BSR     
        XOR A,@0xFF
        CALL B0P5_DSP
     
        JMP PC19C
;====== PCL      0x02  ======
org 0x019c
PC19C: 
        BS STATUS,0
;       MOV A,@0xFF		;R=9F
;       MOV PCL,A
        MOV A,@0x60
        ADC A,PCL     
        CALL B0P5_DSP
;       CLR PCL
;		JMP PC19B     

;org 0x019b
;PC190:
        BC STATUS,0
;       MOV A,@0xFF		;R=a5
;       MOV PCL,A
        MOV A,@0x5A
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,PCL     
        XOR A,@0xFF
        CALL B0P5_DSP     

;====== STATUS   0x03  ====== 

;====== RSR      0x04  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV RSR,A
        MOV A,@0x00
        ADC A,RSR     
        CALL B0P5_DSP
        CLR RSR     

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV BSR,A		
        COMA BSR		;ACC=00 ;DO=FF
        SUBB A,RSR     
        XOR A,@0xFF
        SBANK 00
        CALL B0P5_DSP     

;====== P5       0x05  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV P5,A
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        MOV A,@0x00
        ADC A,P5
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
;       CALL B0P5_DSP
        CLR P5

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		 	;ACC=00 ;DO=FF
        SUBB A,P5
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
;       XOR A,@0xFF
;       CALL B0P5_DSP
        CLR P5

;====== P6       0x06  ====== 
        SBANK 00
        BS STATUS,0
        MOV A,@0xFF
        MOV P6,A
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        MOV A,@0x00
        ADC A,P6
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
;       CALL B0P5_DSP
        CLR P6
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		 	;ACC=00 ;DO=FF
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        SUBB A,P6
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        CLR P6

;====== P7	 0x07  ======
        CLR P7 
        BS STATUS,0
        MOV A,@0xFF
        MOV P7	,A        
        MOV A,@0x00
        ADC A,P7
;       CALL B0P5_DSP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP             
        MOV P7,A
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP             
        NOP
        NOP
        NOP
        NOP
        NOP   
        CLR P7
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP       	
;       BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		 	;ACC=00 ;DO=FF 
        SUBB A,P7
        MOV P7,A
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP     	
;       XOR A,@0xFF
;       CALL B0P5_DSP
        CLR P7	

;====== IOCR5	 0x0B  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV IOCR5	,A
        MOV A,@0x00
        ADC A,IOCR5	
        CALL B0P6_DSP
        CLR IOCR5	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF        
        SUBB A,IOCR5	
        XOR A,@0xFF
        CLR IOCR5
        CALL B0P6_DSP
	

;====== IOCR6	 0x0C  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV IOCR6	,A
        MOV A,@0x00
        ADC A,IOCR6	
        CALL B0P5_DSP	
        CLR IOCR6
        
        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF 
        SUBB A,IOCR6	
        XOR A,@0xFF
        CALL B0P5_DSP
        CLR IOCR6
        BS 	IOCR6,2

;====== IOCR7	 0x0D  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV IOCR7	,A
        MOV A,@0xFC
        ADC A,IOCR7	
        CALL B0P5_DSP
        CLR IOCR7	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,IOCR7	
        XOR A,@0xFF
        CALL B0P5_DSP
        CLR IOCR7	

;====== OMCR 	 0x0E  ====== 
;        BS STATUS,0		;R=C3
;        MOV A,@0xFF	
;        MOV OMCR,A
;        MOV A,@0x3C		;ACC=3C DO=3C
;        ADC A,OMCR 	
;        CALL B0P5_DSP
;       CLR OMCR 	

;        BC OMCR,6		;=83
;        BC STATUS,0
;		MOV A,@0x7C		;R=7C
;		MOV RSR,A		
;		COMA RSR		;ACC=83 ;DO=7C
;        SUBB A,OMCR 	
;        XOR A,@0xFF
;       CALL B0P5_DSP
;       CLR OMCR 	

;====== EIESCR   0x0F  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV EIESCR,A
        MOV A,@0xF3
        ADC A,EIESCR  
        CALL B0P5_DSP
        CLR EIESCR  

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,EIESCR  
        XOR A,@0xFF
        CALL B0P5_DSP
        COM EIESCR  

;====== WUCR1 	 0x10  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV WUCR1 	,A
        MOV A,@0x03
        ADC A,WUCR1 	
        CALL B0P5_DSP
        CLR WUCR1 	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,WUCR1 	
        XOR A,@0xFF
        CALL B0P5_DSP
        CLR WUCR1 	

;====== WUCR3    0x12  ====== 
        BS STATUS,0
        MOV A,@0xFF		;R=70
        MOV WUCR3,A
        MOV A,@0x8F		;ACC=8F ;DO=8F
        ADC A,WUCR3   
        CALL B0P5_DSP
        CLR WUCR3   

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,WUCR3   
        XOR A,@0xFF
        CALL B0P5_DSP
        CLR WUCR3   

;====== WDTCR 	 0x21  ====== 
        BS STATUS,0
        MOV A,@0xFF		;R=8F
        MOV WDTCR 	,A
        MOV A,@0x70
        ADC A,WDTCR 	
        CALL B0P5_DSP
        CLR WDTCR 	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,WDTCR 	
        XOR A,@0xFF
        CALL B0P5_DSP
        CLR WDTCR 	

;====== ADCR1	 0x3E  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV ADCR1	,A
        MOV A,@0x00
        ADC A,ADCR1	
        CALL B0P5_DSP
        CLR ADCR1	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,ADCR1	
        XOR A,@0xFF
        CALL B0P5_DSP
        CLR ADCR1	

;====== ADCR2	 0x3F  ====== 
        BS STATUS,0
        MOV A,@0xFF    ;R=7E
        MOV ADCR2	,A
        MOV A,@0x81
        ADC A,ADCR2	
        CALL B0P5_DSP
        CLR ADCR2	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,ADCR2	
        XOR A,@0xFF
        CALL B0P5_DSP
        CLR ADCR2	

;====== ADISR	 0x40  ====== 
        BS STATUS,0
        MOV A,@0xFF		;R=8F
        MOV ADISR	,A
        MOV A,@0x70
        ADC A,ADISR	
        CALL B0P5_DSP
        CLR ADISR	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,ADISR	
        XOR A,@0xFF
        CALL B0P5_DSP
        CLR ADISR	

;====== ADER1	 0x41  ====== 
        BS STATUS,0
        MOV A,@0xFF		;R=3F
        MOV ADER1	,A
        MOV A,@0xC0
        ADC A,ADER1	
        CALL B0P5_DSP
        CLR ADER1	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,ADER1	
        XOR A,@0xFF
        CALL B0P5_DSP
        CLR ADER1	

;====== ADDL	 0x43  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV ADDL	,A
        MOV A,@0xFF
        ADC A,ADDL	
        CALL B0P5_DSP
        CLR ADDL	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,ADDL	
        XOR A,@0xFF
        CALL B0P5_DSP
        CLR ADDL	

;====== ADDH	 0x44  ====== 
        BS STATUS,0
        MOV A,@0xFF		;R=00
        MOV ADDH	,A
        MOV A,@0xFF
        ADC A,ADDH	
        CALL B0P5_DSP
        CLR ADDH	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,ADDH	
        XOR A,@0xFF
        CALL B0P5_DSP
        CLR ADDH	

;====== ADCVL	 0x45  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV ADCVL	,A
        MOV A,@0x00
        ADC A,ADCVL	
        CALL B0P5_DSP
        CLR ADCVL	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,ADCVL	
        XOR A,@0xFF
        CALL B0P5_DSP
        CLR ADCVL	

;====== ADCVH	 0x46  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV ADCVH	,A
        MOV A,@0x00
        ADC A,ADCVH	
        CALL B0P5_DSP
        CLR ADCVH	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,ADCVH	
        XOR A,@0xFF
        CALL B0P5_DSP
        CLR ADCVH	

  RET

SBANK1REG:
        SBANK 00
        MOV A,@0xFF
        MOV IOCR5,A
        SBANK 01
;====== P5PHCR	 0x08  ====== 
        BS STATUS,0
        MOV P5PHCR,A
        MOV A,@0x00
        ADC A,P5PHCR	
        CALL B1P6_DSP
        CLR P5PHCR	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,P5PHCR	
        XOR A,@0xFF
        CALL B1P6_DSP
        CLR P5PHCR
        	
;====== P5PLCR	 0x0B  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV P5PLCR	,A
        MOV A,@0x00
        ADC A,P5PLCR	
        CALL B1P6_DSP	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,P5PLCR	
        XOR A,@0xFF
        CALL B1P6_DSP
        CLR P5PLCR	
        SBANK 00
        CLR IOCR5
        MOV A,@0xFF        
        MOV IOCR6,A 
        SBANK 01         
;====== P6PHCR	 0x09  ====== 
        BS STATUS,0
        MOV P6PHCR	,A
        MOV A,@0x00
        ADC A,P6PHCR	
        CALL B1P5_DSP
	
        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,P6PHCR	
        XOR A,@0xFF
        CALL B1P5_DSP
        SBANK 00
        MOV A,@0x04
        MOV IOCR6,A
        SBANK 01    
        
;====== P6PLCR	 0x0C  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV P6PLCR	,A
        MOV A,@0x00
        ADC A,P6PLCR	
        CALL B1P5_DSP
        CLR P6PLCR	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,P6PLCR	
        XOR A,@0xFF
        CALL B1P5_DSP
        CLR P6PLCR	
        CLR IOCR6
        
                        
;====== P7PHCR   0x0A  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV P7PHCR,A
        MOV A,@0xFE
        ADC A,P7PHCR  
        CALL B1P5_DSP
        CLR P7PHCR  

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,P7PHCR  
        XOR A,@0xFF
        CALL B1P5_DSP
        CLR P7PHCR  

;====== P7PLCR   0x0D  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV P7PLCR,A
        MOV A,@0xFE
        ADC A,P7PLCR  
        CALL B1P5_DSP
        CLR P7PLCR  

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,P7PLCR  
        XOR A,@0xFF
        CALL B1P5_DSP
        CLR P7PLCR  

;====== P5HDSCR	 0x0E  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV P5HDSCR	,A
        MOV A,@0x00
        ADC A,P5HDSCR	
        CALL B1P5_DSP
        CLR P5HDSCR	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,P5HDSCR	
        XOR A,@0xFF
        CALL B1P5_DSP
        CLR P5HDSCR	

;====== P6HDSCR	 0x0F  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV P6HDSCR	,A
        MOV A,@0x00
        ADC A,P6HDSCR	
        CALL B1P5_DSP
        CLR P6HDSCR	
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,P6HDSCR	
        XOR A,@0xFF
        CALL B1P5_DSP
        CLR P6HDSCR	

;====== P7HDSCR  0x10  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV P7HDSCR,A
        MOV A,@0xFE
        ADC A,P7HDSCR 
        CALL B1P5_DSP
        CLR P7HDSCR 
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,P7HDSCR 
        XOR A,@0xFF
        CALL B1P5_DSP
        CLR P7HDSCR 

;====== P5ODCR	 0x11  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV P5ODCR	,A
        MOV A,@0x00
        ADC A,P5ODCR	
        CALL B1P5_DSP
        CLR P5ODCR	
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,P5ODCR	
        XOR A,@0xFF
        CALL B1P5_DSP
        CLR P5ODCR	

;====== P6ODCR	 0x12  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV P6ODCR	,A
        MOV A,@0x00
        ADC A,P6ODCR	
        CALL B1P5_DSP
        CLR P6ODCR	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,P6ODCR	
        XOR A,@0xFF
        CALL B1P5_DSP
        CLR P6ODCR	

;====== P7ODCR   0x13  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV P7ODCR,A
        MOV A,@0xFE
        ADC A,P7ODCR  
        CALL B1P5_DSP
        CLR P7ODCR  

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,P7ODCR  
        XOR A,@0xFF
        CALL B1P5_DSP
        CLR P7ODCR  

;====== FLKR	 0x44  ====== 
;       BS STATUS,0
;       MOV A,@0xFF
;       MOV FLKR	,A
;       MOV A,@0x00
;       ADC A,FLKR	
;       CALL B1P5_DSP
;       CLR FLKR	

;       BC STATUS,0
;        MOV A,@0xFF		;R=00
;        MOV RSR,A		
;        COMA RSR		;ACC=00 ;DO=FF
;       SUBB A,FLKR	
;       XOR A,@0xFF
;       CALL B1P5_DSP
;       CLR FLKR	

;====== TBPTL	 0x45  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TBPTL	,A
        MOV A,@0x00
        ADC A,TBPTL	
        CALL B1P5_DSP
        CLR TBPTL	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TBPTL	
        XOR A,@0xFF
        CALL B1P5_DSP
        CLR TBPTL	

;====== TBPTH	 0x46  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TBPTH	,A
        MOV A,@0x30
        ADC A,TBPTH	
        CALL B1P5_DSP
        CLR TBPTH	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TBPTH	
        XOR A,@0xFF
        CALL B1P5_DSP
        CLR TBPTH	

;====== STKMON	 0x47  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV STKMON	,A
        MOV A,@0xFE
        ADC A,STKMON	
        CALL B1P5_DSP
        CLR STKMON	

        BC STATUS,0
        MOV A,@0xFE		;R=01
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,STKMON	
        XOR A,@0xFF
        CALL B1P5_DSP
        CLR STKMON	

;====== PCH	 0x48  ====== 
        BS STATUS,0
        MOV A,@0xFF		;R=04
;        MOV PCH	,A
        MOV A,@0xFB
        ADC A,PCH	
        CALL B1P5_DSP
;        CLR PCH	

        BC STATUS,0
        MOV A,@0xFB		;R=04
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,PCH	
        XOR A,@0xFF
        CALL B1P5_DSP
;        CLR PCH	

;====== LVDCR	 0x49  ====== 
;       BS STATUS,0
;       MOV A,@0xFF
;       MOV LVDCR	,A
;       MOV A,@0x00
;       ADC A,LVDCR	
;       CALL B1P5_DSP
;       CLR LVDCR	

;       BC STATUS,0
;       MOV A,@0x00
;       MOV LVDCR	,A
;       SUBB A,LVDCR	
;       XOR A,@0xFF
;       CALL B1P5_DSP
;       CLR LVDCR	

;====== COBS1	 0x4A  ======OPT. W0B15~B14=11 
        BS STATUS,0
        MOV A,@0x24
        MOV COBS1	,A
        MOV A,@0xDB
        ADC A,COBS1	
        CALL B1P5_DSP
        CLR COBS1	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,COBS1	
        XOR A,@0xFF
        CALL B1P5_DSP
        CLR COBS1	

;====== COBS3	 0x4C  ====== 
        BS STATUS,0
        MOV A,@0xFF		;R-3F
        MOV COBS3	,A
        MOV A,@0xC0
        ADC A,COBS3	
        CALL B1P5_DSP
        CLR COBS3	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,COBS3	
        XOR A,@0xFF
        CALL B1P5_DSP
        CLR COBS3	

;====== TBWCR	 0x4D  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TBWCR	,A
        MOV A,@0xFE
        ADC A,TBWCR	
        CALL B1P5_DSP
        CLR TBWCR	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TBWCR	
        XOR A,@0xFF
        CALL B1P5_DSP
        CLR TBWCR	

;====== TBWAL	 0x4E  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TBWAL	,A
        MOV A,@0x1F
        ADC A,TBWAL	
        CALL B1P5_DSP
        CLR TBWAL	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TBWAL	
        XOR A,@0xFF
        CALL B1P5_DSP
        CLR TBWAL	

;====== TBWAH	 0x4F  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TBWAH	,A
        MOV A,@0xF0
        ADC A,TBWAH	
        CALL B1P5_DSP
        CLR TBWAH	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TBWAH	
        XOR A,@0xFF
        CALL B1P5_DSP
        CLR TBWAH	

  RET

SBANK2REG:
        SBANK 02

;====== TM1CR1	 0x05  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TM1CR1	,A
        MOV A,@0x10
        ADC A,TM1CR1	
        CALL B2P5_DSP
        CLR TM1CR1	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TM1CR1	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TM1CR1	

;====== TM1CR2	 0x06  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TM1CR2	,A
        MOV A,@0x00
        ADC A,TM1CR2	
        CALL B2P5_DSP
        CLR TM1CR2	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TM1CR2	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TM1CR2	

;====== TM1DBH	 0x07  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TM1DBH	,A
        MOV A,@0x00
        ADC A,TM1DBH	
        CALL B2P5_DSP
        CLR TM1DBH	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TM1DBH	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TM1DBH	

;====== TM1DBL	 0x08  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TM1DBL	,A
        MOV A,@0x00
        ADC A,TM1DBL	
        CALL B2P5_DSP
        CLR TM1DBL	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TM1DBL	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TM1DBL	

;====== TM1DAH	 0x09  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TM1DAH	,A
        MOV A,@0x00
        ADC A,TM1DAH	
        CALL B2P5_DSP
        CLR TM1DAH	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TM1DAH	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TM1DAH	

;====== TM1DAL	 0x0A  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TM1DAL	,A
        MOV A,@0x00
        ADC A,TM1DAL	
        CALL B2P5_DSP
        CLR TM1DAL	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TM1DAL	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TM1DAL	

;====== TM2CR1	 0x0B  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TM2CR1	,A
        MOV A,@0x10
        ADC A,TM2CR1	
        CALL B2P5_DSP
        CLR TM2CR1	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TM2CR1	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TM2CR1	

;====== TM2CR2	 0x0C  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TM2CR2	,A
        MOV A,@0x00
        ADC A,TM2CR2	
        CALL B2P5_DSP
        CLR TM2CR2	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TM2CR2	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TM2CR2	

;====== TM2DBH	 0x0D  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TM2DBH	,A
        MOV A,@0x00
        ADC A,TM2DBH	
        CALL B2P5_DSP
        CLR TM2DBH	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TM2DBH	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TM2DBH	

;====== TM2DBL	 0x0E  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TM2DBL	,A
        MOV A,@0x00
        ADC A,TM2DBL	
        CALL B2P5_DSP
        CLR TM2DBL	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TM2DBL	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TM2DBL	

;====== TM2DAH	 0x0F  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TM2DAH	,A
        MOV A,@0x00
        ADC A,TM2DAH	
        CALL B2P5_DSP
        CLR TM2DAH	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TM2DAH	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TM2DAH	

;====== TM2DAL	 0x10  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TM2DAL	,A
        MOV A,@0x00
        ADC A,TM2DAL	
        CALL B2P5_DSP
        CLR TM2DAL	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TM2DAL	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TM2DAL	

;====== TM3CR1	 0x11  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TM3CR1	,A
        MOV A,@0x10
        ADC A,TM3CR1	
        CALL B2P5_DSP
        CLR TM3CR1	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TM3CR1	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TM3CR1	

;====== TM3CR2	 0x12  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TM3CR2	,A
        MOV A,@0x00
        ADC A,TM3CR2	
        CALL B2P5_DSP
        CLR TM3CR2	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TM3CR2	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TM3CR2	

;====== TM3DAH	 0x15  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TM3DAH	,A
        MOV A,@0x00
        ADC A,TM3DAH	
        CALL B2P5_DSP
        CLR TM3DAH	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TM3DAH	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TM3DAH	

;====== TM3DAL	 0x16  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TM3DAL	,A
        MOV A,@0x00
        ADC A,TM3DAL	
        CALL B2P5_DSP
        CLR TM3DAL	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TM3DAL	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TM3DAL	

;====== TM4CR1	 0x17  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TM4CR1	,A
        MOV A,@0x10
        ADC A,TM4CR1	
        CALL B2P5_DSP
        CLR TM4CR1	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TM4CR1	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TM4CR1	

;====== TM4CR2	 0x18  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TM4CR2	,A
        MOV A,@0x00
        ADC A,TM4CR2	
        CALL B2P5_DSP
        CLR TM4CR2	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TM4CR2	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TM4CR2	

;====== TM4DBH	 0x19  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TM4DBH	,A
        MOV A,@0x00
        ADC A,TM4DBH	
        CALL B2P5_DSP
        CLR TM4DBH	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TM4DBH	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TM4DBH	

;====== TM4DBL	 0x1A  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TM4DBL	,A
        MOV A,@0x00
        ADC A,TM4DBL	
        CALL B2P5_DSP
        CLR TM4DBL	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TM4DBL	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TM4DBL	

;====== TM4DAH	 0x1B  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TM4DAH	,A
        MOV A,@0x00
        ADC A,TM4DAH	
        CALL B2P5_DSP
        CLR TM4DAH	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TM4DAH	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TM4DAH	

;====== TM4DAL	 0x1C  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TM4DAL	,A
        MOV A,@0x00
        ADC A,TM4DAL	
        CALL B2P5_DSP
        CLR TM4DAL	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TM4DAL	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TM4DAL	

;====== EI01NCR	 0x1D  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV EI01NCR	,A
        MOV A,@0x44
        ADC A,EI01NCR	
        CALL B2P5_DSP
        CLR EI01NCR	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,EI01NCR	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR EI01NCR	

;====== CMP1CR	 0x1E  ====== 
;        BS STATUS,0
;        MOV A,@0xFF
;        MOV CMP1CR	,A
;        MOV A,@0x00
;        ADC A,CMP1CR	
;        CALL B2P5_DSP
;        CLR CMP1CR	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,CMP1CR	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR CMP1CR	

;====== CMP2CR	 0x1F  ====== 
;        BS STATUS,0
;        MOV A,@0xFF
;        MOV CMP2CR	,A
;        MOV A,@0x00
;        ADC A,CMP2CR	
;        CALL B2P5_DSP
;        CLR CMP2CR	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,CMP2CR	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR CMP2CR	

;====== CMPESCR	 0x22  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV CMPESCR	,A
        MOV A,@0xFC
        ADC A,CMPESCR	
        CALL B2P5_DSP
        CLR CMPESCR	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,CMPESCR	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR CMPESCR	

;====== CMP12NCR  0x23  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV CMP12NCR,A
        MOV A,@0x44
        ADC A,CMP12NCR 
        CALL B2P5_DSP
        CLR CMP12NCR 

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,CMP12NCR 
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR CMP12NCR 

;====== CMPTCR1	 0x25  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV CMPTCR1	,A
        MOV A,@0x0C
        ADC A,CMPTCR1	
        CALL B2P5_DSP
        CLR CMPTCR1	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,CMPTCR1	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR CMPTCR1	

;====== CMPTCR2	 0x26  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV CMPTCR2	,A
        MOV A,@0xEC
        ADC A,CMPTCR2	
        CALL B2P5_DSP
        CLR CMPTCR2	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,CMPTCR2	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR CMPTCR2	

;====== TCMP1H	 0x27  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TCMP1H	,A
        MOV A,@0x60
        ADC A,TCMP1H	
        CALL B2P5_DSP
        CLR TCMP1H	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TCMP1H	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TCMP1H	

;====== TCMP1L	 0x28  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TCMP1L	,A
        MOV A,@0x60
        ADC A,TCMP1L	
        CALL B2P5_DSP
        CLR TCMP1L	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TCMP1L	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TCMP1L	

;====== THCMP2H	 0x2B  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV THCMP2H	,A
        MOV A,@0x40
        ADC A,THCMP2H	
        CALL B2P5_DSP
        CLR THCMP2H	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,THCMP2H	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR THCMP2H	

;====== TLCMP2H	 0x2C  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TLCMP2H	,A
        MOV A,@0x40
        ADC A,TLCMP2H	
        CALL B2P5_DSP
        CLR TLCMP2H	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TLCMP2H	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TLCMP2H	

;====== THCMP2L	 0x2D  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV THCMP2L	,A
        MOV A,@0x40
        ADC A,THCMP2L	
        CALL B2P5_DSP
        CLR THCMP2L	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,THCMP2L	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR THCMP2L	

;====== TLCMP2L	 0x2E  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TLCMP2L	,A
        MOV A,@0x40
        ADC A,TLCMP2L	
        CALL B2P5_DSP
        CLR TLCMP2L	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TLCMP2L	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR TLCMP2L	

;====== COBS4	 0x3C  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV COBS4	,A
        MOV A,@0xFC
        ADC A,COBS4	
        CALL B2P5_DSP
        CLR COBS4	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,COBS4	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR COBS4	

;====== COBS5    0x3D  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV COBS5,A
        MOV A,@0x00
        ADC A,COBS5   
        CALL B2P5_DSP
        CLR COBS5   

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,COBS5   
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR COBS5   

;====== COBS6	 0x3E  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV COBS6	,A
        MOV A,@0xF0
        ADC A,COBS6	
        CALL B2P5_DSP
        CLR COBS6	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,COBS6	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR COBS6	

;====== COBS7	 0x3F  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV COBS7	,A
        MOV A,@0xC0
        ADC A,COBS7	
        CALL B2P5_DSP
        CLR COBS7	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,COBS7	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR COBS7	

;====== MULMOD	 0x40  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV MULMOD	,A
        MOV A,@0xE0
        ADC A,MULMOD	
        CALL B2P5_DSP
        CLR MULMOD	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,MULMOD	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR MULMOD	

;====== PRODH	 0x41  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV PRODH	,A
        MOV A,@0x00
        ADC A,PRODH	
        CALL B2P5_DSP
        CLR PRODH	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,PRODH	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR PRODH	

;====== PRODL	 0x42  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV PRODL	,A
        MOV A,@0x00
        ADC A,PRODL	
        CALL B2P5_DSP
        CLR PRODL	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,PRODL	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR PRODL	

;====== SFR7	 0x43  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV SFR7	,A
        MOV A,@0xFF
        ADC A,SFR7	
        CALL B2P5_DSP
        CLR SFR7	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,SFR7	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR SFR7	

;====== IMR7	 0x45  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV IMR7	,A
        MOV A,@0xF0
        ADC A,IMR7	
        CALL B2P5_DSP
        CLR IMR7	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,IMR7	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR IMR7	

;====== LOCKPR	 0x47  ====== 
;       BS STATUS,0
;       MOV A,@0xFF
;       MOV LOCKPR	,A
;       MOV A,@0xFF
;       ADC A,LOCKPR	
;       CALL B2P5_DSP
        CLR LOCKPR	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,LOCKPR	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR LOCKPR	

;====== LOCKCR	 0x48  ====== 
;        BS STATUS,0
;        MOV A,@0xFF
;        MOV LOCKCR	,A
;        MOV A,@0x00
;        ADC A,LOCKCR	
;        CALL B2P5_DSP
        CLR LOCKCR	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,LOCKCR	
        XOR A,@0xFF
        CALL B2P5_DSP
        CLR LOCKCR	

;====== ICEMR3	 0x49  ====== 
;        BS STATUS,0
;        MOV A,@0xFF
;        MOV ICEMR3	,A
;        MOV A,@0x00
;        ADC A,ICEMR3	
;        CALL B2P5_DSP
         CLR ICEMR3	

         BC STATUS,0
         MOV A,@0xFF		;R=00
         MOV RSR,A		
         COMA RSR		;ACC=00 ;DO=FF
         SUBB A,ICEMR3	
         XOR A,@0xFF
         CALL B2P5_DSP
         CLR ICEMR3	

;====== ICEMR2	 0x4A  ====== 
;        BS STATUS,0
;        MOV A,@0xFF
;        MOV ICEMR2	,A
;        MOV A,@0x00
;        ADC A,ICEMR2	
;        CALL B2P5_DSP
;        CLR ICEMR2	

;        BC STATUS,0
;        MOV A,@0x00
;        MOV ICEMR2	,A
;        SUBB A,ICEMR2	
;        XOR A,@0xFF
;        CALL B2P5_DSP
;        CLR ICEMR2	

;====== ICEMR1	 0x4B  ====== 
;        BS STATUS,0
;        MOV A,@0xFF
;        MOV ICEMR1	,A
;        MOV A,@0x00
;        ADC A,ICEMR1	
;        CALL B2P5_DSP
;        CLR ICEMR1	

;        BC STATUS,0
;        MOV A,@0x00
;        MOV ICEMR1	,A
;        SUBB A,ICEMR1	
;        XOR A,@0xFF
;        CALL B2P5_DSP
;        CLR ICEMR1	

;====== ICEACK	 0x4C  ====== 
;        BS STATUS,0
;        MOV A,@0xFF
;        MOV ICEACK	,A
;        MOV A,@0x00
;        ADC A,ICEACK	
;        CALL B2P5_DSP
;        CLR ICEACK	

;        BC STATUS,0
;        MOV A,@0x00
;        MOV ICEACK	,A
;        SUBB A,ICEACK	
;        XOR A,@0xFF
;        CALL B2P5_DSP
;        CLR ICEACK	

;====== ICEBUF	 0x4D  ====== 
;        BS STATUS,0
;        MOV A,@0xFF
;        MOV ICEBUF	,A
;        MOV A,@0x00
;        ADC A,ICEBUF	
;        CALL B2P5_DSP
;        CLR ICEBUF	

;        BC STATUS,0
;        MOV A,@0x00
;        MOV ICEBUF	,A
;        SUBB A,ICEBUF	
;        XOR A,@0xFF
;        CALL B2P5_DSP
;        CLR ICEBUF	

	RET
	
SBANK3REG:
        SBANK 03
;====== EIOPWMPE0	 0x05  ====== 
        BS STATUS,0
        MOV A,@0xFF		;R=3F
        MOV EIOPWMPE0	,A
        MOV A,@0xC0
        ADC A,EIOPWMPE0	
        CALL B3P5_DSP
        CLR EIOPWMPE0	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,EIOPWMPE0	
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR EIOPWMPE0	

;====== EOPWMPE0	 0x06  ====== 
        BS STATUS,0
        MOV A,@0xFF		;30
        MOV EOPWMPE0	,A
        MOV A,@0xCF
        ADC A,EOPWMPE0	
        CALL B3P5_DSP
        CLR EOPWMPE0	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,EOPWMPE0	
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR EOPWMPE0	

;====== EIOPHAPE	 0x07  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV EIOPHAPE	,A
        MOV A,@0xC0
        ADC A,EIOPHAPE	
        CALL B3P5_DSP
        CLR EIOPHAPE	

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,EIOPHAPE	
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR EIOPHAPE	

;====== T5CRH		 0x09  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T5CRH		,A
        MOV A,@0x00
        ADC A,T5CRH		
        CALL B3P5_DSP
        CLR T5CRH		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T5CRH		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T5CRH		

;====== T5CRL		 0x0A  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T5CRL		,A
        MOV A,@0x4E
        ADC A,T5CRL		
        CALL B3P5_DSP
        CLR T5CRL		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T5CRL		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T5CRL		

;====== T6CRH		 0x0B  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T6CRH		,A
        MOV A,@0x00
        ADC A,T6CRH		
        CALL B3P5_DSP
        CLR T6CRH		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T6CRH		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T6CRH		

;====== T6CRL		 0x0C  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T6CRL		,A
        MOV A,@0x00
        ADC A,T6CRL		
        CALL B3P5_DSP
        CLR T6CRL		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T6CRL		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T6CRL		

;====== PWMCR1H		 0x0D  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV PWMCR1H		,A
        MOV A,@0xC0
        ADC A,PWMCR1H		
        CALL B3P5_DSP
        CLR PWMCR1H		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,PWMCR1H		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR PWMCR1H		

;====== PWMCR1L		 0x0E  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV PWMCR1L		,A
        MOV A,@0xC0
        ADC A,PWMCR1L		
        CALL B3P5_DSP
        CLR PWMCR1L		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,PWMCR1L		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR PWMCR1L		

;====== PWMCR2H		 0x0F  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV PWMCR2H		,A
        MOV A,@0x38
        ADC A,PWMCR2H		
        CALL B3P5_DSP
        CLR PWMCR2H		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,PWMCR2H		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR PWMCR2H		

;====== PWMCR2L		 0x10  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV PWMCR2L		,A
        MOV A,@0x8F
        ADC A,PWMCR2L		
        CALL B3P5_DSP
        CLR PWMCR2L		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,PWMCR2L		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR PWMCR2L		

;====== T5OPMS		 0x11  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T5OPMS		,A
        MOV A,@0xEA
        ADC A,T5OPMS		
        CALL B3P5_DSP
        CLR T5OPMS		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T5OPMS		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T5OPMS		

;====== T6OPMS		 0x12  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T6OPMS		,A
        MOV A,@0x03
        ADC A,T6OPMS		
        CALL B3P5_DSP
        CLR T6OPMS		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T6OPMS		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T6OPMS		

;====== ASPWM		 0x13  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV ASPWM		,A
        MOV A,@0xC0
        ADC A,ASPWM		
        CALL B3P5_DSP
        CLR ASPWM		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,ASPWM		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR ASPWM		

;====== LVPWM		 0x14  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV LVPWM		,A
        MOV A,@0xC0
        ADC A,LVPWM		
        CALL B3P5_DSP
        CLR LVPWM		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,LVPWM		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR LVPWM		

;====== SLPWM		 0x15  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV SLPWM		,A
        MOV A,@0xFC
        ADC A,SLPWM		
        CALL B3P5_DSP
        CLR SLPWM		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,SLPWM		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR SLPWM		

;====== COPH		 0x16  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV COPH		,A
        MOV A,@0xFF
        ADC A,COPH		
        CALL B3P5_DSP
        CLR COPH		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,COPH		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR COPH		

;====== COPL		 0x17  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV COPL		,A
        MOV A,@0xFF
        ADC A,COPL		
        CALL B3P5_DSP
        CLR COPL		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,COPL		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR COPL		

;====== MCOPH		 0x18  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV MCOPH		,A
        MOV A,@0x88
        ADC A,MCOPH		
        CALL B3P5_DSP
        CLR MCOPH		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,MCOPH		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR MCOPH		

;====== MCOP		 0x19  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV MCOP		,A
        MOV A,@0xC0
        ADC A,MCOP		
        CALL B3P5_DSP
        CLR MCOP		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,MCOP		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR MCOP		

;====== T5DECR		 0x1A  ====== 
        BS STATUS,0
        MOV A,@0xFF		;R=77
        MOV T5DECR		,A
        MOV A,@0x88
        ADC A,T5DECR		
        CALL B3P5_DSP
        CLR T5DECR		

        BC STATUS,0
        MOV A,@0x8F		;R=70
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T5DECR		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T5DECR		

;====== T5DEB		 0x1B  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T5DEB		,A
        MOV A,@0x00
        ADC A,T5DEB		
        CALL B3P5_DSP
        CLR T5DEB		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T5DEB		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T5DEB		

;====== HACRH		 0x1C  ====== 
        BS STATUS,0
        MOV A,@0xFF		;R=7F
        MOV HACRH		,A
        MOV A,@0x80
        ADC A,HACRH		
        CALL B3P5_DSP
        CLR HACRH		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,HACRH		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR HACRH		

;====== HACRL		 0x1D  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV HACRL		,A
        MOV A,@0x1F
        ADC A,HACRL		
        CALL B3P5_DSP
        CLR HACRL		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,HACRL		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR HACRL		

;====== BRKCR1H		 0x1E  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV BRKCR1H		,A
        MOV A,@0x7C
        ADC A,BRKCR1H		
        CALL B3P5_DSP
        CLR BRKCR1H		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,BRKCR1H		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR BRKCR1H		

;====== BRKCR1L		 0x1F  ====== 
;        BS STATUS,0
;        MOV A,@0xFF
;        MOV BRKCR1L		,A
;        MOV A,@0xFF
;        ADC A,BRKCR1L		
;        CALL B3P5_DSP
        CLR BRKCR1L		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,BRKCR1L		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR BRKCR1L		

;====== BRKCR2H		 0x20  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV BRKCR2H		,A
        MOV A,@0xE8
        ADC A,BRKCR2H		
        CALL B3P5_DSP
        CLR BRKCR2H		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,BRKCR2H		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR BRKCR2H		

;====== BRKCR2L		 0x21  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV BRKCR2L		,A
        MOV A,@0xC0
        ADC A,BRKCR2L		
        CALL B3P5_DSP
        CLR BRKCR2L		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,BRKCR2L		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR BRKCR2L		

;====== TRADCR		 0x22  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TRADCR		,A
        MOV A,@0x00
        ADC A,TRADCR		
        CALL B3P5_DSP
        CLR TRADCR		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TRADCR		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR TRADCR		

;====== TSF1H		 0x23  ====== 
        BS STATUS,0
        MOV A,@0xFF		;R=00***
        MOV TSF1H,A
        MOV A,@0xFF		;A=00 DO=FF***
        ADC A,TSF1H		
        CALL B3P5_DSP
        CLR TSF1H		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TSF1H		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR TSF1H		

;====== TSF1L		 0x24  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TSF1L		,A
        MOV A,@0xFF
        ADC A,TSF1L		
        CALL B3P5_DSP
        CLR TSF1L		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TSF1L		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR TSF1L		

;====== SETM1H		 0x25  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV SETM1H		,A
        MOV A,@0xB3
        ADC A,SETM1H		
        CALL B3P5_DSP
        CLR SETM1H		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,SETM1H		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR SETM1H		

;====== SETM1L		 0x26  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV SETM1L		,A
        MOV A,@0xF0
        ADC A,SETM1L		
        CALL B3P5_DSP
        CLR SETM1L		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,SETM1L		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR SETM1L		

;====== RSTM1H		 0x27  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV RSTM1H		,A
        MOV A,@0xB3
        ADC A,RSTM1H		
        CALL B3P5_DSP
        CLR RSTM1H		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,RSTM1H		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR RSTM1H		

;====== RSTM1L		 0x28  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV RSTM1L		,A
        MOV A,@0xF0
        ADC A,RSTM1L		
        CALL B3P5_DSP
        CLR RSTM1L		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,RSTM1L		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR RSTM1L		

;====== T5VALH		 0x2B  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T5VALH		,A
        MOV A,@0xFF
        ADC A,T5VALH		
        CALL B3P5_DSP
        CLR T5VALH		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T5VALH		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T5VALH		

;====== T5VALL		 0x2C  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T5VALL		,A
        MOV A,@0xFF
        ADC A,T5VALL		
        CALL B3P5_DSP
        CLR T5VALL		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T5VALL		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T5VALL		

;====== T5PDH		 0x2D  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T5PDH		,A
        MOV A,@0x00
        ADC A,T5PDH		
        CALL B3P5_DSP
        CLR T5PDH		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T5PDH		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T5PDH		

;====== T5PDL		 0x2E  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T5PDL		,A
        MOV A,@0x00
        ADC A,T5PDL		
        CALL B3P5_DSP
        CLR T5PDL		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T5PDL		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T5PDL		

;====== T5ACDH		 0x2F  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T5ACDH		,A
        MOV A,@0xFF
        ADC A,T5ACDH		
        CALL B3P5_DSP
        CLR T5ACDH		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T5ACDH		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T5ACDH		

;====== T5ACDL		 0x30  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T5ACDL		,A
        MOV A,@0xFF
        ADC A,T5ACDL		
        CALL B3P5_DSP
        CLR T5ACDL		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T5ACDL		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T5ACDL		

;====== T5BCDH		 0x31  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T5BCDH		,A
        MOV A,@0xFF
        ADC A,T5BCDH		
        CALL B3P5_DSP
        CLR T5BCDH		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T5BCDH		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T5BCDH		

;====== T5BCDL		 0x32  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T5BCDL		,A
        MOV A,@0xFF
        ADC A,T5BCDL		
        CALL B3P5_DSP
        CLR T5BCDL		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T5BCDL		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T5BCDL		

;====== T5CCDH		 0x33  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T5CCDH		,A
        MOV A,@0xFF
        ADC A,T5CCDH		
        CALL B3P5_DSP
        CLR T5CCDH		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T5CCDH		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T5CCDH		

;====== T5CCDL		 0x34  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T5CCDL		,A
        MOV A,@0xFF
        ADC A,T5CCDL		
        CALL B3P5_DSP
        CLR T5CCDL		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T5CCDL		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T5CCDL		

;====== T5ACDMH		 0x35  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T5ACDMH		,A
        MOV A,@0x00
        ADC A,T5ACDMH		
        CALL B3P5_DSP
        CLR T5ACDMH		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T5ACDMH		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T5ACDMH		

;====== T5ACDML		 0x36  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T5ACDML		,A
        MOV A,@0x00
        ADC A,T5ACDML		
        CALL B3P5_DSP
        CLR T5ACDML		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T5ACDML		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T5ACDML		

;====== T5BCDMH		 0x37  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T5BCDMH		,A
        MOV A,@0x00
        ADC A,T5BCDMH		
        CALL B3P5_DSP
        CLR T5BCDMH		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T5BCDMH		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T5BCDMH		

;====== T5BCDML		 0x38  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T5BCDML		,A
        MOV A,@0x00
        ADC A,T5BCDML		
        CALL B3P5_DSP
        CLR T5BCDML		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T5BCDML		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T5BCDML		

;====== T5CCDMH		 0x39  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T5CCDMH		,A
        MOV A,@0x00
        ADC A,T5CCDMH		
        CALL B3P5_DSP
        CLR T5CCDMH		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T5CCDMH		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T5CCDMH		

;====== T5CCDML		 0x3A  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T5CCDML		,A
        MOV A,@0x00
        ADC A,T5CCDML		
        CALL B3P5_DSP
        CLR T5CCDML		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T5CCDML		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T5CCDML		

;====== TRAD1VH		 0x3B  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TRAD1VH		,A
        MOV A,@0x00
        ADC A,TRAD1VH		
        CALL B3P5_DSP
        CLR TRAD1VH		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TRAD1VH		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR TRAD1VH		

;====== TRAD1VL		 0x3C  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TRAD1VL		,A
        MOV A,@0x00
        ADC A,TRAD1VL		
        CALL B3P5_DSP
        CLR TRAD1VL		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TRAD1VL		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR TRAD1VL		

;====== TRAD2VH		 0x3D  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TRAD2VH		,A
        MOV A,@0x00
        ADC A,TRAD2VH		
        CALL B3P5_DSP
        CLR TRAD2VH		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TRAD2VH		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR TRAD2VH		

;====== TRAD2VL		 0x3E  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV TRAD2VL		,A
        MOV A,@0x00
        ADC A,TRAD2VL		
        CALL B3P5_DSP
        CLR TRAD2VL		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,TRAD2VL		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR TRAD2VL		

;====== T6VALH		 0x3F  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T6VALH		,A
        MOV A,@0xFF
        ADC A,T6VALH		
        CALL B3P5_DSP
        CLR T6VALH		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T6VALH		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T6VALH		

;====== T6VALL		 0x40  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T6VALL		,A
        MOV A,@0xFF
        ADC A,T6VALL		
        CALL B3P5_DSP
        CLR T6VALL		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T6VALL		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T6VALL		

;====== T6PDH		 0x41  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T6PDH		,A
        MOV A,@0x00
        ADC A,T6PDH		
        CALL B3P5_DSP
        CLR T6PDH		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T6PDH		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T6PDH		

;====== T6PDL		 0x42  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T6PDL		,A
        MOV A,@0x00
        ADC A,T6PDL		
        CALL B3P5_DSP
        CLR T6PDL		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T6PDL		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T6PDL		

;====== T6CDH		 0x43  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T6CDH		,A
        MOV A,@0xFF
        ADC A,T6CDH		
        CALL B3P5_DSP
        CLR T6CDH		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T6CDH		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T6CDH		

;====== T6CDL		 0x44  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T6CDL		,A
        MOV A,@0xFF
        ADC A,T6CDL		
        CALL B3P5_DSP
        CLR T6CDL		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T6CDL		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T6CDL		

;====== T6CDMH		 0x45  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T6CDMH		,A
        MOV A,@0x00
        ADC A,T6CDMH		
        CALL B3P5_DSP
        CLR T6CDMH		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T6CDMH		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T6CDMH		

;====== T6CDML		 0x46  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV T6CDML		,A
        MOV A,@0xFF
        ADC A,T6CDML		
        CALL B3P5_DSP
        CLR T6CDML		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,T6CDML		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR T6CDML		

;====== SFR9		 0x4C  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV SFR9,A
        MOV A,@0xFF
        ADC A,SFR9		
        CALL B3P5_DSP
        CLR SFR9		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,SFR9		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR SFR9		

;====== SFR10		 0x4D  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV SFR10,A
        MOV A,@0x7F
        ADC A,SFR10		
        CALL B3P5_DSP
        CLR SFR10		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,SFR10		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR SFR10		

;====== IMR9		 0x4E  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV IMR9		,A
        MOV A,@0x00
        ADC A,IMR9		
        CALL B3P5_DSP
        CLR IMR9		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,IMR9		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR IMR9		

;====== IMR10		 0x4F  ====== 
        BS STATUS,0
        MOV A,@0xFF
        MOV IMR10		,A
        MOV A,@0x00
        ADC A,IMR10		
        CALL B3P5_DSP
        CLR IMR10		

        BC STATUS,0
        MOV A,@0xFF		;R=00
        MOV RSR,A		
        COMA RSR		;ACC=00 ;DO=FF
        SUBB A,IMR10		
        XOR A,@0xFF
        CALL B3P5_DSP
        CLR IMR10		

        RET
				;----------- B0P5 DISPLAY	-----------
B0P5_DSP:
	MOV	P5,A	
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
	MOV A,STATUS
        XOR A,@0x1c
	MOV	P5,A
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
	RET
	
B2P5_DSP:
	SBANK	0
	MOV	P5,A
	NOP	
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
	MOV A,STATUS
	XOR A,@0x1c
	MOV	P5,A
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
	SBANK	2  		
	RET
	
B3P5_DSP:
	SBANK	0
	MOV	P5,A
	NOP	
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
	MOV A,STATUS
	XOR A,@0x1c
	MOV	P5,A
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
	SBANK	3  		
	RET
	;----------- B0P6 DISPLAY	--
B0P6_DSP:                     
	SBANK	0                     
	MOV	P6,A                    
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP                         
        NOP                   
        NOP                   
        NOP                   
        NOP                   
        NOP                   
        NOP                   
        NOP
        NOP
        NOP                   
	NOP	                        
	MOV A,STATUS                
        XOR A,@0x1c           
	MOV	P6,A                    
	NOP                         
	NOP                         
	NOP                         
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP                         
        NOP                   
        NOP                   
        NOP                   
        NOP
        NOP
        NOP                   
	SBANK	0  		                
	RET                         

	;----------- B1P5 DISPLAY	-----------
B1P5_DSP:
	SBANK	0
	MOV	P5,A
	NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP	
	MOV A,STATUS
        XOR A,@0x1c
	MOV	P5,A
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
	SBANK	1  		
	RET

	;----------- B1P6 DISPLAY	--
B1P6_DSP:                     
	SBANK	0                     
	MOV	P6,A                    
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP                         
        NOP
        NOP                   
        NOP                   
        NOP                   
        NOP                   
        NOP                   
        NOP
        NOP
        NOP                        
        NOP                   
        NOP                   
        NOP                   
        NOP                   
        NOP                   
        NOP
        NOP
        NOP                   
	NOP	                        
	MOV A,STATUS                
    XOR A,@0x1c           
	MOV	P6,A                    
	NOP                         
	NOP                         
	NOP                         
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP                         
        NOP
        NOP                   
        NOP                   
        NOP                   
        NOP                   
        NOP                   
        NOP
        NOP
        NOP                        
        NOP                   
        NOP                   
        NOP
        NOP
        NOP
	SBANK 00
	BC		P6,0	
	BS		P6,1
	BC		P6,2
	NOP                         
	NOP                         
	NOP                         
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP                         
        NOP
                NOP                   
        NOP                   
        NOP                   
        NOP                   
        NOP                   
        NOP
        NOP
        NOP                        
        NOP                   
        NOP                   
        NOP
        NOP
        NOP                   
	SBANK	01 
	RET
