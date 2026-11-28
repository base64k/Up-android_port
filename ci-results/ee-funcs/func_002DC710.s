/**************************************************************************
 * func_002DC710
 *
 * address      : 0x002dc710 .. 0x002dc760  (80 bytes, 20 instructions)
 * discovered by: pointer
 * called from  : no direct calls (indirect or unreferenced)
 */
glabel func_002DC710
  002dc710  addiu      $sp, $sp, -0x20
  002dc714  sd         $ra, 0x10($sp)
  002dc718  sq         $s0, 0x0($sp)
  002dc71c  daddu      $s0, $a0, $zero
  002dc720  jal        func_004B68C0
  002dc724  addiu      $a0, $s0, 0x24                          # delay slot
  002dc728  bne        $v0, $zero, .L000
  002dc72c  nop                                                # delay slot
  002dc730  b          .L001
  002dc734  ld         $ra, 0x10($sp)                          # delay slot
.L000:
  002dc738  lw         $v1, 0x14($s0)
  002dc73c  addiu      $v1, $v1, 0x1
  002dc740  sw         $v1, 0x14($s0)
  002dc744  lw         $v1, 0x18($s0)
  002dc748  addiu      $v1, $v1, 0x1
  002dc74c  sw         $v1, 0x18($s0)
  002dc750  ld         $ra, 0x10($sp)
.L001:
  002dc754  lq         $s0, 0x0($sp)
  002dc758  jr         $ra
  002dc75c  addiu      $sp, $sp, 0x20                          # delay slot
/* end of func_002DC710 */
