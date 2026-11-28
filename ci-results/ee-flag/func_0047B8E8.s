/**************************************************************************
 * func_0047B8E8
 *
 * address      : 0x0047b8e8 .. 0x0047bde4  (1276 bytes, 319 instructions)
 * discovered by: called
 * called from  : 0x0047c1a4, 0x0047d6e0, 0x0047d778, 0x0047d810
 */
glabel func_0047B8E8
  0047b8e8  addiu      $sp, $sp, -0x50
  0047b8ec  sd         $s0, 0x0($sp)
  0047b8f0  sd         $s1, 0x8($sp)
  0047b8f4  sd         $s2, 0x10($sp)
  0047b8f8  sd         $s3, 0x18($sp)
  0047b8fc  sd         $s4, 0x20($sp)
  0047b900  sd         $s5, 0x28($sp)
  0047b904  sd         $s6, 0x30($sp)
  0047b908  sd         $s7, 0x38($sp)
  0047b90c  sd         $fp, 0x40($sp)
  0047b910  sd         $ra, 0x48($sp)
.L000:
  0047b914  lui        $v1, 0x72
.L001:
  0047b918  lw         $v0, 0x4($v1)                           # 0x00720004
  0047b91c  bne        $v0, $zero, .L024
  0047b920  daddu      $fp, $v1, $zero                         # delay slot
  0047b924  jal        func_003E55E0
  0047b928  nop                                                # delay slot
  0047b92c  daddu      $s7, $v0, $zero
  0047b930  lui        $v1, 0x7b
  0047b934  lw         $v0, -0x67dc($v1)
  0047b938  bne        $v0, $zero, .L023
  0047b93c  lui        $v0, 0x7b                               # delay slot
  0047b940  lui        $v1, 0x7b
  0047b944  addiu      $a1, $v0, -0x67c8
  0047b948  addiu      $v1, $v1, -0x67a8
  0047b94c  lw         $v0, 0x1c($a1)
  0047b950  beq        $v0, $v1, .L003
  0047b954  addiu      $v0, $zero, 0x1                         # delay slot
  0047b958  lui        $v1, 0x7b
  0047b95c  sw         $v0, -0x67dc($v1)
  0047b960  lui        $s0, 0x7b
  0047b964  addiu      $a0, $zero, 0x2
  0047b968  lw         $v0, 0x1c($a1)
  0047b96c  sw         $v0, -0x66b8($s0)
  0047b970  lw         $v1, -0x66b8($s0)
  0047b974  sw         $a0, 0x0($v1)
  0047b978  lw         $v0, 0x1c($a1)
  0047b97c  lw         $v1, 0x1c($v0)
  0047b980  sw         $v1, 0x1c($a1)
  0047b984  lw         $v0, 0x1c($a1)
  0047b988  sw         $a1, 0x18($v0)
  0047b98c  beq        $s7, $zero, .L002
  0047b990  nop                                                # delay slot
  0047b994  jal        func_003E5638
  0047b998  nop                                                # delay slot
.L002:
  0047b99c  lw         $v0, -0x66b8($s0)
  0047b9a0  jal        func_0047B7D0
  0047b9a4  lw         $a0, 0xc($v0)                           # delay slot
  0047b9a8  beq        $v0, $zero, .L000
  0047b9ac  ld         $s0, 0x0($sp)                           # delay slot
  0047b9b0  b          .L026
  0047b9b4  ld         $s1, 0x8($sp)                           # delay slot
