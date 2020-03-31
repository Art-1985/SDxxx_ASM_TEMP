;======================================================;
;  Title:       EM88F758N Include File                 ;
;  Description: The Definition of EM88F758N Registers  ;
;  Company:     ELAN MICROELECTRONICS LTD.	       	   ;
;  Date:        2014/12/03                             ;
;======================================================;

;======================================================;
; Operational Registers Define                         ;
;======================================================;
;======================================================;
; Registers R0~R4                                      ;
;======================================================;
; IAR: Indirect Address Register
IAR     ==    0x00:rpage 0

; BSR: Bank Selection Control Register
BSR     ==    0x01:rpage 0
	SBS1	==	BSR.5
	SBS0	==	BSR.4
	GBS0	==	BSR.0

; PC: Program Counter Low
PCL      ==    0x02:rpage 0

; PSR: Process Status Register
STATUS  ==    0x03:rpage 0
	IT	==  STATUS.7    ; Interrupt mask bit
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
P5      ==    0x05:rpage 0
P6      ==    0x06:rpage 0
P7	==    0x07:rpage 0
PORT5   ==    0x05:rpage 0
PORT6   ==    0x06:rpage 0
PORT7   ==    0x07:rpage 0

; RB ~ RD: I/O Control Register
IOCR5	==    0x0B:rpage 0
IOCR6	==    0x0C:rpage 0
IOCR7	==    0x0D:rpage 0

; OMCR:Operating Mode Control Register
OMCR 	==    0x0E:rpage 0
	CPUS	==	OMCR.7			;CPU Osillator Source Select
	IDLE	==	OMCR.6			;Idle Mode Enable Bit.
	CLK2	==	OMCR.5
	CLK1	==	OMCR.4
	CLK0	==	OMCR.3
	
	RCM1	==	OMCR.1
	RCM0	==	OMCR.0
						
; EIESCR:External interrupt Edge Select Register
EIESCR  ==    0x0F:rpage 0
	EIES1	==	EIESCR.3
	EIES0	==	EIESCR.2

; WUCR1:Wake-up Control Register 1
WUCR1 	==    0x10:rpage 0
	CMP2WK	==	WUCR1.7
	CMP1WK	==	WUCR1.6
	LVDWK	==	WUCR1.5
	ADWK	==	WUCR1.4
	INT1WK	==	WUCR1.3
	INT0WK	==	WUCR1.2

; Reserver 0x11

; WUCR3:Wake-up Control Register 3
WUCR3  ==    0x12:rpage 0
	ICWKP7	==	WUCR3.6
	ICWKP6	==	WUCR3.5
	ICWKP5	==	WUCR3.4

; SFR1:Status Flag Register 1
SFR1 	==    0x14:rpage 0
	CMP2SF	==	SFR1.7
	CMP1SF	==	SFR1.6
	LVDSF	==	SFR1.5
	ADSF	==	SFR1.4
	EXSF1	==	SFR1.3
	EXSF0	==	SFR1.2

; SFR2:Status Flag Register 2
;SFR2 	==    0x15:rpage 0

; SFR3:Status Flag Register 3
;SFR3 	==    0x16:rpage 0

; SFR4:Status Flag Register 4
SFR4	==    0x17:rpage 0
	P7ICSF	==	SFR4.6
	P6ICSF	==	SFR4.5
	P5ICSF	==	SFR4.4

; SFR6:Status Flag Register 6
SFR6	==    0x19:rpage 0
	SHSF	==	SFR6.7

; IMR1:Interrupt Mask Register 1
IMR1 	==    0x1B:rpage 0
	CMP2IE	==	IMR1.7
	CMP1IE	==	IMR1.6
	LVDIE	==	IMR1.5
	ADIE	==	IMR1.4
	EXIE1	==	IMR1.3
	EXIE0	==	IMR1.2

