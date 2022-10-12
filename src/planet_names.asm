#include "commands.asm"

space = 0x20

loop:
    SUB inp, 0x20, out
    copy:
        MOV inp, r0
        MOV r0, out
        BE r0, space, loop
        GOTO copy