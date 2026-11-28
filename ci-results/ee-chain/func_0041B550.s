/**************************************************************************
 * func_0041B550
 *
 * address      : 0x0041b550 .. 0x0041b598  (72 bytes, 18 instructions)
 * discovered by: pointer
 * called from  : no direct calls (indirect or unreferenced)
 */
glabel func_0041B550
  0041b550  addiu      $sp, $sp, -0x20
  0041b554  sd         $ra, 0x10($sp)
  0041b558  sq         $s0, 0x0($sp)
  0041b55c  lb         $v1, 0x18($a0)
  0041b560  beq        $v1, $zero, .L000
  0041b564  daddu      $s0, $a0, $zero                         # delay slot
  0041b568  lw         $t9, 0x20($s0)
  0041b56c  lw         $t9, 0xc($t9)
  0041b570  jalr       $t9
  0041b574  addiu      $a0, $s0, 0x20                          # delay slot
  0041b578  bne        $v0, $zero, .L000
  0041b57c  daddu      $a0, $s0, $zero                         # delay slot
  0041b580  jal        func_003569D0
  0041b584  nop                                                # delay slot
.L000:
  0041b588  ld         $ra, 0x10($sp)
  0041b58c  lq         $s0, 0x0($sp)
  0041b590  jr         $ra
  0041b594  addiu      $sp, $sp, 0x20                          # delay slot
/* end of func_0041B550 */