; IMR2:Interrupt Mask Register 2
;IMR2 	==    0x1C:rpage 0
;	CMP4IE	==	IMR2.7
;	CMP3IE	==	IMR2.6

; IMR3:Interrupt Mask Register 3
;IMR3 	==    0x1D:rpage 0

; IMR4:Interrupt Mask Register 4
IMR4 	==    0x1E:rpage 0
	P7ICIE	==	IMR4.6
	P6ICIE	==	IMR4.5
	P5ICIE	==	IMR4.4

; IMR6:Interrupt Mask Register 6
IMR6 	==    0x20:rpage 0
	SHIE	==	IMR6.7

; WDTCR:Watch Dog Timer Control Register
WDTCR 	==    0x21:rpage 0
	WDTE	==	WDTCR.7
	PSWE	==	WDTCR.3
	WPSR2	==	WDTCR.2
	WPSR1	==	WDTCR.1
	WPSR0	==	WDTCR.0

; Reserver 0x22~0x3D

; ADCR1:ADC Control Register 1
ADCR1	==   0x3E:rpage 0
	CKR2		==	ADCR1.7
	CKR1		==	ADCR1.6
	CKR0		==	ADCR1.5
	ADRUN		==	ADCR1.4
	ADP		==	ADCR1.3
	ADOM		==	ADCR1.2
	SHS1		==	ADCR1.1
	SHS0		==	ADCR1.0

; ADCR2:ADC Control Register 2
ADCR2	==   0x3F:rpage 0
	VPIS2		==	ADCR2.6
	ADIM		==	ADCR2.5
	ADCMS		==	ADCR2.4
	VPIS1		==	ADCR2.3
	VPIS0		==	ADCR2.2
	VREFP		==	ADCR2.1

; ADISR:ADC Input Channel Selection Register
ADISR	==   0x40:rpage 0
	STPMK		==	ADISR.7

	ADIS3		==	ADISR.3
	ADIS2		==	ADISR.2
	ADIS1		==	ADISR.1
	ADIS0		==	ADISR.0	

; ADER1:ADC Input Control Register 1
ADER1	==   0x41:rpage 0
	ADE7		==	ADER1.7
	ADE6		==	ADER1.6
	ADE5		==	ADER1.5
	ADE4		==	ADER1.4
	ADE3		==	ADER1.3
	ADE2		==	ADER1.2
	ADE1		==	ADER1.1
	ADE0		==	ADER1.0

; Reserve 0x42

; ADDL:Low Byte of ADC Data Buffer
ADDL	==   0x43:rpage 0

; ADDH:High Byte of ADC Data Buffer
ADDH	==   0x44:rpage 0

; ADCVL:Low Byte of ADC Comparison
ADCVL	==   0x45:rpage 0

; ADCVH:High Byte of ADC Comparison
ADCVH	==   0x46:rpage 0

; ADCONBUF:High Byte of ADC Comparison
ADCONBUF==   0x47:rpage 0
	ADBFEN		==	ADCONBUF.7
	ADBFOVR		==	ADCONBUF.6
	ADBFINT		==	ADCONBUF.5

	ADBFPTR2	==	ADCONBUF.2
	ADBFPTR1	==	ADCONBUF.1
	ADBFPTR0	==	ADCONBUF.0

;Reserve 0x48~0x4F

;======================================================
;      BANK 1 Registers                                
;======================================================
; P5PHCR:Port 5 Pull-high Control Rgister
P5PHCR	==    0x08:rpage 1

; P6PHCR:Port 6 Pull-high Control Rgister
P6PHCR	==    0x09:rpage 1

; P7PHCR:Port 7 Pull-high Control Rgister
P7PHCR ==    0x0A:rpage 1
	P7LPH		==	P7PHCR.0

; P5PLCR:Port 5 Pull-low Control Register
P5PLCR	==    0x0B:rpage 1

; P6PLCR:Port 6 Pull-low Control Register
P6PLCR	==    0x0C:rpage 1

