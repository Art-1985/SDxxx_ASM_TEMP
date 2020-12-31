;===========================================================================;
;  Title:       SD028 Include File                                          ;
;  Target MCU:  SD028                                                       ;
;  Description: The Definition of SD028 Registers                           ;
;  Company:     ELAN MICROELECTRONICS LTD.	                            	;
;  Date:        2020/02/20                                                  ;
;  Version:     v0.9                                                        ;
;===========================================================================;

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
; R0/IAR: Indirect Address Register
    R0      ==  0x00:rpage 0
    IAR     ==  0x00:rpage 0
;R1/ BSR: Bank Selection Control Register
    R1      ==  0x01:rpage 0
    BSR     ==  0x01:rpage 0
        SBS1  ==  BSR.5
        SBS0  ==  BSR.4
        GBS1  ==  BSR.1
        GBS0  ==  BSR.0
; R2/PC: Program Counter & Stack
    R2      ==  0x02:rpage 0
    PCL     ==  0x02:rpage 0

;R3/SW:Status Register
    R3      ==  0x03:rpage 0
    STATUS  ==  0x03:rpage 0
    SR      ==  0x03:rpage 0
        IT	    == SR.7
        N       == SR.6
        OV      == SR.5
        T       == SR.4
        P       == SR.3
        Z       == SR.2
        DC      == SR.1
        C       == SR.0
;R4/ RSR:RAM Select Register
    R4          == 0x04:rpage 0
    RSR         == 0x04:rpage 0

;======================================================;
; BANK 0                                               ;
; Registers R5~R4F                                     ;
;======================================================;
;R5/PORT5 :IO PORT 5 Data Register
    PORT5   ==  0x05:rpage 0
    P5      ==  0x05:rpage 0
        P50     == PORT5.0
        P51     == PORT5.1
        P52     == PORT5.2
        P53     == PORT5.3
        P54     == PORT5.4
        P55     == PORT5.5
        P56     == PORT5.6
        P57     == PORT5.7
;RB/IOCR5 :IO PORT 5 Control Register
    IOCR5   ==  0x0B:rpage 0
;RE/OMCR :OMCR:Operating Mode Control Register
    OMCR    ==  0x0E:rpage 0
        CPUS    == OMCR.7
        IDLE    == OMCR.6
        PERCS   == OMCR.5
        IIPS    == OMCR.4
        FMSF    == OMCR.3
	    RCM1    == OMCR.1
        RCM0    == OMCR.0
;RF/EIESCR :External Interrupt Edge Select Control Register
    EIESCR  ==  0x0F:rpage 0
        EI1ES1  == EIESCR.3
	    EI1ES0  == EIESCR.2
	    EI0ES1  == EIESCR.1
	    EI0ES0  == EIESCR.0
;R10/WUCR1 :Wake-up Control Register1
    WUCR1   ==  0x10:rpage 0
        CMP2WK	== WUCR1.7
	    CMP1WK	== WUCR1.6
	    ADWK    == WUCR1.4
        INT1WK  == WUCR1.3
        INT0WK  == WUCR1.2
        IGWK    == WUCR1.0
;R11/WUCR2 :Wake-up Control Register2
    WUCR2   == 0x11:rpage 0
        CMP3WK	== WUCR2.6
        URWK	== WUCR2.4
;R12/WUCR3 :Wake-up Control Register3
    WUCR3   ==  0x12:rpage 0
        ICWKP5  == WUCR3.4
;R13/SYSCON :
    SYSCON  == 0x13:rpage 0
        LDOI    ==  SYSCON.7
;R14/SFR1 :Status Flag Register 1
    SFR1    == 0x14:rpage 0
        CMP2SF  == SFR1.7
	    CMP1SF  == SFR1.6
	    ADSF    == SFR1.4
        EXSF1   == SFR1.3
        EXSF0   == SFR1.2
