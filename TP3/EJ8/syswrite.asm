section .text
GLOBAL sys_write

sys_write:
    push ebp
    mov ebp, esp

    push ebx
    push ecx
    push edx

    mov eax, 4
    mov ebx, [ebp+8]
    mov ecx, [ebp+12]
    mov edx, [ebp+16]
    int 80h

    pop edx
    pop ecx
    pop ebx

    mov esp, ebp
    pop ebp
    ret