; P7PLCR:Port 7 Pull-low Control Register
P7PLCR ==    0x0D:rpage 1
	P7LPL		==	P7PLCR.0

; P5HDSCR:Port 5 High Drive Control Register
P5HDSCR	==    0x0E:rpage 1

; P6HDSCR:Port 6 High Drive Control Register
P6HDSCR	==    0x0F:rpage 1

; P7HDSCR:Port 7 High Drive Control Register
P7HDSCR ==    0x10:rpage 1
	P7LHDS		==	P7HDSCR.0

; P5ODCR:Port 5 Open-drain control Register
P5ODCR	==    0x11:rpage 1

; P6ODCR:Port 6 Open-drain control Register
P6ODCR	==    0x12:rpage 1

; P7ODCR:Port 7 Open-drain control Register
P7ODCR ==    0x13:rpage 1
	P7LOD		==	P7ODCR.0

;Reserve 0x14~0x43

; FLKR:Flash Key Register for Table Write
FLKR	==    0x44:rpage 1

; TBPTL:Table Point Low Register
TBPTL	==    0x45:rpage 1

; TBPTH:Table Point High Register
TBPTH	==    0x46:rpage 1
	HLB		==	TBPTH.7
	RDS		==	TBPTH.6

; STKMON:Stack Point
STKMON	==    0x47:rpage 1
	STOV	==	STKMON.7
	STL2	==	STKMON.2
	STL1	==	STKMON.1
	STL0	==	STKMON.0

; PCH:Program Counter High
PCH	==    0x48:rpage 1

; LVDCR:Low Voltage Detector Control Register
LVDCR	==    0x49:rpage 1
	LVDEN		==	LVDCR.7
	LVDB		==	LVDCR.3		; LVD Status

; COBS1:Code Option Bit Selection Register 1
COBS1	==    0x4A:rpage 1
	HLFS		==	COBS1.7
	RESETEN		==	COBS1.6
	ENWDT		==	COBS1.5
	ADFM		==	COBS1.2

; COBS2:Code Option Bit Selection Register 2
;COBS2	==    0x4B:rpage 1

; COBS3:Code Option Bit Selection Register 3
COBS3	==    0x4C:rpage 1
	FSS0		==	COBS3.5
	SC4		==	COBS3.4
	SC3		==	COBS3.3
	SC2		==	COBS3.2
	SC1		==	COBS3.1
	SC0		==	COBS3.0

; TBWCR:Table Write Control Register
TBWCR	==    0x4D:rpage 1
	IAPEN		==	TBWCR.0

; TBWAL:Table Write Start Address Low Byte
TBWAL	==    0x4E:rpage 1

; TBWAH:Table Write Start Address Low Byte
TBWAH	==    0x4F:rpage 1


;======================================================
;      BANK 2 Registers                                
;======================================================
; TM1CR1:
TM1CR1	==    0x05:rpage 2
	TM1S		==	TM1CR1.7
	TM1RC		==	TM1CR1.6
	TM1SS1		==	TM1CR1.5

	TM1FF		==	TM1CR1.3
	TM1MOS		==	TM1CR1.2
	TM1IS1		==	TM1CR1.1
	TM1IS0		==	TM1CR1.0

; TM1CR2:
TM1CR2	==    0x06:rpage 2

; TM1DBH:
TM1DBH	==    0x07:rpage 2

; TM1DBL:
TM1DBL	==    0x08:rpage 2

; TM1DAH:
TM1DAH	==    0x09:rpage 2

; TM1DAL:
TM1DAL	==    0x0A:rpage 2

; TM2CR1:
TM2CR1	==    0x0B:rpage 2
	TM2S		==	TM2CR1.7
	TM2RC		==	TM2CR1.6
	TM2SS1		==	TM2CR1.5
	TM2FF		==	TM2CR1.3
	TM2MOS		==	TM2CR1.2
	TM2IS1		==	TM2CR1.1
	TM2IS0		==	TM2CR1.0

