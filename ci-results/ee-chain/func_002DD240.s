/**************************************************************************
 * func_002DD240
 *
 * address      : 0x002dd240 .. 0x002dd6a0  (1120 bytes, 280 instructions)
 * discovered by: called
 * called from  : 0x002000a4
 * string hint  : "-----------------------------------------------------\n"
 */
glabel func_002DD240
  002dd240  addiu      $sp, $sp, -0x170
  002dd244  sd         $ra, 0x40($sp)
  002dd248  sq         $s3, 0x30($sp)
  002dd24c  sq         $s2, 0x20($sp)
  002dd250  daddu      $s3, $a0, $zero
  002dd254  sq         $s1, 0x10($sp)
  002dd258  daddu      $s2, $a1, $zero
  002dd25c  sq         $s0, 0x0($sp)
  002dd260  lui        $a0, 0x7a
  002dd264  lw         $a2, 0x0($s2)
  002dd268  lui        $a1, 0x73
  002dd26c  addiu      $a0, $a0, 0x7730
  002dd270  jal        func_003F3E70
  002dd274  addiu      $a1, $a1, -0x6860                       # delay slot; 0x007297a0 "%s.xMAP"
  002dd278  jal        func_003D9B70
  002dd27c  sw         $sp, 0x16c($sp)                         # delay slot
  002dd280  jal        func_00241CD0
  002dd284  nop                                                # delay slot
  002dd288  lui        $a0, 0x44
  002dd28c  jal        func_00440890
  002dd290  addiu      $a0, $a0, 0x880                         # delay slot; 0x00440880 -> func_00440880
  002dd294  jal        func_002E0660
  002dd298  nop                                                # delay slot
  002dd29c  lui        $a0, 0x73
  002dd2a0  daddu      $a1, $v0, $zero
  002dd2a4  jal        func_003F2AF8
  002dd2a8  addiu      $a0, $a0, -0x6858                       # delay slot; 0x007297a8 "Language: %d\n"
  002dd2ac  lui        $a0, 0x79
  002dd2b0  jal        func_002DCD90
  002dd2b4  addiu      $a0, $a0, 0x57b0                        # delay slot
  002dd2b8  lw         $a1, 0x0($s2)
  002dd2bc  addiu      $a0, $sp, 0x50
  002dd2c0  jal        func_003F4C88
  002dd2c4  addiu      $a2, $zero, 0x100                       # delay slot
  002dd2c8  lui        $a0, 0x73
  002dd2cc  addiu      $a1, $sp, 0x50
  002dd2d0  jal        func_003F2AF8
  002dd2d4  addiu      $a0, $a0, -0x6848                       # delay slot; 0x007297b8 "App : %s\n"
  002dd2d8  jal        func_003F470C
  002dd2dc  addiu      $a0, $sp, 0x50                          # delay slot
  002dd2e0  addiu      $a0, $sp, 0x4e
  002dd2e4  addiu      $v1, $zero, 0x3b
  002dd2e8  addu       $a1, $a0, $v0
  002dd2ec  lb         $a0, 0x0($a1)
  002dd2f0  bne        $a0, $v1, .L000
  002dd2f4  addiu      $a0, $sp, 0x50                          # delay slot
  002dd2f8  sb         $zero, 0x0($a1)
  002dd2fc  addiu      $v0, $v0, -0x2
.L000:
  002dd300  addiu      $v1, $zero, 0x5c
  002dd304  addu       $s1, $a0, $v0
  002dd308  b          .L002
  002dd30c  addiu      $s0, $s1, -0x1                          # delay slot
.L001:
  002dd310  addiu      $s0, $s0, -0x1
.L002:
  002dd314  nop
  002dd318  beq        $s0, $a0, .L003
  002dd31c  nop                                                # delay slot
  002dd320  lb         $v0, 0x0($s0)
  002dd324  bne        $v0, $v1, .L001
  002dd328  nop                                                # delay slot
.L003:
  002dd32c  nop
  002dd330  lb         $v1, 0x0($s0)
  002dd334  addiu      $v0, $zero, 0x5c
  002dd338  bne        $v1, $v0, .L004
  002dd33c  lui        $a0, 0x79                               # delay slot
  002dd340  addiu      $s0, $s0, 0x1
