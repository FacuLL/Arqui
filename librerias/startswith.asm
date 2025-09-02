section .text
GLOBAL startswith

startswith:
        PUSH EBP
        MOV EBP, ESP
        MOV EDX, [EBP+8]
        MOV EBX, [EBP+12]
loop:   MOV CL, [EDX]
        CMP CL, 0
        JNE sec
        MOV EAX, 1
        JMP end
sec:    MOV AL, [EBX]
        CMP AL, 0
        JNE compare
        MOV EAX, 0
        JMP end
compare:CMP AL, CL
        JE endloop
        MOV EAX, 0
        JMP end
endloop:INC EDX
        INC EBX
        JMP loop
end:    MOV ESP, EBP
        POP EBP
        RET