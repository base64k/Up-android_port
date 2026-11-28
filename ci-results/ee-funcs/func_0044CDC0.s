/**************************************************************************
 * func_0044CDC0
 *
 * address      : 0x0044cdc0 .. 0x0044ced4  (276 bytes, 69 instructions)
 * discovered by: called
 * called from  : 0x002ded30
 * string hint  : "Anonymous Alloc"
 */
glabel func_0044CDC0
  0044cdc0  addiu      $sp, $sp, -0x10
  0044cdc4  sd         $ra, 0x0($sp)
  0044cdc8  jal        func_003DF000
  0044cdcc  daddu      $a0, $zero, $zero                       # delay slot
  0044cdd0  sync
  0044cdd4  sync
  0044cdd8  jal        func_0044D190
  0044cddc  nop                                                # delay slot
.L000:
  0044cde0  lui        $a0, 0x7a
  0044cde4  lui        $v0, 0x100
  0044cde8  addiu      $a0, $a0, 0x7bc0
  0044cdec  ori        $a1, $v0, 0x1
  0044cdf0  jal        func_003DF798
  0044cdf4  daddu      $a2, $zero, $zero                       # delay slot
  0044cdf8  addiu      $v1, $zero, 0x2710
.L001:
  0044cdfc  nop
  0044ce00  daddu      $v0, $v1, $zero
  0044ce04  addiu      $v1, $v1, -0x1
  0044ce08  nop
  0044ce0c  nop
  0044ce10  nop
  0044ce14  bne        $v0, $zero, .L001
  0044ce18  nop                                                # delay slot
  0044ce1c  lui        $at, 0x7a
  0044ce20  lw         $v0, 0x7be4($at)
  0044ce24  beq        $v0, $zero, .L000
  0044ce28  nop                                                # delay slot
  0044ce2c  jal        func_003DC820
  0044ce30  daddu      $a0, $zero, $zero                       # delay slot
  0044ce34  sync
  0044ce38  sync
  0044ce3c  addiu      $a0, $zero, 0x1
  0044ce40  jal        func_0044CEE0
  0044ce44  addiu      $a1, $zero, 0x201                       # delay slot
  0044ce48  lui        $a0, 0x7a
  0044ce4c  daddu      $a1, $zero, $zero
  0044ce50  addiu      $a0, $a0, 0x7c00
  0044ce54  jal        func_003F18EC
  0044ce58  addiu      $a2, $zero, 0x400                       # delay slot
  0044ce5c  lui        $a0, 0x7b
  0044ce60  daddu      $a1, $zero, $zero
  0044ce64  addiu      $a0, $a0, -0x8000
  0044ce68  jal        func_003F18EC
  0044ce6c  addiu      $a2, $zero, 0x400                       # delay slot
  0044ce70  jal        func_003E3830
  0044ce74  addiu      $a0, $zero, 0x110                       # delay slot
  0044ce78  lui        $a1, 0x73
  0044ce7c  lui        $a2, 0x73
  0044ce80  sw         $v0, -0x72f0($gp)
  0044ce84  addiu      $a0, $zero, 0x110
  0044ce88  addiu      $a1, $a1, 0x2900                        # 0x00732900 "Anonymous Alloc"
  0044ce8c  addiu      $a2, $a2, 0x2910                        # 0x00732910 "PS2Rpc_Z.cpp"
  0044ce90  addiu      $a3, $zero, 0x4c
  0044ce94  jal        func_002DCB70
  0044ce98  addiu      $t0, $zero, 0x10                        # delay slot
  0044ce9c  addiu      $v1, $zero, -0x1
  0044cea0  lui        $at, 0x7a
  0044cea4  sw         $v1, 0x7b40($at)
  0044cea8  lui        $at, 0x7a
  0044ceac  sw         $v0, -0x72b0($gp)
  0044ceb0  sw         $v1, 0x7b44($at)
  0044ceb4  addiu      $v0, $zero, 0x1
  0044ceb8  lui        $at, 0x7a
  0044cebc  sw         $zero, 0x7b48($at)
  0044cec0  lui        $at, 0x7a
  0044cec4  sw         $zero, 0x7b4c($at)
  0044cec8  ld         $ra, 0x0($sp)
  0044cecc  jr         $ra
  0044ced0  addiu      $sp, $sp, 0x10                          # delay slot
/* end of func_0044CDC0 */
