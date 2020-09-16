;;====== For IC Application =================================================;;

;Write(WR_ADDR,@WR_VAL)
SDxxx_ROM_EEP_WR MACRO WR_ADDR,WR_VAL
    SBANK	1
    BS      EECR2,5     ;EECR2[EEPC]
    JBS     EECR1,2     ;while(EECR1_ONRD_SF)
    JMP     $-1
    BS      EECR2,7     ;EECR2[EEWE]
	MOV		A,@WR_ADDR
	MOV		EERA,A
	MOV		A,@WR_VAL
	MOV		EERD,A
	BS		EECR1,0		;EECR1[WR]
    JBC     EECR2,6     ;while(EECR2_EDF_SF)
    JMP     $-1
    BC      EECR2,7     ;EECR2[EEWE]
    BC      EECR2,5     ;EECR2[EEPC]
    ENDM

;Read(RD_ADDR,RD_VAL)
SDxxx_ROM_EEP_RD MACRO RD_ADDR,RD_VAL
    SBANK	1
    BS      EECR2,5     ;EECR2[EEPC]
    JBS     EECR1,2     ;while(EECR1_ONRD_SF)
    JMP     $-1
	MOV		A,@RD_ADDR
	MOV		EERA,A
    BS		EECR1,1		;EECR1[RD]
	MOV		A,EERD
	MOV		RD_VAL,A
    JBC     EECR2,6     ;while(EECR2_EDF_SF)
    JMP     $-1
    BC      EECR2,5     ;EECR2[EEPC]
    ENDM

;待驗證
SDxxx_ROM_IAP_WR MACRO WR_ADDR,WR_VAL,RAM_BANK
	SBANK	1
	GBANK	3
	MOV		A,@0x08
	MOV		TBWAH,A
	MOV		A,@0x00
	MOV		TBWAL,A
	MOV		A,@0x01
	MOV		TBWCR,A
	MOV		A,@0xB4
	MOV		FLKR,A		
	SBANK	0
	TBWR
    ENDM


;;====== For IC Function Verify =============================================;;

;Write(WR_VAL),Read(WR_VAL),Clear(0x00)
SDxxx_ROM_EEP_WR_ALL MACRO
    NOP
    ENDM
