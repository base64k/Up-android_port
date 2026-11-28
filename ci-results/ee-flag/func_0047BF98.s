/**************************************************************************
 * func_0047BF98
 *
 * address      : 0x0047bf98 .. 0x0047c2fc  (868 bytes, 217 instructions)
 * discovered by: prologue
 * called from  : no direct calls (indirect or unreferenced)
 */
glabel func_0047BF98
  0047bf98  addiu      $sp, $sp, -0x50
  0047bf9c  lui        $v0, 0x72
  0047bfa0  sd         $s0, 0x0($sp)
  0047bfa4  sd         $s7, 0x38($sp)
  0047bfa8  daddu      $s0, $a0, $zero
  0047bfac  sd         $s1, 0x8($sp)
  0047bfb0  daddu      $s7, $v0, $zero
  0047bfb4  sd         $s2, 0x10($sp)
  0047bfb8  sd         $s3, 0x18($sp)
  0047bfbc  sd         $s4, 0x20($sp)
  0047bfc0  sd         $s5, 0x28($sp)
  0047bfc4  sd         $s6, 0x30($sp)
  0047bfc8  sd         $ra, 0x40($sp)
  0047bfcc  lw         $v1, 0x8($v0)                           # 0x00720008
  0047bfd0  lw         $a1, 0xc($s0)
  0047bfd4  addiu      $v1, $v1, 0x1
  0047bfd8  sw         $v1, 0x8($v0)                           # 0x00720008
  0047bfdc  sltiu      $a0, $a1, 0x3
  0047bfe0  beq        $a0, $zero, .L007
  0047bfe4  addiu      $v1, $zero, 0x1                         # delay slot
  0047bfe8  beql       $a1, $v1, .L003
  0047bfec  lw         $a0, 0x18($s0)                          # delay slot
  0047bff0  beq        $a1, $zero, .L000
  0047bff4  addiu      $v0, $zero, 0x2                         # delay slot
  0047bff8  bne        $a1, $v0, .L016
  0047bffc  lui        $v0, 0x7b                               # delay slot
  0047c000  sw         $v1, -0x67d0($v0)
  0047c004  b          .L016
  0047c008  nop                                                # delay slot
.L000:
  0047c00c  lw         $a0, 0x18($s0)
  0047c010  lui        $v1, 0x7b
  0047c014  lw         $v0, 0x14($s0)
  0047c018  addiu      $a1, $a0, 0xfff
  0047c01c  sw         $v0, -0x67d8($v1)
  0047c020  jal        func_003DCE98
  0047c024  nop                                                # delay slot
  0047c028  lw         $a1, 0x10($s0)
  0047c02c  lui        $v0, 0x7b
  0047c030  sw         $zero, -0x67dc($v0)
  0047c034  beq        $a1, $zero, .L002
  0047c038  lui        $v0, 0x7b                               # delay slot
  0047c03c  addiu      $a0, $zero, -0x1
  0047c040  lw         $v1, -0x6680($v0)
  0047c044  bne        $v1, $a0, .L006
  0047c048  lui        $a2, 0x7b                               # delay slot
  0047c04c  lw         $v0, -0x66b4($a2)
  0047c050  beq        $v0, $zero, .L006
  0047c054  nop                                                # delay slot
  0047c058  lw         $v1, -0x66b4($a2)
  0047c05c  lw         $v0, 0x4($v1)
  0047c060  addu       $v0, $v0, $a1
  0047c064  sw         $v0, 0x4($v1)
  0047c068  lw         $a0, -0x66b4($a2)
  0047c06c  lw         $v1, -0x66b4($a2)
  0047c070  lw         $a1, 0x4($a0)
  0047c074  lw         $v0, 0xc($v1)
  0047c078  bne        $a1, $v0, .L006
  0047c07c  nop                                                # delay slot
  0047c080  lw         $a0, -0x66b4($a2)
  0047c084  sw         $zero, -0x66b4($a2)
  0047c088  beq        $a0, $zero, .L006
  0047c08c  nop                                                # delay slot
  0047c090  lw         $v1, 0x0($a0)
  0047c094  addiu      $v0, $zero, 0x3
  0047c098  beq        $v1, $v0, .L001
  0047c09c  addiu      $v0, $zero, 0x5                         # delay slot
  0047c0a0  sw         $v0, 0x0($a0)
