/************************************************************************
 *  Title:       SD062 include file                                     *
 *  Target MCU:  SD062                                                  *
 *  Description: Register/bit definitions                               *
 *  Company:     ELAN LTD.                                              *
 *  Date:        2019-2-21                                              *
 *  Version:     v1.0                                                   *
 ***********************************************************************/
;======================================================;
; Operational Registers Define                         ;
;======================================================;
BIT0    ==  0
BIT1    ==  1
BIT2    ==  2
BIT3    ==  3
BIT4    ==  4
BIT5    ==  5
BIT6    ==  6
BIT7    ==  7
;======================================================;
; Registers R0~R4                                      ;
;======================================================;
;The general purpose registers
; R0/IAR: Indirect Address Register
R0          ==  0X00:rpage 0
IAR         ==  0x00:rpage 0
;R1/ BSR: Bank Selection Control Register
R1          ==  0x01:rpage 0
BSR         ==  0X01:rpage 0
        SBS1  ==  BSR.5
        SBS0  ==  BSR.4
        GBS0  ==  BSR.0
; R2/PC: Program Counter & Stack
R2          ==  0X02:rpage 0       ; Program Counter.
PCL         ==  0X02:rpage 0       ;

;R3/SW:Status Register
R3          ==  0X03:rpage 0
STATUS      ==  0X03:rpage 0
SR          ==  0X03:rpage 0
       	IT        == SR.7
        N           == SR.6
        OV          == SR.5
        T           == SR.4
        P           == SR.3
        Z           == SR.2
        DC          == SR.1
        C           == SR.0
;R4/ RSR:RAM Select Register
R4          ==  0X04:rpage 0
RSR         ==  0X04:rpage 0       ; File Select Register.
;======================================================
;      BANK 0
;Registers R5~R4F
;======================================================
PORT5       ==  0X05:rpage 0        ; I/O Port Address
P5       ==  0X05:rpage 0        ; I/O Port Address
        P50         ==  PORT5.0
        P51         ==  PORT5.1
        P52         ==  PORT5.2
        P53         ==  PORT5.3
        P54         ==  PORT5.4
        P55         ==  PORT5.5
        P56         ==  PORT5.6
        P57         ==  PORT5.7
PORT6       ==  0X06:rpage 0        ; I/O Port Address
P6       ==  0X06:rpage 0        ; I/O Port Address
        P60         ==  PORT6.0
        P61         ==  PORT6.1
        P62         ==  PORT6.2
        
IOCR5       ==  0X0B:rpage 0        ; IO PORT 5 Control Register
IOCR6       ==  0X0C:rpage 0        ; IO PORT 6 Control Register
;RE/OMCR :OMCR:Operating Mode Control Register
OMCR        ==  0X0E:rpage 0
        CPUS        ==  OMCR.7
        IDLE        ==  OMCR.6
        PERCS       ==  OMCR.5
        IIPS        ==  OMCR.4
        FMSF        ==  OMCR.3
        RCM2		==  OMCR.2
		RCM1        ==  OMCR.1
        RCM0        ==  OMCR.0
;RF/EIESCR :External Interrupt Edge Select Control Register
EIESCR      ==  0X0F:rpage 0
        EIES11 == EIESCR.3
		EIES10 == EIESCR.2
		EIES01 == EIESCR.1
		EIES00 == EIESCR.0
;R10/WUCR1 :Wake-up Control Register1
WUCR1       ==  0X10:rpage 0
        CMP2WK	== WUCR1.7
		CMP1WK	== WUCR1.6
		ADWK        ==  WUCR1.4
        INT1WK      ==  WUCR1.3
        INT0WK      ==  WUCR1.2
;R11/WUCR2 :Wake-up Control Register2
WUCR2       ==  0X11:rpage 0
        CMP3WK	== WUCR2.6
