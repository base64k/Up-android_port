/**************************************************************************
 * func_004B77E0
 *
 * address      : 0x004b77e0 .. 0x004b78f4  (276 bytes, 69 instructions)
 * discovered by: called
 * called from  : 0x004b6898, 0x004b6a0c, 0x004b6d44, 0x004b7218, 0x004b7294
 */
glabel func_004B77E0
  004b77e0  addiu      $sp, $sp, -0x70
  004b77e4  sd         $ra, 0x60($sp)
  004b77e8  sq         $s5, 0x50($sp)
  004b77ec  sq         $s4, 0x40($sp)
  004b77f0  sq         $s3, 0x30($sp)
  004b77f4  sq         $s2, 0x20($sp)
  004b77f8  sq         $s1, 0x10($sp)
  004b77fc  sq         $s0, 0x0($sp)
  004b7800  lb         $v1, 0x470($a0)
  004b7804  bne        $v1, $zero, .L003
  004b7808  daddu      $s5, $a0, $zero                         # delay slot
  004b780c  lb         $v1, 0x471($s5)
  004b7810  beq        $v1, $zero, .L003
  004b7814  nop                                                # delay slot
  004b7818  addiu      $v0, $zero, 0x1
  004b781c  daddu      $a2, $zero, $zero
  004b7820  sb         $v0, 0x470($s5)
  004b7824  daddu      $a3, $zero, $zero
  004b7828  lw         $v1, 0x424($s5)
  004b782c  daddu      $t0, $zero, $zero
  004b7830  addiu      $t1, $zero, 0x4
  004b7834  sll        $v0, $v1, 1
  004b7838  addu       $v0, $v0, $v1
  004b783c  sra        $s0, $v0, 1
  004b7840  jal        func_004B68C0
  004b7844  sll        $a1, $s0, 6                             # delay slot
  004b7848  lw         $s2, 0x8($s5)
  004b784c  daddu      $s1, $v0, $zero
  004b7850  daddu      $s3, $zero, $zero
  004b7854  daddu      $s4, $zero, $zero
.L000:
  004b7858  addu       $v1, $s5, $s4
  004b785c  lw         $v1, 0x428($v1)
  004b7860  beq        $v1, $zero, .L001
  004b7864  nop                                                # delay slot
  004b7868  lw         $v0, 0x424($s5)
  004b786c  sll        $a2, $v1, 2
  004b7870  mult       $v1, $s3, $s0
  004b7874  sll        $v1, $v1, 2
  004b7878  mult1      $v0, $s3, $v0
  004b787c  addu       $a0, $s1, $v1
  004b7880  sll        $v0, $v0, 2
  004b7884  jal        func_002E05B0
  004b7888  addu       $a1, $s2, $v0                           # delay slot
.L001:
  004b788c  nop
  004b7890  addiu      $s3, $s3, 0x1
  004b7894  slti       $v1, $s3, 0x10
  004b7898  bne        $v1, $zero, .L000
  004b789c  addiu      $s4, $s4, 0x4                           # delay slot
  004b78a0  sw         $s1, 0x8($s5)
  004b78a4  sw         $s0, 0x424($s5)
  004b78a8  lb         $v1, 0x472($s5)
  004b78ac  beq        $v1, $zero, .L002
  004b78b0  addiu      $v1, $zero, 0x1                         # delay slot
  004b78b4  daddu      $a1, $s2, $zero
  004b78b8  jal        func_004B66F0
  004b78bc  daddu      $a0, $s5, $zero                         # delay slot
  004b78c0  addiu      $v1, $zero, 0x1
.L002:
  004b78c4  sb         $v1, 0x472($s5)
  004b78c8  sb         $zero, 0x470($s5)
  004b78cc  sb         $zero, 0x471($s5)
.L003:
  004b78d0  ld         $ra, 0x60($sp)
  004b78d4  lq         $s5, 0x50($sp)
  004b78d8  lq         $s4, 0x40($sp)
  004b78dc  lq         $s3, 0x30($sp)
  004b78e0  lq         $s2, 0x20($sp)
  004b78e4  lq         $s1, 0x10($sp)
  004b78e8  lq         $s0, 0x0($sp)
  004b78ec  jr         $ra
  004b78f0  addiu      $sp, $sp, 0x70                          # delay slot
/* end of func_004B77E0 */
