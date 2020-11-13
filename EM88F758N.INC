
;======================================================;
;  Title:       EM88F758N include file                 ;
;  Description: The Definition of EM88F758N Registers  ;
;  Company:     ELAN MICROELECTRONICS LTD.	       	   ;
;  Date:        2014/09/10                             ;
;======================================================;

;======================================================;
; Operational Registers Define                         ;
;======================================================;
;======================================================;
; Registers R0~R4                                      ;
;======================================================;
; IAR: Indirect Address Register
IAR     ==    0x00:rpage 0
R0      ==    0x00:rpage 0

; BSR: Bank Selection Control Register
BSR     ==    0x01:rpage 0
	SBS1	==	BSR.5
	SBS0	==	BSR.4
	
	GBS1	==	BSR.1
	GBS0	==	BSR.0

; PC: Program Counter & Stack
PC      ==    0x02:rpage 0

; PSR: Process Status Register
STATUS  ==    0x03:rpage 0
	IT  	==  STATUS.7    ; Interrupt mask bit
	N       ==  STATUS.6    ; Negative bit
	OV      ==  STATUS.5    ; Overflow bit
	T       ==  STATUS.4    ; Time-out bit
	P       ==  STATUS.3    ; Power-down bit
	Z       ==  STATUS.2    ; Zero flag
	DC      ==  STATUS.1    ; Auxiliary carry flag
	C       ==  STATUS.0    ; Carry flag

; RSR: RAM Select Register
RSR     ==    0x04:rpage 0


;======================================================
;      BANK 0 Registers                                   
;======================================================
; R5 ~ RA: I/O Port Address
PORT5      ==    0x05:rpage 0
PORT6      ==    0x06:rpage 0
PORT7	   ==    0x07:rpage 0
PORT8      ==    0x08:rpage 0
PORT9	   ==    0x09:rpage 0
PORTA      ==    0x0A:rpage 0

; RB ~ RD: I/O Port Address
IOCR5	==    0x0B:rpage 0
IOCR6	==    0x0C:rpage 0
IOCR7	==    0x0D:rpage 0

; OMCR:Operating Mode Control Register
OMCR  	==    0x0E:rpage 0
	CPUS	==	OMCR.7			;CPU Osillator Source Select
	IDLE	==	OMCR.6			;Idle Mode Enable Bit.
	RCM2	==	OMCR.2
	RCM1	==	OMCR.1
	RCM0	==	OMCR.0
						
; EIESCR:External interrupt Edge Select Register
EIESCR  ==    0x0F:rpage 0
	EIES1	==	EIESCR.3
	EIES0	==	EIESCR.2

; WUCR1:Wake-up Control Register 1
WUCR1  ==    0x10:rpage 0
	LVDWK	==	WUCR1.5
	ADWK	==	WUCR1.4
	INT1WK	==	WUCR1.3
	INT0WK	==	WUCR1.2

; WUCR2:Wake-up Control Register 2
WUCR2  ==    0x11:rpage 0
	SPIWK	==	WUCR2.3
	I2CWK	==	WUCR2.2

; WUCR3:Wake-up Control Register 3
WUCR3  ==    0x12:rpage 0
	ICWKP8	==	WUCR3.7
	ICWKP7	==	WUCR3.6
	ICWKP6	==	WUCR3.5
	ICWKP5	==	WUCR3.4

; SFR1:Status Flag Register 1
SFR1  ==    0x14:rpage 0
	LVDSF	==	SFR1.5
	ADSF	==	SFR1.4
	EXSF1	==	SFR1.3
	EXSF0	==	SFR1.2
        WTSF    ==      SFR1.1
	TCSF	==	SFR1.0

; SFR2:Status Flag Register 2
SFR2  ==    0x15:rpage 0
	TC3SF	==	SFR2.2
	TC2SF	==	SFR2.1
	TC1SF	==	SFR2.0

; SFR3:Status Flag Register 3
SFR3  ==    0x16:rpage 0
	PWMBPSF	==	SFR3.3
	PWMBDSF	==	SFR3.2
	PWMAPSF	==	SFR3.1
	PWMADSF	==	SFR3.0

; SFR4:Status Flag Register 4
SFR4  ==    0x17:rpage 0
	P8ICSF	==	SFR4.7
	P7ICSF	==	SFR4.6
	P6ICSF	==	SFR4.5
	P5ICSF	==	SFR4.4
	SPISF	==	SFR4.3
	I2CSTPSF==	SFR4.2
	I2CRSF	==	SFR4.1
	I2CTSF	==	SFR4.0

; SFR6:Status Flag Register 6
SFR6  ==    0x19:rpage 0
	SHSF	==	SFR6.7

