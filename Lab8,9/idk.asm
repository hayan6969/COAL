; Get the number from the user
mov eax, 4     ; sys_read system call for standard input
mov ebx, 1     ; file descriptor for standard input (stdin)
mov ecx, message ; address of the message to display
mov edx, message_len ; length of the message
int 0x80       ; interrupt for system calls

mov eax, 3     ; sys_read system call for standard input
mov ebx, 0     ; file descriptor for standard input (stdin)
mov ecx, buffer ; address of the input buffer
mov edx, buffer_len ; length of the input buffer
int 0x80       ; interrupt for system calls

; Convert the ASCII input to a number
sub al, '0'    ; convert ASCII digit to numerical value

; Initialize loop and variables
mov ebx, eax    ; copy the number to the loop counter
mov eax, 1     ; initialize the factorial result to 1

; Loop to calculate factorial
loop factorial:
  dec ebx        ; decrement the loop counter
  jz done         ; jump to done if counter reaches zero
  mul eax        ; multiply the factorial result by the counter
  jmp loop       ; jump back to the beginning of the loop

done:
; Print the result (replace with your preferred output method)
mov eax, 4     ; sys_write system call for standard output
mov ebx, 1     ; file descriptor for standard output (stdout)
mov ecx, result_message ; address of the result message
mov edx, result_message_len ; length of the result message
int 0x80       ; interrupt for system calls

mov eax, 4     ; sys_write system call for standard output
mov ebx, 1     ; file descriptor for standard output (stdout)
mov ecx, buffer ; address of the input buffer where the result is stored
mov edx, eax    ; use EAX register to store the length of the result (converted to string later)
int 0x80       ; interrupt for system calls

; Exit the program
mov eax, 1     ; sys_exit system call
mov ebx, 0     ; exit status (0 for success)
int 0x80       ; interrupt for system calls

; Data segment
message db "Enter a number: ", 10, 0 ; message to display before input
buffer db 20 dup(0)                 ; buffer to store user input (up to 20 characters)
result_message db "The factorial is: ", 10, 0  ; message to display before result

message_len equ $ - message      ; length of the message
buffer_len equ $ - buffer        ; length of the input buffer
result_message_len equ $ - result_message ; length of the result message
