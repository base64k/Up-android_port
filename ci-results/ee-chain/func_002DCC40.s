/**************************************************************************
 * func_002DCC40
 *
 * address      : 0x002dcc40 .. 0x002dcc7c  (60 bytes, 15 instructions)
 * discovered by: called
 * called from  : 0x00202d78, 0x00202f70, 0x00205cb0, 0x00205e88, 0x00209304, 0x00209b38 (+1676 more)
 */
glabel func_002DCC40
  002dcc40  addiu      $sp, $sp, -0x10
  002dcc44  daddu      $a1, $a0, $zero
  002dcc48  beq        $a1, $zero, .L000
  002dcc4c  sd         $ra, 0x0($sp)                           # delay slot
  002dcc50  lui        $a0, 0x79
  002dcc54  jal        func_004B66F0
  002dcc58  addiu      $a0, $a0, 0x57d4                        # delay slot
  002dcc5c  lui        $at, 0x79
  002dcc60  lw         $v1, 0x57c4($at)
  002dcc64  addiu      $v1, $v1, -0x1
  002dcc68  lui        $at, 0x79
  002dcc6c  sw         $v1, 0x57c4($at)
.L000:
  002dcc70  ld         $ra, 0x0($sp)
  002dcc74  jr         $ra
  002dcc78  addiu      $sp, $sp, 0x10                          # delay slot
/* end of func_002DCC40 */
