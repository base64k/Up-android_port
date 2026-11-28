/**************************************************************************
 * func_004B9050
 *
 * address      : 0x004b9050 .. 0x004b907c  (44 bytes, 11 instructions)
 * discovered by: called
 * called from  : 0x004b5b58, 0x004b5bc8, 0x004b5bf4, 0x004b5cb0, 0x004b5cdc, 0x004b5ea0 (+66 more)
 */
glabel func_004B9050
  004b9050  lw         $v0, 0x4($a1)
  004b9054  dsll32     $v0, $v0, 0
  004b9058  dsrl32     $v0, $v0, 3
  004b905c  addiu      $v0, $v0, -0x400
  004b9060  sll        $v0, $v0, 2
  004b9064  bne        $v0, $zero, .L000
  004b9068  nop                                                # delay slot
  004b906c  lw         $v0, 0x4($a0)
  004b9070  nop
.L000:
  004b9074  jr         $ra
  004b9078  subu       $v0, $v0, $a1                           # delay slot
/* end of func_004B9050 */
