.model small
.stack 100h

.data
    count1 dw 5 ; outer loop counter  row
    count2 dw 5  ; inner loop counter  column
    
.code
main proc
    mov ax, @data       ; Initialize data segment
    mov ds, ax
    
    mov cx, count1      ; Load outer loop counter into CX
    
outer_loop:
    mov bx, count2      ; Load inner loop counter into BX
    
inner_loop:
    ; Print a character '*' on the screen
    mov ah, 02h         ; Function to display a character
    mov dl, '*'         ; Character to display
    int 21h             ; Call interrupt 21h to display the character
    
    dec bx              ; Decrement inner loop counter
    jnz inner_loop      ; Jump back to inner loop if BX is not zero
    
    mov ah, 02h         ; Function to display a new line
    mov dl, 0Dh         ; Carriage return
    int 21h             ; Call interrupt 21h to display the character
    
    mov dl, 0Ah         ; Line feed
    int 21h             ; Call interrupt 21h to display the character
    
    dec cx              ; Decrement outer loop counter
    jnz outer_loop      ; Jump back to outer loop if CX is not zero
    
    mov ah, 4Ch         ; Terminate program
    int 21h             ; Call interrupt 21h to terminate the program

main endp
end main


;ret


