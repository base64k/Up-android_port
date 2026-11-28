/**************************************************************************
 * func_003E5888
 *
 * address      : 0x003e5888 .. 0x003e58dc  (84 bytes, 21 instructions)
 * discovered by: called
 * called from  : 0x00200084
 */
glabel func_003E5888
  003e5888  addiu      $sp, $sp, -0x10
  003e588c  sd         $ra, 0x0($sp)
  003e5890  jal        func_003E5650
  003e5894  nop                                                # delay slot
  003e5898  jal        func_003E5778
  003e589c  nop                                                # delay slot
  003e58a0  jal        func_003E5D68
  003e58a4  nop                                                # delay slot
  003e58a8  jal        func_003E5EE0
  003e58ac  addiu      $a0, $zero, 0x2                         # delay slot
  003e58b0  jal        func_003E6120
  003e58b4  nop                                                # delay slot
  003e58b8  jal        func_003DD378
  003e58bc  nop                                                # delay slot
  003e58c0  jal        func_003E59B0
  003e58c4  nop                                                # delay slot
  003e58c8  jal        func_003E4E88
  003e58cc  nop                                                # delay slot
  003e58d0  ld         $ra, 0x0($sp)
  003e58d4  j          func_003E7598
  003e58d8  addiu      $sp, $sp, 0x10                          # delay slot
/* end of func_003E5888 */