; TM2CR2:
TM2CR2	==    0x0C:rpage 2

; TM2DBH:
TM2DBH	==    0x0D:rpage 2

; TM2DBL:
TM2DBL	==    0x0E:rpage 2

; TM2DAH:
TM2DAH	==    0x0F:rpage 2

; TM2DAL:
TM2DAL	==    0x10:rpage 2

; TM3CR1:
TM3CR1	==    0x11:rpage 2
	TM3S		==	TM3CR1.7
	TM3RC		==	TM3CR1.6
	TM3SS1		==	TM3CR1.5
	TM3FF		==	TM3CR1.3
	TM3MOS		==	TM3CR1.2
	TM3IS1		==	TM3CR1.1
	TM3IS0		==	TM3CR1.0

; TM3CR2:
TM3CR2	==    0x12:rpage 2

; TM3DBH:
TM3DBH	==    0x13:rpage 2

; TM3DBL:
TM3DBL	==    0x14:rpage 2

; TM3DAH:
TM3DAH	==    0x15:rpage 2

; TM3DAL:
TM3DAL	==    0x16:rpage 2

; TM4CR1:
TM4CR1	==    0x17:rpage 2
	TM4S		==	TM4CR1.7
	TM4RC		==	TM4CR1.6
	TM4SS1		==	TM4CR1.5
	TM4FF		==	TM4CR1.3
	TM4MOS		==	TM4CR1.2
	TM4IS1		==	TM4CR1.1
	TM4IS0		==	TM4CR1.0

; TM4CR2:
TM4CR2	==    0x18:rpage 2

; TM4DBH:
TM4DBH	==    0x19:rpage 2

; TM4DBL:
TM4DBL	==    0x1A:rpage 2

; TM4DAH:
TM4DAH	==    0x1B:rpage 2

; TM4DAL:
TM4DAL	==    0x1C:rpage 2

; EI01NCR:
EI01NCR	==    0x1D:rpage 2
	EI1NRE		==	EI01NCR.7
	EI1NR1		==	EI01NCR.5
	EI1NR0		==	EI01NCR.4
	EI0NRE		==	EI01NCR.3
	EI0NR1		==	EI01NCR.1
	EI0NR0		==	EI01NCR.0

; CMP1CR:
CMP1CR	==    0x1E:rpage 2
	C1PRS1		==	CMP1CR.7
	C1PRS0		==	CMP1CR.6
	C1NRS1		==	CMP1CR.5
	C1NRS0		==	CMP1CR.4
	CMP1EN		==	CMP1CR.2
	CMP1OE		==	CMP1CR.1
	CMP1OUT		==	CMP1CR.0

; CMP2CR:
CMP2CR	==    0x1F:rpage 2
	C2PRS1		==	CMP2CR.7
	C2PRS0		==	CMP2CR.6
	C2NRS1		==	CMP2CR.5
	C2NRS0		==	CMP2CR.4
	HYSEN2		==	CMP2CR.3
	CMP2EN		==	CMP2CR.2
	CMP2OE		==	CMP2CR.1
	CMP2OUT		==	CMP2CR.0

;Reserve 0x20~0x21

; CMPESCR:
CMPESCR	==    0x22:rpage 2
	CMP2ES		==	CMPESCR.1
	CMP1ES		==	CMPESCR.0

; CMP12NCR:
CMP12NCR==    0x23:rpage 2
	CO2NRE		==	CMP12NCR.7
	CO2NR1		==	CMP12NCR.5
	CO2NR0		==	CMP12NCR.4
	CO1NRE		==	CMP12NCR.3
	CO1NR1		==	CMP12NCR.1
	CO1NR0		==	CMP12NCR.0

;Reserve 0x24

