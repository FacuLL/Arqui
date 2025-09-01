section .data

str: db "H4ppy C0ding", 10
len: equ $-str
diff: equ 'A'-'a'

section .text
GLOBAL _start

_start:	MOV EAX, 0
	MOV EBX, str
loop:	MOV CL, [EBX]
	CMP CL, 'a'
	JL skip
	CMP CL, 'z'
	JG skip
	ADD CL, diff 
	MOV [EBX], CL
skip:	INC EAX
	INC EBX
	CMP EAX, len
	JL loop
print:	MOV EAX, 4
	MOV EBX, 1
	MOV ECX, str
	MOV EDX, len
	INT 80h
exit:	MOV EAX, 1
    	MOV EBX, 0
    	INT 80h
