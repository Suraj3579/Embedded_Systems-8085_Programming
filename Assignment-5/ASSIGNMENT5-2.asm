//ASSIGNMENT-5 QUESTION-2

LXI H,4100H
MVI B,08H
L1:
MOV A,L
SUI 00H
JZ FIRST
SUI 07H
JZ LAST
CALL SUBFPNUM
MVI H,51H
MOV M,E
DCR H
MOV M,D
MVI H,41H
INX H
DCR B
JNZ L1

FIRST:MVI C,00H
INX H
MOV A,M
DCX H
SUB M
JNC SKIPF
INR C
SKIPF:MVI H,51H
MOV M,A
MVI H,40H
INX H
MOV A,M
DCX H
SUB M
SUB C
MVI H,50H
MOV M,A
MVI H,41H
INX H
DCR B
JNZ L1

LAST:MVI C,00H
MOV A,M
DCX H
SUB M
JNC SKIPL
INR C
SKIPL:MVI H,51H
MOV M,A
MVI H,40H
MOV A,M
DCX H
SUB M
SUB C
MVI H,50H
MOV M,A
MVI H,41H
INX H
DCR B
JNZ L1

MVI B,08H
LXI H,5000H
L2:MOV D,M
INR H
MOV E,M
CALL DVFPNUM
MOV M,E
DCR H
MOV M,D
INX H
DCR B
JNZ L2
HLT


SUBFPNUM:MVI C,00H
INX H
MOV A,M
DCX H
DCX H
SUB M
JNC SKIP1
INR C
SKIP1:INX H
MOV E,A
DCR H
INX H
MOV A,M
DCX H
DCX H
SUB M
SUB C
INX H 
MOV D,A
RET

DVFPNUM:MOV A,D
RAR
MOV D,A
MOV A,E
RAR
MOV E,A
RET



#ORG 4000H //INTEGER PARTS
#DB 08H,08H,06H,05H,04H,03H,02H,01H
#ORG 4100H //FRACTIONAL PARTS
#DB 90H,40H,70H,60H,50H,01H,40H,80H

