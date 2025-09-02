section .text
GLOBAL ordenar

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