;R12/WUCR3 :Wake-up Control Register3
WUCR3       ==  0X12:rpage 0
        ICWKP6      ==  WUCR3.5
        ICWKP5      ==  WUCR3.4
;R13/SYSCON :
SYSCON      ==  0X13:rpage 0
        LDOI        ==  SYSCON.7
;R14/SFR1 :Status Flag Register 1
SFR1        ==  0X14:rpage 0
        CMP2SF == SFR1.7
		CMP1SF == SFR1.6
		ADSF        ==  SFR1.4
        EXSF1       ==  SFR1.3
        EXSF0       ==  SFR1.2
;R15/SFR2 :Status Flag Register2
SFR2        ==  0X15:rpage 0
	CMP3SF == SFR2.6
;R16/SFR3 :Status Flag Register3
SFR3 == 0X16:rpage 0
	PWMCPSF == SFR3.5
	PWMCDSF == SFR3.4
	PWMBPSF == SFR3.3
	PWMBDSF == SFR3.2
	PWMAPSF == SFR3.1
	PWMADSF == SFR3.0
;R17/SFR4 :Status Flag Register4
SFR4        ==  0X17:rpage 0
        P6ICSF      ==  SFR4.5
        P5ICSF      ==  SFR4.4
;R19/SFR6 :Status Flag Register6
SFR6        ==  0X19:rpage 0
        SHSF        ==  SFR6.7
;R1A/SFR7 :Status Flag Register7
SFR7        ==  0X1A:rpage 0
        AFPWMSF     ==  SFR7.7
        TXDSF       ==  SFR7.6
        TXCSF       ==  SFR7.5
        TM2DASF     ==  SFR7.4
        TM1DASF     ==  SFR7.3
        TM1OFSF     ==  SFR7.2
        TM2DBSF     ==  SFR7.1
        TM1DBSF     ==  SFR7.0
;R1B/IMR1 :Interrupt Mask Register 1
IMR1        ==  0X1B:rpage 0
        CMP2IE == IMR1.7
		CMP1IE == IMR1.6
		ADIE        ==  IMR1.4
        EXIE1       ==  IMR1.3
        EXIE0       ==  IMR1.2
;RF/IMR2 :Interrupt Mask Register 2
IMR2        ==  0X1C:rpage 0
        CMP3IE == IMR2.6
;R1D/IMR3 :Interrupt Mask Register 3
IMR3 == 0X1D:rpage 0
	PWMCPIE == IMR3.5
	PWMCDIE == IMR3.4
	PWMBPIE == IMR3.3
	PWMBDIE == IMR3.2
	PWMAPIE == IMR3.1
	PWMADIE == IMR3.0
;R1E/IMR4 :Interrupt Mask Register 4
IMR4        ==  0X1E:rpage 0
        P6ICIE      ==  IMR4.5
        P5ICIE      ==  IMR4.4
;R20/IMR6 :Interrupt Mask Register 6
IMR6        ==  0X20:rpage 0
        SHIE        ==  IMR6.7
        AFPWMIE     ==  IMR6.3
        TXTMIE      ==  IMR6.2
        TM2IE       ==  IMR6.1
        TM1IE       ==  IMR6.0
;R21/WDTCR :Watch Dog Timer Control Register
WDTCR       ==  0X21:rpage 0
        WDTE        ==  WDTCR.7
        FSSF        ==  WDTCR.6
        PSWE        ==  WDTCR.3
        WPSR2       ==  WDTCR.2
        WPSR1       ==  WDTCR.1
        WPSR0       ==  WDTCR.0
;R3E/ADCR1 :ADC Control Register1
ADCR1       ==  0X3E:rpage 0
        CKR1        ==  ADCR1.6
        CKR0        ==  ADCR1.5
        ADRUN       ==  ADCR1.4
        ADP         ==  ADCR1.3
        ADOM        ==  ADCR1.2
        SHS1        ==  ADCR1.1
        SHS0        ==  ADCR1.0
