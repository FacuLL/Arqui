section .text
GLOBAL _start
extern num2str

_start:
    MOV EBX, ESP
    MOV ECX, 0
loop:
    CMP EBX, 0
    JE print

    ADD ECX, 4
    SUB EBX, 4
    JMP loop

print:
    PUSH ECX
    PUSH str
    CALL num2str
    ADD ESP, 8

    MOV EDX, EAX
    MOV EAX, 4
    MOV ECX, str
    MOV EBX, 1
    INT 80h
exit:
    MOV EAX, 1
    MOV EBX, 0
    INT 80h

section .data
str: times 50 db 0