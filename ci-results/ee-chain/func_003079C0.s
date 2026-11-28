/**************************************************************************
 * func_003079C0
 *
 * address      : 0x003079c0 .. 0x00307ba4  (484 bytes, 121 instructions)
 * discovered by: called
 * called from  : 0x003078cc
 */
glabel func_003079C0
  003079c0  addiu      $sp, $sp, -0x90
  003079c4  addiu      $a2, $zero, 0x18
  003079c8  sd         $ra, 0x40($sp)
  003079cc  sq         $s3, 0x30($sp)
  003079d0  sq         $s2, 0x20($sp)
  003079d4  daddu      $s3, $a0, $zero
  003079d8  sq         $s1, 0x10($sp)
  003079dc  daddu      $s2, $a1, $zero
  003079e0  sq         $s0, 0x0($sp)
  003079e4  sw         $zero, 0x60($sp)
  003079e8  addiu      $s0, $sp, 0x64
  003079ec  sw         $zero, 0x0($s0)
  003079f0  lw         $a1, 0x0($a1)
  003079f4  jal        func_002E05B0
  003079f8  addiu      $a0, $sp, 0x50                          # delay slot
  003079fc  lw         $a1, 0x0($s0)
  00307a00  jal        func_0030B9A0
  00307a04  daddu      $a0, $s3, $zero                         # delay slot
  00307a08  sll        $a2, $v0, 4
  00307a0c  lw         $a1, 0xc($s3)
  00307a10  addiu      $v0, $sp, 0x5c
  00307a14  lw         $a0, 0x58($sp)
  00307a18  lw         $v1, 0x0($v0)
  00307a1c  addiu      $s0, $zero, 0x1
  00307a20  addu       $v1, $a0, $v1
  00307a24  bne        $v1, $zero, .L000
  00307a28  addu       $s1, $a1, $a2                           # delay slot
  00307a2c  lh         $a1, 0xc($s1)
  00307a30  lw         $v1, 0x198($s3)
  00307a34  sll        $a0, $a1, 2
  00307a38  addu       $a0, $a0, $a1
  00307a3c  sll        $a0, $a0, 1
  00307a40  addu       $a0, $a0, $a1
  00307a44  sll        $a0, $a0, 2
  00307a48  addu       $v1, $v1, $a0
  00307a4c  lbu        $v1, 0x24($v1)
  00307a50  andi       $v1, $v1, 0x2
  00307a54  beq        $v1, $zero, .L000
  00307a58  nop                                                # delay slot
  00307a5c  lbu        $v0, 0x1($s1)
  00307a60  ori        $v0, $v0, 0x10
  00307a64  b          .L006
  00307a68  sb         $v0, 0x1($s1)                           # delay slot
.L000:
  00307a6c  lbu        $a0, 0x1($s1)
  00307a70  andi       $v1, $a0, 0x10
  00307a74  beq        $v1, $zero, .L003
  00307a78  andi       $v1, $a0, 0x20                          # delay slot
  00307a7c  beq        $v1, $zero, .L001
  00307a80  nop                                                # delay slot
  00307a84  daddu      $s0, $zero, $zero
.L001:
  00307a88  andi       $v1, $a0, 0x80
  00307a8c  beq        $v1, $zero, .L002
  00307a90  nop                                                # delay slot
  00307a94  daddu      $s0, $zero, $zero
.L002:
  00307a98  beq        $s0, $zero, .L006
  00307a9c  nop                                                # delay slot
.L003:
  00307aa0  lw         $v1, 0x4($s1)
  00307aa4  sw         $v1, 0x8($s2)
  00307aa8  lw         $a0, 0x0($s2)
  00307aac  lw         $v1, 0x54($sp)
  00307ab0  addiu      $a0, $a0, 0x18
  00307ab4  addu       $a0, $a0, $v1
  00307ab8  sw         $a0, 0x8c($sp)
  00307abc  lw         $v0, 0x0($v0)
  00307ac0  beq        $v0, $zero, .L004
  00307ac4  lw         $a1, 0x8c($sp)                          # delay slot
  00307ac8  lw         $a2, 0x4($s2)
  00307acc  jal        func_0032DE80
  00307ad0  addiu      $a0, $sp, 0x70                          # delay slot
  00307ad4  lw         $v0, 0x4($s2)
  00307ad8  sw         $v0, 0x8c($sp)
  00307adc  lw         $a0, 0x8($s2)
  00307ae0  lw         $t9, 0x8($a0)
  00307ae4  lw         $t9, 0x14($t9)
  00307ae8  jalr       $t9
  00307aec  addiu      $a1, $sp, 0x8c                          # delay slot
  00307af0  addiu      $a0, $sp, 0x70
  00307af4  jal        func_0032DE20
  00307af8  addiu      $a1, $zero, -0x1                        # delay slot
  00307afc  b          .L005
  00307b00  lbu        $v1, 0x1($s1)                           # delay slot
.L004:
  00307b04  lw         $a0, 0x8($s2)
  00307b08  lw         $t9, 0x8($a0)
  00307b0c  lw         $t9, 0x14($t9)
  00307b10  jalr       $t9
  00307b14  addiu      $a1, $sp, 0x8c                          # delay slot
  00307b18  lbu        $v1, 0x1($s1)
.L005:
  00307b1c  andi       $v0, $v1, 0x10
  00307b20  beq        $v0, $zero, .L006
  00307b24  ori        $v0, $v1, 0x80                          # delay slot
  00307b28  daddu      $a0, $s3, $zero
  00307b2c  sb         $v0, 0x1($s1)
  00307b30  lbu        $v0, 0x1($s1)
  00307b34  andi       $v0, $v0, 0xbf
  00307b38  sb         $v0, 0x1($s1)
  00307b3c  lw         $v0, 0x4($s1)
  00307b40  jal        func_0030CA70
  00307b44  addiu      $a1, $v0, 0x4                           # delay slot
  00307b48  lui        $at, 0x79
  00307b4c  lui        $v0, 0x4000
  00307b50  ld         $v1, 0x7228($at)
  00307b54  and        $v0, $v1, $v0
  00307b58  beq        $v0, $zero, .L006
  00307b5c  nop                                                # delay slot
  00307b60  lw         $t9, 0x88($s3)
  00307b64  daddu      $a0, $s3, $zero
  00307b68  lw         $t9, 0x40($t9)
  00307b6c  jalr       $t9
  00307b70  addiu      $a1, $s1, 0x8                           # delay slot
.L006:
  00307b74  lw         $v0, 0x4($s1)
  00307b78  daddu      $a0, $s3, $zero
  00307b7c  jal        func_0030CA70
  00307b80  addiu      $a1, $v0, 0x4                           # delay slot
  00307b84  daddu      $v0, $s0, $zero
  00307b88  ld         $ra, 0x40($sp)
  00307b8c  lq         $s3, 0x30($sp)
  00307b90  lq         $s2, 0x20($sp)
  00307b94  lq         $s1, 0x10($sp)
  00307b98  lq         $s0, 0x0($sp)
  00307b9c  jr         $ra
  00307ba0  addiu      $sp, $sp, 0x90                          # delay slot
/* end of func_003079C0 */
