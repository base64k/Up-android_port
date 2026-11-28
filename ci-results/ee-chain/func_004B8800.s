/**************************************************************************
 * func_004B8800
 *
 * address      : 0x004b8800 .. 0x004b88e4  (228 bytes, 57 instructions)
 * discovered by: called
 * called from  : 0x004b6900
 */
glabel func_004B8800
  004b8800  addiu      $sp, $sp, -0x40
  004b8804  sd         $ra, 0x30($sp)
  004b8808  sq         $s2, 0x20($sp)
  004b880c  sq         $s1, 0x10($sp)
  004b8810  sq         $s0, 0x0($sp)
  004b8814  daddu      $s1, $a0, $zero
  004b8818  jal        func_004B7900
  004b881c  daddu      $s0, $a1, $zero                         # delay slot
  004b8820  slti       $at, $v0, 0x10
  004b8824  beq        $at, $zero, .L002
  004b8828  sll        $a0, $v0, 2                             # delay slot
.L000:
  004b882c  addu       $v1, $s1, $a0
  004b8830  lw         $v1, 0x428($v1)
  004b8834  beq        $v1, $zero, .L001
  004b8838  nop                                                # delay slot
  004b883c  b          .L003
  004b8840  daddu      $s2, $v0, $zero                         # delay slot
.L001:
  004b8844  addiu      $v0, $v0, 0x1
  004b8848  slti       $v1, $v0, 0x10
  004b884c  bne        $v1, $zero, .L000
  004b8850  addiu      $a0, $a0, 0x4                           # delay slot
.L002:
  004b8854  nop
  004b8858  addiu      $v0, $zero, -0x1
  004b885c  daddu      $s2, $v0, $zero
.L003:
  004b8860  bltz       $v0, .L006
  004b8864  slti       $at, $v0, 0x10                          # delay slot
  004b8868  beq        $at, $zero, .L006
  004b886c  nop                                                # delay slot
  004b8870  daddu      $a0, $s1, $zero
.L004:
  004b8874  daddu      $a1, $s2, $zero
  004b8878  jal        func_004B7F00
  004b887c  daddu      $a2, $s0, $zero                         # delay slot
  004b8880  beq        $v0, $zero, .L005
  004b8884  nop                                                # delay slot
  004b8888  b          .L007
  004b888c  lw         $v1, 0x418($s1)                         # delay slot
.L005:
  004b8890  addiu      $s2, $s2, 0x1
  004b8894  slti       $v0, $s2, 0x10
  004b8898  bne        $v0, $zero, .L004
  004b889c  daddu      $a0, $s1, $zero                         # delay slot
.L006:
  004b88a0  daddu      $v0, $zero, $zero
  004b88a4  lw         $v1, 0x418($s1)
.L007:
  004b88a8  sltu       $v1, $v0, $v1
  004b88ac  bne        $v1, $zero, .L008
  004b88b0  daddu      $a0, $s1, $zero                         # delay slot
  004b88b4  jal        func_004B8520
  004b88b8  daddu      $a1, $s0, $zero                         # delay slot
  004b88bc  bne        $v0, $zero, .L008
  004b88c0  daddu      $a0, $s1, $zero                         # delay slot
  004b88c4  jal        func_004B82A0
  004b88c8  daddu      $a1, $s0, $zero                         # delay slot
.L008:
  004b88cc  ld         $ra, 0x30($sp)
  004b88d0  lq         $s2, 0x20($sp)
  004b88d4  lq         $s1, 0x10($sp)
  004b88d8  lq         $s0, 0x0($sp)
  004b88dc  jr         $ra
  004b88e0  addiu      $sp, $sp, 0x40                          # delay slot
/* end of func_004B8800 */