;R15/SFR2 :Status Flag Register2
    SFR2    == 0x15:rpage 0
	    CMP3SF  == SFR2.6
        UERRSF  == SFR2.5
        URSF    == SFR2.4
        UTSF    == SFR2.3

;R17/SFR4 :Status Flag Register4
    SFR4    == 0x17:rpage 0
        P5ICSF  == SFR4.4

;R19/SFR6 :Status Flag Register6
    SFR6    ==  0x19:rpage 0
        SHSF    == SFR6.7
;R1A/SFR7 :Status Flag Register7
    SFR7        == 0x1A:rpage 0
        IGSF    == SFR7.7
        TXDSF   == SFR7.6
        TXCSF   == SFR7.5
        TM2DASF == SFR7.4
        TM1DASF == SFR7.3
        TM1OFSF == SFR7.2
        TM2DBSF == SFR7.1
        TM1DBSF == SFR7.0
;R1B/IMR1 :Interrupt Mask Register 1
    IMR1        == 0x1B:rpage 0
        CMP2IE  == IMR1.7
	    CMP1IE  == IMR1.6
	    ADIE    == IMR1.4
        EXIE1   == IMR1.3
        EXIE0   == IMR1.2
;RF/IMR2 :Interrupt Mask Register 2
    IMR2        == 0x1C:rpage 0
        CMP3IE  == IMR2.6
        UERRIE  == IMR2.5
        URIE    == IMR2.4
        UTIE    == IMR2.3

;R1E/IMR4 :Interrupt Mask Register 4
    IMR4        ==  0x1E:rpage 0
        P5ICIE  ==  IMR4.4

;R20/IMR6 :Interrupt Mask Register 6
    IMR6        == 0x20:rpage 0
        SHIE    == IMR6.7
        IGIE    == IMR6.3
        TXTMIE  == IMR6.2
        TM2IE   == IMR6.1
        TM1IE   == IMR6.0
;R21/WDTCR :Watch Dog Timer Control Register
    WDTCR       == 0x21:rpage 0
        WDTE    == WDTCR.7
        FSSF    == WDTCR.6
        PSWE    == WDTCR.3
        WPSR2   == WDTCR.2
        WPSR1   == WDTCR.1
        WPSR0   == WDTCR.0
;R3E/ADCR1 :ADC Control Register1
    ADCR1       == 0x3E:rpage 0
        CKR1    == ADCR1.6
        CKR0    == ADCR1.5
        ADRUN   == ADCR1.4
        ADP     == ADCR1.3
        ADOM    == ADCR1.2
        SHS1    == ADCR1.1
        SHS0    == ADCR1.0
;R3F/ADCR2 :ADC Control Register2
    ADCR2       == 0x3F:rpage 0
        ADLPFEN == ADCR2.7
        ADIM    == ADCR2.5
        ADCMS   == ADCR2.4
        VPIS1   == ADCR2.3
        VPIS0   == ADCR2.2
        VREFP   == ADCR2.1
;R40/ADISR :Analog to Digital Converter Input Channel Selection Register
    ADISR       == 0x40:rpage 0
        ADIS1   == ADISR.1
        ADIS0   == ADISR.0
;R41/ADER1 :ADC Input Enable Register
    ADER1       == 0x41:rpage 0
        ADE1    == ADER1.1
        ADE0    == ADER1.0
;R43/ADDL :ADC Low-8 Bits Data Buffer
    ADDL        == 0x43:rpage 0
;R44/ADDH :ADC High-8 Bits Data Buffer
    ADDH        == 0x44:rpage 0
;R45/ADCVL :Low Byte of Analog to Digital Converter Comparison
    ADCVL       == 0x45:rpage 0
;R46/ADCVH :High Byte of Analog to Digital Converter Comparison
    ADCVH       == 0x46:rpage 0
