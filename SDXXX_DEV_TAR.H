;;=========================================================================
;;	FILE:			SDxxx_DEV_TAR.h
;;	Author:			ELAN SRD Arthur (Lu Hungche)
;;	Date:			2020/09/15
;;-------------------------------------------------------------------------
;;	Description:	SDxxx Device Definitions
;;
;;-------------------------------------------------------------------------
;; History:
;; Ver  | dd-mmm-yyyy |  Who  | Description of changes
;; =====|=============|=======|============================================
;;  0.1 | 02 Sep 2020 | Arthur| Original Release.
;; -----|-------------|-------|--------------------------------------------
;;	0.2 |
;; -----|-------------|-------|--------------------------------------------
;;
;; -----|-------------|-------|--------------------------------------------
;;=========================================================================

;;====== Select Target Device ===========================================;;
TARGET	VAR		1

EM88F794N_DEV	VAR		0
EM88F758N_DEV	VAR		0
MTF351_DEV		VAR		0
SD062_DEV		VAR		TARGET
SD028_DEV		VAR		0

IF	(SD062_DEV)
	INCLUDE		"SD062.INC"
	INCLUDE		"SDxxx_ASM_SYS.asm"
	INCLUDE		"SDxxx_ASM_EFT.asm"
ELSEIF(SD028_DEV)
	INCLUDE		"SD028.INC"
	INCLUDE		"SDxxx_ASM_SYS.asm"
	INCLUDE		"SDxxx_ASM_EFT.asm"
ELSE
	NOP
ENDIF

;;使用CALL需定義位址，因有衝突問題
