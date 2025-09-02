section .text
GLOBAL _start

_start:
    MOV EAX, 2
    INT 80h
    MOV ECX, padre
    MOV EDX, plenght
    CMP EAX, 0
    JNE print
    MOV ECX, hijo
    MOV EDX, hlenght
print:
    MOV EAX, 4
    MOV EBX, 1
    INT 80h

    MOV EAX, 1
    MOV EBX, 0
    INT 80h

section .data

padre: db "Soy el padre", 10
plenght: EQU $ - padre
hijo: db "Soy el hijo", 10
hlenght: EQU $ - hijo