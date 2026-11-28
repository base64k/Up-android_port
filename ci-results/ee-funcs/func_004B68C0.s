/**************************************************************************
 * func_004B68C0
 *
 * address      : 0x004b68c0 .. 0x004b6a74  (436 bytes, 109 instructions)
 * discovered by: called
 * called from  : 0x002dc720, 0x004b6e40, 0x004b7840
 */
glabel func_004B68C0
  004b68c0  addiu      $sp, $sp, -0x60
  004b68c4  addiu      $v1, $zero, -0x4
  004b68c8  sd         $ra, 0x50($sp)
  004b68cc  sq         $s4, 0x40($sp)
  004b68d0  sq         $s3, 0x30($sp)
  004b68d4  sq         $s2, 0x20($sp)
  004b68d8  daddu      $s3, $a0, $zero
  004b68dc  daddu      $s2, $a1, $zero
  004b68e0  sq         $s1, 0x10($sp)
  004b68e4  addiu      $v0, $s2, 0x3
  004b68e8  daddu      $s1, $t1, $zero
  004b68ec  and        $s2, $v0, $v1
  004b68f0  sq         $s0, 0x0($sp)
  004b68f4  addiu      $v0, $s1, 0x3
  004b68f8  and        $s1, $v0, $v1
  004b68fc  addiu      $v0, $s2, 0x4
  004b6900  jal        func_004B8800
  004b6904  addu       $a1, $v0, $s1                           # delay slot
  004b6908  daddu      $s0, $v0, $zero
  004b690c  bne        $s0, $zero, .L000
  004b6910  daddu      $a0, $s3, $zero                         # delay slot
  004b6914  b          .L006
  004b6918  daddu      $v0, $zero, $zero                       # delay slot
.L000:
  004b691c  jal        func_004B9050
  004b6920  daddu      $a1, $s0, $zero                         # delay slot
  004b6924  addiu      $v0, $s1, 0x3
  004b6928  srl        $a2, $v0, 2
  004b692c  bne        $a2, $zero, .L001
  004b6930  nop                                                # delay slot
  004b6934  addiu      $a2, $zero, 0x1
.L001:
  004b6938  lbu        $v0, 0x4($s0)
  004b693c  addiu      $a1, $zero, -0x8
  004b6940  andi       $v1, $zero, 0x7
  004b6944  addiu      $a0, $zero, 0x1
  004b6948  and        $v0, $v0, $a1
  004b694c  or         $v0, $v0, $v1
  004b6950  b          .L003
  004b6954  sb         $v0, 0x4($s0)                           # delay slot
.L002:
  004b6958  and        $v0, $a2, $v0
  004b695c  bne        $v0, $zero, .L004
  004b6960  nop                                                # delay slot
  004b6964  lbu        $v0, 0x4($s0)
  004b6968  addiu      $v1, $v1, 0x1
  004b696c  andi       $v1, $v1, 0x7
  004b6970  and        $v0, $v0, $a1
  004b6974  or         $v0, $v0, $v1
  004b6978  sb         $v0, 0x4($s0)
.L003:
  004b697c  nop
  004b6980  lbu        $v0, 0x4($s0)
  004b6984  andi       $v1, $v0, 0x7
  004b6988  slti       $v0, $v1, 0x20
  004b698c  bne        $v0, $zero, .L002
  004b6990  sllv       $v0, $a0, $v1                           # delay slot
.L004:
  004b6994  nop
  004b6998  daddu      $a0, $s3, $zero
  004b699c  daddu      $a1, $s0, $zero
  004b69a0  jal        func_004B9080
  004b69a4  addiu      $s1, $s0, 0x8                           # delay slot
  004b69a8  daddu      $s4, $v0, $zero
  004b69ac  beq        $s4, $zero, .L005
  004b69b0  daddu      $a0, $s3, $zero                         # delay slot
  004b69b4  addu       $s1, $s1, $s4
  004b69b8  sw         $s4, -0x4($s1)
.L005:
  004b69bc  jal        func_004B8140
  004b69c0  daddu      $a1, $s0, $zero                         # delay slot
  004b69c4  addiu      $v0, $s2, 0x8
  004b69c8  daddu      $a0, $s3, $zero
  004b69cc  addu       $a2, $v0, $s4
  004b69d0  jal        func_004B7310
  004b69d4  daddu      $a1, $s0, $zero                         # delay slot
  004b69d8  lbu        $a3, 0x0($s0)
  004b69dc  andi       $v0, $zero, 0x1
  004b69e0  addiu      $a1, $zero, -0x3
  004b69e4  sll        $a2, $v0, 1
  004b69e8  sll        $v1, $v0, 2
  004b69ec  daddu      $a0, $s3, $zero
  004b69f0  addiu      $v0, $zero, -0x5
  004b69f4  and        $a1, $a3, $a1
  004b69f8  or         $a1, $a1, $a2
  004b69fc  sb         $a1, 0x0($s0)
  004b6a00  lbu        $a1, 0x0($s0)
  004b6a04  and        $v0, $a1, $v0
  004b6a08  or         $v0, $v0, $v1
  004b6a0c  jal        func_004B77E0
  004b6a10  sb         $v0, 0x0($s0)                           # delay slot
  004b6a14  daddu      $a0, $s3, $zero
  004b6a18  jal        func_004B9050
  004b6a1c  daddu      $a1, $s0, $zero                         # delay slot
  004b6a20  daddu      $a1, $s0, $zero
  004b6a24  daddu      $a0, $s3, $zero
  004b6a28  jal        func_004B9080
  004b6a2c  daddu      $s0, $v0, $zero                         # delay slot
  004b6a30  lw         $v1, 0x410($s3)
  004b6a34  addiu      $a0, $s0, -0x8
  004b6a38  subu       $a0, $a0, $v0
  004b6a3c  daddu      $v0, $s1, $zero
  004b6a40  addu       $v1, $v1, $s0
  004b6a44  sw         $v1, 0x410($s3)
  004b6a48  lw         $v1, 0x414($s3)
  004b6a4c  addu       $v1, $v1, $a0
  004b6a50  sw         $v1, 0x414($s3)
.L006:
  004b6a54  ld         $ra, 0x50($sp)
  004b6a58  lq         $s4, 0x40($sp)
  004b6a5c  lq         $s3, 0x30($sp)
  004b6a60  lq         $s2, 0x20($sp)
  004b6a64  lq         $s1, 0x10($sp)
  004b6a68  lq         $s0, 0x0($sp)
  004b6a6c  jr         $ra
  004b6a70  addiu      $sp, $sp, 0x60                          # delay slot
/* end of func_004B68C0 */
