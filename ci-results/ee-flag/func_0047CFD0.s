/**************************************************************************
 * func_0047CFD0
 *
 * address      : 0x0047cfd0 .. 0x0047d13c  (364 bytes, 91 instructions)
 * discovered by: prologue
 * called from  : no direct calls (indirect or unreferenced)
 */
glabel func_0047CFD0
  0047cfd0  addiu      $sp, $sp, -0x30
  0047cfd4  sd         $s1, 0x8($sp)
  0047cfd8  sd         $s2, 0x10($sp)
  0047cfdc  daddu      $s1, $a1, $zero
  0047cfe0  sd         $s0, 0x0($sp)
  0047cfe4  daddu      $s2, $a0, $zero
  0047cfe8  sd         $s3, 0x18($sp)
  0047cfec  beq        $s2, $zero, .L009
  0047cff0  sd         $ra, 0x20($sp)                          # delay slot
  0047cff4  lw         $v1, 0x0($s2)
  0047cff8  addiu      $v0, $zero, 0x1
  0047cffc  beq        $v1, $v0, .L000
  0047d000  nop                                                # delay slot
  0047d004  lw         $v1, 0x0($s2)
  0047d008  addiu      $v0, $zero, 0x2
  0047d00c  bne        $v1, $v0, .L010
  0047d010  daddu      $v0, $zero, $zero                       # delay slot
.L000:
  0047d014  beq        $s1, $zero, .L008
  0047d018  lui        $s3, 0x72                               # delay slot
  0047d01c  jal        func_003E55E0
  0047d020  nop                                                # delay slot
  0047d024  daddu      $a1, $v0, $zero
  0047d028  mfc0       $s0, Count
  0047d02c  lui        $a0, 0x7b
  0047d030  lui        $v1, 0x7b
  0047d034  lw         $v0, -0x6a40($a0)
  0047d038  sltu       $v0, $s0, $v0
  0047d03c  beq        $v0, $zero, .L001
  0047d040  lui        $v0, 0x4                                # delay slot
  0047d044  lw         $v0, -0x6a3c($v1)
  0047d048  addiu      $v0, $v0, 0x38e4
  0047d04c  sw         $v0, -0x6a3c($v1)
  0047d050  lui        $v0, 0x4
.L001:
  0047d054  sw         $s0, -0x6a40($a0)
  0047d058  ori        $v0, $v0, 0x8000
  0047d05c  divu       $s0, $v0
  0047d060  lw         $v1, -0x6a3c($v1)
  0047d064  mflo       $v0
  0047d068  beq        $a1, $zero, .L002
  0047d06c  addu       $s0, $v0, $v1                           # delay slot
  0047d070  jal        func_003E5638
  0047d074  nop                                                # delay slot
.L002:
  0047d078  lw         $v0, 0xc($s3)
  0047d07c  sw         $s0, 0xc($s2)
  0047d080  sltu       $v0, $s1, $v0
  0047d084  beq        $v0, $zero, .L007
  0047d088  sw         $s1, 0x8($s2)                           # delay slot
  0047d08c  lui        $v1, 0x7b
  0047d090  sw         $s1, 0xc($s3)
  0047d094  lw         $v0, -0x67d4($v1)
  0047d098  bne        $v0, $zero, .L004
  0047d09c  lui        $a1, 0x7b                               # delay slot
.L003:
  0047d0a0  lw         $v0, -0x67d4($v1)
  0047d0a4  nop
  0047d0a8  nop
  0047d0ac  nop
  0047d0b0  nop
  0047d0b4  beq        $v0, $zero, .L003
  0047d0b8  nop                                                # delay slot
.L004:
  0047d0bc  lui        $v0, 0x72
  0047d0c0  addiu      $v1, $a1, -0x6a00
  0047d0c4  lw         $a0, 0x8($v0)                           # 0x00720008
  0047d0c8  addiu      $v0, $zero, 0x3
  0047d0cc  sw         $s1, 0x10($v1)
  0047d0d0  beq        $a0, $zero, .L005
  0047d0d4  sw         $v0, 0xc($v1)                           # delay slot
  0047d0d8  lui        $v0, 0x3e
  0047d0dc  b          .L006
  0047d0e0  addiu      $v1, $v0, -0x1238                       # delay slot; 0x003dedc8 -> func_003DEDC8
.L005:
  0047d0e4  lui        $v0, 0x3e
  0047d0e8  addiu      $v1, $v0, -0x1278                       # 0x003ded88 -> func_003DED88
.L006:
  0047d0ec  lui        $v0, 0x7b
  0047d0f0  addiu      $a1, $a1, -0x6a00
  0047d0f4  lw         $a0, -0x67e0($v0)
  0047d0f8  addiu      $a2, $zero, 0x14
  0047d0fc  daddu      $a3, $zero, $zero
  0047d100  daddu      $t0, $zero, $zero
  0047d104  jalr       $v1
  0047d108  daddu      $t1, $zero, $zero                       # delay slot
.L007:
  0047d10c  addiu      $v0, $zero, 0x2
  0047d110  sw         $v0, 0x0($s2)
.L008:
  0047d114  b          .L010
  0047d118  lw         $v0, 0xc($s3)                           # delay slot
.L009:
  0047d11c  daddu      $v0, $zero, $zero
.L010:
  0047d120  ld         $s0, 0x0($sp)
  0047d124  ld         $s1, 0x8($sp)
  0047d128  ld         $s2, 0x10($sp)
  0047d12c  ld         $s3, 0x18($sp)
  0047d130  ld         $ra, 0x20($sp)
  0047d134  jr         $ra
  0047d138  addiu      $sp, $sp, 0x30                          # delay slot
/* end of func_0047CFD0 */