;R3F/ADCR2 :ADC Control Register2
ADCR2       ==  0X3F:rpage 0
        ADLPFEN     ==  ADCR2.7
        ADIM        ==  ADCR2.5
        ADCMS       ==  ADCR2.4
        VPIS1       ==  ADCR2.3
        VPIS0       ==  ADCR2.2
;R40/ADISR :Analog to Digital Converter Input Channel Selection Register
ADISR       ==  0X40:rpage 0
        TSLPFEN     ==  ADISR.7
        TSP         ==  ADISR.6
        WMA1        ==  ADISR.5
        WMA0        ==  ADISR.4
        ADIS2       ==  ADISR.2
        ADIS1       ==  ADISR.1
        ADIS0       ==  ADISR.0
;R41/ADER1 :ADC Input Enable Register
ADER1       ==  0X41:rpage 0
        ADE5        ==  ADER1.5
        ADE4        ==  ADER1.4
        ADE3        ==  ADER1.3
        ADE2        ==  ADER1.2
        ADE1        ==  ADER1.1
        ADE0        ==  ADER1.0
;R43/ADDL :ADC Low-8 Bits Data Buffer
ADDL        ==  0X43:rpage 0
;R44/ADDH :ADC High-8 Bits Data Buffer
ADDH        ==  0X44:rpage 0
;R45/ADCVL :Low Byte of Analog to Digital Converter Comparison
ADCVL       ==  0X45:rpage 0
;R46/ADCVH :High Byte of Analog to Digital Converter Comparison
ADCVH       ==  0X46:rpage 0
;======================================================
;      BANK 1
;Registers R5~R4F
;======================================================
;R08/P5PHCR :Port5 Pull-high Control Register
P5PHCR      ==  0X08:rpage 1
        PH57        ==  P5PHCR.7
        PH56        ==  P5PHCR.6
        PH55        ==  P5PHCR.6
        PH54        ==  P5PHCR.4
        PH53        ==  P5PHCR.3
        PH52        ==  P5PHCR.2
        PH51        ==  P5PHCR.1
        PH50        ==  P5PHCR.0
;R09/P6PHCR :Port6 Pull-high Control Register
P6PHCR      ==  0X09:rpage 1
        PH62        ==  P6PHCR.2
        PH61        ==  P6PHCR.1
        PH60        ==  P6PHCR.0
;R0B/P5PLCR Port 5 Pull-low Control Register
P5PLCR      ==  0X0B:rpage 1
        PL57        ==  P5PLCR.7
        PL56        ==  P5PLCR.6
        PL55        ==  P5PLCR.5
        PL54        ==  P5PLCR.4
        PL53        ==  P5PLCR.3
        PL52        ==  P5PLCR.2
        PL51        ==  P5PLCR.1
        PL50        ==  P5PLCR.0
;R0C/P6PLCR Port 6 Pull-low Control Register
P6PLCR      ==  0X0B:rpage 1
        PL62        ==  P6PLCR.2
        PL61        ==  P6PLCR.1
        PL60        ==  P6PLCR.0
;R0E/P5HDSCR :Port 5 High Drive/Sink Control Register
P5HDSCR     ==  0X0E:rpage 1
        HDS57       ==  P5HDSCR.7
        HDS56       ==  P5HDSCR.6
        HDS55       ==  P5HDSCR.5
        HDS54       ==  P5HDSCR.4
        HDS53       ==  P5HDSCR.3
        HDS52       ==  P5HDSCR.2
        HDS51       ==  P5HDSCR.1
        HDS50       ==  P5HDSCR.0
;R0F/P6HDSCR :Port 6 High Drive/Sink Control Register
P6HDSCR     ==  0X0E:rpage 1
        HDS62       ==  P6HDSCR.2
        HDS61       ==  P6HDSCR.1
        HDS60       ==  P6HDSCR.0
