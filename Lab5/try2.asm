.model small
.stack 100h

.data
    msg1 db 'Enter a First Number: $'
    msg2 db 'Enter a Second Number: $'
    msg3 db 'The Sum of Two Numbers is: $'
    msg4 db 'Enter a divisor: $'  
    msg5 db 'The result of the division is: $'
    num1 db ?
    num2 db ?
    sum  db ?
    divisor db ?  

.code
MAIN PROC
    mov AX, @data
    mov DS, AX

    ; --- Input Numbers ---
    call GetInput  ; Input first number
    call GetInput  ; Input second number

    ; --- Calculate Sum ---
    mov AL, num1
    add AL, num2
    mov sum, AL

    ; --- Display the Sum ---
    call DisplayResult  ; Display sum with label

    ; --- Input Divisor ---
    call GetInput 

    ; --- Perform Division ---
    mov AL, sum   
    mov BL, divisor  
    div BL         

    ; --- Display the Result of the Division--- 
    call DisplayResult  ; Display division result with label

    ; --- Exit Program ---
    mov AH, 4ch
    int 21h

; --- GetInput Procedure ---
GetInput PROC
    mov AH, 09h 
    lea DX, msg1  ; Use msg1 for the first time, msg2 for subsequent calls
    int 21h

    mov AH, 1
    int 21h
    sub al, 30h

    ;  Store input in the appropriate variable
    cmp dx, offset msg1  ; Was the first number entered?
    je storeFirstNumber  
    mov num2, AL         ; Otherwise, store as the second number
    jmp GetInputEnd

storeFirstNumber:
    mov num1, AL

GetInputEnd:
    ret 
GetInput ENDP

; --- DisplayResult Procedure ---
DisplayResult PROC
    mov AH, 09h
    lea DX, msg3  ; Use msg3 for sum, msg5 for division result
    int 21h

    mov AH, 2

    ;  Output value from appropriate variable
    cmp dx, offset msg3  ; Was the sum to be displayed?
    je displaySum  
    mov AL, sum         ; Otherwise, load the division result (quotient) 
    jmp displayValue

displaySum:
    mov AL, sum

displayValue:
    add AL, 30h 
    mov DL, AL
    int 21h

    mov AH, 2  ; Add newlines
    mov DL, 0Dh 
    int 21h
    mov DL, 0Ah
    int 21h

    ret
DisplayResult ENDP

main endp
end main 
