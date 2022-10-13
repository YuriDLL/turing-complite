#include "commands.asm"

toggle_magnet = 5

MOV inp, r0
MOV inp, r1
MOV inp, r2
MOV inp, r3

CALL move

move:
;r0 - disk-nr
;r1 - source
;r2 - dest
;r3 - spare
    BNE r0, 0x00, spare
    CALL move_to_dest
    RET
    spare:
    SUB r0, 1, r0
    ;swap r2 <-> r3
    MOV r2, r4
    MOV r3, r2
    MOV r4, r3
    CALL move
    ;swap r2 <-> r3
    MOV r2, r4
    MOV r3, r2
    MOV r4, r3
    CALL move_to_dest
    ;swap r1 <-> r3
    MOV r1, r4
    MOV r3, r1
    MOV r4, r3
    CALL move
    ;swap r1 <-> r3
    MOV r1, r4
    MOV r3, r1
    MOV r4, r3

    ADD r0, 1, r0
    RET

move_to_dest:
;r1 - source
;r2 - dest
    MOV r1, out
    MOV toggle_magnet, out
    MOV r2, out
    MOV toggle_magnet, out
    RET