.L004:
  002dd344  daddu      $a1, $s0, $zero
  002dd348  addiu      $a0, $a0, 0x738c
  002dd34c  jal        func_003F4C88
  002dd350  addiu      $a2, $zero, 0x10                        # delay slot
  002dd354  lui        $a0, 0x79
  002dd358  b          .L007
  002dd35c  addiu      $a0, $a0, 0x739c                        # delay slot
.L005:
  002dd360  lb         $v1, 0x0($s0)
  002dd364  slti       $v0, $v1, 0x30
  002dd368  bne        $v0, $zero, .L006
  002dd36c  slti       $at, $v1, 0x3a                          # delay slot
  002dd370  beq        $at, $zero, .L006
  002dd374  nop                                                # delay slot
  002dd378  sb         $v1, 0x0($a0)
  002dd37c  addiu      $a0, $a0, 0x1
.L006:
  002dd380  addiu      $s0, $s0, 0x1
.L007:
  002dd384  nop
  002dd388  sltu       $v0, $s0, $s1
  002dd38c  bne        $v0, $zero, .L005
  002dd390  nop                                                # delay slot
  002dd394  lui        $a0, 0x73
  002dd398  lui        $a1, 0x79
  002dd39c  addiu      $a0, $a0, -0x6830                       # 0x007297d0 "SCE Product Code = %s\n"
  002dd3a0  jal        func_003F2AF8
  002dd3a4  addiu      $a1, $a1, 0x738c                        # delay slot
  002dd3a8  lui        $a0, 0x73
  002dd3ac  lui        $a1, 0x79
  002dd3b0  addiu      $a0, $a0, -0x6810                       # 0x007297f0 "SCE Product Number = %s\n"
  002dd3b4  jal        func_003F2AF8
  002dd3b8  addiu      $a1, $a1, 0x739c                        # delay slot
  002dd3bc  addiu      $v0, $zero, 0x1
  002dd3c0  addiu      $a0, $sp, 0x150
  002dd3c4  sw         $v0, 0x158($sp)
  002dd3c8  jal        func_003DC5A0
  002dd3cc  sw         $v0, 0x154($sp)                         # delay slot
  002dd3d0  lui        $a0, 0x73
  002dd3d4  sw         $v0, -0x7c94($gp)
  002dd3d8  jal        func_002DD080
  002dd3dc  addiu      $a0, $a0, -0x67f0                       # delay slot; 0x00729810 "Startup"
  002dd3e0  daddu      $a0, $s3, $zero
  002dd3e4  jal        func_002DD6B0
  002dd3e8  daddu      $a1, $s2, $zero                         # delay slot
  002dd3ec  lui        $at, 0x79
  002dd3f0  lui        $a1, 0x73
  002dd3f4  lw         $a0, 0x5f68($at)
  002dd3f8  lui        $a2, 0x44
  002dd3fc  lui        $a3, 0x73
  002dd400  addiu      $a1, $a1, -0x67e0                       # 0x00729820 "ExceptionHandling"
  002dd404  addiu      $a2, $a2, 0x970                         # 0x00440970 -> func_00440970
  002dd408  jal        func_003CF1B0
  002dd40c  addiu      $a3, $a3, -0x67c8                       # delay slot; 0x00729838 "No Comment"
  002dd410  lui        $at, 0x79
  002dd414  lui        $a1, 0x73
  002dd418  lw         $a0, 0x5f68($at)
  002dd41c  lui        $a2, 0x44
  002dd420  lui        $a3, 0x73
  002dd424  addiu      $a1, $a1, -0x67b8                       # 0x00729848 "XMAPFILE"
  002dd428  addiu      $a2, $a2, 0x980                         # 0x00440980 -> func_00440980
  002dd42c  jal        func_003CF1B0
  002dd430  addiu      $a3, $a3, -0x67c8                       # delay slot; 0x00729838 "No Comment"
  002dd434  lui        $at, 0x79
  002dd438  lui        $a1, 0x73
  002dd43c  lw         $a0, 0x5f68($at)
  002dd440  lui        $a2, 0x44
  002dd444  lui        $a3, 0x73
  002dd448  addiu      $a1, $a1, -0x67a8                       # 0x00729858 "FaitPlanter"
  002dd44c  addiu      $a2, $a2, 0x990                         # 0x00440990 -> func_00440990
  002dd450  jal        func_003CF1B0
  002dd454  addiu      $a3, $a3, -0x67c8                       # delay slot; 0x00729838 "No Comment"
  002dd458  jal        func_0032F1B0
  002dd45c  nop                                                # delay slot
  002dd460  jal        func_002DEC00
  002dd464  nop                                                # delay slot
  002dd468  lui        $a0, 0x73
  002dd46c  jal        func_003F2AF8
  002dd470  addiu      $a0, $a0, -0x6790                       # delay slot; 0x00729870 "-----------------------------------------------------\n"
  002dd474  lui        $a0, 0x73
  002dd478  jal        func_003F2AF8
  002dd47c  addiu      $a0, $a0, -0x6750                       # delay slot; 0x007298b0 "MEMORY STATUS:\n"
  002dd480  lui        $at, 0x79
  002dd484  lui        $a0, 0x73
  002dd488  lw         $a1, 0x57c4($at)
  002dd48c  jal        func_003F2AF8
  002dd490  addiu      $a0, $a0, -0x6740                       # delay slot; 0x007298c0 "Mem:  NbAlloc    = %d\n"
  002dd494  lui        $a0, 0x79
  002dd498  addiu      $a0, $a0, 0x57b0
  002dd49c  lw         $t9, 0x20($a0)
  002dd4a0  lw         $t9, 0x40($t9)
  002dd4a4  jalr       $t9
  002dd4a8  nop                                                # delay slot
  002dd4ac  lui        $a0, 0x79
  002dd4b0  addiu      $a0, $a0, 0x57b0
  002dd4b4  lw         $t9, 0x20($a0)
  002dd4b8  lw         $t9, 0x50($t9)
  002dd4bc  jalr       $t9
  002dd4c0  daddu      $s0, $v0, $zero                         # delay slot
  002dd4c4  lui        $a0, 0x79
  002dd4c8  addiu      $a0, $a0, 0x57b0
  002dd4cc  lw         $t9, 0x20($a0)
  002dd4d0  lw         $t9, 0x40($t9)
  002dd4d4  jalr       $t9
  002dd4d8  subu       $s1, $s0, $v0                           # delay slot
  002dd4dc  lui        $a0, 0x79
  002dd4e0  addiu      $a0, $a0, 0x57b0
  002dd4e4  lw         $t9, 0x20($a0)
  002dd4e8  lw         $t9, 0x50($t9)
  002dd4ec  jalr       $t9
  002dd4f0  daddu      $s0, $v0, $zero                         # delay slot
  002dd4f4  bltz       $s1, .L008
  002dd4f8  subu       $s0, $s0, $v0                           # delay slot
  002dd4fc  mtc1       $s1, $f0
  002dd500  b          .L009
  002dd504  cvt.s.w    $f0, $f0                                # delay slot
