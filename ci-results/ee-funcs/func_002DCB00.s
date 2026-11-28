/**************************************************************************
 * func_002DCB00
 *
 * address      : 0x002dcb00 .. 0x002dcb28  (40 bytes, 10 instructions)
 * discovered by: called
 * called from  : 0x00203cb8, 0x00226f04, 0x00227898, 0x00227908, 0x00241a3c, 0x00241ac4 (+1411 more)
 */
glabel func_002DCB00
  002dcb00  daddu      $v1, $a1, $zero
  002dcb04  daddu      $v0, $a2, $zero
  002dcb08  daddu      $a1, $a0, $zero
  002dcb0c  daddu      $t0, $a3, $zero
  002dcb10  lui        $a0, 0x79
  002dcb14  daddu      $a2, $v1, $zero
  002dcb18  addiu      $a0, $a0, 0x57b0
  002dcb1c  daddu      $a3, $v0, $zero
  002dcb20  j          func_002DCE30
  002dcb24  addiu      $t1, $zero, 0x10                        # delay slot
/* end of func_002DCB00 */
