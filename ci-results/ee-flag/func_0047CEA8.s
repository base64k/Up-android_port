/**************************************************************************
 * func_0047CEA8
 *
 * address      : 0x0047cea8 .. 0x0047cfd0  (296 bytes, 74 instructions)
 * discovered by: called
 * called from  : 0x004803e4
 */
glabel func_0047CEA8
  0047cea8  addiu      $sp, $sp, -0x80
  0047ceac  sd         $s0, 0x50($sp)
  0047ceb0  sd         $s4, 0x70($sp)
  0047ceb4  sd         $s1, 0x58($sp)
  0047ceb8  sd         $s2, 0x60($sp)
  0047cebc  sd         $s3, 0x68($sp)
  0047cec0  sd         $ra, 0x78($sp)
  0047cec4  jal        func_0047CD28
  0047cec8  daddu      $s0, $a0, $zero                         # delay slot
  0047cecc  daddu      $s4, $v0, $zero
  0047ced0  lui        $v0, 0x7b
  0047ced4  lw         $v1, -0x667c($v0)
  0047ced8  beq        $v1, $zero, .L002
  0047cedc  daddu      $a0, $zero, $zero                       # delay slot
  0047cee0  lui        $v0, 0x72
  0047cee4  lui        $a1, 0xffff
  0047cee8  daddu      $a2, $v1, $zero
  0047ceec  ori        $a1, $a1, 0xffff
  0047cef0  addiu      $v1, $v0, 0x10                          # 0x00720010
  0047cef4  nop
.L000:
  0047cef8  lw         $v0, 0x0($v1)
  0047cefc  beql       $v0, $s0, .L001
  0047cf00  sw         $a1, 0x0($v1)                           # delay slot
.L001:
  0047cf04  addiu      $a0, $a0, 0x1
  0047cf08  sltu       $v0, $a0, $a2
  0047cf0c  bne        $v0, $zero, .L000
  0047cf10  addiu      $v1, $v1, 0x4                           # delay slot
.L002:
  0047cf14  bltz       $s0, .L007
  0047cf18  lui        $s3, 0x7b                               # delay slot
  0047cf1c  lui        $v1, 0x7b
.L003:
  0047cf20  lw         $v0, -0x67d4($v1)
  0047cf24  nop
  0047cf28  nop
  0047cf2c  nop
  0047cf30  nop
  0047cf34  beq        $v0, $zero, .L003
  0047cf38  addiu      $v0, $zero, 0x2                         # delay slot
  0047cf3c  sw         $s0, 0x10($sp)
  0047cf40  sw         $v0, 0xc($sp)
  0047cf44  lui        $s2, 0x72
  0047cf48  lui        $v0, 0x7b
  0047cf4c  lui        $s1, 0x3e
  0047cf50  sw         $zero, -0x67d0($v0)
  0047cf54  lui        $s0, 0x3e
.L004:
  0047cf58  lw         $v0, 0x8($s2)                           # 0x00720008
  0047cf5c  bne        $v0, $zero, .L005
  0047cf60  addiu      $v0, $s1, -0x1238                       # delay slot; 0x003dedc8 -> func_003DEDC8
  0047cf64  addiu      $v0, $s0, -0x1278
.L005:
  0047cf68  lw         $a0, -0x67e0($s3)
  0047cf6c  daddu      $a1, $sp, $zero
  0047cf70  addiu      $a2, $zero, 0x14
  0047cf74  daddu      $a3, $zero, $zero
  0047cf78  daddu      $t0, $zero, $zero
  0047cf7c  jalr       $v0
  0047cf80  daddu      $t1, $zero, $zero                       # delay slot
  0047cf84  beq        $v0, $zero, .L004
  0047cf88  lui        $v1, 0x7b                               # delay slot
  0047cf8c  nop
.L006:
  0047cf90  lw         $v0, -0x67d0($v1)
  0047cf94  nop
  0047cf98  nop
  0047cf9c  nop
  0047cfa0  nop
  0047cfa4  beq        $v0, $zero, .L006
  0047cfa8  nop                                                # delay slot
.L007:
  0047cfac  daddu      $v0, $s4, $zero
  0047cfb0  ld         $s0, 0x50($sp)
  0047cfb4  ld         $s1, 0x58($sp)
  0047cfb8  ld         $s2, 0x60($sp)
  0047cfbc  ld         $s3, 0x68($sp)
  0047cfc0  ld         $s4, 0x70($sp)
  0047cfc4  ld         $ra, 0x78($sp)
  0047cfc8  jr         $ra
  0047cfcc  addiu      $sp, $sp, 0x80                          # delay slot
/* end of func_0047CEA8 */