;======================================================
; BANK 1
; Registers R5~R4F
;======================================================
;R08/P5PHCR :Port5 Pull-high Control Register
  P5PHCR        ==  0x08:rpage 1
        PH55    ==  P5PHCR.6
        PH54    ==  P5PHCR.4
        PH53    ==  P5PHCR.3
        PH52    ==  P5PHCR.2
        PH51    ==  P5PHCR.1
        PH50    ==  P5PHCR.0

;R0B/P5PLCR Port 5 Pull-low Control Register
    P5PLCR      ==  0x0B:rpage 1
        PL55    ==  P5PLCR.5
        PL54    ==  P5PLCR.4
        PL53    ==  P5PLCR.3
        PL52    ==  P5PLCR.2
        PL51    ==  P5PLCR.1
        PL50    ==  P5PLCR.0

;R0E/P5HDSCR :Port 5 High Drive/Sink Control Register
    P5HDSCR     ==  0x0E:rpage 1
        HDS55   ==  P5HDSCR.5
        HDS54   ==  P5HDSCR.4
        HDS53   ==  P5HDSCR.3
        HDS52   ==  P5HDSCR.2
        HDS51   ==  P5HDSCR.1
        HDS50   ==  P5HDSCR.0

;R33 URCR :UART Control Register
    URCR        == 0x33:rpage 1
        UINVEN  == URCR.7
        UMODE1  == URCR.6
        UMODE0  == URCR.5
        BRATE2  == URCR.4
        BRATE1  == URCR.3
        BRATE0  == URCR.2
	    UTBF    == URCR.1
	    TXE     == URCR.0
;R34 URS :UART Status Register
    URS         == 0x34:rpage 1
        URTD8   == URS.7
        EVEN    == URS.6
        PER     == URS.5
        PRERR   == URS.4
        OVERR   == URS.3
        FMERR   == URS.2
	    URBF    == URS.1
	    RXE     == URS.0
;R35 URTD :UART Transmit Data Buffer Register
    URTD        == 0x35:rpage 1
;R36 URRDL :UART Receive Data Low Buffer Register
    URRDL       == 0x36:rpage 1
;R37 URRDH :UART Receive Data High Buffer Register
    URRDH       == 0x37:rpage 1
        URRD8   == URRDH.7
        URSS    == URRDH.0

;R40/EECR1 :EEPROM Control Register 1
    EECR1       ==  0x40:rpage 1
        EEPVSF  ==  EECR1.4
        EEPV    ==  EECR1.3
        ONRD    ==  EECR1.2
        RD      ==  EECR1.1
        WR      ==  EECR1.0
;R41/EECR2 :EEPROM Control Register 2
    EECR2       ==  0x41:rpage 1
        EEWE    ==  EECR2.7
        EEDF    ==  EECR2.6
        EEPC    ==  EECR2.5
;R42/EERA :EEPROM Address
    EERA        ==  0x42:rpage 1
;R43/EERD :EEPROM Data
    EERD        ==  0x43:rpage 1
;R44/FLKR :Flash Key Register for Table Write Use
    FLKR        ==  0x44:rpage 1
;R45/TBPTL :Table Point Low Register
    TBPTL       ==  0x45:rpage 1
;R46/TBPTH :Table Point High Register
    TBPTH       ==  0x46:rpage 1
        HLB     ==  TBPTH.7
        RDS     ==  TBPTH.6
;R47/STKMON :Stack point
    STKMON      ==  0x47:rpage 1
        STOV    ==  STKMON.7
        STL2    ==  STKMON.2
        STL1    ==  STKMON.1
        STL0    ==  STKMON.0
