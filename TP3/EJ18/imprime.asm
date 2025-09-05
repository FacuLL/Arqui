section .text
GLOBAL imprime_pantalla

imprime_pantalla:
    push ebp
    mov ebp, esp

    mov eax, [ebp+12]
    cmp eax, 80
    jle print_enc
    mov eax, 1
    jmp end
print_enc:
    push dword [ebp+8]
    push eax
    call write
    add esp, 4*2

    mov ecx, 6
    mov ebx, 0A0000000h

loop:
    cmp ecx, 0
    je pie

    push ebx
    push 80
    call write
    add esp, 4*2

    dec ecx
    add ebx, 80
    jmp loop

pie:
    mov eax, [ebp+20]
    cmp eax, 80
    jle print_pie
    mov eax, 1
    jmp end
print_pie:
    push dword [ebp+16]
    push eax
    call write
    add esp, 4*2

end:
    mov esp, ebp
    pop ebp
    ret



write:
    push ebp
    mov ebp, esp

    push ebx
    push ecx
    push edx

    mov eax, 4
    mov ebx, 1
    mov ecx, [ebp+12]
    mov edx, [ebp+8]
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, salto
    mov edx, 1
    int 80h

    pop edx
    pop ecx
    pop ebx

    mov esp, ebp
    pop ebp
    ret

section .data
salto: db 10