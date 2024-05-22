.model small
.stack
.data
    prompt_msg db "Please enter a single digit: $"
    even_msg   db " Even$"
    odd_msg    db " Odd$"
.code
               org  100h
    start:     
main proc
               mov  ax, @data
               mov  ds, ax

               mov  ah, 9
               lea  dx, prompt_msg
               int  21h               ; Display input prompt

               mov  ah, 01h           ; Read a character from standard input
               int  21h
               sub  al, '0'           ; Convert ASCII character to numeric value

               cmp  al, 0             ; Compare with zero
               jbe  even_label        ; If less than or equal to zero, it's even

               test al, 1             ; Check if it's odd (bitwise AND with 1)
               jnz  odd_label         ; If the result is non-zero, it's odd

    even_label:
               mov  ah, 9             ; Display "Even" message
               lea  dx, even_msg
               int  21h
               jmp  exit_label

    odd_label: 
               mov  ah, 9             ; Display "Odd" message
               lea  dx, odd_msg
               int  21h

    exit_label:
               mov  ah, 4Ch           ; Terminate the program
               int  21h

main endp
end start