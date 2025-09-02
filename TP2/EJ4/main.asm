extern num2str

section .text
GLOBAL _start


_start: 	
        MOV EAX, 0
        MOV ECX, numero
        CMP ECX, 0
        JZ convert
loop:   ADD EAX, ECX
        DEC ECX
        CMP ECX, 0
        JNE loop
convert:PUSH EAX
        PUSH str
        CALL num2str
print:  MOV EAX, 4
        MOV EBX, 1
        MOV ECX, str
        MOV EDX, lenght
        INT 80h
        MOV EAX, 1
        MOV EBX, 0
        INT 80h

section .data
str: times 12 db 0
lenght: EQU $-str
numero: EQU 1052