;R48/PCH :Program Counter High
    PCH         == 0x48:rpage 1

    COBS1       == 0x4A:rpage 1
        HLFS	== COBS1.7
        ENWDT	== COBS1.5
        NRHL	== COBS1.4
        NRE     == COBS1.3
        ADFM	== COBS1.2
    COBS2       == 0x4B:rpage 1
        RT5     == COBS2.5
        RT4     == COBS2.4
        RT3     == COBS2.3
        RT2     == COBS2.2
        RT1     == COBS2.1
        RT0     == COBS2.0
    COBS3       == 0x4C:rpage 1
        CT3     == COBS3.3
        CT2     == COBS3.2
        CT1     == COBS3.1
        CT0     == COBS3.0
;R4D/TBWCR :Table Write Control Register
    TBWCR       ==  0x4D:rpage 1
        IAPVSF  ==  TBWCR.2
        IAPV    ==  TBWCR.1
        IAPEN   ==  TBWCR.0
;R4E/TBWAL :Table Write start Address Low byte
    TBWAL       ==  0x4E:rpage 1
;R4F/TBWAH :Table Write start Address High byte
    TBWAH       ==  0x4F:rpage 1

;======================================================
; BANK 2
; Registers R5~R4F
;======================================================
;R05/TM1CR1 :Timer/Counter 1 Control Register 1
    TM1CR1      ==  0x05:rpage 2
        TM1S    ==  TM1CR1.7
        TM1RC   ==  TM1CR1.6
        TM1SS1  ==  TM1CR1.5
        TM1RX1  ==  TM1CR1.4
        TM1FF   ==  TM1CR1.3
        TM1MOS  ==  TM1CR1.2
        TM1IS1  ==  TM1CR1.1
        TM1IS0  ==  TM1CR1.0
;R06/TM1CR2 :Timer/Counter 1 Control Register 2
    TM1CR2      ==  0x06:rpage 2
        TM1M2   ==  TM1CR2.7
        TM1M1   ==  TM1CR2.6
        TM1M0   ==  TM1CR2.5
        TM1SS0  ==  TM1CR2.4
        TM1CK3  ==  TM1CR2.3
        TM1CK2  ==  TM1CR2.2
        TM1CK1  ==  TM1CR2.1
        TM1CK0  ==  TM1CR2.0
;R07/TM1DBH :Timer/Counter 1 Data Buffer B High Byte
    TM1DBH      ==  0x07:rpage 2
;R08/TM1DBL :Timer/Counter 1 Data Buffer B Low Byte
    TM1DBL      ==  0x08:rpage 2
;R09/TM1DAH :Timer/Counter 1 Data Buffer A High Byte
    TM1DAH      ==  0x09:rpage 2
;R0A/TM1DAL :Timer/Counter 1 Data Buffer A Low Byte
    TM1DAL      ==  0x0A:rpage 2
;R0B/TM2CR1 :Timer/Counter 2 Control Register 1
    TM2CR1      ==  0x0B:rpage 2
        TM2S    ==  TM2CR1.7
        TM2RC   ==  TM2CR1.6
        TM2SS1  ==  TM2CR1.5
        TM2RX2  ==  TM2CR1.4
        TM2FF   ==  TM2CR1.3
        TM2MOS  ==  TM2CR1.2
        TM2IS1  ==  TM2CR1.1
        TM2IS0  ==  TM2CR1.0
;R0C/TM2CR2 :Timer/Counter 2 Control Register 2
    TM2CR2      ==  0x0C:rpage 2
        TM2M2   ==  TM2CR2.7
        TM2M1   ==  TM2CR2.6
        TM2M0   ==  TM2CR2.5
        TM2SS0  ==  TM2CR2.4
        TM2CK3  ==  TM2CR2.3
        TM2CK2  ==  TM2CR2.2
        TM2CK1  ==  TM2CR2.1
        TM2CK0  ==  TM2CR2.0
;R0D/TM2DBH :Timer/Counter 2 Data Buffer B High Byte
    TM2DBH      ==  0x0D:rpage 2
;R0E/TM2DBL :Timer/Counter 2 Data Buffer B Low Byte
    TM2DBL      ==  0x0E:rpage 2
