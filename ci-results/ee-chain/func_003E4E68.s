/**************************************************************************
 * func_003E4E68
 *
 * address      : 0x003e4e68 .. 0x003e4e78  (16 bytes, 4 instructions)
 * discovered by: called
 * called from  : 0x003e4f00, 0x003e4f24
 */
glabel func_003E4E68
  003e4e68  addiu      $v1, $zero, 0x5b
  003e4e6c  syscall
  003e4e70  jr         $ra
  003e4e74  nop                                                # delay slot
/* end of func_003E4E68 */
