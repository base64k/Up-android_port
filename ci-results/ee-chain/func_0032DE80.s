/**************************************************************************
 * func_0032DE80
 *
 * address      : 0x0032de80 .. 0x0032df60  (224 bytes, 56 instructions)
 * discovered by: called
 * called from  : 0x00307acc
 * string hint  : "Anonymous Alloc"
 */
glabel func_0032DE80
  0032de80  addiu      $sp, $sp, -0x30
  0032de84  daddu      $v1, $zero, $zero
  0032de88  sd         $ra, 0x20($sp)
  0032de8c  addiu      $v0, $zero, 0x1
  0032de90  sq         $s1, 0x10($sp)
  0032de94  sq         $s0, 0x0($sp)
  0032de98  lbu        $t2, 0x3($a1)
  0032de9c  daddu      $s0, $a1, $zero
  0032dea0  lbu        $t1, 0x2($a1)
  0032dea4  lbu        $t0, 0x1($a1)
  0032dea8  lbu        $a3, 0x0($a1)
  0032deac  sll        $t2, $t2, 24
  0032deb0  sll        $t1, $t1, 16
  0032deb4  addu       $t1, $t2, $t1
  0032deb8  sll        $t0, $t0, 8
  0032debc  addu       $t0, $t0, $t1
  0032dec0  addu       $a3, $a3, $t0
  0032dec4  sw         $a3, 0x4($a0)
  0032dec8  lbu        $t1, 0x7($a1)
  0032decc  lbu        $t0, 0x6($a1)
  0032ded0  lbu        $a3, 0x5($a1)
  0032ded4  sll        $t1, $t1, 24
  0032ded8  sll        $t0, $t0, 16
  0032dedc  lbu        $a1, 0x4($a1)
  0032dee0  addu       $t0, $t1, $t0
  0032dee4  sll        $a3, $a3, 8
  0032dee8  addu       $a3, $a3, $t0
  0032deec  addu       $a1, $a1, $a3
  0032def0  sw         $a1, 0x8($a0)
  0032def4  sw         $a2, 0x0($a0)
  0032def8  lw         $a1, 0x0($a0)
  0032defc  movz       $v1, $v0, $a1
  0032df00  sb         $v1, 0xc($a0)
  0032df04  lw         $v0, 0x0($a0)
  0032df08  bne        $v0, $zero, .L000
  0032df0c  daddu      $s1, $a0, $zero                         # delay slot
  0032df10  lw         $a0, 0x4($s1)
  0032df14  lui        $a1, 0x73
  0032df18  lui        $a2, 0x73
  0032df1c  addiu      $a1, $a1, -0x4990                       # 0x0072b670 "Anonymous Alloc"
  0032df20  addiu      $a2, $a2, -0x4980                       # 0x0072b680 "UnPack_Z.cpp"
  0032df24  addiu      $a3, $zero, 0x24
  0032df28  jal        func_002DCB70
  0032df2c  addiu      $t0, $zero, 0x10                        # delay slot
  0032df30  sw         $v0, 0x0($s1)
.L000:
  0032df34  sb         $zero, 0xd($s1)
  0032df38  daddu      $a1, $s0, $zero
  0032df3c  lw         $a2, 0x0($s1)
  0032df40  jal        func_0032DFA0
  0032df44  daddu      $a0, $s1, $zero                         # delay slot
  0032df48  daddu      $v0, $s1, $zero
  0032df4c  ld         $ra, 0x20($sp)
  0032df50  lq         $s1, 0x10($sp)
  0032df54  lq         $s0, 0x0($sp)
  0032df58  jr         $ra
  0032df5c  addiu      $sp, $sp, 0x30                          # delay slot
/* end of func_0032DE80 */
