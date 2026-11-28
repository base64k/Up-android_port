/**************************************************************************
 * func_002DD6A0
 *
 * address      : 0x002dd6a0 .. 0x002dd6ac  (12 bytes, 3 instructions)
 * discovered by: called
 * called from  : 0x0032f21c
 */
glabel func_002DD6A0
  002dd6a0  lui        $at, 0x79
  002dd6a4  jr         $ra
  002dd6a8  lb         $v0, 0x680c($at)                        # delay slot
/* end of func_002DD6A0 */
