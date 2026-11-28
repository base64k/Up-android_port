/**************************************************************************
 * func_0032DE20
 *
 * address      : 0x0032de20 .. 0x0032de74  (84 bytes, 21 instructions)
 * discovered by: called
 * called from  : 0x00307af4
 */
glabel func_0032DE20
  0032de20  addiu      $sp, $sp, -0x30
  0032de24  sd         $ra, 0x20($sp)
  0032de28  sq         $s1, 0x10($sp)
  0032de2c  sq         $s0, 0x0($sp)
  0032de30  daddu      $s1, $a0, $zero
  0032de34  beq        $s1, $zero, .L000
  0032de38  daddu      $s0, $a1, $zero                         # delay slot
  0032de3c  jal        func_0032DF60
  0032de40  nop                                                # delay slot
  0032de44  dsll32     $v0, $s0, 16
  0032de48  dsra32     $v0, $v0, 16
  0032de4c  blez       $v0, .L001
  0032de50  daddu      $v0, $s1, $zero                         # delay slot
  0032de54  jal        func_002DCA90
  0032de58  daddu      $a0, $s1, $zero                         # delay slot
.L000:
  0032de5c  daddu      $v0, $s1, $zero
.L001:
  0032de60  ld         $ra, 0x20($sp)
  0032de64  lq         $s1, 0x10($sp)
  0032de68  lq         $s0, 0x0($sp)
  0032de6c  jr         $ra
  0032de70  addiu      $sp, $sp, 0x30                          # delay slot
/* end of func_0032DE20 */