; IMR1:Interrupt Mask Register 1
IMR1  ==    0x1B:rpage 0
	LVDIE	==	IMR1.5
	ADIE	==	IMR1.4
	EXIE1	==	IMR1.3
	EXIE0	==	IMR1.2
        WTIE    ==      IMR1.1
	TCIE	==	IMR1.0

; IMR2:Interrupt Mask Register 2
IMR2  ==    0x1C:rpage 0
	TC3IE	==	IMR2.2
	TC2IE	==	IMR2.1
	TC1IE	==	IMR2.0

; IMR3:Interrupt Mask Register 3
IMR3  ==    0x1D:rpage 0
	PWMBPIE	==	IMR3.3
	PWMBDIE	==	IMR3.2
	PWMAPIE	==	IMR3.1
	PWMADIE	==	IMR3.0

; IMR4:Interrupt Mask Register 4
IMR4  ==    0x1E:rpage 0
	P8ICIE	==	IMR4.7
	P7ICIE	==	IMR4.6
	P6ICIE	==	IMR4.5
	P5ICIE	==	IMR4.4
	SPIIE	==	IMR4.3
	I2CSTPIE==	IMR4.2
	I2CRIE	==	IMR4.1
	I2CTIE	==	IMR4.0

; IMR6:Interrupt Mask Register 6
IMR6  ==    0x20:rpage 0
	SHIE	==	IMR6.7

; WDTCR:Watch Dog Timer Control Register
WDTCR  ==    0x21:rpage 0
	WDTE	==	WDTCR.7
	PSWE	==	WDTCR.3
	WPSR2	==	WDTCR.2
	WPSR1	==	WDTCR.1
	WPSR0	==	WDTCR.0

; TCCCR:TCC Control Register
TCCCR	==   0x22:rpage	0
	TCCS	==	TCCCR.6
	TS	==	TCCCR.5
	TE	==	TCCCR.4
	PSTE	==	TCCCR.3
	TPSR2	==	TCCCR.2
	TPSR1	==	TCCCR.1
	TPSR0	==	TCCCR.0

; TCCD:TCC Data Register
TCCD	==   0x23:rpage	0

; TC1CR1:TC1 Control Register 1
TC1CR1	==   0x24:rpage	0
	TC1S	==	TC1CR1.7
	TC1RC	==	TC1CR1.6
	TC1SS1	==	TC1CR1.5
	TC1MOD	==	TC1CR1.4
	TC1FF	==	TC1CR1.3
	TC1MOS	==	TC1CR1.2
	TC1IS1	==	TC1CR1.1
	TC1IS0	==	TC1CR1.0

; TC1CR2:TC1 Control Register 2
TC1CR2	==   0x25:rpage	0
	TC1M2	==	TC1CR2.7
	TC1M1	==	TC1CR2.6
	TC1M0	==	TC1CR2.5
	TC1SS0	==	TC1CR2.4
	TC1CK3	==	TC1CR2.3
	TC1CK2	==	TC1CR2.2
	TC1CK1	==	TC1CR2.1
	TC1CK0	==	TC1CR2.0

; TC1DA:TC1 Data Buffer A
TC1DA	==   0x26:rpage	0

; TC1DB:TC1 Data Buffer B
TC1DB	==   0x27:rpage	0


;======================================================
;      BANK 1 Registers                                   
;======================================================
; R5-R7: I/O Port Address
IOCR8	==    0x05:rpage 1
IOCR9	==    0x06:rpage 1
IOCRA	==    0x07:rpage 1

; P5~6PHCR (Port 5~6 Pull-high Control Register)
P5PHCR	==    0x08:rpage 1
P6PHCR	==    0x09:rpage 1
; P789APHCR (Port 7~A Pull-high Control Register)
P789APHCR ==  0x0A:rpage 1

; P5PLCR (Port 5 Pull-low Control Register)
P5PLCR  ==    0x0B:rpage 1
P6PLCR  ==    0x0C:rpage 1
; P789APLCR (Port 7~A Pull-low Control Register)
P789APLCR  == 0x0D:rpage 1

; P5HDSCR (Port 5 High Drive/Sink Control Register)
P5HDSCR  ==   0x0E:rpage 1
P6HDSCR  ==   0x0F:rpage 1
; P789AHDSCR (Port 7~A High Drive/Sink Control Register)
P789AHDSCR == 0x10:rpage 1

; P5ODCR (Port 5 Open-Drained Control Register)
P5ODCR   ==   0x11:rpage 1
P6ODCR   ==   0x12:rpage 1
; P789AODCR (Port 7~A Open-Drained Control Register)
P789AODCR ==  0x13:rpage 1

; R45: Table Point Low Register
TBPTL	==    0x45:rpage 1
; R46: Table Point High Register
TBPTH	==    0x46:rpage 1


