.L008:
  002dd508  srl        $v1, $s1, 1
  002dd50c  andi       $v0, $s1, 0x1
  002dd510  or         $v1, $v1, $v0
  002dd514  mtc1       $v1, $f0
  002dd518  nop
  002dd51c  cvt.s.w    $f0, $f0
  002dd520  add.s      $f0, $f0, $f0
.L009:
  002dd524  lui        $v0, 0x4980
  002dd528  mtc1       $v0, $f1
  002dd52c  nop
  002dd530  div.s      $f12, $f0, $f1
  002dd534  nop
  002dd538  nop
  002dd53c  jal        func_00201F20
  002dd540  nop                                                # delay slot
  002dd544  lui        $a0, 0x73
  002dd548  daddu      $a1, $s0, $zero
  002dd54c  daddu      $a2, $v0, $zero
  002dd550  jal        func_003F2AF8
  002dd554  addiu      $a0, $a0, -0x6720                       # delay slot; 0x007298e0 "      Allocated  = %d (%0.1fMo)\n"
  002dd558  lui        $a0, 0x79
  002dd55c  jal        func_004B7A60
  002dd560  addiu      $a0, $a0, 0x57d4                        # delay slot
  002dd564  lui        $at, 0x79
  002dd568  lui        $a0, 0x79
  002dd56c  sw         $v0, 0x57b8($at)
  002dd570  lui        $at, 0x79
  002dd574  lw         $s0, 0x57b8($at)
  002dd578  jal        func_004B7A60
  002dd57c  addiu      $a0, $a0, 0x57d4                        # delay slot
  002dd580  lui        $at, 0x79
  002dd584  bltz       $s0, .L010
  002dd588  sw         $v0, 0x57b8($at)                        # delay slot
  002dd58c  mtc1       $s0, $f0
  002dd590  b          .L011
  002dd594  cvt.s.w    $f1, $f0                                # delay slot
