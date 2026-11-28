/**************************************************************************
 * func_004B8140
 *
 * address      : 0x004b8140 .. 0x004b8230  (240 bytes, 60 instructions)
 * discovered by: called
 * called from  : 0x004b6828, 0x004b6870, 0x004b69bc, 0x004b6b2c, 0x004b6c14, 0x004b71f8 (+1 more)
 */
glabel func_004B8140
  004b8140  addiu      $sp, $sp, -0x40
  004b8144  sd         $ra, 0x30($sp)
  004b8148  sq         $s2, 0x20($sp)
  004b814c  sq         $s1, 0x10($sp)
  004b8150  daddu      $s2, $a0, $zero
  004b8154  daddu      $s1, $a1, $zero
  004b8158  jal        func_004B9050
  004b815c  sq         $s0, 0x0($sp)                           # delay slot
  004b8160  lw         $v1, 0x468($s2)
  004b8164  daddu      $a1, $v0, $zero
  004b8168  daddu      $a0, $s2, $zero
  004b816c  subu       $v0, $v1, $v0
  004b8170  jal        func_004B7900
  004b8174  sw         $v0, 0x468($s2)                         # delay slot
  004b8178  lbu        $a3, 0x0($s1)
  004b817c  daddu      $s0, $v0, $zero
  004b8180  addiu      $v0, $zero, -0x2
  004b8184  andi       $v1, $zero, 0x1
  004b8188  daddu      $a0, $s2, $zero
  004b818c  daddu      $a1, $s0, $zero
  004b8190  daddu      $a2, $s1, $zero
  004b8194  and        $v0, $a3, $v0
  004b8198  or         $v0, $v0, $v1
  004b819c  jal        func_004B7C30
  004b81a0  sb         $v0, 0x0($s1)                           # delay slot
  004b81a4  sll        $a0, $s0, 2
  004b81a8  addiu      $v1, $s2, 0x428
  004b81ac  addu       $a0, $v1, $a0
  004b81b0  lw         $v1, 0x0($a0)
  004b81b4  addiu      $v1, $v1, -0x1
  004b81b8  sw         $v1, 0x0($a0)
  004b81bc  lw         $a1, 0x0($a0)
  004b81c0  lw         $v1, 0x8($s2)
  004b81c4  lw         $a0, 0x424($s2)
  004b81c8  slt        $at, $v0, $a1
  004b81cc  mult       $a0, $a0, $s0
  004b81d0  sll        $a0, $a0, 2
  004b81d4  beq        $at, $zero, .L001
  004b81d8  addu       $a2, $v1, $a0                           # delay slot
  004b81dc  sll        $v1, $a1, 2
  004b81e0  sll        $a0, $v0, 2
  004b81e4  addu       $a1, $a2, $a0
  004b81e8  addu       $a0, $a2, $v1
  004b81ec  sltu       $at, $a1, $a0
  004b81f0  beq        $at, $zero, .L001
  004b81f4  nop                                                # delay slot
.L000:
  004b81f8  lw         $v1, 0x4($a1)
  004b81fc  sw         $v1, 0x0($a1)
  004b8200  addiu      $a1, $a1, 0x4
  004b8204  sltu       $v1, $a1, $a0
  004b8208  nop
  004b820c  nop
  004b8210  bne        $v1, $zero, .L000
  004b8214  nop                                                # delay slot
.L001:
  004b8218  ld         $ra, 0x30($sp)
  004b821c  lq         $s2, 0x20($sp)
  004b8220  lq         $s1, 0x10($sp)
  004b8224  lq         $s0, 0x0($sp)
  004b8228  jr         $ra
  004b822c  addiu      $sp, $sp, 0x40                          # delay slot
/* end of func_004B8140 */
