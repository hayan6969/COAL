.model small
.stack
.data
    prompt_msg        db "Please enter a number: $"
    divisible_msg     db " Divisible$"
    not_divisible_msg db " Not Divisible$"
.code
                    org 100h
    start:          
main proc
                    mov ax, @data
                    mov ds, ax

                    mov ah, 9
                    lea dx, prompt_msg
                    int 21h                      ; Display input prompt

                    mov ah, 01h                  ; Read a character from standard input
                    int 21h
                    sub al, '0'                  ; Convert ASCII character to numeric value

                    mov bl, 5                    ; Store the divisor (5) in BL

                    xor ah, ah                   ; Clear AH to prepare for division
                    mov dx, 0                    ; Clear DX (high word of dividend)

                    div bl                       ; Divide AX by BL (AX = Quotient, AH = Remainder)

                    cmp ah, 0                    ; Check if the remainder is zero
                    jz  divisible_label          ; If the remainder is zero, it's divisible

                    mov ah, 9                    ; Display "Not Divisible" message
                    lea dx, not_divisible_msg
                    int 21h
                    jmp exit_label

    divisible_label:
                    mov ah, 9                    ; Display "Divisible" message
                    lea dx, divisible_msg
                    int 21h

    exit_label:     
                    mov ah, 4Ch                  ; Terminate the program
                    int 21h

main endp
end start