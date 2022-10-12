#subruledef source
{
    r{num: u8} => num
    out => 0x07
    inp => 0x07
}

#ruledef
{
    ADD  {des1: source}, {val: i8}, {rez: source} => 0x40 @ des1 @ val @ rez
    ADD  {des1: source}, {des2: source}, {rez: source} => 0x40 @ des1 @ des2 @ rez
    SUB  {des1: source}, {val: i8}, {rez: source} => 0x41 @ des1 @ val @ rez
    SUB  {des1: source}, {des2: source}, {rez: source} => 0x41 @ des1 @ des2 @ rez
    MOV {val: i8}, {des: source} => 0xC0 @ val @ 0x00 @ des
    MOV {des1: source}, {des2: source} => 0x00 @ des1 @ 0x00 @ des2
    LDR {des: source}, {mem_addr: i8} => 0x7E @ mem_addr @ 0x00 @ des
    LDR {des: source}, {des_addr: source} => 0x3E @ des_addr @ 0x00 @ des
    STR {des: source}, {mem_addr: i8} => 0x7F @ mem_addr @ des @ 0x00
    STR {des: source}, {des_addr: source} => 0x3F @ des_addr @ des @ 0x00
    BE {des1: source}, {des2: source}, {addr: i8} => 0x20 @ des1 @ des2 @ addr
    BNE {des1: source}, {des2: source}, {addr: i8} => 0x21 @ des1 @ des2 @ addr
    BL {des1: source}, {des2: source}, {addr: i8} => 0x22 @ des1 @ des2 @ addr
    BL {des1: source}, {val: i8}, {addr: i8} => 0x62 @ des1 @ val @ addr
    BG {des1: source}, {des2: source}, {addr: i8} => 0x25 @ des1 @ des2 @ addr
    BG {des1: source}, {val: i8}, {addr: i8} => 0x65 @ des1 @ val @ addr
}