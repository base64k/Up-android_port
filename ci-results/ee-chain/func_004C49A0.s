/**************************************************************************
 * func_004C49A0
 *
 * address      : 0x004c49a0 .. 0x004c4eac  (1292 bytes, 323 instructions)
 * discovered by: pointer
 * called from  : no direct calls (indirect or unreferenced)
 */
glabel func_004C49A0
  004c49a0  addiu      $sp, $sp, -0x70
  004c49a4  sd         $ra, 0x40($sp)
  004c49a8  sq         $s2, 0x30($sp)
  004c49ac  sq         $s1, 0x20($sp)
  004c49b0  daddu      $s2, $a0, $zero
  004c49b4  sq         $s0, 0x10($sp)
  004c49b8  swc1       $f21, 0x4($sp)
  004c49bc  swc1       $f20, 0x0($sp)
  004c49c0  lb         $v0, 0x5($a0)
  004c49c4  beq        $v0, $zero, .L000
  004c49c8  mov.s      $f21, $f12                              # delay slot
  004c49cc  b          .L025
  004c49d0  daddu      $v0, $zero, $zero                       # delay slot
.L000:
  004c49d4  lw         $t9, 0x154($s2)
  004c49d8  lw         $t9, 0x28($t9)
  004c49dc  jalr       $t9
  004c49e0  addiu      $a0, $s2, 0x14c                         # delay slot
  004c49e4  lw         $v1, 0x158($s2)
  004c49e8  addiu      $v0, $zero, 0x1
  004c49ec  beq        $v1, $v0, .L001
  004c49f0  addiu      $a2, $zero, 0x2                         # delay slot
  004c49f4  bne        $v1, $a2, .L002
  004c49f8  addiu      $a1, $zero, 0x3                         # delay slot
.L001:
  004c49fc  lwc1       $f0, -0x71e0($gp)
  004c4a00  addiu      $v0, $zero, 0x1
  004c4a04  add.s      $f0, $f0, $f21
  004c4a08  b          .L025
  004c4a0c  swc1       $f0, -0x71e0($gp)                       # delay slot
.L002:
  004c4a10  bne        $v1, $a1, .L003
  004c4a14  nop                                                # delay slot
  004c4a18  b          .L026
  004c4a1c  ld         $ra, 0x40($sp)                          # delay slot
.L003:
  004c4a20  lw         $a0, 0x8($s2)
  004c4a24  addiu      $v1, $zero, 0x9
  004c4a28  beq        $a0, $v1, .L023
  004c4a2c  addiu      $v1, $zero, 0x4                         # delay slot
  004c4a30  beq        $a0, $v1, .L008
  004c4a34  nop                                                # delay slot
  004c4a38  beq        $a0, $a1, .L007
  004c4a3c  nop                                                # delay slot
  004c4a40  beq        $a0, $a2, .L006
  004c4a44  nop                                                # delay slot
  004c4a48  beq        $a0, $v0, .L005
  004c4a4c  nop                                                # delay slot
  004c4a50  beq        $a0, $zero, .L004
  004c4a54  addiu      $v0, $zero, -0x1                        # delay slot
  004c4a58  beq        $a0, $v0, .L024
  004c4a5c  nop                                                # delay slot
  004c4a60  b          .L014
  004c4a64  lwc1       $f0, -0x71d8($gp)                       # delay slot
.L004:
  004c4a68  lw         $t9, 0x154($s2)
  004c4a6c  addiu      $a0, $s2, 0x14c
  004c4a70  lw         $t9, 0x1c($t9)
  004c4a74  jalr       $t9
  004c4a78  addiu      $a1, $s2, 0x3c                          # delay slot
  004c4a7c  lw         $v0, 0x8($s2)
  004c4a80  addiu      $v0, $v0, 0x1
  004c4a84  b          .L024
  004c4a88  sw         $v0, 0x8($s2)                           # delay slot
.L005:
  004c4a8c  lw         $t9, 0x154($s2)
  004c4a90  lui        $a1, 0x7b
  004c4a94  daddu      $a3, $v0, $zero
  004c4a98  addiu      $a0, $s2, 0x14c
  004c4a9c  addiu      $a1, $a1, -0x5980
  004c4aa0  lw         $t9, 0x20($t9)
  004c4aa4  jalr       $t9
  004c4aa8  daddu      $a2, $zero, $zero                       # delay slot
  004c4aac  lw         $v0, 0x8($s2)
  004c4ab0  addiu      $v0, $v0, 0x1
  004c4ab4  b          .L024
  004c4ab8  sw         $v0, 0x8($s2)                           # delay slot
