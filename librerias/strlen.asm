section .text
GLOBAL strlen

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