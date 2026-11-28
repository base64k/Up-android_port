/**************************************************************************
 * func_0032DFA0
 *
 * address      : 0x0032dfa0 .. 0x0032e0a0  (256 bytes, 64 instructions)
 * discovered by: called
 * called from  : 0x0032df40
 */
glabel func_0032DFA0
  0032dfa0  lw         $v1, 0x4($a0)
  0032dfa4  addiu      $a1, $a1, 0x8
  0032dfa8  addu       $a3, $a2, $v1
  0032dfac  addiu      $t4, $zero, 0xe
  0032dfb0  addiu      $t3, $zero, 0x3fff
  0032dfb4  lbu        $t0, 0x0($a1)
.L000:
  0032dfb8  daddu      $v1, $zero, $zero
  0032dfbc  lbu        $t5, 0x1($a1)
  0032dfc0  lbu        $t2, 0x2($a1)
  0032dfc4  lbu        $t1, 0x3($a1)
  0032dfc8  sll        $t0, $t0, 8
  0032dfcc  addu       $t0, $t0, $t5
  0032dfd0  sll        $t0, $t0, 8
  0032dfd4  addu       $t0, $t0, $t2
  0032dfd8  addiu      $a1, $a1, 0x4
  0032dfdc  sll        $t0, $t0, 8
  0032dfe0  addu       $t0, $t0, $t1
  0032dfe4  andi       $t1, $t0, 0x3
  0032dfe8  subu       $t6, $t4, $t1
  0032dfec  srav       $t7, $t3, $t1
.L001:
  0032dff0  bgez       $t0, .L003
  0032dff4  nop                                                # delay slot
  0032dff8  lbu        $t2, 0x0($a1)
  0032dffc  lbu        $t1, 0x1($a1)
  0032e000  sll        $t5, $t2, 8
  0032e004  or         $t5, $t5, $t1
  0032e008  addiu      $a1, $a1, 0x2
  0032e00c  and        $t1, $t5, $t7
  0032e010  srav       $t2, $t5, $t6
  0032e014  addiu      $t5, $t2, 0x3
  0032e018  addiu      $t8, $t1, 0x1
  0032e01c  daddu      $t1, $t5, $zero
  0032e020  beq        $t1, $zero, .L004
  0032e024  addiu      $t5, $t5, -0x1                          # delay slot
.L002:
  0032e028  subu       $t1, $a2, $t8
  0032e02c  lbu        $t2, 0x0($t1)
  0032e030  daddu      $t1, $t5, $zero
  0032e034  sb         $t2, 0x0($a2)
  0032e038  addiu      $t5, $t5, -0x1
  0032e03c  bne        $t1, $zero, .L002
  0032e040  addiu      $a2, $a2, 0x1                           # delay slot
  0032e044  b          .L004
  0032e048  nop                                                # delay slot
.L003:
  0032e04c  nop
  0032e050  lbu        $t1, 0x0($a1)
  0032e054  sb         $t1, 0x0($a2)
  0032e058  addiu      $a1, $a1, 0x1
  0032e05c  addiu      $a2, $a2, 0x1
.L004:
  0032e060  beq        $a3, $a2, .L006
  0032e064  nop                                                # delay slot
  0032e068  lb         $t1, 0xd($a0)
  0032e06c  beq        $t1, $zero, .L005
  0032e070  sltu       $at, $a1, $a2                           # delay slot
  0032e074  bne        $at, $zero, .L006
  0032e078  nop                                                # delay slot
.L005:
  0032e07c  nop
  0032e080  addiu      $v1, $v1, 0x1
  0032e084  slti       $t1, $v1, 0x1e
  0032e088  bne        $t1, $zero, .L001
  0032e08c  sll        $t0, $t0, 1                             # delay slot
  0032e090  b          .L000
  0032e094  lbu        $t0, 0x0($a1)                           # delay slot
.L006:
  0032e098  jr         $ra
  0032e09c  nop                                                # delay slot
/* end of func_0032DFA0 */