; CMPTCR1:
CMPTCR1	==    0x25:rpage 2
	CMPTEN		==	CMPTCR1.7
	VOSFS2		==	CMPTCR1.6
	VOSFS1		==	CMPTCR1.5
	VOSFS0		==	CMPTCR1.4
	TRIMDU2		==	CMPTCR1.1
	TRIMDU1		==	CMPTCR1.0

; CMPTCR2:
CMPTCR2	==    0x26:rpage 2
	TRIMOS		==	CMPTCR2.4
	TRIMIS2		==	CMPTCR2.1
	TRIMIS1		==	CMPTCR2.0

; TCMP1H:
TCMP1H	==    0x27:rpage 2
	TCMP1HS		==	TCMP1H.7
	TCMP1H4		==	TCMP1H.4
	TCMP1H3		==	TCMP1H.3
	TCMP1H2		==	TCMP1H.2
	TCMP1H1		==	TCMP1H.1
	TCMP1H0		==	TCMP1H.0

; TCMP1L:
TCMP1L	==    0x28:rpage 2
	TCMP1LS		==	TCMP1L.7
	TCMP1L4		==	TCMP1L.4
	TCMP1L3		==	TCMP1L.3
	TCMP1L2		==	TCMP1L.2
	TCMP1L1		==	TCMP1L.1
	TCMP1L0		==	TCMP1L.0

;Reserve 0x29~0x2A

; THCMP2H:
THCMP2H	==    0x2B:rpage 2
	THCMP2HS	==	THCMP2H.7

	THCMP2H5	==	THCMP2H.5
	THCMP2H4	==	THCMP2H.4
	THCMP2H3	==	THCMP2H.3
	THCMP2H2	==	THCMP2H.2
	THCMP2H1	==	THCMP2H.1
	THCMP2H0	==	THCMP2H.0

; TLCMP2H:
TLCMP2H	==    0x2C:rpage 2
	TLCMP2HS	==	TLCMP2H.7

	TLCMP2H5	==	TLCMP2H.5
	TLCMP2H4	==	TLCMP2H.4
	TLCMP2H3	==	TLCMP2H.3
	TLCMP2H2	==	TLCMP2H.2
	TLCMP2H1	==	TLCMP2H.1
	TLCMP2H0	==	TLCMP2H.0

; THCMP2L:
THCMP2L	==    0x2D:rpage 2
	THCMP2LS	==	THCMP2L.7

	THCMP2L5	==	THCMP2L.5
	THCMP2L4	==	THCMP2L.4
	THCMP2L3	==	THCMP2L.3
	THCMP2L2	==	THCMP2L.2
	THCMP2L1	==	THCMP2L.1
	THCMP2L0	==	THCMP2L.0

; TLCMP2L:
TLCMP2L	==    0x2E:rpage 2
	TLCMP2LS	==	TLCMP2L.7

	TLCMP2L5	==	TLCMP2L.5
	TLCMP2L4	==	TLCMP2L.4
	TLCMP2L3	==	TLCMP2L.3
	TLCMP2L2	==	TLCMP2L.2
	TLCMP2L1	==	TLCMP2L.1
	TLCMP2L0	==	TLCMP2L.0

;Reserve 0x2F~0x3B

; COBS4
COBS4	==    0x3C:rpage 2

; COBS5
COBS5	==    0x3D:rpage 2

; COBS6
COBS6	==    0x3E:rpage 2

; COBS7
COBS7	==    0x3F:rpage 2

; MULMOD:
MULMOD	==    0x40:rpage 2
	PROD16		==	MULMOD.4
	MACEN		==	MULMOD.3
	MACM		==	MULMOD.2
	SMCAND		==	MULMOD.1
	SMIER		==	MULMOD.0

; PRODH:
PRODH	==    0x41:rpage 2

; PRODL:
PRODL	==    0x42:rpage 2

; SFR7:
SFR7	==    0x43:rpage 2
	TM4SF	== SFR7.3
	TM3SF	== SFR7.2
	TM2SF	== SFR7.1
	TM1SF	== SFR7.0