.L003:
  0047b9b8  lui        $v1, 0x7b
  0047b9bc  lw         $v0, -0x66b4($v1)
  0047b9c0  beq        $v0, $zero, .L005
  0047b9c4  daddu      $s3, $v1, $zero                         # delay slot
  0047b9c8  lw         $v0, -0x66b4($s3)
  0047b9cc  addiu      $a0, $zero, 0x3
  0047b9d0  lw         $v1, 0x0($v0)
  0047b9d4  bne        $v1, $a0, .L006
  0047b9d8  nop                                                # delay slot
  0047b9dc  lw         $s0, -0x66b4($s3)
  0047b9e0  sw         $zero, -0x66b4($s3)
  0047b9e4  beql       $s7, $zero, .L004
  0047b9e8  lw         $v1, 0x1c($s0)                          # delay slot
  0047b9ec  jal        func_003E5638
  0047b9f0  nop                                                # delay slot
  0047b9f4  lw         $v1, 0x1c($s0)
.L004:
  0047b9f8  beq        $v1, $zero, .L000
  0047b9fc  lw         $v0, 0x4($fp)                           # delay slot
  0047ba00  bnel       $v0, $zero, .L025
  0047ba04  ld         $s0, 0x0($sp)                           # delay slot
  0047ba08  jalr       $v1
  0047ba0c  daddu      $a0, $s0, $zero                         # delay slot
  0047ba10  b          .L001
  0047ba14  lui        $v1, 0x72                               # delay slot
.L005:
  0047ba18  lui        $v0, 0x7b
  0047ba1c  lui        $v1, 0x7b
  0047ba20  addiu      $a1, $v0, -0x6788
  0047ba24  addiu      $v1, $v1, -0x6760
  0047ba28  lw         $v0, 0x24($a1)
  0047ba2c  beq        $v0, $v1, .L023
  0047ba30  nop                                                # delay slot
  0047ba34  lw         $v1, 0x24($a1)
  0047ba38  addiu      $a0, $zero, 0x2
  0047ba3c  sw         $v1, -0x66b4($s3)
  0047ba40  lw         $v0, -0x66b4($s3)
  0047ba44  sw         $a0, 0x0($v0)
  0047ba48  lw         $v1, 0x24($a1)
  0047ba4c  lw         $v0, 0x24($v1)
  0047ba50  sw         $v0, 0x24($a1)
  0047ba54  lw         $v1, 0x24($a1)
  0047ba58  sw         $a1, 0x20($v1)
.L006:
  0047ba5c  lw         $v1, -0x66b4($s3)
  0047ba60  lui        $t0, 0x8100
  0047ba64  lw         $v0, -0x66b4($s3)
  0047ba68  lw         $a3, 0x10($v1)
  0047ba6c  lw         $a0, 0x4($v0)
  0047ba70  lw         $a1, -0x66b4($s3)
  0047ba74  lw         $v0, -0x66b4($s3)
  0047ba78  addu       $s2, $a3, $a0
  0047ba7c  lw         $a2, 0xc($a1)
  0047ba80  lw         $v1, 0x4($v0)
  0047ba84  lw         $a0, -0x66b4($s3)
  0047ba88  lw         $v0, 0x18($a0)
  0047ba8c  slt        $v0, $v0, $t0
  0047ba90  beq        $v0, $zero, .L007
  0047ba94  subu       $s1, $a2, $v1                           # delay slot
  0047ba98  lw         $v0, -0x66b4($s3)
  0047ba9c  lui        $a0, 0x8000
  0047baa0  lw         $v1, 0x18($v0)
  0047baa4  b          .L008
  0047baa8  subu       $v1, $v1, $a0                           # delay slot
.L007:
  0047baac  daddu      $v1, $zero, $zero
