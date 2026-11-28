/**************************************************************************
 * func_0047DAE0
 *
 * address      : 0x0047dae0 .. 0x0047dbf8  (280 bytes, 70 instructions)
 * discovered by: called
 * called from  : 0x00301bf8
 */
glabel func_0047DAE0
  0047dae0  addiu      $sp, $sp, -0x50
  0047dae4  sd         $s2, 0x10($sp)
  0047dae8  sd         $s0, 0x0($sp)
  0047daec  lui        $s2, 0x7b
  0047daf0  sd         $s1, 0x8($sp)
  0047daf4  addiu      $s0, $s2, -0x6900
  0047daf8  sd         $s3, 0x18($sp)
  0047dafc  daddu      $s1, $zero, $zero
  0047db00  sd         $s4, 0x20($sp)
  0047db04  daddu      $s3, $t0, $zero
  0047db08  sd         $s5, 0x28($sp)
  0047db0c  daddu      $s4, $a3, $zero
  0047db10  sd         $s6, 0x30($sp)
  0047db14  daddu      $s5, $a2, $zero
  0047db18  sd         $s7, 0x38($sp)
  0047db1c  daddu      $s6, $a1, $zero
  0047db20  sd         $fp, 0x40($sp)
  0047db24  daddu      $s7, $a0, $zero
  0047db28  sd         $ra, 0x48($sp)
  0047db2c  lui        $fp, 0x3e
  0047db30  lui        $v1, 0x7b
  0047db34  nop
.L000:
  0047db38  lw         $v0, -0x67d4($v1)
  0047db3c  nop
  0047db40  nop
  0047db44  nop
  0047db48  nop
  0047db4c  beq        $v0, $zero, .L000
  0047db50  nop                                                # delay slot
  0047db54  lui        $v1, 0x72
  0047db58  lw         $v0, 0x8($v1)                           # 0x00720008
  0047db5c  addiu      $v1, $zero, 0x5
  0047db60  sw         $s7, 0x10($s0)
  0047db64  sw         $v1, 0xc($s0)
  0047db68  sw         $s6, 0x14($s0)
  0047db6c  sw         $s5, 0x18($s0)
  0047db70  sw         $s4, 0x1c($s0)
  0047db74  beq        $v0, $zero, .L001
  0047db78  sw         $s3, 0x20($s0)                          # delay slot
  0047db7c  lui        $v1, 0x3e
  0047db80  b          .L002
  0047db84  addiu      $v0, $v1, -0x1238                       # delay slot; 0x003dedc8 -> func_003DEDC8
.L001:
  0047db88  addiu      $v0, $fp, -0x1278
.L002:
  0047db8c  lui        $v1, 0x7b
  0047db90  addiu      $a1, $s2, -0x6900
  0047db94  lw         $a0, -0x67e0($v1)
  0047db98  addiu      $a2, $zero, 0x24
  0047db9c  daddu      $a3, $zero, $zero
  0047dba0  daddu      $t0, $zero, $zero
  0047dba4  jalr       $v0
  0047dba8  daddu      $t1, $zero, $zero                       # delay slot
  0047dbac  bne        $v0, $zero, .L003
  0047dbb0  addiu      $v0, $zero, 0x1                         # delay slot
  0047dbb4  addiu      $s1, $s1, 0x1
  0047dbb8  slti       $v0, $s1, 0x20
  0047dbbc  bne        $v0, $zero, .L000
  0047dbc0  lui        $v1, 0x7b                               # delay slot
  0047dbc4  daddu      $v0, $zero, $zero
.L003:
  0047dbc8  ld         $s0, 0x0($sp)
  0047dbcc  ld         $s1, 0x8($sp)
  0047dbd0  ld         $s2, 0x10($sp)
  0047dbd4  ld         $s3, 0x18($sp)
  0047dbd8  ld         $s4, 0x20($sp)
  0047dbdc  ld         $s5, 0x28($sp)
  0047dbe0  ld         $s6, 0x30($sp)
  0047dbe4  ld         $s7, 0x38($sp)
  0047dbe8  ld         $fp, 0x40($sp)
  0047dbec  ld         $ra, 0x48($sp)
  0047dbf0  jr         $ra
  0047dbf4  addiu      $sp, $sp, 0x50                          # delay slot
/* end of func_0047DAE0 */
