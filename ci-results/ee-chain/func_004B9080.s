/**************************************************************************
 * func_004B9080
 *
 * address      : 0x004b9080 .. 0x004b90bc  (60 bytes, 15 instructions)
 * discovered by: called
 * called from  : 0x004b67cc, 0x004b69a0, 0x004b6a28, 0x004b6ce8, 0x004b6d60, 0x004b6e64 (+3 more)
 */
glabel func_004B9080
  004b9080  lbu        $a0, 0x4($a1)
  004b9084  addiu      $v0, $zero, 0x1
  004b9088  addiu      $v1, $a1, 0x8
  004b908c  andi       $a0, $a0, 0x7
  004b9090  addiu      $a0, $a0, 0x2
  004b9094  sllv       $a0, $v0, $a0
  004b9098  addiu      $v0, $a0, -0x1
  004b909c  and        $v0, $v1, $v0
  004b90a0  beq        $v0, $zero, .L000
  004b90a4  nop                                                # delay slot
  004b90a8  b          .L001
  004b90ac  subu       $v0, $a0, $v0                           # delay slot
.L000:
  004b90b0  daddu      $v0, $zero, $zero
.L001:
  004b90b4  jr         $ra
  004b90b8  nop                                                # delay slot
/* end of func_004B9080 */
