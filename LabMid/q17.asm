.model small
.stack
.data
num db ?             ; Variable to store the input number
sum db ?             ; Variable to store the sum of positive numbers
msg db 13, 10, "Enter a number (negative to exit): $"
msg_sum db 13, 10, "Sum of positive numbers: $"
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Initialize sum to 0
    mov sum, 0

input_loop:
   
    mov ah, 09h
    lea dx, msg
    int 21h

   
    mov ah, 01h
    int 21h

    
    sub al, 30h

    
    cmp al, 0
    jge positive_number   
    jmp end_input_loop    

positive_number:
    add sum, al

    jmp input_loop

end_input_loop:
    mov ah, 09h
    
    lea dx, msg_sum
    int 21h

    mov al, sum
    add al, 30h
    mov ah, 02h
    int 21h

    mov ah, 4ch
    int 21h
main endp
end main