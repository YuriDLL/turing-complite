#include "commands.asm"

inp_len = 15

;load data
MOV 0, r0
load_loop:
    STR inp, r0
    ADD r0, 1, r0
    BL r0, inp_len, load_loop

;sort
MOV 0, r0
loop1:
    MOV 0, r1
    loop2:
        LDR r2, r1
        ADD r1, 1, r1
        LDR r3, r1
        BL r2, r3, loop2.end
        ;swap
        STR r2, r1
        SUB r1, 1, r4
        STR r3, r4
    .end:
        BL r1, inp_len - 1, loop2
    ADD r0, 1, r0
    BL r0, inp_len, loop1

;out data
MOV 0, r0
out_loop:
    LDR out, r0
    ADD r0, 1, r0
    BL r0, inp_len, out_loop
