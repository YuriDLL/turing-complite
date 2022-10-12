#include "commands.asm"

turn_left = 0x00
forward = 0x01
turn_rigth = 0x02
sleep = 0x03
use = 0x04
shoot = 0x05

coveyor = 0x5C
;r0 - array iter
;r1 - array len

;go on position
MOV turn_left, out
MOV forward, out
MOV turn_left, out
MOV forward, out
MOV forward, out
MOV forward, out
MOV forward, out
MOV turn_left, out
MOV forward, out
MOV turn_rigth, out
MOV forward, out

MOV 0, r1
loop:
    MOV sleep, out
    MOV inp, r2
    BE r2, coveyor, loop
    ;ceck that it is first fruit
    MOV 0, r0 ; iter
    check_loop:
        BE r0, r1, is_first
        LDR r3, r0
        ADD r0, 0x01, r0
        BNE r2, r3, check_loop
    ;not first
    MOV turn_rigth, out
    MOV use, out
    MOV turn_left, out
    GOTO loop
    is_first:
        ;insert r2 to array
        STR r2, r1
        ADD r1, 0x01, r1
        GOTO loop
