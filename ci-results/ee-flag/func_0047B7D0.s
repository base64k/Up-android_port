/**************************************************************************
 * func_0047B7D0
 *
 * address      : 0x0047b7d0 .. 0x0047b8e8  (280 bytes, 70 instructions)
 * discovered by: called
 * called from  : 0x0047b9a0
 */
glabel func_0047B7D0
  0047b7d0  addiu      $sp, $sp, -0x30
  0047b7d4  lui        $v1, 0x7b
  0047b7d8  sd         $s1, 0x8($sp)
  0047b7dc  daddu      $a1, $a0, $zero
  0047b7e0  sd         $s2, 0x10($sp)
  0047b7e4  lui        $s1, 0x7b
  0047b7e8  sd         $s3, 0x18($sp)
  0047b7ec  lui        $s2, 0x7b
  0047b7f0  lw         $v0, -0x67d4($v1)
  0047b7f4  lui        $s3, 0x7b
  0047b7f8  sd         $s0, 0x0($sp)
  0047b7fc  bne        $v0, $zero, .L001
  0047b800  sd         $ra, 0x20($sp)                          # delay slot
  0047b804  nop
.L000:
  0047b808  lw         $v0, -0x67d4($v1)
  0047b80c  nop
  0047b810  nop
  0047b814  nop
  0047b818  nop
  0047b81c  beq        $v0, $zero, .L000
  0047b820  nop                                                # delay slot
.L001:
  0047b824  lw         $v1, -0x6400($s2)
  0047b828  addiu      $v0, $s3, -0x6580
  0047b82c  addiu      $a0, $zero, 0x1
  0047b830  addiu      $a2, $s1, -0x6500
  0047b834  sw         $v1, 0x10($v0)
  0047b838  sw         $a0, 0xc($v0)
  0047b83c  daddu      $a0, $a2, $zero
  0047b840  lbu        $v0, 0x0($a1)
  0047b844  sll        $v1, $v0, 24
  0047b848  beq        $v1, $zero, .L003
  0047b84c  sb         $v0, -0x6500($s1)                       # delay slot
.L002:
  0047b850  addiu      $a1, $a1, 0x1
  0047b854  addiu      $a0, $a0, 0x1
  0047b858  lbu        $v0, 0x0($a1)
  0047b85c  sll        $v1, $v0, 24
  0047b860  nop
  0047b864  bne        $v1, $zero, .L002
  0047b868  sb         $v0, 0x0($a0)                           # delay slot
.L003:
  0047b86c  subu       $v0, $a0, $a2
  0047b870  addiu      $v1, $zero, -0x10
  0047b874  addiu      $v0, $v0, 0x10
  0047b878  addiu      $a0, $s1, -0x6500
  0047b87c  and        $s0, $v0, $v1
  0047b880  addiu      $a1, $a0, -0x1
  0047b884  jal        func_003DCE98
  0047b888  addu       $a1, $s0, $a1                           # delay slot
  0047b88c  lui        $v0, 0x72
  0047b890  lw         $v1, 0x8($v0)                           # 0x00720008
  0047b894  beq        $v1, $zero, .L004
  0047b898  lui        $v0, 0x3e                               # delay slot
  0047b89c  b          .L005
  0047b8a0  addiu      $v1, $v0, -0x1238                       # delay slot
.L004:
  0047b8a4  lui        $v0, 0x3e
  0047b8a8  addiu      $v1, $v0, -0x1278                       # 0x003ded88 -> func_003DED88
.L005:
  0047b8ac  lui        $v0, 0x7b
  0047b8b0  lw         $t0, -0x6400($s2)
  0047b8b4  lw         $a0, -0x67e0($v0)
  0047b8b8  addiu      $a1, $s3, -0x6580
  0047b8bc  addiu      $a3, $s1, -0x6500
  0047b8c0  daddu      $t1, $s0, $zero
  0047b8c4  jalr       $v1
  0047b8c8  addiu      $a2, $zero, 0x14                        # delay slot
  0047b8cc  ld         $s0, 0x0($sp)
  0047b8d0  ld         $s1, 0x8($sp)
  0047b8d4  ld         $s2, 0x10($sp)
  0047b8d8  ld         $s3, 0x18($sp)
  0047b8dc  ld         $ra, 0x20($sp)
  0047b8e0  jr         $ra
  0047b8e4  addiu      $sp, $sp, 0x30                          # delay slot
/* end of func_0047B7D0 */
