section .text
GLOBAL sys_execve

sys_execve:
    push ebp
    mov ebp, esp

    push ebx
    push ecx
    push edx

    mov eax, 11
    mov ebx, [ebp+8]
    mov ecx, [ebp+12]
    int 80h

    pop edx
    pop ecx
    pop ebx

    mov esp, ebp
    pop ebp
    ret