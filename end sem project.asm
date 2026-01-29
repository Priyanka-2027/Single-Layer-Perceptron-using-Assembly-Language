.MODEL SMALL
.STACK 100h

.DATA
MSG_X1      DB 0Dh,0Ah, 'Enter x1 (0-9): $'
MSG_X2      DB 0Dh,0Ah, 'Enter x2 (0-9): $'
MSG_X3      DB 0Dh,0Ah, 'Enter x3 (0-9): $'
MSG_W1      DB 0Dh,0Ah, 'Enter W1 (0-9): $'
MSG_W2      DB 0Dh,0Ah, 'Enter W2 (0-9): $'
MSG_W3      DB 0Dh,0Ah, 'Enter W3 (0-9): $'
MSG_B_SIGN  DB 0Dh,0Ah, 'Enter Bias sign (+ or -): $'
MSG_B_VAL   DB 0Dh,0Ah, 'Enter Bias value (0-9): $'
MSG_OUT     DB 0Dh,0Ah, 'Output y = $'

X   DW 3 DUP(?)
W   DW 3 DUP(?)
B   DW ?
Y   DW ?

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA DX, MSG_X1
    MOV AH, 09h
    INT 21h
    CALL READ_DIGIT
    MOV X, AX

    LEA DX, MSG_X2
    MOV AH, 09h
    INT 21h
    CALL READ_DIGIT
    MOV X+2, AX

    LEA DX, MSG_X3
    MOV AH, 09h
    INT 21h
    CALL READ_DIGIT
    MOV X+4, AX

    LEA DX, MSG_W1
    MOV AH, 09h
    INT 21h
    CALL READ_DIGIT
    MOV W, AX

    LEA DX, MSG_W2
    MOV AH, 09h
    INT 21h
    CALL READ_DIGIT
    MOV W+2, AX

    LEA DX, MSG_W3
    MOV AH, 09h
    INT 21h
    CALL READ_DIGIT
    MOV W+4, AX

    LEA DX, MSG_B_SIGN
    MOV AH, 09h
    INT 21h
    CALL READ_SIGN
    MOV BL, AL

    LEA DX, MSG_B_VAL
    MOV AH, 09h
    INT 21h
    CALL READ_DIGIT

    CMP BL, '-'
    JNE BIAS_STORE
    NEG AX

BIAS_STORE:
    MOV B, AX

    CALL COMPUTE_OUTPUT

    LEA DX, MSG_OUT
    MOV AH, 09h
    INT 21h

    MOV AX, Y
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 02h
    INT 21h

    MOV AH, 4Ch
    INT 21h
MAIN ENDP

COMPUTE_OUTPUT PROC
    MOV AX, [W]
    MOV BX, [X]
    MUL BX
    MOV SI, AX

    MOV AX, [W+2]
    MOV BX, [X+2]
    MUL BX
    ADD SI, AX

    MOV AX, [W+4]
    MOV BX, [X+4]
    MUL BX
    ADD SI, AX

    MOV AX, B
    ADD SI, AX

    CMP SI, 0
    JL SET_Y_ZERO
    MOV Y, 1
    RET

SET_Y_ZERO:
    MOV Y, 0
    RET
COMPUTE_OUTPUT ENDP

READ_DIGIT PROC
RD_LOOP:
    MOV AH, 01h
    INT 21h
    CMP AL, 0Dh
    JE RD_LOOP
    SUB AL, '0'
    XOR AH, AH
    RET
READ_DIGIT ENDP

READ_SIGN PROC
RS_LOOP:
    MOV AH, 01h
    INT 21h
    CMP AL, '+'
    JE RS_DONE
    CMP AL, '-'
    JE RS_DONE
    CMP AL, 0Dh
    JE RS_LOOP
    JMP RS_LOOP
RS_DONE:
    RET
READ_SIGN ENDP

END MAIN
