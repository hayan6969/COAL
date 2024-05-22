; Display the sentence on the screen
.model small             ; Specifies the memory model for the program.

; The stack segment is used for storing local variables, return addresses
; and other temporary data during program execution.
.stack 100h              ; Specifies the storage for stack (allocate 100h (256 bytes))

; Define the data segment where the message string is stored.
.data
    ; denote the end of a strings.
    message db 'Hello, I am displaying a statement in Assembly!', '$'

    ; Indicates the start of the code segment.
.code

main PROC
    ; DS: Data Segment register, holds the segment address of the data segment (part).
    ; AX: Accumulator register, used in arithmetic and data movement operations.
    
         mov ax, @data    ; Refers to the starting address of the data segment.
         mov ds, ax       ; Move the AX value to DS.

    ; Display the message
         mov ah, 09h      ; 09h = Displays a character string to the standard output device.
    
    ; LEA doesn't actually load the content at the memory address into the register.
    ; Instead, it loads the memory address itself.
lea dx, message               ; Load the offset address of the message string into DX.
    
    ; Interrupt Display Output
         int 21h          ; Triggers the DOS interrupt 21h to display the character stored in DL
   
    ; Terminate with Output Code
         mov ah, 4ch      ; Sets AH to 4Ch, indicating a DOS function to terminate the program.
         int 21h          ; Triggers the DOS interrupt 21h to terminate the program.
main ENDP

END main