.L001:
  0047c0a4  lw         $a1, 0x1c($a0)
  0047c0a8  beq        $a1, $zero, .L006
  0047c0ac  lui        $v0, 0x72                               # delay slot
  0047c0b0  lw         $v1, 0x4($v0)
  0047c0b4  bne        $v1, $zero, .L006
  0047c0b8  nop                                                # delay slot
  0047c0bc  jalr       $a1
  0047c0c0  nop                                                # delay slot
  0047c0c4  b          .L006
  0047c0c8  nop                                                # delay slot
.L002:
  0047c0cc  lui        $v0, 0x7b
  0047c0d0  lw         $a0, -0x66b4($v0)
  0047c0d4  sw         $zero, -0x66b4($v0)
  0047c0d8  beq        $a0, $zero, .L006
  0047c0dc  addiu      $v0, $zero, 0x4                         # delay slot
  0047c0e0  lw         $a1, 0x1c($a0)
  0047c0e4  sw         $v0, 0x0($a0)
  0047c0e8  beq        $a1, $zero, .L006
  0047c0ec  lui        $v0, 0x72                               # delay slot
  0047c0f0  lw         $v1, 0x4($v0)
  0047c0f4  bne        $v1, $zero, .L006
  0047c0f8  nop                                                # delay slot
  0047c0fc  jalr       $a1
  0047c100  nop                                                # delay slot
  0047c104  b          .L006
  0047c108  nop                                                # delay slot
.L003:
  0047c10c  lui        $v0, 0x7b
  0047c110  lui        $a1, 0x7b
  0047c114  lui        $v1, 0x7b
  0047c118  sw         $a0, -0x67d8($v0)
  0047c11c  daddu      $s1, $v1, $zero
  0047c120  sw         $zero, -0x67dc($a1)
  0047c124  lw         $v0, -0x66b8($v1)
  0047c128  beq        $v0, $zero, .L006
  0047c12c  nop                                                # delay slot
  0047c130  lw         $v0, -0x66b8($s1)
  0047c134  addiu      $a0, $zero, 0x3
  0047c138  lw         $v1, 0x0($v0)
  0047c13c  beq        $v1, $a0, .L004
  0047c140  addiu      $v0, $zero, 0x4                         # delay slot
  0047c144  lw         $a1, 0x10($s0)
  0047c148  lw         $a0, -0x66b8($s1)
  0047c14c  addiu      $v1, $zero, 0x5
  0047c150  movn       $v0, $v1, $a1
  0047c154  sw         $v0, 0x0($a0)
.L004:
  0047c158  lw         $a0, -0x66b8($s1)
  0047c15c  lw         $v0, 0x14($s0)
  0047c160  lw         $a1, -0x66b8($s1)
  0047c164  sw         $v0, 0x4($a0)
  0047c168  lw         $v1, -0x66b8($s1)
  0047c16c  lw         $v0, 0x1c($s0)
  0047c170  lw         $a0, 0x14($v1)
  0047c174  beq        $a0, $zero, .L005
  0047c178  sw         $v0, 0x8($a1)                           # delay slot
  0047c17c  lui        $v0, 0x72
  0047c180  lw         $v1, 0x4($v0)                           # 0x00720004
  0047c184  bne        $v1, $zero, .L005
  0047c188  nop                                                # delay slot
  0047c18c  lw         $v1, -0x66b8($s1)
  0047c190  lw         $a0, -0x66b8($s1)
  0047c194  lw         $v0, 0x14($v1)
  0047c198  jalr       $v0
  0047c19c  nop                                                # delay slot
.L005:
  0047c1a0  sw         $zero, -0x66b8($s1)
.L006:
  0047c1a4  jal        func_0047B8E8
  0047c1a8  nop                                                # delay slot
  0047c1ac  b          .L016
  0047c1b0  nop                                                # delay slot
.L007:
  0047c1b4  addiu      $v0, $zero, 0x4
  0047c1b8  beq        $a1, $v0, .L010
  0047c1bc  sltiu      $v0, $a1, 0x5                           # delay slot
  0047c1c0  beq        $v0, $zero, .L008
  0047c1c4  addiu      $v0, $zero, 0x3                         # delay slot
  0047c1c8  beq        $a1, $v0, .L009
  0047c1cc  lui        $v1, 0x7b                               # delay slot
  0047c1d0  b          .L016
  0047c1d4  nop                                                # delay slot
