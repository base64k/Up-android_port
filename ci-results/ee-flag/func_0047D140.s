/**************************************************************************
 * func_0047D140
 *
 * address      : 0x0047d140 .. 0x0047d2d8  (408 bytes, 102 instructions)
 * discovered by: prologue
 * called from  : no direct calls (indirect or unreferenced)
 */
glabel func_0047D140
  0047d140  addiu      $sp, $sp, -0x30
  0047d144  lui        $v1, 0x72
  0047d148  sd         $s0, 0x0($sp)
  0047d14c  lw         $v0, 0x0($v1)                           # 0x00720000
  0047d150  daddu      $s0, $a0, $zero
  0047d154  sd         $s1, 0x8($sp)
  0047d158  sd         $s2, 0x10($sp)
  0047d15c  sd         $s3, 0x18($sp)
  0047d160  beq        $v0, $zero, .L009
  0047d164  sd         $ra, 0x20($sp)                          # delay slot
  0047d168  beq        $s0, $zero, .L010
  0047d16c  daddu      $v0, $zero, $zero                       # delay slot
  0047d170  lw         $v1, 0x0($s0)
  0047d174  addiu      $v0, $zero, 0x1
  0047d178  beq        $v1, $v0, .L000
  0047d17c  nop                                                # delay slot
  0047d180  lw         $v1, 0x0($s0)
  0047d184  addiu      $v0, $zero, 0x2
  0047d188  bne        $v1, $v0, .L010
  0047d18c  daddu      $v0, $zero, $zero                       # delay slot
.L000:
  0047d190  jal        func_003E55E0
  0047d194  nop                                                # delay slot
  0047d198  lw         $a2, 0x10($s0)
  0047d19c  lui        $v1, 0x7b
  0047d1a0  lw         $a1, 0x14($s0)
  0047d1a4  addiu      $s3, $v1, -0x66b0
  0047d1a8  lui        $a0, 0x7b
  0047d1ac  sw         $a1, 0x14($a2)
  0047d1b0  addiu      $s1, $a0, -0x6698
  0047d1b4  lw         $a1, 0x14($s0)
  0047d1b8  lw         $v1, 0x10($s0)
  0047d1bc  sw         $v1, 0x10($a1)
  0047d1c0  sw         $s3, 0x10($s0)
  0047d1c4  sw         $s1, 0x14($s0)
  0047d1c8  beq        $v0, $zero, .L001
  0047d1cc  lui        $v0, 0x72                               # delay slot
  0047d1d0  jal        func_003E5638
  0047d1d4  nop                                                # delay slot
  0047d1d8  lui        $v0, 0x72
.L001:
  0047d1dc  lw         $a0, 0x8($s0)
  0047d1e0  lw         $v1, 0xc($v0)                           # 0x0072000c
  0047d1e4  bne        $a0, $v1, .L008
  0047d1e8  daddu      $s2, $v0, $zero                         # delay slot
  0047d1ec  lui        $a2, 0xffff
  0047d1f0  lw         $a1, 0x14($s3)
  0047d1f4  beq        $a1, $s1, .L003
  0047d1f8  ori        $a2, $a2, 0xffff                        # delay slot
  0047d1fc  daddu      $a0, $s1, $zero
.L002:
  0047d200  lw         $v1, 0x8($a1)
  0047d204  lw         $a1, 0x14($a1)
  0047d208  sltu       $v0, $v1, $a2
  0047d20c  nop
  0047d210  nop
  0047d214  bne        $a1, $a0, .L002
  0047d218  movn       $a2, $v1, $v0                           # delay slot
.L003:
  0047d21c  lw         $v0, 0xc($s2)
  0047d220  sltu       $v0, $v0, $a2
  0047d224  beq        $v0, $zero, .L008
  0047d228  lui        $v1, 0x7b                               # delay slot
  0047d22c  sw         $a2, 0xc($s2)
  0047d230  lw         $v0, -0x67d4($v1)
  0047d234  bne        $v0, $zero, .L005
  0047d238  lui        $a1, 0x7b                               # delay slot
  0047d23c  nop
.L004:
  0047d240  lw         $v0, -0x67d4($v1)
  0047d244  nop
  0047d248  nop
  0047d24c  nop
  0047d250  nop
  0047d254  beq        $v0, $zero, .L004
  0047d258  nop                                                # delay slot
.L005:
  0047d25c  lui        $v0, 0x72
  0047d260  addiu      $v1, $a1, -0x6a00
  0047d264  lw         $a0, 0x8($v0)                           # 0x00720008
  0047d268  addiu      $v0, $zero, 0x3
  0047d26c  sw         $a2, 0x10($v1)
  0047d270  beq        $a0, $zero, .L006
  0047d274  sw         $v0, 0xc($v1)                           # delay slot
  0047d278  lui        $v0, 0x3e
  0047d27c  b          .L007
  0047d280  addiu      $v1, $v0, -0x1238                       # delay slot; 0x003dedc8 -> func_003DEDC8
.L006:
  0047d284  lui        $v0, 0x3e
  0047d288  addiu      $v1, $v0, -0x1278                       # 0x003ded88 -> func_003DED88
.L007:
  0047d28c  lui        $v0, 0x7b
  0047d290  addiu      $a1, $a1, -0x6a00
  0047d294  lw         $a0, -0x67e0($v0)
  0047d298  addiu      $a2, $zero, 0x14
  0047d29c  daddu      $a3, $zero, $zero
  0047d2a0  daddu      $t0, $zero, $zero
  0047d2a4  jalr       $v1
  0047d2a8  daddu      $t1, $zero, $zero                       # delay slot
.L008:
  0047d2ac  sw         $zero, 0x0($s0)
  0047d2b0  b          .L010
  0047d2b4  lw         $v0, 0xc($s2)                           # delay slot
.L009:
  0047d2b8  daddu      $v0, $zero, $zero
.L010:
  0047d2bc  ld         $s0, 0x0($sp)
  0047d2c0  ld         $s1, 0x8($sp)
  0047d2c4  ld         $s2, 0x10($sp)
  0047d2c8  ld         $s3, 0x18($sp)
  0047d2cc  ld         $ra, 0x20($sp)
  0047d2d0  jr         $ra
  0047d2d4  addiu      $sp, $sp, 0x30                          # delay slot
/* end of func_0047D140 */
