/**************************************************************************
 * func_003DC820
 *
 * address      : 0x003dc820 .. 0x003dc830  (16 bytes, 4 instructions)
 * discovered by: called
 * called from  : 0x0020008c, 0x002f3c78, 0x002f681c, 0x002f6878, 0x002f68d0, 0x0030173c (+28 more)
 */
glabel func_003DC820
  003dc820  addiu      $v1, $zero, 0x64
  003dc824  syscall
  003dc828  jr         $ra
  003dc82c  nop                                                # delay slot
/* end of func_003DC820 */
