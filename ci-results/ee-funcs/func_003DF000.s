/**************************************************************************
 * func_003DF000
 *
 * address      : 0x003df000 .. 0x003df19c  (412 bytes, 103 instructions)
 * discovered by: called
 * called from  : 0x002dd970, 0x002dda18, 0x002dda74, 0x003e0744, 0x003e4c9c, 0x003f97f8 (+7 more)
 */
glabel func_003DF000
  003df000  addiu      $sp, $sp, -0x40
  003df004  sd         $ra, 0x30($sp)
  003df008  sd         $s2, 0x20($sp)
  003df00c  sd         $s1, 0x10($sp)
  003df010  jal        func_003E55E0
  003df014  sd         $s0, 0x0($sp)                           # delay slot
  003df018  lui        $v1, 0x71
  003df01c  lw         $v0, 0x3790($v1)                        # 0x00713790
  003df020  beq        $v0, $zero, .L000
  003df024  addiu      $s1, $zero, 0x1                         # delay slot
  003df028  ld         $ra, 0x30($sp)
  003df02c  ld         $s2, 0x20($sp)
  003df030  ld         $s1, 0x10($sp)
  003df034  ld         $s0, 0x0($sp)
  003df038  j          func_003E5638
  003df03c  addiu      $sp, $sp, 0x40                          # delay slot
.L000:
  003df040  jal        func_003E5638
  003df044  sw         $s1, 0x3790($v1)                        # delay slot
  003df048  jal        func_003DE8A0
  003df04c  nop                                                # delay slot
  003df050  jal        func_003E55E0
  003df054  nop                                                # delay slot
  003df058  lui        $v1, 0x7a
  003df05c  lui        $t0, 0x7a
  003df060  addiu      $s2, $v1, -0x4800
  003df064  lui        $a2, 0x7a
  003df068  lui        $a3, 0x7a
  003df06c  addiu      $s0, $t0, -0x3000
  003df070  addiu      $v1, $zero, 0x20
  003df074  lui        $v0, 0x2000
  003df078  addiu      $a2, $a2, -0x4000
  003df07c  addiu      $a3, $a3, -0x3800
  003df080  or         $a2, $a2, $v0
  003df084  or         $a3, $a3, $v0
  003df088  sw         $v1, 0x20($s0)
  003df08c  or         $v0, $s2, $v0
  003df090  sw         $s1, -0x3000($t0)
  003df094  lui        $a1, 0x3e
  003df098  sw         $a2, 0x14($s0)
  003df09c  lui        $a0, 0x8000
  003df0a0  sw         $v0, 0x4($s0)
  003df0a4  addiu      $a1, $a1, -0xd00                        # 0x003df300 -> func_003DF300
  003df0a8  sw         $a3, 0x1c($s0)
  003df0ac  ori        $a0, $a0, 0x8
  003df0b0  daddu      $a2, $s0, $zero
  003df0b4  sw         $v1, 0x8($s0)
  003df0b8  sw         $zero, 0xc($s0)
  003df0bc  sw         $zero, 0x10($s0)
  003df0c0  sw         $v1, 0x18($s0)
  003df0c4  jal        func_003DEB88
  003df0c8  sw         $zero, 0x24($s0)                        # delay slot
  003df0cc  lui        $a1, 0x3e
  003df0d0  lui        $a0, 0x8000
  003df0d4  addiu      $a1, $a1, -0x938                        # 0x003df6c8 -> func_003DF6C8
  003df0d8  ori        $a0, $a0, 0x9
  003df0dc  jal        func_003DEB88
  003df0e0  daddu      $a2, $s0, $zero                         # delay slot
  003df0e4  lui        $a1, 0x3e
  003df0e8  lui        $a0, 0x8000
  003df0ec  addiu      $a1, $a1, -0x728                        # 0x003df8d8 -> func_003DF8D8
  003df0f0  ori        $a0, $a0, 0xa
  003df0f4  jal        func_003DEB88
  003df0f8  daddu      $a2, $s0, $zero                         # delay slot
  003df0fc  lui        $a1, 0x3e
  003df100  lui        $a0, 0x8000
  003df104  addiu      $a1, $a1, -0xbf0                        # 0x003df410 -> func_003DF410
  003df108  daddu      $a2, $s0, $zero
  003df10c  jal        func_003DEB88
  003df110  ori        $a0, $a0, 0xc                           # delay slot
  003df114  jal        func_003E5638
  003df118  nop                                                # delay slot
  003df11c  lui        $a0, 0x8000
  003df120  jal        func_003DC9B0
  003df124  ori        $a0, $a0, 0x2                           # delay slot
  003df128  bne        $v0, $zero, .L002
  003df12c  ld         $ra, 0x30($sp)                          # delay slot
  003df130  addiu      $a1, $s2, 0x40
  003df134  lui        $a0, 0x8000
  003df138  sw         $s1, 0xc($a1)
  003df13c  ori        $a0, $a0, 0x2
  003df140  addiu      $a2, $zero, 0x10
  003df144  daddu      $a3, $zero, $zero
  003df148  daddu      $t0, $zero, $zero
  003df14c  jal        func_003DED88
  003df150  daddu      $t1, $zero, $zero                       # delay slot
  003df154  nop
.L001:
  003df158  jal        func_003DE858
  003df15c  daddu      $a0, $zero, $zero                       # delay slot
  003df160  beq        $v0, $zero, .L001
  003df164  ld         $ra, 0x30($sp)                          # delay slot
  003df168  lui        $a0, 0x8000
  003df16c  ld         $s2, 0x20($sp)
  003df170  addiu      $a1, $zero, 0x1
  003df174  ld         $s1, 0x10($sp)
  003df178  ori        $a0, $a0, 0x2
  003df17c  ld         $s0, 0x0($sp)
  003df180  j          func_003DC9A0
  003df184  addiu      $sp, $sp, 0x40                          # delay slot
.L002:
  003df188  ld         $s2, 0x20($sp)
  003df18c  ld         $s1, 0x10($sp)
  003df190  ld         $s0, 0x0($sp)
  003df194  jr         $ra
  003df198  addiu      $sp, $sp, 0x40                          # delay slot
/* end of func_003DF000 */