;Reserve 0x44

; IMR7:
IMR7	==    0x45:rpage 2
	TM4IE	== IMR7.3
	TM3IE	== IMR7.2
	TM2IE	== IMR7.1
	TM1IE	== IMR7.0

;Reserve 0x46

; LOCKPR:Lock Page Number Register
LOCKPR	==	  0x47:rpage 2

; LOCKPR:Lock Page Number Register
LOCKCR	==	  0x48:rpage 2
	LOCKEN	== LOCKCR.7

; ICEMR3:ICE Monitor Register 3
ICEMR3	==    0x49:rpage 2

; ICEMR2:ICE Monitor Register 2
ICEMR2	==    0x4A:rpage 2

; ICEMR1:ICE Monitor Register 1
ICEMR1	==    0x4B:rpage 2

; ICEACK:ICE Monitor ACK egister
ICEACK	==    0x4C:rpage 2

; ICEBUF:ICE Monitor Buffer Register
ICEBUF	==    0x4D:rpage 2


;======================================================
;      BANK 3 Registers                                
;======================================================

; EIOPWMPE0
EIOPWMPE0	==    0x05:rpage 3

; EOPWMPE0
EOPWMPE0	==    0x06:rpage 3

; EIOPHAPE
EIOPHAPE	==    0x07:rpage 3

;Reserve 0x08

; T5CRH
T5CRH		==    0x09:rpage 3

; T5CRL
T5CRL		==    0x0A:rpage 3

; T6CRH
T6CRH		==    0x0B:rpage 3

; T6CRL
T6CRL		==    0x0C:rpage 3

; PWMCR1H
PWMCR1H		==    0x0D:rpage 3

; PWMCR1L
PWMCR1L		==    0x0E:rpage 3

; PWMCR2H
PWMCR2H		==    0x0F:rpage 3

; PWMCR2L
PWMCR2L		==    0x10:rpage 3

; T5OPMS
T5OPMS		==    0x11:rpage 3

; T6OPMS
T6OPMS		==    0x12:rpage 3

; ASPWM
ASPWM		==    0x13:rpage 3

; LVPWM
LVPWM		==    0x14:rpage 3

; SLPWM
SLPWM		==    0x15:rpage 3

; COPH
COPH		==    0x16:rpage 3

; COPL
COPL		==    0x17:rpage 3

; MCOPH
MCOPH		==    0x18:rpage 3

; MCOPL
MCOP		==    0x19:rpage 3

; T5DECR
T5DECR		==    0x1A:rpage 3

; T5DEB
T5DEB		==    0x1B:rpage 3

; HACRH
HACRH		==    0x1C:rpage 3

; HACRL
HACRL		==    0x1D:rpage 3

; BRKCR1H
BRKCR1H		==    0x1E:rpage 3

; BRKCR1L
BRKCR1L		==    0x1F:rpage 3

; BRKCR2H
BRKCR2H		==    0x20:rpage 3

; BRKCR2L
BRKCR2L		==    0x21:rpage 3

; TRADCR
TRADCR		==    0x22:rpage 3

; TSF1H
TSF1H		==    0x23:rpage 3

; TSF1L
TSF1L		==    0x24:rpage 3

; SETM1H
SETM1H		==    0x25:rpage 3
	IEHC		==	SETM1H.7
	MTRS		==	SETM1H.6
	COIDS		==	SETM1H.3
	BRKFS		==	SETM1H.2

; SETM1L
SETM1L		==    0x26:rpage 3
	T6MTS		==	SETM1L.3
	T6RS		==	SETM1L.2
	T5MTS		==	SETM1L.1
	T5RS		==	SETM1L.0


; RSTM1H
RSTM1H		==    0x27:rpage 3
	MTRR		==	RSTM1H.6
	COIDR		==	RSTM1H.3
	BRKFR		==	RSTM1H.2

