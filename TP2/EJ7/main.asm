extern num2str
section .text
GLOBAL _start

_start:
    PUSH array
    PUSH lenght
    CALL menor
    ADD ESP, 8
    
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

menor:
        PUSH EBP
        MOV EBP, ESP
        PUSH EBX
        PUSH ECX
        PUSH EDX
        MOV ECX, [EBP+8]
        CMP ECX, 0
        JE end
        MOV EBX, [EBP+12]
        MOV EAX, [EBX]
loop:   DEC ECX
        ADD EBX, 4
        CMP ECX, 0
        JZ end
        MOV EDX, [EBX]
        CMP EDX, EAX
        JGE loop
        MOV EAX, EDX
        JMP loop
    
end:    POP EDX
        POP ECX
        POP EBX
        MOV ESP, EBP
        POP EBP
        RET


section .data

array: DD 10, 2, 3, 4, 5
lenght: EQU 5
str: times 50 db 0