.L008:
  0047bab0  lw         $v0, -0x66b4($s3)
  0047bab4  dsll32     $a0, $v1, 0
  0047bab8  lw         $a1, -0x66b4($s3)
  0047babc  dsrl       $a0, $a0, 21
  0047bac0  lw         $a3, 0x8($v0)
  0047bac4  sll        $v1, $v1, 11
  0047bac8  lw         $a2, 0x4($a1)
  0047bacc  lui        $v0, 0x7b
  0047bad0  daddu      $t5, $v0, $zero
  0047bad4  lw         $a1, -0x667c($v0)
  0047bad8  addu       $a3, $a3, $a2
  0047badc  daddu      $s4, $zero, $zero
  0047bae0  dsll32     $v0, $a3, 0
  0047bae4  addu       $v1, $v1, $a3
  0047bae8  dsrl32     $v0, $v0, 0
  0047baec  andi       $a3, $v1, 0xfff
  0047baf0  daddu      $a0, $a0, $v0
  0047baf4  dsll       $s5, $a0, 20
  0047baf8  dsra32     $s5, $s5, 0
  0047bafc  beq        $a1, $zero, .L014
  0047bb00  daddu      $t1, $zero, $zero                       # delay slot
  0047bb04  lui        $v0, 0x7b
  0047bb08  lui        $a0, 0x72
  0047bb0c  addiu      $a2, $v0, -0x65f8
  0047bb10  lui        $v1, 0x7b
  0047bb14  lui        $v0, 0x7b
  0047bb18  daddu      $t4, $a2, $zero
  0047bb1c  addiu      $t0, $v0, -0x6678
  0047bb20  addiu      $t3, $v1, -0x6638
  0047bb24  addiu      $t2, $a0, 0x10                          # 0x00720010
  0047bb28  lui        $s6, 0x72
  0047bb2c  nop
.L009:
  0047bb30  lw         $v0, -0x66b4($s3)
  0047bb34  lw         $a0, 0x0($t2)
  0047bb38  lw         $v1, 0x18($v0)
  0047bb3c  bne        $a0, $v1, .L013
  0047bb40  sll        $v0, $t1, 2                             # delay slot
  0047bb44  lw         $v0, 0x0($t3)
  0047bb48  bne        $v0, $s5, .L014
  0047bb4c  daddu      $t1, $s4, $zero                         # delay slot
  0047bb50  addiu      $v0, $zero, 0x1000
  0047bb54  subu       $s0, $v0, $a3
  0047bb58  sltu       $v1, $s0, $s1
  0047bb5c  bne        $v1, $zero, .L012
  0047bb60  lw         $a1, 0x0($t0)                           # delay slot
  0047bb64  daddu      $a0, $s2, $zero
  0047bb68  daddu      $a2, $s1, $zero
  0047bb6c  jal        func_0047DD40
  0047bb70  addu       $a1, $a1, $a3                           # delay slot
  0047bb74  lw         $v1, -0x66b4($s3)
  0047bb78  lw         $v0, 0x4($v1)
  0047bb7c  addu       $v0, $v0, $s1
  0047bb80  sw         $v0, 0x4($v1)
  0047bb84  lw         $s0, -0x66b4($s3)
  0047bb88  sw         $zero, -0x66b4($s3)
  0047bb8c  beq        $s7, $zero, .L010
  0047bb90  nop                                                # delay slot
  0047bb94  jal        func_003E5638
  0047bb98  nop                                                # delay slot
.L010:
  0047bb9c  lw         $v1, 0x0($s0)
  0047bba0  addiu      $v0, $zero, 0x3
  0047bba4  beq        $v1, $v0, .L011
  0047bba8  addiu      $v0, $zero, 0x5                         # delay slot
  0047bbac  sw         $v0, 0x0($s0)
.L011:
  0047bbb0  lw         $v1, 0x1c($s0)
  0047bbb4  beq        $v1, $zero, .L000
  0047bbb8  lw         $v0, 0x4($fp)                           # delay slot
  0047bbbc  bne        $v0, $zero, .L024
  0047bbc0  lw         $v0, 0x68($s6)                          # delay slot
  0047bbc4  daddu      $a0, $s0, $zero
  0047bbc8  addiu      $v0, $v0, 0x1
  0047bbcc  jalr       $v1
  0047bbd0  sw         $v0, 0x68($s6)                          # delay slot
  0047bbd4  lw         $v0, 0x68($s6)
  0047bbd8  addiu      $v0, $v0, -0x1
  0047bbdc  b          .L000
  0047bbe0  sw         $v0, 0x68($s6)                          # delay slot
