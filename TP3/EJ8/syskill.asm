section .text
GLOBAL sys_kill

sys_kill:
    push ebp
    mov ebp, esp

    push ebx
    push ecx
    push edx

    mov eax, 37
    mov ebx, [ebp+8]
    mov ecx, [ebp+12]
    int 80h

    pop edx
    pop ecx
    pop ebx

    mov esp, ebp
    pop ebp
    ret