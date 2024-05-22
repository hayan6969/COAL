.model SMALL
.STACK
; Data segment (optional, if variables need to be stored in memory)
.data
  a db 5
  b db 2
; Code segment
.code
  main PROC      ; Start of the program

  ; Load the values of a and b into registers
  MOV AL, [a]     ; Move the value of `a` to register AL
  MOV BL, [b]     ; Move the value of `b` to register BL

  ; Add the values in AL and BL and store the result in AL
  ADD AL, BL     ; Add the content of BL to AL (AL = AL + BL)

  ; (Optional: If sum needs to be stored in memory)
  ; MOV [sum], AL  ; Move the value in AL (sum) to the memory location of `sum`

  ; Exit the program
  MOV AH, 4CH     ; Set the AH register to 4Ch (exit code for no error)
  INT 21h         ; Interrupt 21h to terminate the program

main ENDP        ; End of the program