.L012:
  0047bbe4  daddu      $a0, $s2, $zero
  0047bbe8  daddu      $a2, $s0, $zero
  0047bbec  addu       $s2, $s2, $s0
  0047bbf0  addu       $a1, $a1, $a3
  0047bbf4  jal        func_0047DD40
  0047bbf8  subu       $s1, $s1, $s0                           # delay slot
  0047bbfc  addiu      $s5, $s5, 0x1
  0047bc00  lw         $v1, -0x66b4($s3)
  0047bc04  daddu      $a3, $zero, $zero
  0047bc08  lw         $v0, 0x4($v1)
  0047bc0c  addu       $v0, $v0, $s0
  0047bc10  sw         $v0, 0x4($v1)
  0047bc14  b          .L014
  0047bc18  daddu      $t1, $s4, $zero                         # delay slot
.L013:
  0047bc1c  lw         $v1, 0x0($a2)
  0047bc20  addu       $v0, $v0, $t4
  0047bc24  lw         $a0, -0x667c($t5)
  0047bc28  lw         $a1, 0x0($v0)
  0047bc2c  addiu      $a2, $a2, 0x4
  0047bc30  addiu      $t0, $t0, 0x4
  0047bc34  addiu      $t3, $t3, 0x4
  0047bc38  sltu       $v1, $v1, $a1
  0047bc3c  movn       $t1, $s4, $v1
  0047bc40  addiu      $s4, $s4, 0x1
  0047bc44  sltu       $a0, $s4, $a0
  0047bc48  bne        $a0, $zero, .L009
  0047bc4c  addiu      $t2, $t2, 0x4                           # delay slot
.L014:
  0047bc50  addiu      $v0, $zero, 0x1
  0047bc54  lui        $a0, 0x7b
  0047bc58  sltiu      $v1, $s1, 0x1000
  0047bc5c  sw         $v0, -0x67dc($a0)
  0047bc60  bne        $v1, $zero, .L015
  0047bc64  lui        $t0, 0x72                               # delay slot
  0047bc68  andi       $v0, $s2, 0x3f
  0047bc6c  bne        $v0, $zero, .L015
  0047bc70  nop                                                # delay slot
  0047bc74  beq        $a3, $zero, .L016
  0047bc78  lui        $v1, 0x7b                               # delay slot
.L015:
  0047bc7c  lui        $v0, 0x7b
  0047bc80  lw         $a2, 0x50($t0)
  0047bc84  sll        $a1, $t1, 2
  0047bc88  lui        $v1, 0x7b
  0047bc8c  addiu      $v0, $v0, -0x65f8
  0047bc90  addu       $v0, $a1, $v0
  0047bc94  addiu      $a2, $a2, 0x1
  0047bc98  addiu      $v1, $v1, -0x6638
  0047bc9c  sw         $a2, 0x0($v0)
  0047bca0  addu       $v1, $a1, $v1
  0047bca4  lui        $a0, 0x72
  0047bca8  sw         $s5, 0x0($v1)
  0047bcac  lui        $v0, 0x7b
  0047bcb0  lw         $v1, -0x66b4($s3)
  0047bcb4  addiu      $a0, $a0, 0x10                          # 0x00720010
  0047bcb8  addu       $a0, $a1, $a0
  0047bcbc  addiu      $v0, $v0, -0x6678
  0047bcc0  lw         $a3, 0x18($v1)
  0047bcc4  addu       $a1, $a1, $v0
  0047bcc8  sw         $a2, 0x50($t0)
  0047bccc  lui        $v1, 0x7b
  0047bcd0  sw         $a3, 0x0($a0)
  0047bcd4  sw         $t1, -0x6680($v1)
  0047bcd8  b          .L017
  0047bcdc  lw         $s0, 0x0($a1)                           # delay slot
