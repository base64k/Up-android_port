/**************************************************************************
 * func_0047C6C8
 *
 * address      : 0x0047c6c8 .. 0x0047c824  (348 bytes, 87 instructions)
 * discovered by: prologue
 * called from  : no direct calls (indirect or unreferenced)
 */
glabel func_0047C6C8
  0047c6c8  lui        $v1, 0x72
  0047c6cc  addiu      $sp, $sp, -0x40
  0047c6d0  lw         $v0, 0x0($v1)                           # 0x00720000
  0047c6d4  sd         $s0, 0x10($sp)
  0047c6d8  sd         $s1, 0x18($sp)
  0047c6dc  sd         $s2, 0x20($sp)
  0047c6e0  sd         $s3, 0x28($sp)
  0047c6e4  beq        $v0, $zero, .L006
  0047c6e8  sd         $ra, 0x30($sp)                          # delay slot
  0047c6ec  addiu      $v0, $v0, -0x1
  0047c6f0  bne        $v0, $zero, .L006
  0047c6f4  sw         $v0, 0x0($v1)                           # delay slot
  0047c6f8  lui        $v1, 0x7b
  0047c6fc  lui        $s2, 0x7b
  0047c700  lw         $v0, -0x67d4($v1)
  0047c704  bne        $v0, $zero, .L001
  0047c708  lui        $s3, 0x7b                               # delay slot
  0047c70c  nop
.L000:
  0047c710  lw         $v0, -0x67d4($v1)
  0047c714  nop
  0047c718  nop
  0047c71c  nop
  0047c720  nop
  0047c724  beq        $v0, $zero, .L000
  0047c728  nop                                                # delay slot
.L001:
  0047c72c  jal        func_0047CAD8
  0047c730  nop                                                # delay slot
  0047c734  addiu      $a0, $s2, -0x6738
  0047c738  lui        $v1, 0x7b
  0047c73c  lw         $v0, 0x1c($a0)
  0047c740  addiu      $v1, $v1, -0x66f8
  0047c744  beq        $v0, $v1, .L003
  0047c748  lui        $v0, 0x7b                               # delay slot
  0047c74c  daddu      $s0, $a0, $zero
  0047c750  daddu      $s1, $v1, $zero
  0047c754  nop
.L002:
  0047c758  lw         $a0, 0x1c($s0)
  0047c75c  jal        func_0047D498
  0047c760  nop                                                # delay slot
  0047c764  lw         $v1, 0x1c($s0)
  0047c768  nop
  0047c76c  bne        $v1, $s1, .L002
  0047c770  addiu      $a0, $s2, -0x6738                       # delay slot
  0047c774  lui        $v0, 0x7b
.L003:
  0047c778  lw         $v1, 0x3c($a0)
  0047c77c  addiu      $v0, $v0, -0x66d8
  0047c780  beq        $v1, $v0, .L005
  0047c784  daddu      $s0, $a0, $zero                         # delay slot
  0047c788  daddu      $s1, $v0, $zero
  0047c78c  nop
.L004:
  0047c790  lw         $a0, 0x3c($s0)
  0047c794  jal        func_0047D498
  0047c798  nop                                                # delay slot
  0047c79c  lw         $v1, 0x3c($s0)
  0047c7a0  nop
  0047c7a4  bne        $v1, $s1, .L004
  0047c7a8  nop                                                # delay slot
.L005:
  0047c7ac  lw         $a0, -0x67f0($s3)
  0047c7b0  daddu      $a1, $zero, $zero
  0047c7b4  daddu      $a2, $zero, $zero
  0047c7b8  jal        func_003E40C8
  0047c7bc  daddu      $a3, $sp, $zero                         # delay slot
  0047c7c0  jal        func_003E42D0
  0047c7c4  lw         $a0, -0x67f0($s3)                       # delay slot
  0047c7c8  lui        $v1, 0x7b
  0047c7cc  jal        func_003DEC00
  0047c7d0  lw         $a0, -0x67e0($v1)                       # delay slot
  0047c7d4  lui        $v0, 0x7b
  0047c7d8  lw         $a0, -0x6678($v0)
  0047c7dc  beql       $a0, $zero, .L007
  0047c7e0  addiu      $v0, $zero, 0x1                         # delay slot
  0047c7e4  jal        func_00478130
  0047c7e8  nop                                                # delay slot
  0047c7ec  lui        $v0, 0x72
  0047c7f0  addiu      $v1, $v0, 0x60                          # 0x00720060
  0047c7f4  sw         $zero, 0x60($v0)                        # 0x00720060
  0047c7f8  sw         $zero, 0x4($v1)
  0047c7fc  b          .L007
  0047c800  addiu      $v0, $zero, 0x1                         # delay slot
.L006:
  0047c804  daddu      $v0, $zero, $zero
.L007:
  0047c808  ld         $s0, 0x10($sp)
  0047c80c  ld         $s1, 0x18($sp)
  0047c810  ld         $s2, 0x20($sp)
  0047c814  ld         $s3, 0x28($sp)
  0047c818  ld         $ra, 0x30($sp)
  0047c81c  jr         $ra
  0047c820  addiu      $sp, $sp, 0x40                          # delay slot
/* end of func_0047C6C8 */
