//ASSIGNMENT-4 QUESTION-5

LHLD 5000H
XCHG
MVI H,80H
MOV A,E
ANI 0FH
MOV B,A
MOV A,E
ANI F0H
RRC
MOV C,A
RRC
RRC
ADD C
ADD B
MOV M,A 
INX H
MOV A,D
ANI 0FH
MOV B,A
MOV A,D
ANI F0H
RRC
MOV C,A
RRC
RRC
ADD C
ADD B
MVI B,80H 
MVI C,00H 
MVI D,08H 
LOOP:
DCR D
JM STORE
RLC
CPI 64H
JC CONTINUE 
SUI 64H
MOV E,A
MOV A,B
ADD C
MOV C,A
MOV A,B
RRC
JZ STORE
MOV B,A
MOV A,E
ADI 00H
JZ STORE
JMP LOOP
CONTINUE:
MOV E,A
MOV A,B
RRC
JZ STORE
MOV B,A
MOV A,E
JMP LOOP
STORE:
MOV M,C
HLT

#ORG 5000H
#DB 14H,25H

//T-STATES 