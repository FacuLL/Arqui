section .text
global _start
extern strlen

_start:
        MOV EBX, ESP

    clear:
        MOV EAX, [EBX]
        ADD EBX, 4
        CMP EAX, 0
        JNE clear

    search:
        MOV EAX, [EBX]
        CMP EAX, 0
        JE exit

        PUSH EAX
        PUSH query
        CALL startswith
        CMP EAX, 1
        JE value

        ADD EBX, 4
        JMP search

    value:
        MOV EBX, [EBX]

    valoop:
        XOR EAX, EAX
        MOV AL, [EBX]
        INC EBX
        CMP AL, 61
        JNE valoop
        
        PUSH EBX
        CALL strlen
        POP EBX

        MOV EDX, EAX
        MOV EAX, 4
        MOV ECX, EBX
        MOV EBX, 1
        INT 80h

        MOV EDX, 1
        MOV EAX, 4
        MOV ECX, salto
        MOV EBX, 1
        INT 80h

    exit:   
        MOV EAX, 1
        MOV EBX, 0
        INT 80h


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

section .data

query: db "USER=", 0
str: db "USER=ASD", 0
salto: db 10
