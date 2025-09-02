section .text
GLOBAL _start

_start:
    MOV ECX, [ESP]
    DEC ECX
    MOV EBX, ESP
    ADD EBX, 8

loop:
    CMP ECX, 0
    JE exit

    MOV EAX, [EBX]
    PUSH EAX
    CALL strlen
    ADD ESP, 4

    PUSH EBX
    PUSH ECX

    MOV EDX, EAX
    MOV EAX, 4
    MOV ECX, [EBX]
    MOV EBX, 1
    INT 80h

    MOV EDX, 1
    MOV EAX, 4
    MOV ECX, salto
    MOV EBX, 1
    INT 80h

    POP ECX
    POP EBX

    ADD EBX, 4
    DEC ECX
    JMP loop

exit:
    MOV EAX, 1
    MOV EBX, 0
    INT 80h

strlen:
    PUSH EBP
    MOV EBP, ESP
    PUSH EBX
    PUSH ECX
    PUSH EDX

    MOV EBX, [EBP+8]
    MOV EAX, 0
    XOR EDX, EDX
lp: MOV DL, [EBX]
    CMP DL, 0
    JE end
    INC EAX
    INC EBX
    JMP lp

end:POP EDX
    POP ECX
    POP EBX
    MOV ESP, EBP
    POP EBP
    RET

section .data

salto: db 10