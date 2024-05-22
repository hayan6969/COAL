.model small
.stack 100h
.data
    msg1 db 'Enter a First Number: $'
    msg2 db 'Enter a Second Number: $'
    msg3 db 'The Sum of Two Numbers is: $'
    num1 db ?
    num2 db ?
    sum  db ?

.code
MAIN PROC
         mov AX, @data
         mov DS, AX

         mov AH, 09h
         lea DX, msg1
         int 21h
         
         mov AH, 1
         int 21h
sub al, 30h
         mov num1, AL

         mov AH,2
         mov DL,0DH
         int 21h
         mov AH,2
         mov DL,0AH
         int 21h

         mov AH, 09h
         lea DX, msg2
         int 21h

         mov AH, 1
         int 21h
sub al, 30h
         mov num2, AL

         mov DL, num1
         add DL, num2
         mov sum, DL

         mov ah,2
         mov dl,0dh
            int 21h
            mov AH,2
            mov DL,0AH
            int 21h

        mov AH, 09h
        lea DX, msg3
        int 21h

        mov AH,2
        add sum,30h
        mov DL,sum
        int 21h





         mov AH,4ch
         int 21h
main endp
    end main