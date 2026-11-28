/**************************************************************************
 * func_0047D498
 *
 * address      : 0x0047d498 .. 0x0047d630  (408 bytes, 102 instructions)
 * discovered by: called
 * called from  : 0x0047c75c, 0x0047c794, 0x0048181c, 0x00481974
 */
glabel func_0047D498
  0047d498  addiu      $sp, $sp, -0x50
  0047d49c  lui        $v1, 0x72
  0047d4a0  sd         $s0, 0x0($sp)
  0047d4a4  lw         $v0, 0x0($v1)                           # 0x00720000
  0047d4a8  daddu      $s0, $a0, $zero
  0047d4ac  sd         $s1, 0x8($sp)
  0047d4b0  sd         $s2, 0x10($sp)
  0047d4b4  sd         $s3, 0x18($sp)
  0047d4b8  sd         $s4, 0x20($sp)
  0047d4bc  sd         $s5, 0x28($sp)
  0047d4c0  sd         $s6, 0x30($sp)
  0047d4c4  sd         $s7, 0x38($sp)
  0047d4c8  sd         $fp, 0x40($sp)
  0047d4cc  beq        $v0, $zero, .L008
  0047d4d0  sd         $ra, 0x48($sp)                          # delay slot
  0047d4d4  beq        $s0, $zero, .L009
  0047d4d8  daddu      $v0, $zero, $zero                       # delay slot
  0047d4dc  lw         $v1, 0xc($s0)
  0047d4e0  addiu      $v0, $zero, 0x1
  0047d4e4  beq        $v1, $v0, .L000
  0047d4e8  nop                                                # delay slot
  0047d4ec  lw         $v1, 0xc($s0)
  0047d4f0  addiu      $v0, $zero, 0x2
  0047d4f4  bne        $v1, $v0, .L009
  0047d4f8  daddu      $v0, $zero, $zero                       # delay slot
.L000:
  0047d4fc  jal        func_003E55E0
  0047d500  nop                                                # delay slot
  0047d504  sw         $zero, 0xc($s0)
  0047d508  lui        $a1, 0x7b
  0047d50c  lw         $a3, 0x10($s0)
  0047d510  addiu      $a1, $a1, -0x6738
  0047d514  lw         $a2, 0x18($s0)
  0047d518  addiu      $a1, $a1, 0x1c
  0047d51c  lw         $a0, 0x1c($s0)
  0047d520  sll        $a3, $a3, 5
  0047d524  lui        $v1, 0x7b
  0047d528  addu       $a1, $a3, $a1
  0047d52c  sw         $a0, 0x1c($a2)
  0047d530  addiu      $v1, $v1, -0x66f8
  0047d534  addu       $a3, $a3, $v1
  0047d538  lw         $a2, 0x1c($s0)
  0047d53c  lw         $a0, 0x18($s0)
  0047d540  sw         $a0, 0x18($a2)
  0047d544  lw         $v1, 0x0($a1)
  0047d548  xor        $v1, $v1, $a3
  0047d54c  beq        $v0, $zero, .L001
  0047d550  sltiu      $s1, $v1, 0x1                           # delay slot
  0047d554  jal        func_003E5638
  0047d558  nop                                                # delay slot
.L001:
  0047d55c  beq        $s1, $zero, .L007
  0047d560  lui        $s2, 0x7b                               # delay slot
  0047d564  lui        $fp, 0x7b
  0047d568  addiu      $s1, $s2, -0x6980
  0047d56c  lui        $s7, 0x72
  0047d570  lui        $s6, 0x7b
  0047d574  addiu      $s5, $zero, 0x4
  0047d578  lui        $s4, 0x3e
  0047d57c  lui        $s3, 0x3e
.L002:
  0047d580  lw         $v0, -0x67d4($fp)
  0047d584  bne        $v0, $zero, .L004
  0047d588  lw         $a0, 0x10($s0)                          # delay slot
  0047d58c  lui        $v1, 0x7b
.L003:
  0047d590  lw         $v0, -0x67d4($v1)
  0047d594  nop
  0047d598  nop
  0047d59c  nop
  0047d5a0  nop
  0047d5a4  beq        $v0, $zero, .L003
  0047d5a8  nop                                                # delay slot
.L004:
  0047d5ac  lw         $v0, 0x8($s7)
  0047d5b0  sw         $a0, 0x10($s1)
  0047d5b4  sw         $s5, 0xc($s1)
  0047d5b8  sw         $zero, 0x14($s1)
  0047d5bc  beq        $v0, $zero, .L005
  0047d5c0  sw         $zero, 0x18($s1)                        # delay slot
  0047d5c4  b          .L006
  0047d5c8  addiu      $v0, $s4, -0x1238                       # delay slot
.L005:
  0047d5cc  addiu      $v0, $s3, -0x1278
.L006:
  0047d5d0  lw         $a0, -0x67e0($s6)
  0047d5d4  addiu      $a1, $s2, -0x6980
  0047d5d8  addiu      $a2, $zero, 0x1c
  0047d5dc  daddu      $a3, $zero, $zero
  0047d5e0  daddu      $t0, $zero, $zero
  0047d5e4  jalr       $v0
  0047d5e8  daddu      $t1, $zero, $zero                       # delay slot
  0047d5ec  beq        $v0, $zero, .L002
  0047d5f0  nop                                                # delay slot
.L007:
  0047d5f4  b          .L009
  0047d5f8  addiu      $v0, $zero, 0x1                         # delay slot
.L008:
  0047d5fc  daddu      $v0, $zero, $zero
.L009:
  0047d600  ld         $s0, 0x0($sp)
  0047d604  ld         $s1, 0x8($sp)
  0047d608  ld         $s2, 0x10($sp)
  0047d60c  ld         $s3, 0x18($sp)
  0047d610  ld         $s4, 0x20($sp)
  0047d614  ld         $s5, 0x28($sp)
  0047d618  ld         $s6, 0x30($sp)
  0047d61c  ld         $s7, 0x38($sp)
  0047d620  ld         $fp, 0x40($sp)
  0047d624  ld         $ra, 0x48($sp)
  0047d628  jr         $ra
  0047d62c  addiu      $sp, $sp, 0x50                          # delay slot
/* end of func_0047D498 */
