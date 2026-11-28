/**************************************************************************
 * func_0047C300
 *
 * address      : 0x0047c300 .. 0x0047c6c8  (968 bytes, 242 instructions)
 * discovered by: called
 * called from  : 0x00301bbc
 */
glabel func_0047C300
  0047c300  addiu      $sp, $sp, -0x90
  0047c304  lui        $v0, 0x72
  0047c308  lw         $v1, 0x0($v0)                           # 0x00720000
  0047c30c  sd         $s6, 0x70($sp)
  0047c310  daddu      $s6, $a1, $zero
  0047c314  sd         $s1, 0x48($sp)
  0047c318  addiu      $a1, $v1, 0x1
  0047c31c  sd         $s3, 0x58($sp)
  0047c320  sd         $s4, 0x60($sp)
  0047c324  daddu      $s3, $a2, $zero
  0047c328  sd         $s0, 0x40($sp)
  0047c32c  daddu      $s4, $a3, $zero
  0047c330  sd         $s2, 0x50($sp)
  0047c334  daddu      $s1, $a0, $zero
  0047c338  sd         $s5, 0x68($sp)
  0047c33c  addiu      $v1, $zero, 0x1
  0047c340  sd         $s7, 0x78($sp)
  0047c344  sd         $fp, 0x80($sp)
  0047c348  sd         $ra, 0x88($sp)
  0047c34c  bne        $a1, $v1, .L017
  0047c350  sw         $a1, 0x0($v0)                           # delay slot; 0x00720000
  0047c354  beq        $s3, $zero, .L014
  0047c358  andi       $v0, $s3, 0x3f                          # delay slot
  0047c35c  bne        $v0, $zero, .L015
  0047c360  lui        $v0, 0x7b                               # delay slot
  0047c364  andi       $v1, $s4, 0x1
  0047c368  daddu      $v0, $zero, $zero
  0047c36c  movn       $v0, $a1, $v1
  0047c370  sltiu      $a2, $s1, 0x11
  0047c374  daddu      $s5, $v1, $zero
  0047c378  andi       $a1, $s4, 0x2
  0047c37c  addiu      $v1, $v0, 0x1
  0047c380  addiu      $s1, $zero, 0x10
  0047c384  movn       $s1, $a0, $a2
  0047c388  movn       $v0, $v1, $a1
  0047c38c  sll        $v0, $v0, 11
  0047c390  lui        $v1, 0x7b
  0047c394  sll        $s2, $s1, 12
  0047c398  daddu      $s7, $a1, $zero
  0047c39c  addu       $a0, $s2, $v0
  0047c3a0  jal        func_00478078
  0047c3a4  sw         $s1, -0x667c($v1)                       # delay slot
  0047c3a8  daddu      $s0, $v0, $zero
  0047c3ac  beq        $s0, $zero, .L016
  0047c3b0  addu       $a1, $s0, $s2                           # delay slot
  0047c3b4  daddu      $a0, $s0, $zero
  0047c3b8  addiu      $a1, $a1, -0x1
  0047c3bc  jal        func_003DCE98
  0047c3c0  lui        $fp, 0x7b                               # delay slot
  0047c3c4  lui        $v0, 0x7b
  0047c3c8  addiu      $t0, $s3, 0x1000
  0047c3cc  lui        $a3, 0x72
  0047c3d0  lui        $v1, 0x7b
  0047c3d4  addiu      $a0, $sp, 0x20
  0047c3d8  sw         $s0, -0x6678($v0)
  0047c3dc  beq        $s1, $zero, .L001
  0047c3e0  daddu      $a1, $zero, $zero                       # delay slot
  0047c3e4  addiu      $a2, $v0, -0x6678
.L000:
  0047c3e8  sw         $s0, 0x0($a2)
  0047c3ec  addiu      $a1, $a1, 0x1
  0047c3f0  addiu      $s0, $s0, 0x1000
  0047c3f4  sltu       $v0, $a1, $s1
  0047c3f8  nop
  0047c3fc  bne        $v0, $zero, .L000
  0047c400  addiu      $a2, $a2, 0x4                           # delay slot
.L001:
  0047c404  daddu      $a1, $t0, $zero
  0047c408  beq        $s5, $zero, .L002
  0047c40c  sw         $s3, -0x6400($fp)                       # delay slot
  0047c410  sw         $a1, -0x63f8($v1)
  0047c414  sw         $s0, 0x60($a3)
  0047c418  addiu      $a1, $s3, 0x1800
  0047c41c  b          .L003
  0047c420  addiu      $s0, $s0, 0x800                         # delay slot
.L002:
  0047c424  sw         $zero, 0x60($a3)
  0047c428  sw         $zero, -0x63f8($v1)
