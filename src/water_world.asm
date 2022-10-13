#include "commands.asm"

world_len = 16

;read world to mem
MOV 0, r0
read_loop:
    STR inp, r0
    ADD r0, 1, r0
    BL r0, world_len, read_loop

;r0-iter
;r1-wall_len
;r4-wall addr
;r2-volume
;r5-templ volume
;r3-new_wall
MOV 0, r0
loop:
    LDR r3, r0
    BL r3, r1, add_volume
    MOV r3, r1
    MOV r0, r4
    ADD r5, r2, r2
    MOV 0, r5
    GOTO loop_end
add_volume:
    SUB r1, r3, r3
    ADD r5, r3, r5
loop_end:
    ADD r0, 1, r0
    BL r0, world_len, loop
    BE r4, world_len, end
    MOV 0, r5
    ADD r4, 1, r0
    SUB r1, 1, r1
    GOTO loop
end:
    MOV r2, out
