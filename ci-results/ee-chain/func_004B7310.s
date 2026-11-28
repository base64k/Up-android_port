/**************************************************************************
 * func_004B7310
 *
 * address      : 0x004b7310 .. 0x004b75a8  (664 bytes, 166 instructions)
 * discovered by: called
 * called from  : 0x004b69d0, 0x004b7210, 0x004b7258
 */
glabel func_004B7310
  004b7310  addiu      $sp, $sp, -0x70
  004b7314  addiu      $v1, $zero, -0x400
  004b7318  sd         $ra, 0x50($sp)
  004b731c  sq         $s4, 0x40($sp)
  004b7320  sq         $s3, 0x30($sp)
  004b7324  daddu      $s4, $a2, $zero
  004b7328  sq         $s2, 0x20($sp)
  004b732c  sq         $s1, 0x10($sp)
  004b7330  addu       $s2, $a1, $a2
  004b7334  sq         $s0, 0x0($sp)
  004b7338  daddu      $s1, $a0, $zero
  004b733c  lw         $v0, 0x4($a1)
  004b7340  dsll32     $v0, $v0, 0
  004b7344  dsrl32     $v0, $v0, 3
  004b7348  addu       $v0, $v0, $v1
  004b734c  sll        $s3, $v0, 2
  004b7350  beq        $s3, $zero, .L004
  004b7354  daddu      $s0, $a1, $zero                         # delay slot
  004b7358  lbu        $v0, 0x0($s3)
  004b735c  andi       $v0, $v0, 0x1
  004b7360  beq        $v0, $zero, .L004
  004b7364  nop                                                # delay slot
  004b7368  jal        func_004B9050
  004b736c  nop                                                # delay slot
  004b7370  sltu       $at, $s4, $v0
  004b7374  beq        $at, $zero, .L008
  004b7378  nop                                                # delay slot
  004b737c  lwc1       $f1, 0x0($s3)
  004b7380  addiu      $v0, $sp, 0x68
  004b7384  lwc1       $f0, 0x4($s3)
  004b7388  daddu      $a1, $s3, $zero
  004b738c  daddu      $a0, $s1, $zero
  004b7390  swc1       $f1, 0x0($v0)
  004b7394  jal        func_004B8140
  004b7398  swc1       $f0, 0x4($v0)                           # delay slot
  004b739c  srl        $v0, $s2, 2
  004b73a0  lw         $a1, 0x4($s0)
  004b73a4  addiu      $v1, $v0, 0x400
  004b73a8  addiu      $v0, $zero, -0x1
  004b73ac  dsll32     $v1, $v1, 3
  004b73b0  dsll32     $a0, $v0, 0
  004b73b4  dsrl32     $v1, $v1, 3
  004b73b8  addiu      $v0, $zero, 0x7
  004b73bc  sll        $v1, $v1, 3
  004b73c0  or         $v0, $v0, $a0
  004b73c4  srl        $a0, $s0, 2
  004b73c8  and        $a1, $a1, $v0
  004b73cc  addiu      $a0, $a0, 0x400
  004b73d0  or         $a2, $a1, $v1
  004b73d4  dsll32     $a0, $a0, 3
  004b73d8  sw         $a2, 0x4($s0)
  004b73dc  dsrl32     $a0, $a0, 3
  004b73e0  sll        $a1, $a0, 3
  004b73e4  lw         $a0, 0x0($s2)
  004b73e8  and        $a0, $a0, $v0
  004b73ec  or         $a0, $a0, $a1
  004b73f0  sw         $a0, 0x0($s2)
  004b73f4  lw         $a1, 0x6c($sp)
  004b73f8  lw         $a0, 0x4($s2)
  004b73fc  dsll32     $a1, $a1, 0
  004b7400  dsrl32     $a1, $a1, 3
  004b7404  and        $a0, $a0, $v0
  004b7408  addiu      $a1, $a1, -0x400
  004b740c  sll        $a2, $a1, 2
  004b7410  srl        $a1, $a2, 2
  004b7414  addiu      $a1, $a1, 0x400
  004b7418  dsll32     $a1, $a1, 3
  004b741c  dsrl32     $a1, $a1, 3
  004b7420  sll        $a1, $a1, 3
  004b7424  or         $a0, $a0, $a1
  004b7428  beq        $a2, $zero, .L000
  004b742c  sw         $a0, 0x4($s2)                           # delay slot
  004b7430  lw         $a0, 0x0($a2)
  004b7434  and        $v0, $a0, $v0
  004b7438  or         $v0, $v0, $v1
  004b743c  sw         $v0, 0x0($a2)
.L000:
  004b7440  lbu        $v0, 0x4($s2)
  004b7444  addiu      $a1, $zero, -0x8
  004b7448  andi       $v1, $zero, 0x7
  004b744c  addiu      $a0, $zero, 0x1
  004b7450  and        $v0, $v0, $a1
  004b7454  or         $v0, $v0, $v1
  004b7458  b          .L002
  004b745c  sb         $v0, 0x4($s2)                           # delay slot
