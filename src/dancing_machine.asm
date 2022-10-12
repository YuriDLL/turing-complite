#include "commands.asm"


SEED inp
loop:
    RND r1
    AND r1, 0x03, out
    GOTO loop