;R0F/TM2DAH :Timer/Counter 2 Data Buffer A High Byte
    TM2DAH      ==  0x0F:rpage 2
;R10/TM2DAL :Timer/Counter 2 Data Buffer A Low Byte
    TM2DAL      ==  0x10:rpage 2

;R11 RX1CR1(RX1 Control Register 1)
    RX1CR1      ==  0x11:rpage 2
        RX1E    ==  RX1CR1.7
        RXIVE   ==  RX1CR1.6
        RX1HV4  ==  RX1CR1.4
        RX1HV3  ==  RX1CR1.3
        RX1HV2  ==  RX1CR1.2
        RX1HV1  ==  RX1CR1.1
        RX1HV0  ==  RX1CR1.0
;R12 RX1CR2(RX1 Control Register 2)
    RX1CR2      ==  0x12:rpage 2
        RX1OPE  ==  RX1CR2.7
        RX1OUT  ==  RX1CR2.6
        RX1LV4  ==  RX1CR2.4
        RX1LV3  ==  RX1CR2.3
        RX1LV2  ==  RX1CR2.2
        RX1LV1  ==  RX1CR2.1
        RX1LV0  ==  RX1CR2.0
;R13 RX2CR1(RX2 Control Register 1)
    RX2CR1      ==  0x13:rpage 2
        RX2E    ==  RX2CR1.7
        RX2HV4  ==  RX2CR1.4
        RX2HV3  ==  RX2CR1.3
        RX2HV2  ==  RX2CR1.2
        RX2HV1  ==  RX2CR1.1
        RX2HV0  ==  RX2CR1.0
;R14 RX2CR2(RX2 Control Register 2)
    RX2CR2      ==  0x14:rpage 2
        RX2OPE  ==  RX2CR2.7
        RX2OUT  ==  RX2CR2.6
        RX2LV4  ==  RX2CR2.4
        RX2LV3  ==  RX2CR2.3
        RX2LV2  ==  RX2CR2.2
        RX2LV1  ==  RX2CR2.1
        RX2LV0  ==  RX2CR2.0
;R15 RXDCR(RX Deglitch Control Register)
    RXDCR       ==  0x15:rpage 2
        RX1DS   ==  RXDCR.7
        RX1DT2  ==  RXDCR.6
        RX1DT1  ==  RXDCR.5
        RX1DT0  ==  RXDCR.4
        RX2DS   ==  RXDCR.3
        RX2DT2  ==  RXDCR.2
        RX2DT1  ==  RXDCR.1
        RX2DT0  ==  RXDCR.0
;R16 TXSC(TX Sink Current Register)
    TXSC        ==  0x16:rpage 2
        TXCS3   ==  TXSC.3
        TXCS2   ==  TXSC.2
        TXCS1   ==  TXSC.1
        TXCS0   ==  TXSC.0
;R17 TXCR1(TX Control Register 1)
    TXCR1       ==  0x17:rpage 2
        TXEN    ==  TXCR1.7
        TXTM    ==  TXCR1.5
        TXSR1   ==  TXCR1.4
        TXSR0   ==  TXCR1.3
        TXMV2   ==  TXCR1.2
        TXMV1   ==  TXCR1.1
        TXMV0   ==  TXCR1.0
;R18 TXCR2(TX Control Register 2)
    TXCR2       ==  0x18:rpage 2
        TXS     ==  TXCR2.7
        TXCLK   ==  TXCR2.6
        TXDP2   ==  TXCR2.5
        TXDP1   ==  TXCR2.4
        TXDP0   ==  TXCR2.3
        TXCP2   ==  TXCR2.2
        TXCP1   ==  TXCR2.1
        TXCP0   ==  TXCR2.0
;R19 TXDT(TX Delay Timer Register)
    TXDT       ==  0x19:rpage 2
;R1A TXCT(TX Sink Current Timer Register)
    TXCT       ==  0x1A:rpage 2
