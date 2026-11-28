/**************************************************************************
 * func_00426E00
 *
 * address      : 0x00426e00 .. 0x00426e54  (84 bytes, 21 instructions)
 * discovered by: called
 * called from  : 0x004263b4, 0x004263ec, 0x004263f8, 0x00426404, 0x00426410, 0x0042641c (+1 more)
 */
glabel func_00426E00
  00426e00  addiu      $sp, $sp, -0x30
  00426e04  sd         $ra, 0x20($sp)
  00426e08  sq         $s0, 0x10($sp)
  00426e0c  swc1       $f20, 0x0($sp)
  00426e10  lw         $s0, 0x0($a0)
  00426e14  beq        $s0, $zero, .L002
  00426e18  mov.s      $f20, $f12                              # delay slot
.L000:
  00426e1c  lb         $v1, 0x18($s0)
  00426e20  beq        $v1, $zero, .L001
  00426e24  daddu      $a0, $s0, $zero                         # delay slot
  00426e28  jal        func_00356A60
  00426e2c  mov.s      $f12, $f20                              # delay slot
.L001:
  00426e30  lw         $s0, 0x10($s0)
  00426e34  bne        $s0, $zero, .L000
  00426e38  nop                                                # delay slot
.L002:
  00426e3c  nop
  00426e40  ld         $ra, 0x20($sp)
  00426e44  lq         $s0, 0x10($sp)
  00426e48  lwc1       $f20, 0x0($sp)
  00426e4c  jr         $ra
  00426e50  addiu      $sp, $sp, 0x30                          # delay slot
/* end of func_00426E00 */
