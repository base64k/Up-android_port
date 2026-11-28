/**************************************************************************
 * func_00426350
 *
 * address      : 0x00426350 .. 0x004264c0  (368 bytes, 92 instructions)
 * discovered by: called
 * called from  : 0x0032ed94
 */
glabel func_00426350
  00426350  addiu      $sp, $sp, -0x30
  00426354  addiu      $a1, $zero, 0x1
  00426358  sd         $ra, 0x20($sp)
  0042635c  lui        $at, 0x79
  00426360  sq         $s0, 0x10($sp)
  00426364  swc1       $f20, 0x0($sp)
  00426368  daddu      $s0, $a0, $zero
  0042636c  sb         $a1, 0xf1($a0)
  00426370  lw         $a0, 0x5f70($at)
  00426374  jal        func_0030C3D0
  00426378  mov.s      $f20, $f12                              # delay slot
  0042637c  lb         $v0, 0xf0($s0)
  00426380  beq        $v0, $zero, .L003
  00426384  nop                                                # delay slot
  00426388  b          .L002
  0042638c  sw         $zero, 0xf4($s0)                        # delay slot
.L000:
  00426390  bne        $v1, $v0, .L001
  00426394  addiu      $a1, $zero, 0x1                         # delay slot
  00426398  daddu      $a1, $zero, $zero
.L001:
  0042639c  lui        $at, 0x79
  004263a0  jal        func_0030C3D0
  004263a4  lw         $a0, 0x5f70($at)                        # delay slot
  004263a8  lw         $v0, 0xf4($s0)
  004263ac  mov.s      $f12, $f20
  004263b0  sll        $v0, $v0, 3
  004263b4  jal        func_00426E00
  004263b8  addu       $a0, $s0, $v0                           # delay slot
  004263bc  lw         $v0, 0xf4($s0)
  004263c0  addiu      $v0, $v0, 0x1
  004263c4  sw         $v0, 0xf4($s0)
.L002:
  004263c8  lw         $v1, 0xf4($s0)
  004263cc  slti       $v0, $v1, 0x4
  004263d0  bne        $v0, $zero, .L000
  004263d4  addiu      $v0, $zero, 0x2                         # delay slot
  004263d8  lui        $at, 0x79
  004263dc  lw         $a0, 0x5f70($at)
  004263e0  jal        func_0030C3D0
  004263e4  addiu      $a1, $zero, 0x1                         # delay slot
  004263e8  addiu      $a0, $s0, 0xa0
  004263ec  jal        func_00426E00
  004263f0  mov.s      $f12, $f20                              # delay slot
  004263f4  addiu      $a0, $s0, 0xb0
  004263f8  jal        func_00426E00
  004263fc  mov.s      $f12, $f20                              # delay slot
  00426400  addiu      $a0, $s0, 0xc0
  00426404  jal        func_00426E00
  00426408  mov.s      $f12, $f20                              # delay slot
  0042640c  addiu      $a0, $s0, 0xd8
  00426410  jal        func_00426E00
  00426414  mov.s      $f12, $f20                              # delay slot
  00426418  mov.s      $f12, $f20
  0042641c  jal        func_00426E00
  00426420  addiu      $a0, $s0, 0xd0                          # delay slot
  00426424  b          .L007
  00426428  nop                                                # delay slot
.L003:
  0042642c  b          .L006
  00426430  sw         $zero, 0xf4($s0)                        # delay slot
.L004:
  00426434  bne        $v1, $v0, .L005
  00426438  addiu      $a1, $zero, 0x1                         # delay slot
  0042643c  daddu      $a1, $zero, $zero
.L005:
  00426440  lui        $at, 0x79
  00426444  jal        func_0030C3D0
  00426448  lw         $a0, 0x5f70($at)                        # delay slot
  0042644c  lw         $v0, 0xf4($s0)
  00426450  mov.s      $f12, $f20
  00426454  sll        $v0, $v0, 3
  00426458  jal        func_00426E00
  0042645c  addu       $a0, $s0, $v0                           # delay slot
  00426460  lw         $v0, 0xf4($s0)
  00426464  addiu      $v0, $v0, 0x1
  00426468  sw         $v0, 0xf4($s0)
.L006:
  0042646c  nop
  00426470  lw         $v1, 0xf4($s0)
  00426474  slti       $at, $v1, 0x1c
  00426478  beq        $at, $zero, .L007
  0042647c  nop                                                # delay slot
  00426480  lb         $v0, 0xf0($s0)
  00426484  beq        $v0, $zero, .L004
  00426488  addiu      $v0, $zero, 0x2                         # delay slot
.L007:
  0042648c  nop
  00426490  daddu      $a0, $s0, $zero
  00426494  jal        func_004264C0
  00426498  sb         $zero, 0xf1($s0)                        # delay slot
  0042649c  lui        $at, 0x79
  004264a0  lw         $a0, 0x5f70($at)
  004264a4  jal        func_0030C3D0
  004264a8  daddu      $a1, $zero, $zero                       # delay slot
  004264ac  ld         $ra, 0x20($sp)
  004264b0  lwc1       $f20, 0x0($sp)
  004264b4  lq         $s0, 0x10($sp)
  004264b8  jr         $ra
  004264bc  addiu      $sp, $sp, 0x30                          # delay slot
/* end of func_00426350 */
