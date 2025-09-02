section .text
global fact

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