.L006:
  004c4abc  lw         $t9, 0x0($s2)
  004c4ac0  lui        $a1, 0x7b
  004c4ac4  daddu      $a0, $s2, $zero
  004c4ac8  lw         $t9, 0x10($t9)
  004c4acc  jalr       $t9
  004c4ad0  addiu      $a1, $a1, -0x5980                       # delay slot
  004c4ad4  beq        $v0, $zero, .L024
  004c4ad8  nop                                                # delay slot
  004c4adc  lw         $v0, 0x8($s2)
  004c4ae0  addiu      $v0, $v0, 0x1
  004c4ae4  b          .L024
  004c4ae8  sw         $v0, 0x8($s2)                           # delay slot
.L007:
  004c4aec  lw         $a1, 0x28($s2)
  004c4af0  jal        func_004C4F40
  004c4af4  daddu      $a0, $s2, $zero                         # delay slot
  004c4af8  lw         $v0, 0x8($s2)
  004c4afc  addiu      $v0, $v0, 0x1
  004c4b00  b          .L024
  004c4b04  sw         $v0, 0x8($s2)                           # delay slot
.L008:
  004c4b08  lwc1       $f1, 0x14c($s2)
  004c4b0c  lui        $v0, 0x7b
  004c4b10  lwc1       $f0, -0x71dc($gp)
  004c4b14  addiu      $v0, $v0, -0x585c
  004c4b18  add.s      $f0, $f0, $f1
  004c4b1c  swc1       $f0, -0x71dc($gp)
  004c4b20  lw         $a0, 0x28($s2)
  004c4b24  sll        $v1, $a0, 1
  004c4b28  addu       $v1, $v1, $a0
  004c4b2c  sll        $v1, $v1, 3
  004c4b30  addu       $v0, $v0, $v1
  004c4b34  lw         $v0, 0x0($v0)
  004c4b38  bgez       $v0, .L009
  004c4b3c  sra        $v1, $v0, 11                            # delay slot
  004c4b40  addiu      $v0, $v0, 0x7ff
  004c4b44  sra        $v1, $v0, 11
.L009:
  004c4b48  lw         $v0, 0xc($s2)
  004c4b4c  daddu      $a0, $s2, $zero
  004c4b50  addu       $v0, $v0, $v1
  004c4b54  sw         $v0, 0xc($s2)
  004c4b58  lw         $v0, 0x28($s2)
  004c4b5c  jal        func_004C4F40
  004c4b60  addiu      $a1, $v0, 0x1                           # delay slot
  004c4b64  lw         $a3, 0x28($s2)
  004c4b68  lui        $a2, 0x7b
  004c4b6c  addiu      $v1, $s2, 0x18
  004c4b70  addiu      $v0, $s2, 0x10
  004c4b74  addiu      $a2, $a2, -0x5980
  004c4b78  sll        $a0, $a3, 1
  004c4b7c  andi       $a1, $a3, 0x1
  004c4b80  addu       $a3, $a0, $a3
  004c4b84  sll        $a0, $a1, 1
  004c4b88  addu       $a0, $a0, $a1
  004c4b8c  sll        $a0, $a0, 2
  004c4b90  sll        $a1, $a3, 3
  004c4b94  addu       $v1, $v1, $a0
  004c4b98  addu       $a1, $a2, $a1
  004c4b9c  lw         $v1, 0x0($v1)
  004c4ba0  addu       $v0, $v0, $a0
  004c4ba4  addiu      $s0, $a1, 0x120
  004c4ba8  sw         $v1, 0x2c($s2)
  004c4bac  lw         $v0, 0x0($v0)
  004c4bb0  sw         $v0, 0x30($s2)
  004c4bb4  lw         $v1, 0x120($a1)
  004c4bb8  addiu      $v0, $v1, -0x1
  004c4bbc  beq        $v1, $zero, .L013
  004c4bc0  sw         $v0, 0x120($a1)                         # delay slot
.L010:
  004c4bc4  lui        $at, 0x79
  004c4bc8  lw         $s1, 0x2c($s2)
  004c4bcc  lw         $a0, 0x5f70($at)
  004c4bd0  jal        func_003078A0
  004c4bd4  addiu      $a1, $s2, 0x2c                          # delay slot
  004c4bd8  beq        $v0, $zero, .L012
  004c4bdc  nop                                                # delay slot
  004c4be0  lhu        $a0, 0x13c($s2)
  004c4be4  andi       $v0, $a0, 0x3fff
  004c4be8  bne        $v0, $zero, .L011
  004c4bec  addiu      $v0, $zero, -0x4000                     # delay slot
  004c4bf0  daddiu     $v1, $zero, 0x20
  004c4bf4  and        $v0, $a0, $v0
  004c4bf8  or         $v0, $v0, $v1
  004c4bfc  addiu      $a0, $s2, 0x13c
  004c4c00  sh         $v0, 0x13c($s2)
  004c4c04  lw         $v0, 0x13c($s2)
  004c4c08  lhu        $v1, 0x13c($s2)
  004c4c0c  dsll32     $v0, $v0, 0
  004c4c10  andi       $v1, $v1, 0x3fff
  004c4c14  dsrl32     $v0, $v0, 14
  004c4c18  jal        func_004C4EB0
  004c4c1c  addu       $a1, $v1, $v0                           # delay slot
