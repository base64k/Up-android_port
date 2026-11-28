/**************************************************************************
 * func_002DEC40
 *
 * address      : 0x002dec40 .. 0x002def10  (720 bytes, 180 instructions)
 * discovered by: called
 * called from  : 0x0032f588
 * string hint  : "ParticlesDMAManager"
 */
glabel func_002DEC40
  002dec40  addiu      $sp, $sp, -0x20
  002dec44  lui        $a1, 0x73
  002dec48  lui        $a2, 0x73
  002dec4c  sd         $ra, 0x10($sp)
  002dec50  addiu      $a0, $zero, 0x24
  002dec54  addiu      $a1, $a1, -0x6658                       # 0x007299a8 "Anonymous New"
  002dec58  addiu      $a2, $a2, -0x6648                       # 0x007299b8 "PS2Main_Z.cpp"
  002dec5c  addiu      $a3, $zero, 0x1fe
  002dec60  jal        func_002DCB00
  002dec64  sq         $s0, 0x0($sp)                           # delay slot
  002dec68  beq        $v0, $zero, .L000
  002dec6c  lui        $at, 0x79                               # delay slot
  002dec70  sw         $zero, 0x0($v0)
  002dec74  sh         $zero, 0x4($v0)
  002dec78  sw         $zero, 0x8($v0)
  002dec7c  sw         $zero, 0xc($v0)
  002dec80  sh         $zero, 0x10($v0)
  002dec84  sw         $zero, 0x14($v0)
  002dec88  sw         $zero, 0x18($v0)
  002dec8c  sh         $zero, 0x1c($v0)
  002dec90  sw         $zero, 0x20($v0)
.L000:
  002dec94  lui        $a1, 0x73
  002dec98  lui        $a2, 0x73
  002dec9c  sw         $v0, 0x5fc0($at)
  002deca0  addiu      $a0, $zero, 0xc
  002deca4  addiu      $a1, $a1, -0x6658                       # 0x007299a8 "Anonymous New"
  002deca8  addiu      $a2, $a2, -0x6648                       # 0x007299b8 "PS2Main_Z.cpp"
  002decac  jal        func_002DCB00
  002decb0  addiu      $a3, $zero, 0x1ff                       # delay slot
  002decb4  beq        $v0, $zero, .L001
  002decb8  lui        $at, 0x79                               # delay slot
  002decbc  sw         $zero, 0x0($v0)
  002decc0  sh         $zero, 0x4($v0)
  002decc4  sw         $zero, 0x8($v0)
.L001:
  002decc8  lui        $a1, 0x73
  002deccc  lui        $a2, 0x73
  002decd0  sw         $v0, 0x5fc8($at)
  002decd4  addiu      $a0, $zero, 0x63c0
  002decd8  addiu      $a1, $a1, -0x6658                       # 0x007299a8 "Anonymous New"
  002decdc  addiu      $a2, $a2, -0x6648                       # 0x007299b8 "PS2Main_Z.cpp"
  002dece0  jal        func_002DCB00
  002dece4  addiu      $a3, $zero, 0x201                       # delay slot
  002dece8  beq        $v0, $zero, .L002
  002decec  nop                                                # delay slot
  002decf0  jal        func_002F2790
  002decf4  daddu      $a0, $v0, $zero                         # delay slot
.L002:
  002decf8  lui        $at, 0x79
  002decfc  sw         $v0, 0x5f6c($at)
  002ded00  lb         $v0, -0x74bc($gp)
  002ded04  bne        $v0, $zero, .L003
  002ded08  lui        $a0, 0x79                               # delay slot
  002ded0c  addiu      $v0, $zero, 0x1
  002ded10  sb         $v0, -0x74bc($gp)
.L003:
  002ded14  jal        func_004258E0
  002ded18  addiu      $a0, $a0, 0x5c50                        # delay slot
  002ded1c  lui        $at, 0x79
  002ded20  lhu        $a1, 0x7230($at)
  002ded24  lui        $at, 0x79
  002ded28  jal        func_002F2D70
  002ded2c  lw         $a0, 0x5f6c($at)                        # delay slot
  002ded30  jal        func_0044CDC0
  002ded34  nop                                                # delay slot
  002ded38  lui        $a1, 0x73
  002ded3c  lui        $a2, 0x73
  002ded40  addiu      $a0, $zero, 0x2e4
  002ded44  addiu      $a1, $a1, -0x6658                       # 0x007299a8 "Anonymous New"
  002ded48  addiu      $a2, $a2, -0x6648                       # 0x007299b8 "PS2Main_Z.cpp"
  002ded4c  jal        func_002DCB00
  002ded50  addiu      $a3, $zero, 0x20f                       # delay slot
  002ded54  beq        $v0, $zero, .L004
  002ded58  nop                                                # delay slot
  002ded5c  jal        func_002F9FC0
  002ded60  daddu      $a0, $v0, $zero                         # delay slot
.L004:
  002ded64  lui        $at, 0x79
  002ded68  sw         $v0, 0x5fa8($at)
  002ded6c  lui        $at, 0x79
  002ded70  lw         $a0, 0x5fa8($at)
  002ded74  lw         $t9, 0x1a8($a0)
  002ded78  lw         $t9, 0xc($t9)
  002ded7c  jalr       $t9
  002ded80  nop                                                # delay slot
  002ded84  lui        $a1, 0x73
  002ded88  lui        $a2, 0x73
  002ded8c  addiu      $a0, $zero, 0x1500
  002ded90  addiu      $a1, $a1, -0x6658                       # 0x007299a8 "Anonymous New"
  002ded94  addiu      $a2, $a2, -0x6648                       # 0x007299b8 "PS2Main_Z.cpp"
  002ded98  jal        func_002DCB00
  002ded9c  addiu      $a3, $zero, 0x211                       # delay slot
  002deda0  beq        $v0, $zero, .L005
  002deda4  nop                                                # delay slot
  002deda8  jal        func_002F89C0
  002dedac  daddu      $a0, $v0, $zero                         # delay slot
