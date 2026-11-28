/**************************************************************************
 * func_003DD900
 *
 * address      : 0x003dd900 .. 0x003dd924  (36 bytes, 9 instructions)
 * discovered by: called
 * called from  : 0x003ddee8
 */
glabel func_003DD900
  003dd900  addiu      $sp, $sp, -0x20
  003dd904  sw         $a0, 0x0($sp)
  003dd908  daddu      $a1, $sp, $zero
  003dd90c  sd         $ra, 0x10($sp)
  003dd910  jal        func_003DC9D0
  003dd914  addiu      $a0, $zero, 0x10                        # delay slot
  003dd918  ld         $ra, 0x10($sp)
  003dd91c  jr         $ra
  003dd920  addiu      $sp, $sp, 0x20                          # delay slot
/* end of func_003DD900 */