.L011:
  004c4c20  lw         $a0, 0x13c($s2)
  004c4c24  addiu      $v0, $zero, -0x1
  004c4c28  lw         $a2, 0x34($s2)
  004c4c2c  dsll32     $v1, $v0, 0
  004c4c30  addiu      $v0, $zero, 0x3fff
  004c4c34  or         $v1, $v0, $v1
  004c4c38  addiu      $v0, $zero, -0x4000
  004c4c3c  and        $v1, $a0, $v1
  004c4c40  dsll32     $a0, $a0, 0
  004c4c44  dsrl32     $a0, $a0, 14
  004c4c48  addiu      $a1, $a0, 0x1
  004c4c4c  dsll32     $a1, $a1, 14
  004c4c50  sll        $a0, $a0, 2
  004c4c54  dsrl32     $a1, $a1, 14
  004c4c58  sll        $a1, $a1, 14
  004c4c5c  or         $v1, $v1, $a1
  004c4c60  sw         $v1, 0x13c($s2)
  004c4c64  lw         $v1, 0x140($s2)
  004c4c68  addu       $v1, $v1, $a0
  004c4c6c  sw         $a2, 0x0($v1)
  004c4c70  lhu        $v1, 0x13c($s2)
  004c4c74  and        $v0, $v1, $v0
  004c4c78  andi       $v1, $v1, 0x3fff
  004c4c7c  addiu      $v1, $v1, -0x1
  004c4c80  andi       $v1, $v1, 0x3fff
  004c4c84  or         $v0, $v0, $v1
  004c4c88  sh         $v0, 0x13c($s2)
.L012:
  004c4c8c  nop
  004c4c90  sw         $zero, 0x60($sp)
  004c4c94  sw         $zero, 0x64($sp)
  004c4c98  addiu      $a0, $sp, 0x50
  004c4c9c  lw         $a1, 0x2c($s2)
  004c4ca0  jal        func_002E05B0
  004c4ca4  addiu      $a2, $zero, 0x18                        # delay slot
  004c4ca8  lw         $v0, 0x50($sp)
  004c4cac  addu       $v0, $s1, $v0
  004c4cb0  addiu      $v0, $v0, 0x18
  004c4cb4  sw         $v0, 0x2c($s2)
  004c4cb8  lw         $v1, 0x0($s0)
  004c4cbc  addiu      $v0, $v1, -0x1
  004c4cc0  bne        $v1, $zero, .L010
  004c4cc4  sw         $v0, 0x0($s0)                           # delay slot
.L013:
  004c4cc8  lw         $v0, 0x28($s2)
  004c4ccc  lui        $at, 0x7b
  004c4cd0  addiu      $v0, $v0, 0x1
  004c4cd4  sw         $v0, 0x28($s2)
  004c4cd8  lw         $v1, 0x28($s2)
  004c4cdc  lw         $v0, -0x587c($at)
  004c4ce0  bne        $v1, $v0, .L025
  004c4ce4  addiu      $v0, $zero, 0x1                         # delay slot
  004c4ce8  lw         $v0, 0x13c($s2)
  004c4cec  dsll32     $v0, $v0, 0
  004c4cf0  dsrl32     $v0, $v0, 14
  004c4cf4  sw         $v0, 0x144($s2)
  004c4cf8  lw         $v0, 0x8($s2)
  004c4cfc  addiu      $v0, $v0, 0x1
  004c4d00  b          .L024
  004c4d04  sw         $v0, 0x8($s2)                           # delay slot
.L014:
  004c4d08  add.s      $f0, $f0, $f21
  004c4d0c  jal        func_002E0480
  004c4d10  swc1       $f0, -0x71d8($gp)                       # delay slot
  004c4d14  b          .L020
  004c4d18  mov.s      $f20, $f0                               # delay slot
.L015:
  004c4d1c  lw         $v1, 0x8($s2)
  004c4d20  addiu      $v0, $zero, 0x7
  004c4d24  beq        $v1, $v0, .L018
  004c4d28  addiu      $v0, $zero, 0x6                         # delay slot
  004c4d2c  beq        $v1, $v0, .L017
  004c4d30  nop                                                # delay slot
  004c4d34  addiu      $v0, $zero, 0x5
  004c4d38  beq        $v1, $v0, .L016
  004c4d3c  nop                                                # delay slot
  004c4d40  b          .L019
  004c4d44  nop                                                # delay slot
