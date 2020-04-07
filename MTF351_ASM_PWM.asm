;============================================================
;	Project:		MTF351_ASM_TEMP
;	FILE:			MTF351_ASM_TEMP.asm
;  	Target:  		MTF351
;	Author:			Arthur (Lu Hungche)
;	Date:			2020/03/11
;------------------------------------------------------------
;	Description:	For MTF351 Instruction and EFT Verify
;	Active-Low: P50(Red-PWR)、P51(Yel-PUSH)、
;					
;------------------------------------------------------------
; History:
; Ver  | dd-mmm-yyyy |  Who  | Description of changes
; =====|=============|=======|===============================
;  0.1 | 11 Mat 2020 |Arthur | Original Release.
; -----|-------------|-------|-------------------------------
;  0.2 |
; -----|-------------|-------|-------------------------------
;============================================================

;==================== Project Include ====================
;Include	"SD028.INC"
Include	"MTF351.INC"

MAIN:
        CALL        PWM_INITIAL

        SBANK       3
        MOV         A, @0
        MOV         T5ACDMH, A
        MOV         T5BCDMH, A
        MOV         A, @250                               
        MOV         T5BCDML, A     
        MOV         T5ACDML, A                                                   

pwm_lp:
        JBC         SR, b_C
        JMP         B_AB_INIT0

        BC          LVPWM, bPWMALV
        BS          LVPWM, bPWMBLV
        MOV         A, @0x08
        MOV         MCOPL, A          
        BS          SR, b_C                                 
        JMP         PWM_ST_RUN0
B_AB_INIT0:
        BS          LVPWM, bPWMALV
        BC          LVPWM, bPWMBLV
        MOV         A, @0x02
        MOV         MCOPL, A
        BC          SR, b_C
PWM_ST_RUN0:
        BS          SETM1L, bT5RS
        BC          RSTM1L, bT5RR
        JMP         pwm_lp


PWM_INITIAL:
    SBANK       3
    ;hall detect need timer5 clk not gating                                          
    BS          T5CRL, bTMR5P                                             
    ;EHAA is on, EHAA set to input 
    ;CP2OUT trigger HAA.,EHAA is off,                     
    IF (HYS_COMP)
        MOV     A, @0x02
    ELSE 
        MOV     A, @0x01                             
    ENDIF
        MOV     EIOPHAPE, A              
    ;Hall Sampling                                       
    ;3��b111=Both edge at one of the inputs HAx
    ;Hall Sensor Noise Rejection Enable
    ;Hall sensor noise rejection Pre-scaler
    ;512/32=16us
    ;256/20=12.8us
    MOV     A, HACRH
    ;OR     A, @0x7F
    OR      A, @0x7D
    MOV     HACRH, A
    ;Hall Sensor Input Noise Rejection                                        
    MOV     A, @0x00
    MOV     HACRL, A                                                                                     
    MOV     A, @T5_SCALE
    OR      T5CRH, A
    BS      T5CRH, bT5CLR
    ;PWMAB,BB is modulated by timer5
    MOV     A, @0X0A
    MOV     PWMCR1L, A
    ;PWM Output mode                                      
    MOV     A, @0X05
    MOV     T5OPMS, A                          
    ;Composite PWM Mode Enable
    ;Synchronization source,Direct
    MOV     A, PWMCR2H
    OR      A, @0x83
    MOV     PWMCR2H, A
    ;Trigger Source, Timer 5 period match detected                   
    MOV     A, PWMCR2L
    OR      A, @0x20
    MOV     PWMCR2L, A
    ;1000
    MOV     A, @0x03
    MOV     T5PDH, A           
    MOV     A, @0xE8
    MOV     T5PDL, A            
    BS      IMR9, bT5PDMIE      
    BS      IMR10, bHAEGIE
    CLR     SFR9
    CLR     SFR10
    ;Active Status/Active state Level
    ;PWMA
    BS  LVPWM, bPWMALV           
    ;PWMAB                                                                            
    IF  (PWMAB_ASLV == 0)
        BC      ASPWM, bPWMABAS
        BC      LVPWM, bPWMABLV
    ELSEIF (PWMAB_ASLV == 1)
        BC      ASPWM, bPWMABAS
        BS      LVPWM, bPWMABLV
    ELSEIF (PWMAB_ASLV == 2)
        BS      ASPWM, bPWMABAS
        BC      LVPWM, bPWMABLV
    ELSE
        BS      ASPWM, bPWMABAS
        BS      LVPWM, bPWMABLV                 
    ENDIF
    ;PWMB
    BS      LVPWM, bPWMBLV
    ;PWMBB
    IF  (PWMBB_ASLV == 0)
        BC      ASPWM, bPWMBBAS
        BC      LVPWM, bPWMBBLV
    ELSEIF (PWMBB_ASLV == 1)
        BC      ASPWM, bPWMBBAS
        BS      LVPWM, bPWMBBLV
    ELSEIF (PWMBB_ASLV == 2)
        BS      ASPWM, bPWMBBAS
        BC      LVPWM, bPWMBBLV
    ELSE
        BS      ASPWM, bPWMBBAS
        BS      LVPWM, bPWMBBLV
    ENDIF

    ;PWMA,AB,B,BB Pin Enable
    MOV     A, @0X0F
    MOV     EIOPWMPE0, A
    RET

