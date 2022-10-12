#include "commands.asm"

right = 0
down = 1
left = 2
up = 3

STR up, 0x00
STR right, 0x01
STR down, 0x02
STR right, 0x03
STR right, 0x04
STR up, 0x05
STR left, 0x06
STR up, 0x07
STR up, 0x08
STR right, 0x09
STR up, 0x0a
STR left, 0x0b
STR left, 0x0c
STR down, 0x0d
STR left, 0x0e
STR up, 0x0f

CALL play_data
MOV up, out

MOV 0x03, r3
CALL xor_data

CALL play_data
MOV right, out
CALL play_data
MOV down, out

MOV 0x01, r3
CALL xor_data

CALL play_data

MOV down, out

play_data:
    MOV 0, r0
    .loop:
        LDR out, r0
        ADD r0, 0x01, r0
        BL r0, 0x10, play_data.loop
    RET

xor_data:
    MOV 0, r0
    .loop:
        LDR r1, r0
        XOR r1, r3, r1
        STR r1, r0
        ADD r0, 0x01, r0
        BL r0, 0x10, xor_data.loop
    RET
