section .text
GLOBAL tryReadKeyBoard

tryReadKeyBoard:

    PUSH RBP
    MOV RBP, RSP

    xor rax, rax
    in al, 64h
    and al, 0x01
    cmp al, 0x01
    jne nodata
    xor rax, rax
    in al, 60h
    mov [rdi], al
    mov rax, 1
    jmp end
nodata:
    mov rax, 0
end:
    MOV RSP, RBP
    POP RBP
    RET