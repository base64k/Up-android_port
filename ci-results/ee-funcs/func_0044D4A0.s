/**************************************************************************
 * func_0044D4A0
 *
 * address      : 0x0044d4a0 .. 0x0044d4fc  (92 bytes, 23 instructions)
 * discovered by: prologue
 * called from  : no direct calls (indirect or unreferenced)
 */
glabel func_0044D4A0
  0044d4a0  addiu      $sp, $sp, -0x80
  0044d4a4  sd         $ra, 0x0($sp)
  0044d4a8  jal        func_003DC490
  0044d4ac  nop                                                # delay slot
  0044d4b0  daddu      $a1, $v0, $zero
  0044d4b4  jal        func_003DFBA0
  0044d4b8  addiu      $a0, $sp, 0x10                          # delay slot
  0044d4bc  lui        $v0, 0x100
  0044d4c0  lui        $a2, 0x45
  0044d4c4  lui        $a3, 0x7b
  0044d4c8  addiu      $a0, $sp, 0x30
  0044d4cc  ori        $a1, $v0, 0x2
  0044d4d0  addiu      $a2, $a2, -0x2c60                       # 0x0044d3a0 -> func_0044D3A0
  0044d4d4  addiu      $a3, $a3, -0x7c00
  0044d4d8  daddu      $t0, $zero, $zero
  0044d4dc  daddu      $t1, $zero, $zero
  0044d4e0  jal        func_003DFC38
  0044d4e4  addiu      $t2, $sp, 0x10                          # delay slot
  0044d4e8  jal        func_003E0050
  0044d4ec  addiu      $a0, $sp, 0x10                          # delay slot
  0044d4f0  ld         $ra, 0x0($sp)
  0044d4f4  jr         $ra
  0044d4f8  addiu      $sp, $sp, 0x80                          # delay slot
/* end of func_0044D4A0 */
