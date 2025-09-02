extern num2str

section .text
GLOBAL _start

_start:
        PUSH numero
        CALL fact
        ADD ESP, 4
        PUSH EAX
        PUSH str
        CALL num2str
        ADD ESP, 8

        MOV EDX, EAX
        MOV EAX, 4
        MOV EBX, 1
        MOV ECX, str
        INT 80h

        MOV EAX, 1
        MOV EBX, 0
        INT 80h

fact: 	
        PUSH EBP
        MOV EBP, ESP
        PUSH EBX
        PUSH ECX
        MOV EBX, [EBP + 8]
        MOV EAX, 1

loop:
        CMP EBX, 1
        JLE end
        MUL EBX
        DEC EBX
        JMP loop

end:    POP ECX
        POP EBX
        MOV ESP, EBP
        POP EBP
        RET


section .data
str: times 50 db 0
lenght: EQU $-str
numero: EQU 8