.model small
.stack 100h
.data
.code
main proc
    mov ax, @data      ; Load the address of the data segment into AX
    mov ds, ax         ; Set the data segment register (DS) to the value stored in AX

    mov bx, 01H          ; Initialize BX to 01h (start of the pattern)
    mov cx, 5          ; Initialize CX to 5 (number of rows for the triangle)

L1:
    push cx            ; Push the value of CX onto the stack to preserve it
    mov cx, bx         ; reverse
    ;mov bx, cx         ; Set the inner loop counter (CX) to the current row number (BX)
    L2:
        mov dl, '*'    ; Move the character '*' into DL (the character to be printed)
        mov ah, 02h    ; Set AH to 02h (function to display a character)
        int 21h        ; Call interrupt 21h to display the character

    loop L2            ; Continue inner loop until CX becomes zero (end of row)

    mov dl, 0AH         ; Move ASCII value 0ah (line feed) into DL (move to the next line)
    mov ah, 02h        ; Set AH to 02h (function to display a character)
    int 21h            ; Call interrupt 21h to display the character
    
    inc bx             ; Increment Bx to move to the next row
    pop cx             ; Restore the value of CX from the stack
    loop L1            ; Continue outer loop until CX becomes zero (end of triangle pattern)

    mov ah, 4ch        ; Set AH to 4Ch (function to terminate the program)
    int 21h            ; Call interrupt 21h to terminate the program
    

main endp
end main