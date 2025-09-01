section .text
GLOBAL _start

_start: 		
	PUSH 0
	PUSH str
	CALL num2str		
print:	MOV EDX, EAX
	MOV EBX, 1
	MOV ECX, str
	MOV EAX, 4
	INT 80h
exit:	MOV EAX, 1
	MOV EBX, 0
	INT 80h	

num2str:
	PUSH EBP
	MOV EBP, ESP
	MOV EAX, [EBP + 12]
	MOV EBX, 10
	XOR ECX, ECX
loop:   XOR EDX, EDX
	DIV EBX
	ADD EDX, '0'
	PUSH EDX
	INC ECX
	CMP EAX, 0
	JNZ loop
save:	MOV EAX, ECX
	MOV EBX, [EBP + 8]
sloop:	POP EDX
	MOV [EBX], DL
	DEC ECX
	INC EBX
	CMP ECX, 0
	JNZ sloop
	MOV BYTE [EBX], 0
	MOV ESP, EBP
	POP EBP 
	RET

section .data
str:	DW 10