;R16 PWMSCR :PWM Start Control Register
PWMSCR == 0X16:rpage 1
	TBEN == PWMSCR.1
	TAEN == PWMSCR.0
;R17 PWMACR :PWMA Control Register
PWMACR == 0X17:rpage 1
	PWMAE == PWMACR.7
	PWMAA == PWMACR.5
	PWMAS == PWMACR.3
	TAP2 == PWMACR.2
	TAP1 == PWMACR.1
	TAP0 == PWMACR.0
;R18 PRDAL (Low byte of PWMA period)
PRDAL == 0X18:rpage 1
;R19 PRDAH (High byte of PWMA period)
PRDAH == 0X19:rpage 1	
;R1A DTAL (Low byte of PMWA duty)
DTAL == 0X1A:rpage 1
;R1B DTAH (High byte of PMWA duty)
DTAH == 0X1B:rpage 1
;R1C TMRAL (Low byte of TimerA)
TMRAL == 0X1C:rpage 1
;R1D TMRAH (High byte of TimerA)
TMRAH == 0X1D:rpage 1
;R1E PWMBCR (PWMB Control Register)
PWMBCR == 0X1E:rpage 1
	PWMBE == PWMBCR.7
	PWMBA == PWMBCR.5
	PWMBS == PWMBCR.3
	TBP2 == PWMBCR.2
	TBP1 == PWMBCR.1
	TBP0 == PWMBCR.0
;R1F PRDBL (Low byte of PWMB period)
PRDBL == 0X1F:rpage 1
;R20 PRDBH (High byte of PWMB period)
PRDBH == 0X20:rpage 1	
;R21 DTBL (Low byte of PMWB duty)
DTBL == 0X21:rpage 1
;R22 DTBH (High byte of PMWB duty)
DTBH == 0X22:rpage 1
;R23 TMRBL (Low byte of TimerB)
TMRBL == 0X23:rpage 1
;R24 TMRBH (High byte of TimerB)
TMRBH == 0X24:rpage 1
;R40/EECR1 :EEPROM Control Register 1
EECR1       ==  0X40:rpage 1
        EEPVSF      ==  EECR1.4
        EEPV        ==  EECR1.3
        ONRD        ==  EECR1.2
        RD          ==  EECR1.1
        WR          ==  EECR1.0
;R41/EECR2 :EEPROM Control Register 2
EECR2       ==  0X41:rpage 1
        EEWE        ==  EECR2.7
        EEDF        ==  EECR2.6
        EEPC        ==  EECR2.5
;R42/EERA :EEPROM Address
EERA        ==  0X42:rpage 1
EEAR        ==  0X42:rpage 1
;R43/EERD :EEPROM Data
EERD        ==  0X43:rpage 1
EEDR        ==  0X43:rpage 1
;R44/FLKR :Flash Key Register for Table Write Use
FLKR        ==  0X44:rpage 1
;R45/TBPTL :Table Point Low Register
TBPTL       ==  0X45:rpage 1
;R46/TBPTH :Table Point High Register
TBPTH       ==  0X46:rpage 1
        HLB     ==  TBPTH.7
        RDS     ==  TBPTH.6
;R47/STKMON :Stack point
STKMON      ==  0X47:rpage 1
        STOV        ==  STKMON.7
        STL2        ==  STKMON.2
        STL1        ==  STKMON.1
        STL0        ==  STKMON.0
;R48/PCH :Program Counter High
PCH         ==  0X48:rpage 1
COBS1       ==  0X4A:rpage 1
		HLFS	== COBS1.7
		ENWDT	== COBS1.5
		NRHL	== COBS1.4
		NRE		== COBS1.3
		ADFM	== COBS1.2
COBS2       ==  0X4B:rpage 1
		RT5		== COBS2.5
		RT4		== COBS2.4
		RT3		== COBS2.3
		RT2		== COBS2.2
		RT1		== COBS2.1
		RT0		== COBS2.0