.L008:
  0047c1d8  addiu      $v0, $zero, 0x5
  0047c1dc  beql       $a1, $v0, .L015
  0047c1e0  lw         $a1, 0x14($s0)                          # delay slot
  0047c1e4  b          .L016
  0047c1e8  nop                                                # delay slot
.L009:
  0047c1ec  addiu      $v0, $zero, 0x1
  0047c1f0  sw         $v0, -0x67d4($v1)
  0047c1f4  b          .L016
  0047c1f8  nop                                                # delay slot
.L010:
  0047c1fc  jal        func_0047DBF8
  0047c200  nop                                                # delay slot
  0047c204  daddu      $s2, $v0, $zero
  0047c208  lui        $v1, 0x7b
  0047c20c  lui        $v0, 0x7b
  0047c210  addiu      $v1, $v1, -0x6698
  0047c214  addiu      $v0, $v0, -0x66b0
  0047c218  lw         $s1, 0x14($v0)
  0047c21c  beq        $s1, $v1, .L016
  0047c220  daddu      $s6, $v1, $zero                         # delay slot
  0047c224  addiu      $s5, $zero, 0x2
  0047c228  daddu      $s0, $s1, $zero
  0047c22c  nop
.L011:
  0047c230  lw         $s1, 0x14($s1)
  0047c234  lw         $v0, 0x0($s0)
  0047c238  bne        $v0, $s5, .L014
  0047c23c  nop                                                # delay slot
  0047c240  lw         $v0, 0xc($s0)
  0047c244  lw         $a0, 0x8($s0)
  0047c248  subu       $v0, $s2, $v0
  0047c24c  sltu       $v0, $a0, $v0
  0047c250  beq        $v0, $zero, .L014
  0047c254  nop                                                # delay slot
  0047c258  lui        $s4, 0x72
  0047c25c  addiu      $s3, $zero, 0x2
.L012:
  0047c260  lw         $v0, 0xc($s0)
  0047c264  lw         $v1, 0x4($s0)
  0047c268  addu       $v0, $v0, $a0
  0047c26c  sw         $v0, 0xc($s0)
  0047c270  beq        $v1, $zero, .L013
  0047c274  lw         $v0, 0x4($s4)                           # delay slot; 0x00720004
  0047c278  bne        $v0, $zero, .L013
  0047c27c  nop                                                # delay slot
  0047c280  jalr       $v1
  0047c284  daddu      $a0, $s0, $zero                         # delay slot
.L013:
  0047c288  lw         $v0, 0x0($s0)
  0047c28c  bne        $v0, $s3, .L014
  0047c290  nop                                                # delay slot
  0047c294  lw         $v0, 0xc($s0)
  0047c298  lw         $a0, 0x8($s0)
  0047c29c  subu       $v0, $s2, $v0
  0047c2a0  sltu       $v0, $a0, $v0
  0047c2a4  bne        $v0, $zero, .L012
  0047c2a8  nop                                                # delay slot
.L014:
  0047c2ac  bne        $s1, $s6, .L011
  0047c2b0  daddu      $s0, $s1, $zero                         # delay slot
  0047c2b4  b          .L016
  0047c2b8  nop                                                # delay slot
.L015:
  0047c2bc  jal        func_0047BDE8
  0047c2c0  lw         $a0, 0x10($s0)                          # delay slot
.L016:
  0047c2c4  lw         $v0, 0x8($s7)
  0047c2c8  ld         $s0, 0x0($sp)
  0047c2cc  addiu      $v0, $v0, -0x1
  0047c2d0  ld         $s1, 0x8($sp)
  0047c2d4  sw         $v0, 0x8($s7)
  0047c2d8  ld         $s2, 0x10($sp)
  0047c2dc  ld         $s3, 0x18($sp)
  0047c2e0  ld         $s4, 0x20($sp)
  0047c2e4  ld         $s5, 0x28($sp)
  0047c2e8  ld         $s6, 0x30($sp)
  0047c2ec  ld         $s7, 0x38($sp)
  0047c2f0  ld         $ra, 0x40($sp)
  0047c2f4  jr         $ra
  0047c2f8  addiu      $sp, $sp, 0x50                          # delay slot
/* end of func_0047BF98 */
