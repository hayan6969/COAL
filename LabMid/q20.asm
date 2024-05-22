.model small
.stack 100h

.data
    msg_input   db  'Enter a number: $'
    msg_divisible db 'Divisible$'
    msg_not_divisible db 'Not Divisible$'

.code
main:
    mov ax, @data
    mov ds, ax

    ; Display message asking for input
    mov ah, 09h
    lea dx, msg_input
    int 21h

    ; Read input from user
    mov ah, 01h
    int 21h
    sub al, 30h  ; convert ASCII digit to numeric digit

    ; Check divisibility by 5
    mov bl, 5
    mov ah, 0
    div bl          ; AL / BL -> Quotient in AL, Remainder in AH

    ; Check if remainder is 0 (divisible by 5)
    cmp ah, 0
    jne not_divisible

    ; Display "Divisible" message
    mov ah, 09h
    lea dx, msg_divisible
    int 21h
    jmp exit_program

not_divisible:
    ; Display "Not Divisible" message
    mov ah, 09h
    lea dx, msg_not_divisible
    int 21h

exit_program:
    ; Exit program
    mov ah, 4Ch
int 21h

END MAIN