/**************************************************************************
 * func_00356A60
 *
 * address      : 0x00356a60 .. 0x00356a7c  (28 bytes, 7 instructions)
 * discovered by: called
 * called from  : 0x00426e28
 */
glabel func_00356A60
  00356a60  lwc1       $f0, 0x1c($a0)
  00356a64  add.s      $f0, $f0, $f12
  00356a68  swc1       $f0, 0x1c($a0)
  00356a6c  lw         $t9, 0x8($a0)
  00356a70  lw         $t9, 0x4c($t9)
  00356a74  jr         $t9
  00356a78  nop                                                # delay slot
/* end of func_00356A60 */
