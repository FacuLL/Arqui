extern num2str

section .text
GLOBAL _start


_start: 	
        MOV EAX, 0
        MOV EBX, tope
loop:   PUSH EBX
				PUSH EAX
        PUSH str
        CALL num2str
print:  MOV EDX, EAX
        MOV EAX, 4
        MOV EBX, 1
        MOV ECX, str
        INT 80h
			  MOV EAX, 4
        MOV EBX, 1
        MOV ECX, salto
				MOV EDX, 1
        INT 80h
        POP ECX
        POP EAX
				POP EBX
        ADD EAX, multiplo
        CMP EAX, EBX
        JLE loop
        MOV EAX, 1
        MOV EBX, 0
        INT 80h

section .data
str: times 12 db 0
salto: DB 10
lenght: EQU $-str
multiplo: EQU 6
tope: EQU 51