.L010:
  002dd598  srl        $v1, $s0, 1
  002dd59c  andi       $v0, $s0, 0x1
  002dd5a0  or         $v1, $v1, $v0
  002dd5a4  mtc1       $v1, $f0
  002dd5a8  nop
  002dd5ac  cvt.s.w    $f1, $f0
  002dd5b0  add.s      $f1, $f1, $f1
.L011:
  002dd5b4  lui        $v0, 0x4980
  002dd5b8  mtc1       $v0, $f0
  002dd5bc  nop
  002dd5c0  div.s      $f12, $f1, $f0
  002dd5c4  nop
  002dd5c8  nop
  002dd5cc  jal        func_00201F20
  002dd5d0  nop                                                # delay slot
  002dd5d4  lui        $at, 0x79
  002dd5d8  lui        $a0, 0x73
  002dd5dc  lw         $a1, 0x57b8($at)
  002dd5e0  daddu      $a2, $v0, $zero
  002dd5e4  jal        func_003F2AF8
  002dd5e8  addiu      $a0, $a0, -0x66f0                       # delay slot; 0x00729910 "      FreeMem    = %d (%0.1fMo)\n"
  002dd5ec  lui        $at, 0x79
  002dd5f0  lw         $v1, 0x57d8($at)
  002dd5f4  lui        $at, 0x79
  002dd5f8  lw         $v0, 0x57d4($at)
  002dd5fc  subu       $s0, $v1, $v0
  002dd600  bltz       $s0, .L012
  002dd604  srl        $v1, $s0, 1                             # delay slot
  002dd608  mtc1       $s0, $f0
  002dd60c  b          .L013
  002dd610  cvt.s.w    $f1, $f0                                # delay slot
.L012:
  002dd614  andi       $v0, $s0, 0x1
  002dd618  or         $v1, $v1, $v0
  002dd61c  mtc1       $v1, $f0
  002dd620  nop
  002dd624  cvt.s.w    $f1, $f0
  002dd628  add.s      $f1, $f1, $f1
.L013:
  002dd62c  lui        $v0, 0x4980
  002dd630  mtc1       $v0, $f0
  002dd634  nop
  002dd638  div.s      $f12, $f1, $f0
  002dd63c  nop
  002dd640  nop
  002dd644  jal        func_00201F20
  002dd648  nop                                                # delay slot
  002dd64c  lui        $a0, 0x73
  002dd650  daddu      $a1, $s0, $zero
  002dd654  daddu      $a2, $v0, $zero
  002dd658  jal        func_003F2AF8
  002dd65c  addiu      $a0, $a0, -0x66c0                       # delay slot; 0x00729940 "TotalMem:        = %d (%0.1fMo)\n"
  002dd660  lui        $a0, 0x73
  002dd664  jal        func_003F2AF8
  002dd668  addiu      $a0, $a0, -0x6790                       # delay slot; 0x00729870 "-----------------------------------------------------\n"
  002dd66c  lui        $a0, 0x73
  002dd670  jal        func_003F2AF8
  002dd674  addiu      $a0, $a0, -0x6790                       # delay slot; 0x00729870 "-----------------------------------------------------\n"
  002dd678  jal        func_003D9B60
  002dd67c  nop                                                # delay slot
  002dd680  ld         $ra, 0x40($sp)
  002dd684  addiu      $v0, $zero, 0x1
  002dd688  lq         $s3, 0x30($sp)
  002dd68c  lq         $s2, 0x20($sp)
  002dd690  lq         $s1, 0x10($sp)
  002dd694  lq         $s0, 0x0($sp)
  002dd698  jr         $ra
  002dd69c  addiu      $sp, $sp, 0x170                         # delay slot
/* end of func_002DD240 */
