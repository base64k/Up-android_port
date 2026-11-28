/**************************************************************************
 * func_003078A0
 *
 * address      : 0x003078a0 .. 0x003078ec  (76 bytes, 19 instructions)
 * discovered by: called
 * called from  : 0x004c4bd0
 */
glabel func_003078A0
  003078a0  addiu      $sp, $sp, -0x30
  003078a4  sd         $ra, 0x20($sp)
  003078a8  sq         $s1, 0x10($sp)
  003078ac  sq         $s0, 0x0($sp)
  003078b0  daddu      $s1, $a0, $zero
  003078b4  jal        func_003078F0
  003078b8  daddu      $s0, $a1, $zero                         # delay slot
  003078bc  bne        $v0, $zero, .L000
  003078c0  daddu      $a0, $s1, $zero                         # delay slot
  003078c4  b          .L001
  003078c8  daddu      $v0, $zero, $zero                       # delay slot
.L000:
  003078cc  jal        func_003079C0
  003078d0  daddu      $a1, $s0, $zero                         # delay slot
  003078d4  addiu      $v0, $zero, 0x1
.L001:
  003078d8  ld         $ra, 0x20($sp)
  003078dc  lq         $s1, 0x10($sp)
  003078e0  lq         $s0, 0x0($sp)
  003078e4  jr         $ra
  003078e8  addiu      $sp, $sp, 0x30                          # delay slot
/* end of func_003078A0 */
