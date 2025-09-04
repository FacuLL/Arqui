GLOBAL main
EXTERN printf

section .rodata
fmt db "Cantidad de argumentos: %d", 10, 0
fmt2 db "Argumento %s", 10, 0

section .text
main:
    push ebp ;Armado de stack frame
    mov ebp, esp ;

    mov ecx, [ebp+8]
    dec ecx

    push ecx
    push fmt
    call printf
    add esp, 2*4
    
    mov ecx, [ebp+8]
    dec ecx

    mov ebx, [ebp+12]
    add ebx, 4
loop:
    cmp ecx, 0
    je end
    push ebx
    push ecx
    push dword [ebx]
    push fmt2
    call printf
    add esp, 2*4
    pop ecx
    pop ebx

    dec ecx
    add ebx, 4
    jmp loop

end:
    mov eax, 0
    mov esp, ebp ;Desarmado de stack frame
    pop ebp ;
    ret