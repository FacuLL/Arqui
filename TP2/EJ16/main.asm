section .text
GLOBAL _start

_start:
    mov eax, 3
    mov ebx, 1
    mov ecx, str
    mov edx, lenght
    int 0x80

    MOV ecx, 0
    mov ebx, str
loop:
    CMP ecx, eax
    JE print
    mov dl, [ebx]
    cmp dl, 97
    JL continue
    cmp dl, 122
    JG continue
    sub dl, 32
    mov [ebx], dl
    JMP continue

continue:
    inc ecx
    inc ebx
    jmp loop

print:
    MOV ECX, str
    MOV EDX, EAX
    MOV EAX, 4
    MOV EBX, 1
    INT 80h

    MOV EAX, 1
    MOV EBX, 0
    INT 80h

section .data

str: times 50 db 0
lenght: EQU $ - str