.L001:
  004b7460  andi       $v0, $v0, 0x1
  004b7464  bne        $v0, $zero, .L003
  004b7468  nop                                                # delay slot
  004b746c  lbu        $v0, 0x4($s2)
  004b7470  addiu      $v1, $v1, 0x1
  004b7474  andi       $v1, $v1, 0x7
  004b7478  and        $v0, $v0, $a1
  004b747c  or         $v0, $v0, $v1
  004b7480  sb         $v0, 0x4($s2)
.L002:
  004b7484  nop
  004b7488  lbu        $v0, 0x4($s2)
  004b748c  andi       $v1, $v0, 0x7
  004b7490  slti       $v0, $v1, 0x20
  004b7494  bne        $v0, $zero, .L001
  004b7498  sllv       $v0, $a0, $v1                           # delay slot
.L003:
  004b749c  nop
  004b74a0  lbu        $a2, 0x0($s2)
  004b74a4  andi       $v0, $zero, 0x1
  004b74a8  daddu      $a0, $s1, $zero
  004b74ac  sll        $v1, $v0, 2
  004b74b0  daddu      $a1, $s2, $zero
  004b74b4  addiu      $v0, $zero, -0x5
  004b74b8  and        $v0, $a2, $v0
  004b74bc  or         $v0, $v0, $v1
  004b74c0  jal        func_004B80E0
  004b74c4  sb         $v0, 0x0($s2)                           # delay slot
  004b74c8  b          .L009
  004b74cc  ld         $ra, 0x50($sp)                          # delay slot
.L004:
  004b74d0  daddu      $a0, $s1, $zero
  004b74d4  jal        func_004B9050
  004b74d8  daddu      $a1, $s0, $zero                         # delay slot
  004b74dc  addiu      $v1, $s4, 0x20
  004b74e0  sltu       $v1, $v0, $v1
  004b74e4  bne        $v1, $zero, .L008
  004b74e8  nop                                                # delay slot
  004b74ec  lw         $v0, 0x46c($s1)
  004b74f0  daddu      $a0, $s0, $zero
  004b74f4  daddu      $a1, $s2, $zero
  004b74f8  addiu      $v0, $v0, 0x1
  004b74fc  jal        func_004B53F0
  004b7500  sw         $v0, 0x46c($s1)                         # delay slot
  004b7504  lbu        $v0, 0x4($s2)
  004b7508  addiu      $a1, $zero, -0x8
  004b750c  andi       $v1, $zero, 0x7
  004b7510  addiu      $a0, $zero, 0x1
  004b7514  and        $v0, $v0, $a1
  004b7518  or         $v0, $v0, $v1
  004b751c  b          .L006
  004b7520  sb         $v0, 0x4($s2)                           # delay slot
.L005:
  004b7524  andi       $v0, $v0, 0x1
  004b7528  bne        $v0, $zero, .L007
  004b752c  nop                                                # delay slot
  004b7530  lbu        $v0, 0x4($s2)
  004b7534  addiu      $v1, $v1, 0x1
  004b7538  andi       $v1, $v1, 0x7
  004b753c  and        $v0, $v0, $a1
  004b7540  or         $v0, $v0, $v1
  004b7544  sb         $v0, 0x4($s2)
.L006:
  004b7548  lbu        $v0, 0x4($s2)
  004b754c  andi       $v1, $v0, 0x7
  004b7550  slti       $v0, $v1, 0x20
  004b7554  bne        $v0, $zero, .L005
  004b7558  sllv       $v0, $a0, $v1                           # delay slot
.L007:
  004b755c  nop
  004b7560  lbu        $a2, 0x0($s2)
  004b7564  andi       $v0, $zero, 0x1
  004b7568  daddu      $a0, $s1, $zero
  004b756c  sll        $v1, $v0, 2
  004b7570  daddu      $a1, $s2, $zero
  004b7574  addiu      $v0, $zero, -0x5
  004b7578  and        $v0, $a2, $v0
  004b757c  or         $v0, $v0, $v1
  004b7580  jal        func_004B80E0
  004b7584  sb         $v0, 0x0($s2)                           # delay slot
.L008:
  004b7588  ld         $ra, 0x50($sp)
.L009:
  004b758c  lq         $s4, 0x40($sp)
  004b7590  lq         $s3, 0x30($sp)
  004b7594  lq         $s2, 0x20($sp)
  004b7598  lq         $s1, 0x10($sp)
  004b759c  lq         $s0, 0x0($sp)
  004b75a0  jr         $ra
  004b75a4  addiu      $sp, $sp, 0x70                          # delay slot
/* end of func_004B7310 */
