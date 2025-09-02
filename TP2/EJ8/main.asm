extern num2str
section .text
GLOBAL _start

_start:
        PUSH array
        PUSH lenght
        CALL ordenar
        ADD ESP, 8

        MOV ECX, lenght
        MOV EBX, array
arrlp:  CMP ECX, 0
        JE exit
        PUSH ECX
        PUSH EBX
        
        MOV EAX, [EBX]
        PUSH EAX
        PUSH str
        CALL num2str
        ADD ESP, 8

        MOV EDX, EAX
        MOV EAX, 4
        MOV EBX, 1
        MOV ECX, str
        INT 80h

        MOV EDX, 1
        MOV EAX, 4
        MOV EBX, 1
        MOV ECX, space
        INT 80h

        POP EBX
        POP ECX
        DEC ECX
        ADD EBX, 4
        JMP arrlp
    
exit:   MOV EAX, 1
        MOV EBX, 0
        INT 80h

ordenar:
        PUSH EBP
        MOV EBP, ESP
        PUSH EBX
        PUSH ECX
        PUSH EDX

        MOV EBX, [EBP+12]
        MOV ECX, [EBP+8]

loop:   CMP ECX, 0
        JZ end
        MOV EDX, EBX
        MOV EBX, [EBX]
sub:    CMP ECX, 0
        JZ endlp
        MOV EAX, [EDX]
        CMP EAX, EBX
        JL swap
endsub: DEC ECX
        ADD EDX, 4
        JMP sub
swap:   MOV EBX, [EBP+12]
        PUSH EAX
        MOV EAX, [EBX]
        MOV [EDX], EAX
        POP EAX
        MOV [EBX], EAX
        MOV EBX, [EBX]
        JMP endsub

endlp:  MOV ECX, [EBP+8]
        DEC ECX
        MOV [EBP+8], ECX
        MOV EBX, [EBP+12]
        ADD EBX, 4
        MOV [EBP+12], EBX
        JMP loop
    
end:    POP EDX
        POP ECX
        POP EBX
        MOV ESP, EBP
        POP EBP
        RET


section .data

array: DD 10, 2, 3, 4, 5, 2, 1, 100, 89
lenght: EQU 9
str: times 50 db 0
space: DB 32