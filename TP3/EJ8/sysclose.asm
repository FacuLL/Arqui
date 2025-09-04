section .text
GLOBAL sys_close

sys_close:
    push ebp
    mov ebp, esp

    push ebx
    push ecx
    push edx

    mov eax, 6
    mov ebx, [ebp+8]
    int 80h

    pop edx
    pop ecx
    pop ebx

    mov esp, ebp
    pop ebp
    ret