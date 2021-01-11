//EE-312 FINAL ASSIGNMENT - HASHING TREE

LXI H,5000H //ADDRESSES OF THE STARTING NODE
LXI SP,FFFFH
MVI B,00H
MVI C,07H
LOOP:CALL ADDBLOCK
INR H
MVI L,00H
INR B
DCR C
JNZ LOOP
//TREE HAS BEEN FORMED

// 5000H, 5100H, 5200H,5300H,5400H,5500H,5600H ARE THE STARTING ADDRESSES OF THE SEVEN NODES

LXI H, 6000H
MVI B,04H
L1:CALL FINDHASHINPUT
INR H
DCR B
JNZ L1
HLT
//FIRST 3 BITS STARTING FROM MSB IN A BYTE REPRESENT THE HASH

//SUBROUTINE FOR CALLING THE HASHING1 SUBROUTINE FOR EVERY INPUT AND STORING IT IN THE MEMORY
FINDHASHINPUT:PUSH H
PUSH B
MVI B,80H
MVI C,00H
MOV E,M
INX H
MOV D,M
LXI H,5000H
//CALLING HASH1 SUBROUTINE 3 TIMES BECAUSE THE DEPTH OF THE TREE IS 3
CALL HASH1
CALL HASH1
CALL HASH1
MOV A,C
POP B
MVI H,70H
MOV L,B
MOV M,A
POP H
RET



//SUBROUTINE FOR ADDING A NODE
ADDBLOCK: PUSH H   //UPDATING PARENT NODE ADDRESS
MVI H,30H
MOV A,B
RLC
MOV L,A
MOV E,M
INX H
MOV D,M
POP H
MOV M,E
INX H
MOV M,D
INX H
//UPDATING LEFT CHILD ADDRESS
PUSH H
MVI H,31H
MOV A,B
RLC
MOV L,A
MOV E,M
INX H
MOV D,M
POP H
MOV M,E
INX H
MOV M,D
INX H
//UPDATING RIGHT CHILD ADDRESS
PUSH H
MVI H,32H
MOV A,B
RLC
MOV L,A
MOV E,M
INX H
MOV D,M
POP H
MOV M,E
INX H
MOV M,D
INX H
//UPDATING DEPTH VALUE
PUSH H
MVI H,33H
MOV L,B
MOV E,M
POP H
MOV M,E
INX H
//UPDATING INDEX VALUE
PUSH H
MVI H,34H
MOV L,B
MOV E,M
POP H
MOV M,E
INX H
//UPDATING THRESHOLDVALUE
PUSH H
MVI H,35H
MOV L,B
MOV E,M
POP H
MOV M,E
INX H

RET

//SUBROUTINE FOR HASHING 
HASH1:
MOV A,L
ADI 07H
MOV L,A
MOV A,M
CPI 01H
JNZ MOVFR
INX H
MOV A,M
CMA
ADI 01H
ADD E
RAL
JNC GRT
MOV A,B
RRC
MOV B,A
MOV A,L
SUI 05H
MOV L,A
MOV A,M
STA C041H
DCR L 
MOV A,M
STA C040H
LHLD C040H
RET

MOVFR:INX H
MOV A,M
CMA
ADI 01H
ADD D
RAL
JNC GRT
MOV A,B
RRC
MOV B,A
MOV A,L
SUI 05H
MOV L,A
MOV A,M
STA C041H
DCR L 
MOV A,M
STA C040H
LHLD C040H
RET

GRT:MOV A,C
ORA B
MOV C,A
MOV A,B
RRC
MOV B,A
MOV A,L
SUI 03H
MOV L,A
MOV A,M
STA C041H
DCR L 
MOV A,M
STA C040H
LHLD C040H
RET


//ALL THE PARENT NODE ADDRESSES  OF VARIOUS NODES ARE STORED FROM 3000H
#ORG 3000H
#DB 00H, 00H, 00H, 50H, 00H, 50H, 00H, 51H, 00H, 51H, 00H, 52H, 00H, 52H
//ALL THE LEFT CHILD ADDRESSES  OF VARIOUS NODES ARE STORED FROM 3100H
#ORG 3100H
#DB 00H, 51H, 00H, 53H, 00H, 55H
//ALL THE RIGHT CHILD ADDRESSES  OF VARIOUS NODES ARE STORED FROM 3200H
#ORG 3200H
#DB 00H, 52H, 00H, 54H, 00H, 56H
//ALL THE DEPTH VALUES OF VARIOUS NODES ARE STORED FROM 3300H
#ORG 3300H
#DB 00H, 01H, 01H, 02H, 02H, 02H, 02H
//ALL THE INDEX VALUES OF VARIOUS NODES ARE STORED FROM 3400H
#ORG 3400H
#DB 02H, 01H, 01H, 02H, 01H, 02H, 01H
//ALL THE THRESHOLD VALUES OF VARIOUS NODES ARE STORED FROM 3500H
#ORG 3500H
#DB 03H, 00H, 00H, FBH, 04H, 07H,01H

//INPUTS
//NEGATIVE INPUTS ARE GIVEN IN TWO'S COMPLIMENT FORM
#ORG 6000H//(+5,+5)
#DB 05H, 05H//CORRESPONDING HASH STORED AT 7003H

#ORG 6100H//(-5,+5)
#DB 05H, FBH// CORRESPONDING HASH STORED AT 7002H

#ORG 6200H//(+5,-5)
#DB FBH, 05H// CORRESPONDING HASH STORED AT 7001H

#ORG 6300H//(-5,-5)
#DB FBH, FBH// CORRESPONDING HASH STORED AT 7000H

//FIRST 3 BITS STARTING FROM MSB OUT OF 8 BITS REPRESENT THE HASH.