;R1B TXRC (TXTM Read Counting)
    TXRC       ==  0x1B:rpage 2
;R1C CMP3&LRR (CMP3&Limiting Resistor)
    LRR         ==  0x1C:rpage 2
        CMP3DS  ==  LRR.7
        CMP3DT2 ==  LRR.6
        CMP3DT1 ==  LRR.5
        CMP3DT0 ==  LRR.4
        CL0     ==  LRR.0
;R1D DCCR (Discharge Control Register)
    DCCR        ==  0x1D:rpage 2
        CMP3E   ==  DCCR.7
        MCDC    ==  DCCR.6
        DCT2    ==  DCCR.4
        DCT1    ==  DCCR.3
        DCT0    ==  DCCR.2
        DCR1    ==  DCCR.1
        DCR0    ==  DCCR.0
;R1E DCVS (Discharge Voltage select Register)
    DCVS        ==  0x1E:rpage 2
        CMP3OPE ==  DCVS.7
        CMP3OUT ==  DCVS.6
        DCP     ==  DCVS.3
        DCV2    ==  DCVS.2
        DCV1    ==  DCVS.1
        DCV0    ==  DCVS.0


;R1F IR1SR (IR1 Sink Current Control Register)
    IR1SR       ==  0x1F:rpage 2
;R20 IR2SR (IR2 Sink Current Control Register)
    IR2SR       ==  0x20:rpage 2
;R21 IRCR1 (IR Control Register 1)
    IRCR1       ==  0x21:rpage 2
;R22 IGCR1 (Integrator Control Register 1)
    IGCR1       ==  0x22:rpage 2
;R23 IGCR2 (Integrator Control Register 2)
    IGCR2       ==  0x23:rpage 2
;R24 IGCR3 (Integrator Control Register 3)
    IGCR3       ==  0x24:rpage 2
;R25 IGDBH (Integrator Data Buffer High byte)
    IGDBH       ==  0x25:rpage 2
;R26 IGDBL (Integrator Data Buffer Low byte)
    IGDBL       ==  0x26:rpage 2    
;R27 TLED (Time of LED Control Register)
    TLED        ==  0x27:rpage 2

;R38 IGCOBS1 (Integrator Code Option Bit Selection Register 1)
    IGCOBS1     ==  0x38:rpage 2
;R39 IGCOBS2 (Integrator Code Option Bit Selection Register 2)
    IGCOBS2     ==  0x39:rpage 2
;R3A IGCOBS3 (Integrator Code Option Bit Selection Register 3)
    IGCOBS3     ==  0x3A:rpage 2
;R3B IGCOBS4 (Integrator Code Option Bit Selection Register 4)
    IGCOBS4     ==  0x3B:rpage 2
;R3C IGCOBS5 (Integrator Code Option Bit Selection Register 5)
    IGCOBS5     ==  0x3C:rpage 2
;R3D IGCOBS6 (Integrator Code Option Bit Selection Register 6)
    IGCOBS6     ==  0x3D:rpage 2
;R3E IGCOBS7 (Integrator Code Option Bit Selection Register 7)
    IGCOBS7     ==  0x3E:rpage 2

;R41 VRCOBS1 (VREF Code Option Bit Selection Register 1)
    VRCOBS1     ==  0x41:rpage 2
;R42/COBS4 :Code Option Bit Selection Register4
    COBS4       ==  0x42:rpage 2
;R43/COBS5 :Code Option Bit Selection Register5
    COBS5       ==  0x43:rpage 2
;R44/COBS6 :Code Option Bit Selection Register6
    COBS6       ==  0x44:rpage 2

;R47/LOCKPR (Lock Page Number Register)
    LOCKPR      ==  0x47:rpage 2
;R46/LOCKCR (Lock Control Register)
    LOCKCR      ==  0x48:rpage 2
	LOCKEN  == LOCKCR.7