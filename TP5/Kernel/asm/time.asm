section .text
GLOBAL getFromTime

getFromTime:
    PUSH RBP
    MOV RBP, RSP

    xor rax, rax
    mov al, dil
    out 70h, al
    xor rax, rax
    in al, 71h
    movzx eax, al

    MOV RSP, RBP
    POP RBP
    RET