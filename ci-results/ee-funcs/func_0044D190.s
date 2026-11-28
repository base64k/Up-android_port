/**************************************************************************
 * func_0044D190
 *
 * address      : 0x0044d190 .. 0x0044d21c  (140 bytes, 35 instructions)
 * discovered by: called
 * called from  : 0x0044cdd8
 * string hint  : "Anonymous Alloc"
 */
glabel func_0044D190
  0044d190  addiu      $sp, $sp, -0x40
  0044d194  sd         $ra, 0x0($sp)
  0044d198  jal        func_003DC490
  0044d19c  nop                                                # delay slot
  0044d1a0  daddu      $a0, $v0, $zero
  0044d1a4  jal        func_003DC430
  0044d1a8  addiu      $a1, $zero, 0xa                         # delay slot
  0044d1ac  lui        $v0, 0x45
  0044d1b0  lui        $a1, 0x73
  0044d1b4  addiu      $v0, $v0, -0x2b60                       # 0x0044d4a0 -> func_0044D4A0
  0044d1b8  lui        $a2, 0x73
  0044d1bc  addiu      $a0, $zero, 0x2800
  0044d1c0  sw         $v0, 0x14($sp)
  0044d1c4  addiu      $a1, $a1, 0x2900                        # 0x00732900 "Anonymous Alloc"
  0044d1c8  addiu      $a2, $a2, 0x2910                        # 0x00732910 "PS2Rpc_Z.cpp"
  0044d1cc  addiu      $a3, $zero, 0xc6
  0044d1d0  jal        func_002DCB70
  0044d1d4  addiu      $t0, $zero, 0x40                        # delay slot
  0044d1d8  sw         $v0, 0x18($sp)
  0044d1dc  addiu      $a0, $sp, 0x10
  0044d1e0  addiu      $v0, $zero, 0x2800
  0044d1e4  sw         $v0, 0x1c($sp)
  0044d1e8  addiu      $v0, $zero, 0x4
  0044d1ec  sw         $v0, 0x24($sp)
  0044d1f0  addiu      $v0, $gp, 0x0
  0044d1f4  jal        func_003DC3A0
  0044d1f8  sw         $v0, 0x20($sp)                          # delay slot
  0044d1fc  jal        func_003DC490
  0044d200  sw         $v0, -0x7330($gp)                       # delay slot
  0044d204  lw         $a0, -0x7330($gp)
  0044d208  jal        func_003DC3C0
  0044d20c  daddu      $a1, $zero, $zero                       # delay slot
  0044d210  ld         $ra, 0x0($sp)
  0044d214  jr         $ra
  0044d218  addiu      $sp, $sp, 0x40                          # delay slot
/* end of func_0044D190 */
