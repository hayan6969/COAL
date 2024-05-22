;Print the number wwith loop
.model small
.data
.code
main proc
    ;Extended Counter Register 
    mov cx,10 
    ;mov dx,57            ;for reverse 57
    mov dx,48         
    label1:
        mov ah,02h
        int 21h
        inc dx  
        ;dec dx          ;for reverse
    loop label1

    ; Terminate the program
    mov ah, 4Ch       ; Function to exit the program
    int 21h           ; Call DOS interrupt
main endp
end main