.L016:
  004c4d48  lw         $v1, 0x144($s2)
  004c4d4c  lw         $v0, 0x140($s2)
  004c4d50  sll        $v1, $v1, 2
  004c4d54  addu       $v0, $v0, $v1
  004c4d58  lw         $a0, 0x0($v0)
  004c4d5c  lw         $t9, 0x8($a0)
  004c4d60  lw         $t9, 0x18($t9)
  004c4d64  jalr       $t9
  004c4d68  nop                                                # delay slot
  004c4d6c  b          .L019
  004c4d70  nop                                                # delay slot
.L017:
  004c4d74  nop
  004c4d78  lw         $v1, 0x144($s2)
  004c4d7c  lw         $v0, 0x140($s2)
  004c4d80  sll        $v1, $v1, 2
  004c4d84  addu       $v0, $v0, $v1
  004c4d88  lw         $a0, 0x0($v0)
  004c4d8c  lw         $t9, 0x8($a0)
  004c4d90  lw         $t9, 0x1c($t9)
  004c4d94  jalr       $t9
  004c4d98  nop                                                # delay slot
  004c4d9c  b          .L019
  004c4da0  nop                                                # delay slot
.L018:
  004c4da4  nop
  004c4da8  lw         $v1, 0x144($s2)
  004c4dac  lw         $v0, 0x140($s2)
  004c4db0  sll        $v1, $v1, 2
  004c4db4  addu       $v0, $v0, $v1
  004c4db8  lw         $a0, 0x0($v0)
  004c4dbc  lw         $t9, 0x8($a0)
  004c4dc0  lw         $t9, 0x20($t9)
  004c4dc4  jalr       $t9
  004c4dc8  nop                                                # delay slot
.L019:
  004c4dcc  nop
  004c4dd0  jal        func_002E0480
  004c4dd4  nop                                                # delay slot
  004c4dd8  sub.s      $f1, $f0, $f20
  004c4ddc  sub.s      $f21, $f21, $f1
  004c4de0  mov.s      $f20, $f0
.L020:
  004c4de4  nop
  004c4de8  mtc1       $zero, $f0
  004c4dec  nop
  004c4df0  c.le.s     $f21, $f0
  004c4df4  nop
  004c4df8  bc1t       .L021
  004c4dfc  nop                                                # delay slot
  004c4e00  lw         $v1, 0x144($s2)
  004c4e04  addiu      $v0, $v1, -0x1
  004c4e08  bne        $v1, $zero, .L015
  004c4e0c  sw         $v0, 0x144($s2)                         # delay slot
.L021:
  004c4e10  lw         $v0, 0x144($s2)
  004c4e14  bgez       $v0, .L022
  004c4e18  nop                                                # delay slot
  004c4e1c  lw         $v0, 0x8($s2)
  004c4e20  addiu      $v0, $v0, 0x1
  004c4e24  sw         $v0, 0x8($s2)
  004c4e28  lw         $v0, 0x13c($s2)
  004c4e2c  dsll32     $v0, $v0, 0
  004c4e30  dsrl32     $v0, $v0, 14
  004c4e34  sw         $v0, 0x144($s2)
.L022:
  004c4e38  lw         $v1, 0x8($s2)
  004c4e3c  addiu      $v0, $zero, 0x8
  004c4e40  bne        $v1, $v0, .L024
  004c4e44  nop                                                # delay slot
  004c4e48  lw         $t9, 0x0($s2)
  004c4e4c  addiu      $a1, $zero, 0x1
  004c4e50  daddu      $a0, $s2, $zero
  004c4e54  lw         $t9, 0x14($t9)
  004c4e58  jalr       $t9
  004c4e5c  daddu      $a2, $a1, $zero                         # delay slot
  004c4e60  b          .L025
  004c4e64  daddu      $v0, $zero, $zero                       # delay slot
.L023:
  004c4e68  lw         $t9, 0x0($s2)
  004c4e6c  daddu      $a0, $s2, $zero
  004c4e70  daddu      $a1, $v0, $zero
  004c4e74  lw         $t9, 0x14($t9)
  004c4e78  jalr       $t9
  004c4e7c  daddu      $a2, $v0, $zero                         # delay slot
  004c4e80  b          .L025
  004c4e84  daddu      $v0, $zero, $zero                       # delay slot
.L024:
  004c4e88  addiu      $v0, $zero, 0x1
.L025:
  004c4e8c  ld         $ra, 0x40($sp)
.L026:
  004c4e90  lwc1       $f21, 0x4($sp)
  004c4e94  lq         $s2, 0x30($sp)
  004c4e98  lwc1       $f20, 0x0($sp)
  004c4e9c  lq         $s1, 0x20($sp)
  004c4ea0  lq         $s0, 0x10($sp)
  004c4ea4  jr         $ra
  004c4ea8  addiu      $sp, $sp, 0x70                          # delay slot
/* end of func_004C49A0 */
