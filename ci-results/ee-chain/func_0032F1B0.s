/**************************************************************************
 * func_0032F1B0
 *
 * address      : 0x0032f1b0 .. 0x0032f244  (148 bytes, 37 instructions)
 * discovered by: called
 * called from  : 0x002dd458
 * string hint  : "BSource User.tsc"
 */
glabel func_0032F1B0
  0032f1b0  addiu      $sp, $sp, -0x10
  0032f1b4  sd         $ra, 0x0($sp)
  0032f1b8  jal        func_00338480
  0032f1bc  nop                                                # delay slot
  0032f1c0  jal        func_00338490
  0032f1c4  nop                                                # delay slot
  0032f1c8  jal        func_0032F250
  0032f1cc  nop                                                # delay slot
  0032f1d0  lui        $a0, 0x79
  0032f1d4  jal        func_002E0200
  0032f1d8  addiu      $a0, $a0, 0x5f60                        # delay slot
  0032f1dc  lui        $at, 0x79
  0032f1e0  lui        $a1, 0x73
  0032f1e4  lw         $a0, 0x5f68($at)
  0032f1e8  addiu      $a1, $a1, -0x4370                       # 0x0072bc90 "BSource User.tsc"
  0032f1ec  jal        func_003CF420
  0032f1f0  daddu      $a2, $zero, $zero                       # delay slot
  0032f1f4  lui        $at, 0x79
  0032f1f8  lw         $v0, 0x7248($at)
  0032f1fc  addiu      $v0, $v0, 0x1
  0032f200  lui        $at, 0x79
  0032f204  sw         $v0, 0x7248($at)
.L000:
  0032f208  lb         $v0, -0x7440($gp)
  0032f20c  bne        $v0, $zero, .L000
  0032f210  nop                                                # delay slot
  0032f214  jal        func_0032EAA0
  0032f218  nop                                                # delay slot
  0032f21c  jal        func_002DD6A0
  0032f220  nop                                                # delay slot
  0032f224  beq        $v0, $zero, .L000
  0032f228  nop                                                # delay slot
  0032f22c  jal        func_00331230
  0032f230  nop                                                # delay slot
  0032f234  ld         $ra, 0x0($sp)
  0032f238  addiu      $v0, $zero, 0x1
  0032f23c  jr         $ra
  0032f240  addiu      $sp, $sp, 0x10                          # delay slot
/* end of func_0032F1B0 */