.L005:
  002dedb0  lui        $at, 0x79
  002dedb4  sw         $v0, 0x5fac($at)
  002dedb8  lui        $at, 0x79
  002dedbc  lw         $a0, 0x5fac($at)
  002dedc0  lw         $t9, 0x30($a0)
  002dedc4  lw         $t9, 0x18($t9)
  002dedc8  jalr       $t9
  002dedcc  nop                                                # delay slot
  002dedd0  lui        $a1, 0x73
  002dedd4  lui        $a2, 0x73
  002dedd8  addiu      $a0, $zero, 0xf0
  002deddc  addiu      $a1, $a1, -0x6658                       # 0x007299a8 "Anonymous New"
  002dede0  addiu      $a2, $a2, -0x6648                       # 0x007299b8 "PS2Main_Z.cpp"
  002dede4  jal        func_002DCB00
  002dede8  addiu      $a3, $zero, 0x213                       # delay slot
  002dedec  beq        $v0, $zero, .L006
  002dedf0  nop                                                # delay slot
  002dedf4  jal        func_003018B0
  002dedf8  daddu      $a0, $v0, $zero                         # delay slot
.L006:
  002dedfc  lui        $at, 0x79
  002dee00  sw         $v0, 0x5fb0($at)
  002dee04  lui        $at, 0x79
  002dee08  lw         $a0, 0x5fb0($at)
  002dee0c  lw         $t9, 0x40($a0)
  002dee10  lw         $t9, 0xc($t9)
  002dee14  jalr       $t9
  002dee18  nop                                                # delay slot
  002dee1c  lui        $a1, 0x73
  002dee20  lui        $a2, 0x73
  002dee24  addiu      $a0, $zero, 0xa00
  002dee28  addiu      $a1, $a1, -0x6658                       # 0x007299a8 "Anonymous New"
  002dee2c  addiu      $a2, $a2, -0x6648                       # 0x007299b8 "PS2Main_Z.cpp"
  002dee30  jal        func_002DCB00
  002dee34  addiu      $a3, $zero, 0x215                       # delay slot
  002dee38  beq        $v0, $zero, .L007
  002dee3c  nop                                                # delay slot
  002dee40  jal        func_002FDC60
  002dee44  daddu      $a0, $v0, $zero                         # delay slot
.L007:
  002dee48  lui        $at, 0x79
  002dee4c  sw         $v0, 0x5fb8($at)
  002dee50  lui        $at, 0x79
  002dee54  lw         $a0, 0x5fb8($at)
  002dee58  lw         $t9, 0x8($a0)
  002dee5c  lw         $t9, 0x18($t9)
  002dee60  jalr       $t9
  002dee64  nop                                                # delay slot
  002dee68  lui        $a1, 0x73
  002dee6c  lui        $a2, 0x73
  002dee70  addiu      $a0, $zero, 0x2c
  002dee74  addiu      $a1, $a1, -0x6658                       # 0x007299a8 "Anonymous New"
  002dee78  addiu      $a2, $a2, -0x6648                       # 0x007299b8 "PS2Main_Z.cpp"
  002dee7c  jal        func_002DCB00
  002dee80  addiu      $a3, $zero, 0x217                       # delay slot
  002dee84  beq        $v0, $zero, .L008
  002dee88  daddu      $s0, $v0, $zero                         # delay slot
  002dee8c  lui        $a1, 0x73
  002dee90  daddu      $a0, $s0, $zero
  002dee94  jal        func_002E0B70
  002dee98  addiu      $a1, $a1, -0x6270                       # delay slot; 0x00729d90 "ParticlesDMAManager"
  002dee9c  lui        $v0, 0x76
  002deea0  addiu      $v0, $v0, 0x4970                        # 0x00764970
  002deea4  sw         $v0, 0x0($s0)
.L008:
  002deea8  lui        $at, 0x79
  002deeac  sw         $s0, 0x7388($at)
  002deeb0  lui        $at, 0x79
  002deeb4  lw         $s0, 0x5f6c($at)
  002deeb8  jal        func_002E5200
  002deebc  daddu      $a0, $s0, $zero                         # delay slot
  002deec0  jal        func_002EA260
  002deec4  daddu      $a0, $s0, $zero                         # delay slot
  002deec8  jal        func_002ECE30
  002deecc  daddu      $a0, $s0, $zero                         # delay slot
  002deed0  jal        func_002E2A00
  002deed4  daddu      $a0, $s0, $zero                         # delay slot
  002deed8  jal        func_003D2950
  002deedc  daddu      $a0, $s0, $zero                         # delay slot
  002deee0  jal        func_002EF3C0
  002deee4  daddu      $a0, $s0, $zero                         # delay slot
  002deee8  jal        func_00441CF0
  002deeec  daddu      $a0, $s0, $zero                         # delay slot
  002deef0  jal        func_0045BDF0
  002deef4  daddu      $a0, $s0, $zero                         # delay slot
  002deef8  jal        func_0045F1F0
  002deefc  daddu      $a0, $s0, $zero                         # delay slot
  002def00  ld         $ra, 0x10($sp)
  002def04  lq         $s0, 0x0($sp)
  002def08  jr         $ra
  002def0c  addiu      $sp, $sp, 0x20                          # delay slot
/* end of func_002DEC40 */
