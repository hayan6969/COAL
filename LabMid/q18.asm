.model small
.stack
.data
msg db "Enter a Lower Case Letter : $"
msg1 db "Upper Case Letter is : $"
.code
main proc
mov ax,@data
mov ds,ax
mov ah,09h
lea dx,msg
int 21h
mov ah,01h
int 21h
sub al,32
mov ah,09h
lea dx,msg1
int 21h
mov dl,al
mov ah,02h
int 21h
mov ah,4ch
int 21h
main endp
end main