.L003:
  0047c42c  beq        $s7, $zero, .L004
  0047c430  addiu      $v0, $a3, 0x60                          # delay slot
  0047c434  addiu      $v1, $v1, -0x63f8
  0047c438  sw         $s0, 0x4($v0)
  0047c43c  b          .L005
  0047c440  sw         $a1, 0x4($v1)                           # delay slot
.L004:
  0047c444  addiu      $v1, $v1, -0x63f8
  0047c448  sw         $zero, 0x4($v0)
  0047c44c  sw         $zero, 0x4($v1)
.L005:
  0047c450  lw         $v0, -0x6400($fp)
  0047c454  addiu      $a1, $zero, 0x1c08
  0047c458  lui        $v1, 0x73
  0047c45c  sw         $a1, 0x28($sp)
  0047c460  addiu      $v1, $v1, 0x57c0                        # 0x007357c0
  0047c464  sw         $v0, 0x24($sp)
  0047c468  sw         $v1, 0x20($sp)
  0047c46c  addiu      $a1, $zero, 0x1
  0047c470  jal        func_003DC960
  0047c474  sw         $zero, 0x2c($sp)                        # delay slot
  0047c478  daddu      $s2, $v0, $zero
  0047c47c  beq        $s2, $zero, .L014
  0047c480  lui        $v0, 0x7b                               # delay slot
  0047c484  lui        $v1, 0x7b
  0047c488  sw         $zero, -0x67d8($v0)
  0047c48c  lui        $a1, 0x7b
  0047c490  sw         $zero, -0x67dc($v1)
  0047c494  lui        $a2, 0x7b
  0047c498  sw         $zero, -0x66b8($a1)
  0047c49c  lui        $a0, 0x7b
  0047c4a0  lui        $v0, 0x7b
  0047c4a4  sw         $zero, -0x66b4($a2)
  0047c4a8  addiu      $a0, $a0, -0x67c8
  0047c4ac  addiu      $v0, $v0, -0x67a8
  0047c4b0  sw         $v0, 0x1c($a0)
  0047c4b4  lui        $a1, 0x7b
  0047c4b8  lui        $v1, 0x7b
  0047c4bc  sw         $a0, 0x18($v0)
  0047c4c0  addiu      $a1, $a1, -0x6788
  0047c4c4  addiu      $v1, $v1, -0x6760
  0047c4c8  sw         $v1, 0x24($a1)
  0047c4cc  lui        $a2, 0x7b
  0047c4d0  lui        $a0, 0x7b
  0047c4d4  sw         $a1, 0x20($v1)
  0047c4d8  addiu      $a2, $a2, -0x66b0
  0047c4dc  addiu      $a0, $a0, -0x6698
  0047c4e0  sw         $a0, 0x14($a2)
  0047c4e4  lui        $v0, 0x7b
  0047c4e8  lui        $v1, 0x7b
  0047c4ec  sw         $a2, 0x10($a0)
  0047c4f0  addiu      $v0, $v0, -0x6738
  0047c4f4  addiu      $v1, $v1, -0x66f8
  0047c4f8  sw         $v1, 0x1c($v0)
  0047c4fc  addiu      $a0, $v1, 0x20
  0047c500  sw         $v0, 0x18($v1)
  0047c504  addiu      $a2, $v0, 0x20
  0047c508  sw         $a0, 0x3c($v0)
  0047c50c  lui        $a1, 0x7b
  0047c510  addiu      $v0, $zero, -0x1
  0047c514  sw         $a2, 0x38($v1)
  0047c518  bne        $s6, $v0, .L006
  0047c51c  sw         $v0, -0x67e8($a1)                       # delay slot
  0047c520  lui        $v1, 0x7b
  0047c524  addiu      $v0, $zero, 0x1
  0047c528  jal        func_003DE8A0
  0047c52c  sw         $v0, -0x67e4($v1)                       # delay slot
  0047c530  jal        func_003E55E0
  0047c534  nop                                                # delay slot
  0047c538  lui        $a0, 0x7b
  0047c53c  daddu      $s1, $v0, $zero
  0047c540  addiu      $a0, $a0, -0x68b0
  0047c544  jal        func_003DEB58
  0047c548  addiu      $a1, $zero, 0x10                        # delay slot
  0047c54c  lui        $v1, 0x7b
  0047c550  addiu      $v0, $zero, 0xb
  0047c554  b          .L007
  0047c558  sw         $v0, -0x67e0($v1)                       # delay slot
.L006:
  0047c55c  lui        $s0, 0x7b
  0047c560  lui        $v0, 0x7b
  0047c564  sw         $zero, -0x67e4($v0)
  0047c568  jal        func_003E55E0
  0047c56c  sw         $s6, -0x67e0($s0)                       # delay slot
  0047c570  daddu      $s1, $v0, $zero
  0047c574  daddu      $v1, $s0, $zero
