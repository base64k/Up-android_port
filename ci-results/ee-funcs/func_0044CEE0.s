/**************************************************************************
 * func_0044CEE0
 *
 * address      : 0x0044cee0 .. 0x0044d03c  (348 bytes, 87 instructions)
 * discovered by: called
 * called from  : 0x002f8e44, 0x002f94f8, 0x002f9d14, 0x002f9d44, 0x002f9e74, 0x002f9ee0 (+31 more)
 */
glabel func_0044CEE0
  0044cee0  addiu      $sp, $sp, -0x80
  0044cee4  sd         $ra, 0x20($sp)
  0044cee8  sq         $s0, 0x10($sp)
  0044ceec  sw         $a1, 0x40($sp)
  0044cef0  daddu      $s0, $a0, $zero
  0044cef4  sd         $a2, 0x50($sp)
  0044cef8  lui        $a0, 0x7a
  0044cefc  sd         $a3, 0x58($sp)
  0044cf00  addiu      $a0, $a0, 0x7bc0
  0044cf04  sd         $t0, 0x60($sp)
  0044cf08  sd         $t1, 0x68($sp)
  0044cf0c  sd         $t2, 0x70($sp)
  0044cf10  jal        func_003DFB60
  0044cf14  sd         $t3, 0x78($sp)                          # delay slot
  0044cf18  beq        $v0, $zero, .L001
  0044cf1c  nop                                                # delay slot
.L000:
  0044cf20  jal        func_003DC450
  0044cf24  addiu      $a0, $zero, 0xa                         # delay slot
  0044cf28  lui        $a0, 0x7a
  0044cf2c  jal        func_003DFB60
  0044cf30  addiu      $a0, $a0, 0x7bc0                        # delay slot
  0044cf34  nop
  0044cf38  bne        $v0, $zero, .L000
  0044cf3c  nop                                                # delay slot
.L001:
  0044cf40  addiu      $v1, $zero, 0x2
  0044cf44  slti       $v0, $v1, 0x8
  0044cf48  bne        $v0, $zero, .L002
  0044cf4c  addiu      $v0, $zero, 0x8                         # delay slot
  0044cf50  b          .L003
  0044cf54  daddu      $v1, $zero, $zero                       # delay slot
.L002:
  0044cf58  subu       $v0, $v0, $v1
  0044cf5c  sll        $v1, $v0, 3
.L003:
  0044cf60  addiu      $v0, $sp, 0x80
  0044cf64  lui        $a3, 0x7a
  0044cf68  subu       $a2, $v0, $v1
  0044cf6c  addiu      $a3, $a3, 0x7c00
  0044cf70  lui        $at, 0x7a
  0044cf74  addiu      $a2, $a2, 0x8
  0044cf78  sw         $a3, 0x7c00($at)
  0044cf7c  daddu      $v1, $zero, $zero
  0044cf80  lw         $a0, -0x8($a2)
  0044cf84  addiu      $v0, $zero, 0x1
  0044cf88  lui        $at, 0x7a
  0044cf8c  movz       $v1, $v0, $s0
  0044cf90  dsll32     $s0, $v1, 24
  0044cf94  lw         $a1, 0x40($sp)
  0044cf98  dsra32     $s0, $s0, 24
  0044cf9c  sw         $a0, 0x7c04($at)
  0044cfa0  addiu      $a2, $a2, 0x8
  0044cfa4  lw         $v0, -0x8($a2)
  0044cfa8  lui        $at, 0x7a
  0044cfac  sw         $v0, 0x7c08($at)
  0044cfb0  addiu      $a2, $a2, 0x8
  0044cfb4  lw         $v0, -0x8($a2)
  0044cfb8  lui        $at, 0x7a
  0044cfbc  sw         $v0, 0x7c0c($at)
  0044cfc0  addiu      $a2, $a2, 0x8
  0044cfc4  lw         $v0, -0x8($a2)
  0044cfc8  lui        $at, 0x7a
  0044cfcc  sw         $v0, 0x7c10($at)
  0044cfd0  addiu      $a2, $a2, 0x8
  0044cfd4  lw         $v0, -0x8($a2)
  0044cfd8  lui        $at, 0x7a
  0044cfdc  sw         $v0, 0x7c14($at)
  0044cfe0  addiu      $a2, $a2, 0x8
  0044cfe4  lw         $v0, -0x8($a2)
  0044cfe8  lui        $at, 0x7a
  0044cfec  sw         $v0, 0x7c18($at)
  0044cff0  sync
  0044cff4  sync
  0044cff8  lui        $a0, 0x7a
  0044cffc  addiu      $t0, $zero, 0x20
  0044d000  daddu      $a2, $s0, $zero
  0044d004  addiu      $a0, $a0, 0x7bc0
  0044d008  daddu      $t1, $a3, $zero
  0044d00c  daddu      $t2, $t0, $zero
  0044d010  daddu      $t3, $zero, $zero
  0044d014  jal        func_003DF968
  0044d018  sd         $zero, 0x0($sp)                         # delay slot
  0044d01c  sync
  0044d020  sync
  0044d024  lui        $at, 0x7a
  0044d028  ld         $ra, 0x20($sp)
  0044d02c  lq         $s0, 0x10($sp)
  0044d030  lw         $v0, 0x7c00($at)
  0044d034  jr         $ra
  0044d038  addiu      $sp, $sp, 0x80                          # delay slot
/* end of func_0044CEE0 */
