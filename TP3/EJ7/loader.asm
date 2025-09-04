section .text
GLOBAL _start
extern main

_start:
    push ebp
    mov ebp, esp

    mov eax, 4
    mov ebx, [ebp+4]
    mul ebx
    sub esp, eax
    and esp, -16

    mov ecx, [ebp+4]
    mov ebx, ebp
    sub ebx, eax
    mov edx, ebp
    add edx, 12

    push ebx

loop:
    cmp ecx, 0
    je end
    mov eax, [edx]
    mov [ebx], eax
    add ebx, 4
    add edx, 4
    dec ecx
    jmp loop

end:
    mov ecx, [ebp+4]
    push ecx
    call main
    add esp, 4*2

    mov esp, ebp
    pop ebp

    mov ebx, eax
    mov eax, 1
    int 80h