.L007:
  0047c578  lui        $a1, 0x48
  0047c57c  lui        $a2, 0x7b
  0047c580  lw         $a0, -0x67e0($v1)
  0047c584  addiu      $a1, $a1, -0x4068                       # 0x0047bf98 -> func_0047BF98
  0047c588  jal        func_003DEB88
  0047c58c  addiu      $a2, $a2, -0x67ec                       # delay slot
  0047c590  beq        $s1, $zero, .L008
  0047c594  andi       $s3, $s4, 0x10                          # delay slot
  0047c598  jal        func_003E5638
  0047c59c  nop                                                # delay slot
.L008:
  0047c5a0  addiu      $s1, $sp, 0x30
  0047c5a4  addiu      $s0, $sp, 0xf
.L009:
  0047c5a8  jal        func_003DC940
  0047c5ac  daddu      $a0, $s2, $zero                         # delay slot
  0047c5b0  nop
  0047c5b4  nop
  0047c5b8  nop
  0047c5bc  bgez       $v0, .L009
  0047c5c0  daddu      $v1, $s6, $zero                         # delay slot
  0047c5c4  sb         $zero, 0xf($sp)
  0047c5c8  srl        $a2, $v1, 31
  0047c5cc  subu       $v0, $zero, $v1
  0047c5d0  movn       $v1, $v0, $a2
  0047c5d4  daddu      $a1, $s0, $zero
  0047c5d8  daddu      $a3, $sp, $zero
  0047c5dc  addiu      $a0, $zero, 0xa
.L010:
  0047c5e0  div        $v1, $a0
  0047c5e4  addiu      $a1, $a1, -0x1
  0047c5e8  mfhi       $v0
  0047c5ec  mflo       $v1
  0047c5f0  addiu      $v0, $v0, 0x30
  0047c5f4  bne        $v1, $zero, .L010
  0047c5f8  sb         $v0, 0x0($a1)                           # delay slot
  0047c5fc  beq        $a2, $zero, .L011
  0047c600  addiu      $v0, $zero, 0x2d                        # delay slot
  0047c604  addiu      $a1, $a1, -0x1
  0047c608  sb         $v0, 0x0($a1)
.L011:
  0047c60c  beql       $s1, $zero, .L012
  0047c610  lw         $v0, 0x30($sp)                          # delay slot
  0047c614  addiu      $v0, $a1, -0xf
  0047c618  subu       $v0, $a3, $v0
  0047c61c  sw         $v0, 0x0($s1)
  0047c620  lw         $v0, 0x30($sp)
.L012:
  0047c624  addu       $v1, $v0, $a1
  0047c628  beq        $s3, $zero, .L013
  0047c62c  addiu      $v0, $zero, 0x31                        # delay slot
  0047c630  addiu      $v0, $zero, 0x30
.L013:
  0047c634  sb         $v0, 0x1($v1)
  0047c638  lw         $v1, 0x30($sp)
  0047c63c  lui        $v0, 0x7b
  0047c640  lw         $a0, -0x6400($fp)
  0047c644  daddu      $a2, $a1, $zero
  0047c648  addu       $v1, $v1, $a1
  0047c64c  sw         $zero, -0x67d4($v0)
  0047c650  sb         $zero, 0x2($v1)
  0047c654  lw         $a1, 0x30($sp)
  0047c658  jal        func_003E4490
  0047c65c  addiu      $a1, $a1, 0x3                           # delay slot
  0047c660  lui        $v1, 0x7b
  0047c664  bgez       $v0, .L017
  0047c668  sw         $v0, -0x67f0($v1)                       # delay slot
.L014:
  0047c66c  lui        $v0, 0x7b
.L015:
  0047c670  jal        func_00478130
  0047c674  lw         $a0, -0x6678($v0)                       # delay slot
.L016:
  0047c678  lui        $v0, 0x72
  0047c67c  lui        $a0, 0x72
  0047c680  lw         $v1, 0x0($v0)                           # 0x00720000
  0047c684  daddu      $v0, $zero, $zero
  0047c688  addiu      $v1, $v1, -0x1
  0047c68c  b          .L018
  0047c690  sw         $v1, 0x0($a0)                           # delay slot; 0x00720000
.L017:
  0047c694  addiu      $v0, $zero, 0x1
.L018:
  0047c698  ld         $s0, 0x40($sp)
  0047c69c  ld         $s1, 0x48($sp)
  0047c6a0  ld         $s2, 0x50($sp)
  0047c6a4  ld         $s3, 0x58($sp)
  0047c6a8  ld         $s4, 0x60($sp)
  0047c6ac  ld         $s5, 0x68($sp)
  0047c6b0  ld         $s6, 0x70($sp)
  0047c6b4  ld         $s7, 0x78($sp)
  0047c6b8  ld         $fp, 0x80($sp)
  0047c6bc  ld         $ra, 0x88($sp)
  0047c6c0  jr         $ra
  0047c6c4  addiu      $sp, $sp, 0x90                          # delay slot
/* end of func_0047C300 */
