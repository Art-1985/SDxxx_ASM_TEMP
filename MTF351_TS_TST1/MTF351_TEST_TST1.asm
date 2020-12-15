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
; 1 common sram 50~7F   
; 2 bank   sram 80~FF   
	TMP50	== 0x50
	TMP80	== 0x80                                                 
;================ Interrupt Vector Table =================                                                                                                                       
                                                                                                                                                                                 
;==================== Main Function ======================                                                                                                                                                                        
const  == 30                                       
;;; set port8 as output 
org 0x0000
jmp MAIN
jmp fail_loop

org 0x0030
MAIN:                              
MOV A,@0x00                                           
MOV PORT5,A                                          
MOV PORT6,A                                          
MOV PORT7,A                                          
MOV IOCR5,A                                                                                    
MOV IOCR7,A
MOV A,@0x02
MOV IOCR6,A                                          
MOV A,@0xCC
MOV PORT6,A
MOV A,@0x33
MOV PORT5,A                                                      
;;; test common ram 50~7F (num=0x30)                  
MOV A,@const                                           
MOV TMP80,A                                           
MOV A,@0x50                                           
MOV RSR,A                                             
MOV A,@0x00                                           
wr_com_ram :                                          
ADD A,@0x03                                           
MOV IAR,A                                             
INC RSR                                               
DJZ TMP80                                             
JMP wr_com_ram                                        
CALL show_com_ram                                     

;;; invert common ram data
MOV A,@const
MOV TMP80,A
MOV A,@0x50
MOV RSR,A
inv_com_ram :
COM IAR
INC RSR
DJZ TMP80
JMP inv_com_ram
CALL show_com_ram

;;; test bank ram 80~FF (num=0x80*2)
GBANK 00
MOV A,@0x80
MOV TMP50,A
MOV RSR,A
MOV A,@0x00
wr_bk0_ram :
ADD A,@0x05
MOV IAR,A
INC RSR
DJZ TMP50
JMP wr_bk0_ram

GBANK 01
MOV A,@0x80
MOV TMP50,A
MOV RSR,A
MOV A,@0x00
wr_bk1_ram :
ADD A,@0x07
MOV IAR,A
INC RSR
DJZ TMP50
JMP wr_bk1_ram

;;; show bank ram 
GBANK 00
CALL show_bk_ram
GBANK 01
CALL show_bk_ram

;;; invert bank ram data
GBANK 00
MOV A,@0x80
MOV TMP50,A
MOV RSR,A
inv_bk0_ram :
COM IAR
INC RSR
DJZ TMP50
JMP inv_bk0_ram

GBANK 01
MOV A,@0x80
MOV TMP50,A
MOV RSR,A
inv_bk1_ram :
COM IAR
INC RSR
DJZ TMP50
JMP inv_bk1_ram

;;; show bank ram 
GBANK 00
CALL show_bk_ram
GBANK 01
CALL show_bk_ram

;;; test end ;;;
JMP end_loop


;=========Subroutine below=======;
show_com_ram :
MOV A,@const
MOV TMP80,A
MOV A,@0x50
MOV RSR,A
show_loop1 :
MOV A,IAR
MOV PORT6,A
INC RSR
DJZ TMP80
JMP show_loop1
RET

show_bk_ram :
MOV A,@0x80
MOV TMP50,A
MOV RSR,A
show_loop2 :
MOV A,IAR
MOV PORT6,A
INC RSR
DJZ TMP50
JMP show_loop2
RET

fail_loop :
SBANK 0
MOV A,@0x55
MOV PORT5,A
MOV A,@0xAA
MOV PORT6,A
fail_loopx :
JMP fail_loopx

end_loop :
SBANK 0
MOV A,@0xCC
MOV PORT5,A
MOV A,@0x33
MOV PORT6,A
end_loopx :
JMP end_loopx
