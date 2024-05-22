.Model small
.stack

;program to get input from user and display its factorial with loops

.data
msg db "Enter a number: $"
msg1 db "Factorial of the number is: $"
num db ?
fact db ?
.code
main proc
mov ah,2
lea dx,msg
int 21h
mov ah,1
int 21h
mov num,ah

mov cx,num
mov fact,1
l1: mov ax,fact
mul cx
mov fact,ax
loop l1

mov ah,2
lea dx,msg1
int 21h
mov dl,fact
add dl,30h
mov ah,2
int 21h



mov ah,4ch
int 21h
main endp
end main