COBS3       ==  0X4C:rpage 1
		IRT		== COBS3.7
		TSRT	== COBS3.6
		RIRT	== COBS3.5
		CT3		== COBS3.3
		CT2		== COBS3.2
		CT1		== COBS3.1
		CT0		== COBS3.0
;R4D/TBWCR :Table Write Control Register
TBWCR       ==  0X4D:rpage 1
        IAPVSF     ==  TBWCR.2
        IAPV       ==  TBWCR.1
        IAPEN      ==  TBWCR.0
;R4E/TBWAL :Table Write start Address Low byte
TBWAL       ==  0X4E:rpage 1
;R4F/TBWAH :Table Write start Address High byte
TBWAH       ==  0X4F:rpage 1

;======================================================
;      BANK 2
;Registers R5~R4F
;======================================================
;R05/TM1CR1 :Timer/Counter 1 Control Register 1
TM1CR1      ==  0X05:rpage 2
        TM1S        ==  TM1CR1.7
        TM1RC       ==  TM1CR1.6
        TM1SS1      ==  TM1CR1.5
        TM1RX1      ==  TM1CR1.4
        TM1FF       ==  TM1CR1.3
        TM1MOS      ==  TM1CR1.2
        TM1IS1      ==  TM1CR1.1
        TM1IS0      ==  TM1CR1.0
;R06/TM1CR2 :Timer/Counter 1 Control Register 2
TM1CR2      ==  0X06:rpage 2
        TM1M2       ==  TM1CR2.7
        TM1M1       ==  TM1CR2.6
        TM1M0       ==  TM1CR2.5
        TM1SS0      ==  TM1CR2.4
        TM1CK3      ==  TM1CR2.3
        TM1CK2      ==  TM1CR2.2
        TM1CK1      ==  TM1CR2.1
        TM1CK0      ==  TM1CR2.0
;R07/TM1DBH :Timer/Counter 1 Data Buffer B High Byte
TM1DBH      ==  0X07:rpage 2
;R08/TM1DBL :Timer/Counter 1 Data Buffer B Low Byte
TM1DBL      ==  0X08:rpage 2
;R09/TM1DAH :Timer/Counter 1 Data Buffer A High Byte
TM1DAH      ==  0X09:rpage 2
;R0A/TM1DAL :Timer/Counter 1 Data Buffer A Low Byte
TM1DAL      ==  0X0A:rpage 2
;R0B/TM2CR1 :Timer/Counter 2 Control Register 1
TM2CR1      ==  0X0B:rpage 2
        TM2S        ==  TM2CR1.7
        TM2RC       ==  TM2CR1.6
        TM2SS1      ==  TM2CR1.5
        TM2RX2      ==  TM2CR1.4
        TM2FF       ==  TM2CR1.3
        TM2MOS      ==  TM2CR1.2
        TM2IS1      ==  TM2CR1.1
        TM2IS0      ==  TM2CR1.0
;R0C/TM2CR2 :Timer/Counter 2 Control Register 2
TM2CR2      ==  0X0C:rpage 2
        TM2M2       ==  TM2CR2.7
        TM2M1       ==  TM2CR2.6
        TM2M0       ==  TM2CR2.5
        TM2SS0      ==  TM2CR2.4
        TM2CK3      ==  TM2CR2.3
        TM2CK2      ==  TM2CR2.2
        TM2CK1      ==  TM2CR2.1
        TM2CK0      ==  TM2CR2.0
;R0D/TM2DBH :Timer/Counter 2 Data Buffer B High Byte
TM2DBH      ==  0X0D:rpage 2
;R0E/TM2DBL :Timer/Counter 2 Data Buffer B Low Byte
TM2DBL      ==  0X0E:rpage 2
;R0F/TM2DAH :Timer/Counter 2 Data Buffer A High Byte
TM2DAH      ==  0X0F:rpage 2
;R10/TM2DAL :Timer/Counter 2 Data Buffer A Low Byte
TM2DAL      ==  0X10:rpage 2
;R11 RXCR(RX Control Register����H�s��)
RXCR       ==  0X11:rpage 2
        RXIE       ==  RXCR.7
