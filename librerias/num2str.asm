section .text
global num2str

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

