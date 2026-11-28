/**************************************************************************
 * func_0032DF60
 *
 * address      : 0x0032df60 .. 0x0032df9c  (60 bytes, 15 instructions)
 * discovered by: called
 * called from  : 0x0032de3c
 */
glabel func_0032DF60
  0032df60  addiu      $sp, $sp, -0x20
  0032df64  sd         $ra, 0x10($sp)
  0032df68  sq         $s0, 0x0($sp)
  0032df6c  lb         $v1, 0xc($a0)
  0032df70  beq        $v1, $zero, .L000
  0032df74  daddu      $s0, $a0, $zero                         # delay slot
  0032df78  jal        func_002DCC40
  0032df7c  lw         $a0, 0x0($s0)                           # delay slot
.L000:
  0032df80  sw         $zero, 0x0($s0)
  0032df84  sw         $zero, 0x4($s0)
  0032df88  sb         $zero, 0xc($s0)
  0032df8c  ld         $ra, 0x10($sp)
  0032df90  lq         $s0, 0x0($sp)
  0032df94  jr         $ra
  0032df98  addiu      $sp, $sp, 0x20                          # delay slot
/* end of func_0032DF60 */