;R12 RX1CR1(RX1 Control Register 1����H�s��1)
RX1CR1     ==  0X12:rpage 2
        RX1E       ==  RX1CR1.7
        RX1HV4       ==  RX1CR1.4
        RX1HV3       ==  RX1CR1.3
        RX1HV2       ==  RX1CR1.2
        RX1HV1       ==  RX1CR1.1
        RX1HV0       ==  RX1CR1.0
;R13 RX1CR2(RX1 Control Register 2����H�s��2)
RX1CR2     ==  0X13:rpage 2
        RX1OPE       ==  RX1CR2.7
        RX1OUT       ==  RX1CR2.6
        RX1LV4       ==  RX1CR2.4
        RX1LV3       ==  RX1CR2.3
        RX1LV2       ==  RX1CR2.2
        RX1LV1       ==  RX1CR2.1
        RX1LV0       ==  RX1CR2.0
;R14 RX2CR1(RX2 Control Register 1����H�s��1)
RX2CR1     ==  0X14:rpage 2
        RX2E       ==  RX2CR1.7
        RX2HV4       ==  RX2CR1.4
        RX2HV3       ==  RX2CR1.3
        RX2HV2       ==  RX2CR1.2
        RX2HV1       ==  RX2CR1.1
        RX2HV0       ==  RX2CR1.0
;R15 RX2CR2(RX2 Control Register 2����H�s��2)
RX2CR2     ==  0X15:rpage 2
        RX2OPE       ==  RX2CR2.7
        RX2OUT       ==  RX2CR2.6
        RX2LV4       ==  RX2CR2.4
        RX2LV3       ==  RX2CR2.3
        RX2LV2       ==  RX2CR2.2
        RX2LV1       ==  RX2CR2.1
        RX2LV0       ==  RX2CR2.0
;R16 RXDCR(RX Deglitch Control Register����H�s��)
RXDCR       ==  0X16:rpage 2
        RX1DS       ==  RXDCR.7
        RX1DT2      ==  RXDCR.6
        RX1DT1      ==  RXDCR.5
        RX1DT0      ==  RXDCR.4
        RX2DS       ==  RXDCR.3
        RX2DT2      ==  RXDCR.2
        RX2DT1      ==  RXDCR.1
        RX2DT0      ==  RXDCR.0
;R17 TXSC(TX Sink Current Register�H�s��)
TXSC       ==  0X17:rpage 2
        TXCS3       ==  TXSC.3
        TXCS2       ==  TXSC.2
        TXCS1       ==  TXSC.1
        TXCS0       ==  TXSC.0
;R18 TXCR1(TX Control Register 1����H�s��1)
TXCR1     ==  0X18:rpage 2
        TXE         ==  TXCR1.7
        TXTM        ==  TXCR1.5
        TXSR1       ==  TXCR1.4
        TXSR0       ==  TXCR1.3
        TXMV2       ==  TXCR1.2
        TXMV1       ==  TXCR1.1
        TXMV0       ==  TXCR1.0
;R19 TXCR2(TX Control Register 2����H�s��2)
TXCR2     ==  0X19:rpage 2
        TXS         ==  TXCR2.7
        TXCLK       ==  TXCR2.6
        TXDP2       ==  TXCR2.5
        TXDP1       ==  TXCR2.4
        TXDP0       ==  TXCR2.3
        TXCP2       ==  TXCR2.2
        TXCP1       ==  TXCR2.1
        TXCP0       ==  TXCR2.0
