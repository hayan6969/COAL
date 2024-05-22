.MODEL SMALL
.STACK 100h

.DATA

    message DB "HELLO, MY NAME IS HAYAN $"

.CODE

MAIN PROC

         MOV AH, 09h
         MOV DX, OFFSET message

         INT 21h

         MOV AH, 4Ch
         INT 21H
MAIN ENDP
END MAIN