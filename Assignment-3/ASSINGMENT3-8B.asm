//ASSIGNMENT-3 QUESTION-8B

MVI B,0AH
MVI C,02H
MVI D,02H
MVI A,06H
ANA B
MOV H,A
MOV A,C
ORA B
ANA D
ORA C
ORA H
RLC
RLC
HLT;

