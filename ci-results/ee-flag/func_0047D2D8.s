/**************************************************************************
 * func_0047D2D8
 *
 * address      : 0x0047d2d8 .. 0x0047d494  (444 bytes, 111 instructions)
 * discovered by: called
 * called from  : 0x004817fc
 */
glabel func_0047D2D8
  0047d2d8  addiu      $sp, $sp, -0x50
  0047d2dc  lui        $v1, 0x72
  0047d2e0  sd         $s0, 0x0($sp)
  0047d2e4  lw         $v0, 0x0($v1)                           # 0x00720000
  0047d2e8  daddu      $s0, $a0, $zero
  0047d2ec  sd         $s1, 0x8($sp)
  0047d2f0  sd         $s2, 0x10($sp)
  0047d2f4  sd         $s3, 0x18($sp)
  0047d2f8  sd         $s4, 0x20($sp)
  0047d2fc  sd         $s5, 0x28($sp)
  0047d300  sd         $s6, 0x30($sp)
  0047d304  sd         $s7, 0x38($sp)
  0047d308  sd         $fp, 0x40($sp)
  0047d30c  beq        $v0, $zero, .L007
  0047d310  sd         $ra, 0x48($sp)                          # delay slot
  0047d314  lw         $v0, 0x14($s0)
  0047d318  beq        $v0, $zero, .L007
  0047d31c  lui        $v1, 0x7b                               # delay slot
  0047d320  lw         $v0, 0x10($s0)
  0047d324  addiu      $s3, $v1, -0x63f8
  0047d328  sll        $v0, $v0, 2
  0047d32c  addu       $v0, $v0, $s3
  0047d330  lw         $v1, 0x0($v0)
  0047d334  beq        $v1, $zero, .L008
  0047d338  daddu      $v0, $zero, $zero                       # delay slot
  0047d33c  jal        func_003E55E0
  0047d340  nop                                                # delay slot
  0047d344  lui        $a3, 0x7b
  0047d348  lw         $a0, 0x10($s0)
  0047d34c  addiu      $a3, $a3, -0x6738
  0047d350  lui        $v1, 0x7b
  0047d354  sll        $a0, $a0, 5
  0047d358  addiu      $a2, $a3, 0x1c
  0047d35c  addu       $a2, $a0, $a2
  0047d360  addiu      $t0, $zero, 0x1
  0047d364  lw         $a1, 0x0($a2)
  0047d368  addiu      $v1, $v1, -0x66f8
  0047d36c  sw         $t0, 0xc($s0)
  0047d370  addu       $v1, $a0, $v1
  0047d374  xor        $a1, $a1, $v1
  0047d378  addu       $a0, $a0, $a3
  0047d37c  lw         $v1, 0x0($a2)
  0047d380  sltiu      $s1, $a1, 0x1
  0047d384  sw         $v1, 0x1c($s0)
  0047d388  sw         $s0, 0x0($a2)
  0047d38c  lw         $v1, 0x1c($s0)
  0047d390  sw         $s0, 0x18($v1)
  0047d394  sw         $a0, 0x18($s0)
  0047d398  beq        $v0, $zero, .L000
  0047d39c  nop                                                # delay slot
  0047d3a0  jal        func_003E5638
  0047d3a4  nop                                                # delay slot
.L000:
  0047d3a8  beq        $s1, $zero, .L006
  0047d3ac  lui        $s2, 0x7b                               # delay slot
  0047d3b0  lui        $fp, 0x7b
  0047d3b4  addiu      $s1, $s2, -0x6980
  0047d3b8  lui        $s7, 0x72
  0047d3bc  lui        $s6, 0x7b
  0047d3c0  addiu      $s5, $zero, 0x4
  0047d3c4  lui        $s4, 0x3e
  0047d3c8  lui        $s3, 0x3e
  0047d3cc  lw         $a0, 0x10($s0)
.L001:
  0047d3d0  lui        $a1, 0x7b
  0047d3d4  addiu      $a1, $a1, -0x63f8
  0047d3d8  lw         $v1, -0x67d4($fp)
  0047d3dc  sll        $v0, $a0, 2
  0047d3e0  addu       $v0, $v0, $a1
  0047d3e4  bne        $v1, $zero, .L003
  0047d3e8  lw         $a1, 0x0($v0)                           # delay slot
  0047d3ec  lui        $v1, 0x7b
.L002:
  0047d3f0  lw         $v0, -0x67d4($v1)
  0047d3f4  nop
  0047d3f8  nop
  0047d3fc  nop
  0047d400  nop
  0047d404  beq        $v0, $zero, .L002
  0047d408  nop                                                # delay slot
.L003:
  0047d40c  lw         $v0, 0x8($s7)
  0047d410  addiu      $v1, $zero, 0x1
  0047d414  sw         $a0, 0x10($s1)
  0047d418  sw         $a1, 0x18($s1)
  0047d41c  sw         $s5, 0xc($s1)
  0047d420  beq        $v0, $zero, .L004
  0047d424  sw         $v1, 0x14($s1)                          # delay slot
  0047d428  b          .L005
  0047d42c  addiu      $v0, $s4, -0x1238                       # delay slot
.L004:
  0047d430  addiu      $v0, $s3, -0x1278
.L005:
  0047d434  lw         $a0, -0x67e0($s6)
  0047d438  addiu      $a1, $s2, -0x6980
  0047d43c  addiu      $a2, $zero, 0x1c
  0047d440  daddu      $a3, $zero, $zero
  0047d444  daddu      $t0, $zero, $zero
  0047d448  jalr       $v0
  0047d44c  daddu      $t1, $zero, $zero                       # delay slot
  0047d450  beql       $v0, $zero, .L001
  0047d454  lw         $a0, 0x10($s0)                          # delay slot
.L006:
  0047d458  b          .L008
  0047d45c  addiu      $v0, $zero, 0x1                         # delay slot
.L007:
  0047d460  daddu      $v0, $zero, $zero
.L008:
  0047d464  ld         $s0, 0x0($sp)
  0047d468  ld         $s1, 0x8($sp)
  0047d46c  ld         $s2, 0x10($sp)
  0047d470  ld         $s3, 0x18($sp)
  0047d474  ld         $s4, 0x20($sp)
  0047d478  ld         $s5, 0x28($sp)
  0047d47c  ld         $s6, 0x30($sp)
  0047d480  ld         $s7, 0x38($sp)
  0047d484  ld         $fp, 0x40($sp)
  0047d488  ld         $ra, 0x48($sp)
  0047d48c  jr         $ra
  0047d490  addiu      $sp, $sp, 0x50                          # delay slot
/* end of func_0047D2D8 */
