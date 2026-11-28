/**************************************************************************
 * func_003DC9D0
 *
 * address      : 0x003dc9d0 .. 0x003dc9e0  (16 bytes, 4 instructions)
 * discovered by: called
 * called from  : 0x003dd720, 0x003dd748, 0x003dd77c, 0x003dd7a0, 0x003dd7d4, 0x003dd7f8 (+6 more)
 */
glabel func_003DC9D0
  003dc9d0  addiu      $v1, $zero, 0x7c
  003dc9d4  syscall
  003dc9d8  jr         $ra
  003dc9dc  nop                                                # delay slot
/* end of func_003DC9D0 */
