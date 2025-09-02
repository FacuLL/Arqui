section .text
GLOBAL _start
extern num2str

_start:
    MOV EAX, 20
    INT 80h

    PUSH EAX
    PUSH str
    CALL num2str
    ADD ESP, 8

    MOV EDX, EAX
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, str
    INT 80h

    MOV EAX, 1
    MOV EBX, 0
    INT 80h

section .data

str: times 20 db 0