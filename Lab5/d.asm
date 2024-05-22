.model small
.stack
.data
    prompt_msg db "Please enter your grade (A, B, C, D, or F): $"
    pass_msg db " Pass$"
    fail_msg db " Fail$"
.code
org 100h
start:
    main proc
        mov ax, @data
        mov ds, ax   

        ; Display prompt message
        mov ah, 9
        lea dx, prompt_msg
        int 21h

        ; Read grade from standard input
        mov ah, 01h
        int 21h
        mov bl, al  ; Store the grade character

        ; Check if the grade is A, B, or C
        cmp bl, 'A'
        je pass_label
        cmp bl, 'B'
        je pass_label
        cmp bl, 'C'
        je pass_label

        ; If the grade is not A, B, or C, it's a fail
        mov ah, 9
        lea dx, fail_msg
        int 21h
        jmp exit_label

    pass_label:
        ; If the grade is A, B, or C, it's a pass
        mov ah, 9
        lea dx, pass_msg
        int 21h

    exit_label:
        ; Exit the program
        mov ah, 4Ch
        int 21h

    main endp
end start