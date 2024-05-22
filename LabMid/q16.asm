;write a simple program in assembly that keeps on taking input from user until it gets a - input and then displays the sum of all previous inputs

.model small
.stack
.data
msg db 10,13,'Enter a number : $'
msg1 db 10,13,'Sum of all numbers entered is : $'
num db ?
sum db ?
.code
main proc
mov ax,@data
mov ds,ax
mov sum,0
mov ah,9
lea dx,msg
int 21h
mov ah,1
int 21h
mov num,al
cmp al,'-'
je l1
add sum,al
jmp main
l1:
mov ah,9
lea dx,msg1
int 21h
mov dl,sum
mov ah,2
int 21h
mov ah,4ch
int 21h
main endp
end main