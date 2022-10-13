#subruledef source
{
    r{num: u8} => num
    out => 0x07
    inp => 0x07
}

#ruledef
{
    ADD  {des1: source}, {val: i8}, {rez: source} => 0x40 @ des1 @ val @ rez
    ADD  {des1: source}, {des2: source}, {rez: source} => 0x00 @ des1 @ des2 @ rez
    SUB  {des1: source}, {val: i8}, {rez: source} => 0x41 @ des1 @ val @ rez
    SUB  {des1: source}, {des2: source}, {rez: source} => 0x01 @ des1 @ des2 @ rez
    AND  {des1: source}, {val: i8}, {rez: source} => 0x42 @ des1 @ val @ rez
    AND  {des1: source}, {des2: source}, {rez: source} => 0x02 @ des1 @ des2 @ rez
    XOR  {des1: source}, {val: i8}, {rez: source} => 0x45 @ des1 @ val @ rez
    XOR  {des1: source}, {des2: source}, {rez: source} => 0x05 @ des1 @ des2 @ rez
    
    MOV {val: i8}, {des: source} => 0xC0 @ val @ 0x00 @ des
    MOV {des1: source}, {des2: source} => 0x40 @ des1 @ 0x00 @ des2
    LDR {des: source}, {mem_addr: i8} => 0x7E @ mem_addr @ 0x00 @ des
    LDR {des: source}, {des_addr: source} => 0x3E @ des_addr @ 0x00 @ des
    STR {des: source}, {mem_addr: i8} => 0x7F @ mem_addr @ des @ 0x00
    STR {val: i8}, {mem_addr: i8} => 0xFF @ mem_addr @ val @ 0x00
    STR {des: source}, {des_addr: source} => 0x3F @ des_addr @ des @ 0x00
    GOTO {addr: i8} => 0xE0 @ 0x00 @ 0x00 @ addr
    BE {des1: source}, {des2: source}, {addr: i8} => 0x20 @ des1 @ des2 @ addr
    BE {des1: source}, {val: i8}, {addr: i8} => 0x60 @ des1 @ val @ addr
    BNE {des1: source}, {des2: source}, {addr: i8} => 0x21 @ des1 @ des2 @ addr
    BNE {des1: source}, {val: i8}, {addr: i8} => 0x61 @ des1 @ val @ addr
    BL {des1: source}, {des2: source}, {addr: i8} => 0x22 @ des1 @ des2 @ addr
    BL {des1: source}, {val: i8}, {addr: i8} => 0x62 @ des1 @ val @ addr
    BG {des1: source}, {des2: source}, {addr: i8} => 0x25 @ des1 @ des2 @ addr
    BG {des1: source}, {val: i8}, {addr: i8} => 0x65 @ des1 @ val @ addr
    SEED {des: source} => 0x08 @ des @ 0x00 @ 0x00
    RND {des: source} => 0x09 @ 0x00 @ 0x00 @ des
    NOP => 0x56 @ 0x00 @ 0x00 @ 0x00
    CALL {addr: i8} => 0x28 @ addr @ 0x00 @ 0x00
    RET => 0x29 @ 0x00 @ 0x00 @ 0x00
}