;R1A TXDT(TX Delay Timer Register����H�s��)
TXDT       ==  0X1A:rpage 2
;R1B TXCT(TX Sink Current Timer Register�ϯ�ɶ��H�s��)
TXCT       ==  0X1B:rpage 2
;R1C TXRC (TXTM Read Counting)
TXRC       ==  0X1C:rpage 2
;R1D CMP3&LRR (CMP3&Limiting Resistor Register���y�q���H�s��)
CMP3LRR    ==  0X1D:rpage 2
        CMP3DS      ==  CMP3LRR.7
        CMP3DT2     ==  CMP3LRR.6
        CMP3DT1     ==  CMP3LRR.5
        CMP3DT0     ==  CMP3LRR.4
        CL1   	    ==  CMP3LRR.1
        CL0  	    ==  CMP3LRR.0
;R1E DCCR (Discharge Control Register ��q����H�s��)
DCCR       ==  0X1E:rpage 2
        CMP3E     ==  DCCR.7
        MCDC      ==  DCCR.6
        DCT2      ==  DCCR.4
        DCT1      ==  DCCR.3
        DCT0      ==  DCCR.2
        DCR1      ==  DCCR.1
        DCR0      ==  DCCR.0
;R1F DCVS (Discharge Voltage select Register ��q�q����ܱH�s��)
DCVS       ==  0X1F:rpage 2
        CMP3OPE   ==  DCVS.7
        CMP3OUT   ==  DCVS.6
        DCP       ==  DCVS.3
        DCV2      ==  DCVS.2
        DCV1      ==  DCVS.1
        DCV0      ==  DCVS.0
;R20 PWMCCR (PWMC Control Register)
PWMCCR == 0X20:rpage 2
	PWMCE == PWMCCR.7
	PWMCRC == PWMCCR.6
	PWMCA == PWMCCR.5
	TCEN == PWMCCR.4
	PWMCS == PWMCCR.3
	TCP2 == PWMCCR.2
	TCP1 == PWMCCR.1
	TCP0 == PWMCCR.0
PRDCL == 0X21:rpage 2
PRDCH == 0X22:rpage 2	
DTCL == 0X23:rpage 2
DTCH == 0X24:rpage 2
TMRCL == 0X25:rpage 2
TMRCH == 0X26:rpage 2		
AFPWMCCR1== 0X27:rpage 2
	AFPI2	== AFPWMCCR1.6
	AFPI1	== AFPWMCCR1.5
	AFPI0	== AFPWMCCR1.4
	AFPD2	== AFPWMCCR1.2
	AFPD1	== AFPWMCCR1.1
	AFPD0	== AFPWMCCR1.0
AFPWMCCR2== 0X28:rpage 2
	AFPM2	== AFPWMCCR2.7
	AFPM1	== AFPWMCCR2.6
	AFPM0	== AFPWMCCR2.5
	AFPSS0	== AFPWMCCR2.4
	AFPCK3	== AFPWMCCR2.3
	AFPCK2	== AFPWMCCR2.2
	AFPCK1	== AFPWMCCR2.1
	AFPCK0	== AFPWMCCR2.0
AFDAL== 0X29:rpage 2
AFDAH== 0X2A:rpage 2
AFDBL== 0X2B:rpage 2
AFDBH== 0X2C:rpage 2
PRDCL_T == 0X2D:rpage 2
PRDCH_T == 0X2E:rpage 2	
DTCL_T == 0X2F:rpage 2
DTCH_T == 0X30:rpage 2

COBS4       ==  0X40:rpage 2
;R3E/COBS5 :Code Option Bit Selection Register5
COBS5       ==  0X41:rpage 2
;R3F/COBS6 :Code Option Bit Selection Register6
COBS6       ==  0X42:rpage 2
;R40/COBS7 :Code Option Bit Selection Register7
LOCKPR       ==  0X47:rpage 2
;R41/COBS8 :Code Option Bit Selection Register8
LOCKCR       ==  0X48:rpage 2
	LOCKEN	== LOCKCR.7