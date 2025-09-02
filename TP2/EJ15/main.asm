section .text
GLOBAL _start

_start:
    mov eax, 162
    mov ebx, timeval
    mov ecx, timeval
    int 0x80
print:
   MOV ECX, str
    MOV EDX, lenght
    MOV EAX, 4
    MOV EBX, 1
    INT 80h

    MOV EAX, 1
    MOV EBX, 0
    INT 80h

section .data

timeval:
        tv_sec  dd 3    ; Desired seconds to sleep
        tv_nsec dd 0    ; Desired nanoseconds to sleep

str: dw "Terminado", 10
lenght: EQU $ - str