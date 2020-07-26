 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

JMP START

DATA SEGMENT
	ID db 1H, 2H, 3H, 4H, 5H, 6H, 7H, 8H, 9H, 0A0H, 0B0H, 0C0H, 0D0H, 0E0H, 0F0H, 10H, 11H, 12H, 13H, 14H, 15H, 16H, 17H, 18H, 19H
	MARKS db 50, 66, 77, 98, 100, 32, 34, 65, 36, 55, 80, 12, 54, 78, 22, 14, 9, 4, 99, 21, 62, 51, 44, 100, 1
DATA ENDS  

CODE SEGMENT

	ASSUME DS:DATA CS:CODE
START: MOV AX, DATA
	   MOV DS, AX
	   MOV CX, 18H  
	   
OUTER: MOV SI, 0
	   MOV BX, 0
	   
INNER: INC BX
	   MOV AL, MARKS[SI]
	   MOV DL, ID[SI]
	   INC SI
	   CMP  MARKS[SI], AL
	   JB   SKIP
	   XCHG AL, MARKS[SI]
	   MOV  MARKS[SI-1], AL
	   XCHG DL, ID[SI]
       MOV  ID[SI-1], DL
SKIP:
	   CMP BX, CX
	   JL INNER 
	   LOOP OUTER
	
	   
	MOV AH, 4CH
CODE ENDS

END START

ret