.L016:
  0047bce0  addiu      $v0, $zero, -0x1
  0047bce4  sw         $v0, -0x6680($v1)
  0047bce8  daddu      $s0, $s2, $zero
.L017:
  0047bcec  beq        $s7, $zero, .L018
  0047bcf0  nop                                                # delay slot
  0047bcf4  jal        func_003E5638
  0047bcf8  nop                                                # delay slot
.L018:
  0047bcfc  lw         $v1, -0x66b4($s3)
  0047bd00  lui        $a0, 0x7b
  0047bd04  lw         $v0, -0x67d4($a0)
  0047bd08  lui        $a3, 0x7b
  0047bd0c  bne        $v0, $zero, .L020
  0047bd10  lw         $a2, 0x18($v1)                          # delay slot
  0047bd14  daddu      $v1, $a0, $zero
.L019:
  0047bd18  lw         $v0, -0x67d4($v1)
  0047bd1c  nop
  0047bd20  nop
  0047bd24  nop
  0047bd28  nop
  0047bd2c  beq        $v0, $zero, .L019
  0047bd30  nop                                                # delay slot
.L020:
  0047bd34  lui        $v0, 0x7b
  0047bd38  addiu      $v1, $a3, -0x6580
  0047bd3c  lw         $a1, -0x6400($v0)
  0047bd40  lui        $v0, 0x72
  0047bd44  lw         $a0, 0x8($v0)                           # 0x00720008
  0047bd48  sw         $s5, 0x1c($v1)
  0047bd4c  sw         $a2, 0x10($v1)
  0047bd50  sw         $s0, 0x14($v1)
  0047bd54  sw         $a1, 0x18($v1)
  0047bd58  beq        $a0, $zero, .L021
  0047bd5c  sw         $zero, 0xc($v1)                         # delay slot
  0047bd60  lui        $v0, 0x3e
  0047bd64  b          .L022
  0047bd68  addiu      $v1, $v0, -0x1238                       # delay slot; 0x003dedc8 -> func_003DEDC8
.L021:
  0047bd6c  lui        $v0, 0x3e
  0047bd70  addiu      $v1, $v0, -0x1278                       # 0x003ded88 -> func_003DED88
.L022:
  0047bd74  lui        $v0, 0x7b
  0047bd78  addiu      $a1, $a3, -0x6580
  0047bd7c  lw         $a0, -0x67e0($v0)
  0047bd80  addiu      $a2, $zero, 0x20
  0047bd84  daddu      $a3, $zero, $zero
  0047bd88  daddu      $t0, $zero, $zero
  0047bd8c  jalr       $v1
  0047bd90  daddu      $t1, $zero, $zero                       # delay slot
  0047bd94  beq        $v0, $zero, .L000
  0047bd98  ld         $s0, 0x0($sp)                           # delay slot
  0047bd9c  b          .L026
  0047bda0  ld         $s1, 0x8($sp)                           # delay slot
.L023:
  0047bda4  beq        $s7, $zero, .L025
  0047bda8  ld         $s0, 0x0($sp)                           # delay slot
  0047bdac  jal        func_003E5638
  0047bdb0  nop                                                # delay slot
.L024:
  0047bdb4  ld         $s0, 0x0($sp)
.L025:
  0047bdb8  ld         $s1, 0x8($sp)
.L026:
  0047bdbc  ld         $s2, 0x10($sp)
  0047bdc0  ld         $s3, 0x18($sp)
  0047bdc4  ld         $s4, 0x20($sp)
  0047bdc8  ld         $s5, 0x28($sp)
  0047bdcc  ld         $s6, 0x30($sp)
  0047bdd0  ld         $s7, 0x38($sp)
  0047bdd4  ld         $fp, 0x40($sp)
  0047bdd8  ld         $ra, 0x48($sp)
  0047bddc  jr         $ra
  0047bde0  addiu      $sp, $sp, 0x50                          # delay slot
/* end of func_0047B8E8 */
