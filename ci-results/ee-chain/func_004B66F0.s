/**************************************************************************
 * func_004B66F0
 *
 * address      : 0x004b66f0 .. 0x004b68b8  (456 bytes, 114 instructions)
 * discovered by: called
 * called from  : 0x002dc854, 0x002dcaa4, 0x002dcb44, 0x002dcc54, 0x004b6fb8, 0x004b703c (+1 more)
 */
glabel func_004B66F0
  004b66f0  addiu      $sp, $sp, -0x40
  004b66f4  sd         $ra, 0x30($sp)
  004b66f8  sq         $s2, 0x20($sp)
  004b66fc  sq         $s1, 0x10($sp)
  004b6700  sq         $s0, 0x0($sp)
  004b6704  beq        $a1, $zero, .L008
  004b6708  daddu      $s1, $a0, $zero                         # delay slot
  004b670c  lw         $v1, -0x4($a1)
  004b6710  sltiu      $v0, $v1, 0x400
  004b6714  bne        $v0, $zero, .L000
  004b6718  subu       $v0, $a1, $v1                           # delay slot
  004b671c  b          .L001
  004b6720  addiu      $s0, $a1, -0x8                          # delay slot
.L000:
  004b6724  addiu      $s0, $v0, -0x8
.L001:
  004b6728  lbu        $v0, 0x0($s0)
  004b672c  dsll32     $v0, $v0, 29
  004b6730  dsrl32     $v0, $v0, 31
  004b6734  beq        $v0, $zero, .L005
  004b6738  nop                                                # delay slot
  004b673c  lw         $v0, 0x418($s1)
  004b6740  bne        $v0, $s0, .L005
  004b6744  nop                                                # delay slot
  004b6748  lw         $v0, 0x4($s0)
  004b674c  addiu      $v1, $zero, -0x400
  004b6750  dsll32     $v0, $v0, 0
  004b6754  dsrl32     $v0, $v0, 3
  004b6758  addu       $v0, $v0, $v1
  004b675c  sll        $a0, $v0, 2
  004b6760  beq        $a0, $zero, .L005
  004b6764  nop                                                # delay slot
.L002:
  004b6768  lbu        $v1, 0x0($a0)
  004b676c  andi       $v0, $v1, 0x1
  004b6770  bne        $v0, $zero, .L003
  004b6774  dsll32     $v0, $v1, 29                            # delay slot
  004b6778  dsrl32     $v0, $v0, 31
  004b677c  beq        $v0, $zero, .L003
  004b6780  nop                                                # delay slot
  004b6784  b          .L005
  004b6788  sw         $a0, 0x418($s1)                         # delay slot
.L003:
  004b678c  lw         $v0, 0x4($a0)
  004b6790  dsll32     $v0, $v0, 0
  004b6794  dsrl32     $v0, $v0, 3
  004b6798  addiu      $v0, $v0, -0x400
  004b679c  sll        $a0, $v0, 2
  004b67a0  bne        $a0, $zero, .L004
  004b67a4  nop                                                # delay slot
  004b67a8  lw         $v0, 0x4($s1)
  004b67ac  sw         $v0, 0x418($s1)
.L004:
  004b67b0  bne        $a0, $zero, .L002
  004b67b4  nop                                                # delay slot
.L005:
  004b67b8  daddu      $a0, $s1, $zero
  004b67bc  jal        func_004B9050
  004b67c0  daddu      $a1, $s0, $zero                         # delay slot
  004b67c4  daddu      $s2, $v0, $zero
  004b67c8  daddu      $a0, $s1, $zero
  004b67cc  jal        func_004B9080
  004b67d0  daddu      $a1, $s0, $zero                         # delay slot
  004b67d4  lw         $v1, 0x410($s1)
  004b67d8  addiu      $a0, $s2, -0x8
  004b67dc  subu       $a0, $a0, $v0
  004b67e0  addiu      $a1, $zero, -0x400
  004b67e4  subu       $v0, $v1, $s2
  004b67e8  sw         $v0, 0x410($s1)
  004b67ec  lw         $v0, 0x414($s1)
  004b67f0  subu       $v0, $v0, $a0
  004b67f4  sw         $v0, 0x414($s1)
  004b67f8  lw         $v0, 0x0($s0)
  004b67fc  dsll32     $v0, $v0, 0
  004b6800  dsrl32     $v0, $v0, 3
  004b6804  addu       $v0, $v0, $a1
  004b6808  sll        $s2, $v0, 2
  004b680c  beq        $s2, $zero, .L006
  004b6810  nop                                                # delay slot
  004b6814  lbu        $v0, 0x0($s2)
  004b6818  andi       $v0, $v0, 0x1
  004b681c  beq        $v0, $zero, .L006
  004b6820  daddu      $a0, $s1, $zero                         # delay slot
  004b6824  daddu      $a1, $s2, $zero
  004b6828  jal        func_004B8140
  004b682c  daddu      $s0, $s2, $zero                         # delay slot
  004b6830  lw         $v0, 0x46c($s1)
  004b6834  daddu      $a0, $s2, $zero
  004b6838  addiu      $v0, $v0, -0x1
  004b683c  jal        func_004B54D0
  004b6840  sw         $v0, 0x46c($s1)                         # delay slot
.L006:
  004b6844  lw         $v0, 0x4($s0)
  004b6848  dsll32     $v0, $v0, 0
  004b684c  dsrl32     $v0, $v0, 3
  004b6850  addiu      $v0, $v0, -0x400
  004b6854  sll        $a1, $v0, 2
  004b6858  beq        $a1, $zero, .L007
  004b685c  nop                                                # delay slot
  004b6860  lbu        $v0, 0x0($a1)
  004b6864  andi       $v0, $v0, 0x1
  004b6868  beq        $v0, $zero, .L007
  004b686c  daddu      $a0, $s1, $zero                         # delay slot
  004b6870  jal        func_004B8140
  004b6874  nop                                                # delay slot
  004b6878  lw         $v0, 0x46c($s1)
  004b687c  daddu      $a0, $s0, $zero
  004b6880  addiu      $v0, $v0, -0x1
  004b6884  jal        func_004B54D0
  004b6888  sw         $v0, 0x46c($s1)                         # delay slot
.L007:
  004b688c  daddu      $a1, $s0, $zero
  004b6890  jal        func_004B80E0
  004b6894  daddu      $a0, $s1, $zero                         # delay slot
  004b6898  jal        func_004B77E0
  004b689c  daddu      $a0, $s1, $zero                         # delay slot
.L008:
  004b68a0  ld         $ra, 0x30($sp)
  004b68a4  lq         $s2, 0x20($sp)
  004b68a8  lq         $s1, 0x10($sp)
  004b68ac  lq         $s0, 0x0($sp)
  004b68b0  jr         $ra
  004b68b4  addiu      $sp, $sp, 0x40                          # delay slot
/* end of func_004B66F0 */
