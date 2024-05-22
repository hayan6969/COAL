.model small
.stack
.data
sum db ?
.code
main proc

labelname:
mov ah,1

int 21h
sub al, 48
mov dl,3
cmp al,dl



je labelname

mov ah,4ch
int 21h






main endp
end main

