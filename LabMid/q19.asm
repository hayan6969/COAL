.model small
.stack
.data
num1 db 1
num2 db 2
num3 db 5
min db ?
.code
main proc
mov ax,@data
mov ds,ax

mov al,num1
mov bl,num2
cmp al,bl
jge l1
mov al,num3
l1:mov min,al
mov ah,2
mov dl,min
add dl,30h
int 21h
mov ah,4ch
int 21h
main endp
end main