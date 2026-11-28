/**************************************************************************
 * func_003E5D58
 *
 * address      : 0x003e5d58 .. 0x003e5d68  (16 bytes, 4 instructions)
 * discovered by: called
 * called from  : 0x003e5e00
 */
glabel func_003E5D58
  003e5d58  addiu      $v1, $zero, 0x5b
  003e5d5c  syscall
  003e5d60  jr         $ra
  003e5d64  nop                                                # delay slot
/* end of func_003E5D58 */
