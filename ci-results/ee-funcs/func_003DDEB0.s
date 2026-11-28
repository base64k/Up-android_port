/**************************************************************************
 * func_003DDEB0
 *
 * address      : 0x003ddeb0 .. 0x003ddf60  (176 bytes, 44 instructions)
 * discovered by: prologue
 * called from  : no direct calls (indirect or unreferenced)
 */
glabel func_003DDEB0
  003ddeb0  addiu      $sp, $sp, -0x40
  003ddeb4  sd         $s1, 0x10($sp)
  003ddeb8  lui        $s1, 0x71
  003ddebc  sd         $s0, 0x0($sp)
  003ddec0  lw         $a1, 0x3784($s1)                        # 0x00713784
  003ddec4  daddu      $s0, $a0, $zero
  003ddec8  sd         $ra, 0x30($sp)
  003ddecc  slti       $v0, $a1, 0x7e
  003dded0  bne        $v0, $zero, .L000
  003dded4  sd         $s2, 0x20($sp)                          # delay slot
  003dded8  lui        $s2, 0x7a
  003ddedc  sw         $zero, 0x3784($s1)
  003ddee0  addiu      $v0, $s2, -0x4b80
  003ddee4  daddu      $a0, $v0, $zero
  003ddee8  jal        func_003DD900
  003ddeec  sb         $zero, 0x7f($v0)                        # delay slot
  003ddef0  b          .L001
  003ddef4  lw         $a1, 0x3784($s1)                        # delay slot
.L000:
  003ddef8  lui        $s2, 0x7a
.L001:
  003ddefc  addiu      $v0, $zero, 0xa
  003ddf00  bne        $s0, $v0, .L002
  003ddf04  addiu      $v0, $s2, -0x4b80                       # delay slot
  003ddf08  addiu      $a0, $s2, -0x4b80
  003ddf0c  sw         $zero, 0x3784($s1)
  003ddf10  addu       $v0, $a1, $a0
  003ddf14  ld         $ra, 0x30($sp)
  003ddf18  sb         $s0, 0x0($v0)
  003ddf1c  daddu      $v1, $v0, $zero
  003ddf20  ld         $s2, 0x20($sp)
  003ddf24  ld         $s1, 0x10($sp)
  003ddf28  ld         $s0, 0x0($sp)
  003ddf2c  sb         $zero, 0x1($v1)
  003ddf30  j          func_003DD900
  003ddf34  addiu      $sp, $sp, 0x40                          # delay slot
.L002:
  003ddf38  addiu      $v1, $a1, 0x1
  003ddf3c  sw         $v1, 0x3784($s1)
  003ddf40  addu       $v0, $a1, $v0
  003ddf44  sb         $s0, 0x0($v0)
  003ddf48  ld         $ra, 0x30($sp)
  003ddf4c  ld         $s2, 0x20($sp)
  003ddf50  ld         $s1, 0x10($sp)
  003ddf54  ld         $s0, 0x0($sp)
  003ddf58  jr         $ra
  003ddf5c  addiu      $sp, $sp, 0x40                          # delay slot
/* end of func_003DDEB0 */