; RSTM1L
RSTM1L		==    0x28:rpage 3
	T6MTR		==	RSTM1L.3
	T6RR		==	RSTM1L.2
	T5MTR		==	RSTM1L.1
	T5RR		==	RSTM1L.0

;Reserve 0x29~0x2A

; T5VALH
T5VALH		==    0x2B:rpage 3

; T5VALL
T5VALL		==    0x2C:rpage 3

; T5PDH
T5PDH		==    0x2D:rpage 3

; T5PDL
T5PDL		==    0x2E:rpage 3

; T5ACDH
T5ACDH		==    0x2F:rpage 3

; T5ACDL
T5ACDL		==    0x30:rpage 3

; T5BCDH
T5BCDH		==    0x31:rpage 3

; T5BCDL
T5BCDL		==    0x32:rpage 3

; T5CCDH
T5CCDH		==    0x33:rpage 3

; T5CCDL
T5CCDL		==    0x34:rpage 3

; T5ACDMH
T5ACDMH		==    0x35:rpage 3

; T5ACDML
T5ACDML		==    0x36:rpage 3

; T5BCDMH
T5BCDMH		==    0x37:rpage 3

; T5BCDML
T5BCDML		==    0x38:rpage 3

; T5CCDMH
T5CCDMH		==    0x39:rpage 3

; T5CCDML
T5CCDML		==    0x3A:rpage 3

; TRAD1VH
TRAD1VH		==    0x3B:rpage 3

; TRAD1VL
TRAD1VL		==    0x3C:rpage 3

; TRAD2VH
TRAD2VH		==    0x3D:rpage 3

; TRAD2VL
TRAD2VL		==    0x3E:rpage 3

; T6VALH
T6VALH		==    0x3F:rpage 3

; T6VALL
T6VALL		==    0x40:rpage 3

; T6PDH
T6PDH		==    0x41:rpage 3

; T6PDL
T6PDL		==    0x42:rpage 3

; T6CDH
T6CDH		==    0x43:rpage 3

; T6CDL
T6CDL		==    0x44:rpage 3

; T6CDMH
T6CDMH		==    0x45:rpage 3

; T6CDML
T6CDML		==    0x46:rpage 3

;Reserve 0x47~0x4B

; SFR9
SFR9		==    0x4C:rpage 3
	T5PDMSF		==	SFR9.7
	T5ONEMSF	==	SFR9.6
	IRT5CSF		==	SFR9.5
	IRT5BSF		==	SFR9.4
	IRT5ASF		==	SFR9.3
	IFT5CSF		==	SFR9.2
	IFT5BSF		==	SFR9.1
	IFT5ASF		==	SFR9.0

; SFR10
SFR10		==    0x4D:rpage 3
	MTRSF		==	SFR10.7
	BRKSF		==	SFR10.6
	HAEGSF		==	SFR10.5
	HACOSF		==	SFR10.4
	HAERRSF		==	SFR10.3
	T6PDMSF		==	SFR10.2
	IRT6SF		==	SFR10.1
	IFT6SF		==	SFR10.0

; IMR9
IMR9		==    0x4E:rpage 3
	T5PDMIE		==	IMR9.7
	T5ONEMIE	==	IMR9.6
	IRT5CIE		==	IMR9.5
	IRT5BIE		==	IMR9.4
	IRT5AIE		==	IMR9.3
	IFT5CIE		==	IMR9.2
	IFT5BIE		==	IMR9.1
	IFT5AIE		==	IMR9.0

; IMR10
IMR10		==    0x4F:rpage 3
	MTRIE		==	IMR10.7
	BRKIE		==	IMR10.6
	HAEGIE		==	IMR10.5
	HACOIE		==	IMR10.4
	HAERRIE		==	IMR10.3
	T6PDMIE		==	IMR10.2
	IRT6IE		==	IMR10.1
	IFT6IE		==	IMR10.0


