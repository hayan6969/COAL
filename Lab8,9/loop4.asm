;Print the alphabets with loop in different order
;org 100h
.model small
.data
.code
main proc
    mov cx, 26        ; Number of times loop runs (number of alphabets)
    mov dx,65          ;start of 'A' in ascii table
    ;mov dx,97         ;start of 'a' in ascii table
    
    ;mov dx,90         ;end of 'Z' in ascii table
    ;mov dx,122        ;start of 'z' in ascii table

label1:
    mov ah, 02h       ; Function to display character
    int 21h           ; Display the character
    inc dx            ; Move to the next character
    ;dec dx            ;end of 'Z' in ascii table
    loop label1       ; Repeat until all alphabets are printed

    ; Terminate the program
    mov ah, 4Ch       ; Function to exit the program
    int 21h           ; Call DOS interrupt
main endp
end main


 
    


;ret
