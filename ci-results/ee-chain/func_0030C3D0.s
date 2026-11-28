/**************************************************************************
 * func_0030C3D0
 *
 * address      : 0x0030c3d0 .. 0x0030c41c  (76 bytes, 19 instructions)
 * discovered by: called
 * called from  : 0x003a5814, 0x003a5920, 0x00426374, 0x004263a0, 0x004263e0, 0x00426444 (+1 more)
 */
glabel func_0030C3D0
  0030c3d0  addiu      $sp, $sp, -0x10
  0030c3d4  beq        $a1, $zero, .L000
  0030c3d8  sd         $ra, 0x0($sp)                           # delay slot
  0030c3dc  lb         $v1, 0x6b($a0)
  0030c3e0  bne        $v1, $zero, .L001
  0030c3e4  nop                                                # delay slot
  0030c3e8  sb         $zero, 0x6c($a0)
.L000:
  0030c3ec  sb         $a1, 0x6b($a0)
  0030c3f0  lb         $v1, 0x6c($a0)
  0030c3f4  beq        $v1, $zero, .L001
  0030c3f8  nop                                                # delay slot
  0030c3fc  sb         $zero, 0x6b($a0)
  0030c400  lw         $t9, 0x88($a0)
  0030c404  lw         $t9, 0x30($t9)
  0030c408  jalr       $t9
  0030c40c  nop                                                # delay slot
.L001:
  0030c410  ld         $ra, 0x0($sp)
  0030c414  jr         $ra
  0030c418  addiu      $sp, $sp, 0x10                          # delay slot
/* end of func_0030C3D0 */
