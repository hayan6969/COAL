.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
Rval SDWORD ?
Xval SDWORD 26
Yval SDWORD 30
Zval SDWORD 40
.code
main PROC
; INC and DEC
mov bx,0A69Bh ; BX = 0A69Bh
 movzx eax,bx ; EAX = 0000A69Bh (BX zero-extended to EAX)
 movzx edx,bl ; BL = 9Bh, EDX = 0000009Bh (BL zero-extended to EDX)
 movzx cx,bl ; BL = 9Bh, CX = 009Bh (BL zero-extended to CX)


; Zero flag example:
;mov cx,1
;sub cx,1 ; ZF = 1
;mov ax,0FFFFh
;inc ax ; ZF = 1
; Sign flag example:
;mov cx,0
;sub cx,1 ; SF = 1
;mov ax,7FFFh
;add ax,2 ; SF = 1
; Carry flag example:
;mov al,0FFh
;add al,1 ; CF = 1, AL = 00
; Overflow flag example:
;mov al,+127
;add al,1 ; OF = 1
;mov al,-128
;sub al,1 ; OF = 1
INVOKE ExitProcess,0
main ENDP
END main
