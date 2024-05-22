.model small
.stack
.data
    prompt_msg1 db "Please enter the first number: $"
    prompt_msg2 db 0Ah, "Please enter the second number: $"
    result_msg db 0Ah, " The larger number is: $"
.code
org 100h
start:
    main proc
        mov ax, @data
        mov ds, ax   

        ; Display prompt message for the first number
        mov dx, 10
        mov ah, 9
        lea dx, prompt_msg1
        int 21h

        ; Read the first number
        call input_number

        ; Save the first number
        mov bx, ax

        ; Display prompt message for the second number
        mov dx, 10
        mov ah, 9
        lea dx, prompt_msg2
        
        int 21h

        ; Read the second number
        call input_number

        ; Compare the two numbers
        cmp ax, bx
        jg first_greater   ; Jump if the second number is greater
        mov ax, bx         ; Otherwise, keep the first number as the larger one

    first_greater:
        ; Display the larger number

        mov ah, 9
        lea dx, result_msg
        int 21h

        ; Display the result value
        call display_number

        ; Exit the program
        mov ah, 4Ch
        int 21h

    main endp

input_number proc
    mov ah, 01h    ; Function to read character from standard input
    int 21h        ; Call interrupt
    sub al, '0'    ; Convert ASCII character to numeric value
    mov ah, 0      ; Clear AH register
    ret
input_number endp

display_number proc
    add ax, '0'    ; Convert number to ASCII character
    mov dl, al     ; Move the ASCII character to DL
    mov ah, 02h    ; Function to display character
    int 21h        ; Call interrupt
    ret
display_number endp

end start