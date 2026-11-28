/**************************************************************************
 * func_00338490
 *
 * address      : 0x00338490 .. 0x003384a4  (20 bytes, 5 instructions)
 * discovered by: called
 * called from  : 0x0031dfe0, 0x0032f1c0
 */
glabel func_00338490
  00338490  lui        $at, 0x79
  00338494  lb         $v1, 0x680d($at)
  00338498  nop
  0033849c  jr         $ra
  003384a0  nop                                                # delay slot
/* end of func_00338490 */
