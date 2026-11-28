/**************************************************************************
 * func_003083F0
 *
 * address      : 0x003083f0 .. 0x00308730  (832 bytes, 208 instructions)
 * discovered by: called
 * called from  : 0x0032f2c0
 * string hint  : " - Asobo Studio - Internal Cross Technology"
 */
glabel func_003083F0
  003083f0  addiu      $sp, $sp, -0x30
  003083f4  dsll32     $v0, $zero, 14
  003083f8  sd         $ra, 0x10($sp)
  003083fc  dsrl32     $v0, $v0, 14
  00308400  sq         $s0, 0x0($sp)
  00308404  addiu      $a3, $zero, -0x1
  00308408  sw         $a0, 0x2c($sp)
  0030840c  sll        $t0, $v0, 14
  00308410  lw         $s0, 0x2c($sp)
  00308414  lui        $a0, 0x76
  00308418  addiu      $a0, $a0, 0x5740                        # 0x00765740
  0030841c  dsll32     $v1, $a3, 0
  00308420  addiu      $v0, $zero, 0x3fff
  00308424  andi       $a1, $zero, 0x3fff
  00308428  or         $a2, $v0, $v1
  0030842c  addiu      $v1, $zero, -0x4000
  00308430  sw         $a0, 0x88($s0)
  00308434  lw         $v0, 0x8($s0)
  00308438  addiu      $a0, $s0, 0x38
  0030843c  and        $v0, $v0, $a2
  00308440  or         $v0, $v0, $t0
  00308444  sw         $v0, 0x8($s0)
  00308448  lhu        $v0, 0x8($s0)
  0030844c  and        $v0, $v0, $v1
  00308450  or         $v0, $v0, $a1
  00308454  sh         $v0, 0x8($s0)
  00308458  sw         $zero, 0xc($s0)
  0030845c  lw         $v0, 0x10($s0)
  00308460  and        $v0, $v0, $a2
  00308464  or         $v0, $v0, $t0
  00308468  sw         $v0, 0x10($s0)
  0030846c  lhu        $v0, 0x10($s0)
  00308470  and        $v0, $v0, $v1
  00308474  or         $v0, $v0, $a1
  00308478  sh         $v0, 0x10($s0)
  0030847c  sw         $zero, 0x14($s0)
  00308480  sw         $zero, 0x20($s0)
  00308484  sw         $zero, 0x24($s0)
  00308488  sw         $a3, 0x28($s0)
  0030848c  sw         $zero, 0x18($s0)
  00308490  sw         $zero, 0x1c($s0)
  00308494  sw         $zero, 0x30($s0)
  00308498  jal        func_00308730
  0030849c  sw         $zero, 0x34($s0)                        # delay slot
  003084a0  sb         $zero, 0x8c($s0)
  003084a4  dsll32     $v0, $zero, 14
  003084a8  lw         $t4, 0x18c($s0)
  003084ac  dsrl32     $v0, $v0, 14
  003084b0  sll        $t3, $v0, 14
  003084b4  lui        $a1, 0x73
  003084b8  addiu      $v0, $zero, -0x1
  003084bc  lui        $a2, 0x31
  003084c0  lui        $a3, 0x73
  003084c4  addiu      $v1, $zero, 0x3fff
  003084c8  dsll32     $a0, $v0, 0
  003084cc  addiu      $t0, $zero, -0x4000
  003084d0  or         $t2, $v1, $a0
  003084d4  andi       $t1, $zero, 0x3fff
  003084d8  and        $v1, $t4, $t2
  003084dc  lui        $a0, 0x76
  003084e0  or         $v1, $v1, $t3
  003084e4  addiu      $a0, $a0, 0x56c0                        # 0x007656c0
  003084e8  sw         $v1, 0x18c($s0)
  003084ec  lui        $at, 0x79
  003084f0  lhu        $v1, 0x18c($s0)
  003084f4  addiu      $a1, $a1, -0x57a0                       # 0x0072a860 "OpenBF"
  003084f8  addiu      $a2, $a2, -0x7d00                       # 0x00308300 -> func_00308300
  003084fc  and        $v1, $v1, $t0
  00308500  or         $v1, $v1, $t1
  00308504  sh         $v1, 0x18c($s0)
  00308508  sw         $zero, 0x190($s0)
  0030850c  lw         $v1, 0x2c($sp)
  00308510  sw         $a0, 0x88($v1)
  00308514  lw         $a0, 0x2c($sp)
  00308518  lw         $v1, 0x194($a0)
  0030851c  and        $v1, $v1, $t2
  00308520  or         $v1, $v1, $t3
  00308524  sw         $v1, 0x194($a0)
  00308528  lw         $a0, 0x2c($sp)
  0030852c  lhu        $v1, 0x194($a0)
  00308530  and        $v1, $v1, $t0
  00308534  or         $v1, $v1, $t1
  00308538  sh         $v1, 0x194($a0)
  0030853c  lw         $v1, 0x2c($sp)
  00308540  sw         $zero, 0x198($v1)
  00308544  lw         $v1, 0x2c($sp)
  00308548  sw         $zero, 0x1a4($v1)
  0030854c  lw         $v1, 0x2c($sp)
  00308550  sw         $zero, 0x1a8($v1)
  00308554  lw         $v1, 0x2c($sp)
  00308558  sw         $v0, 0x1ac($v1)
  0030855c  lw         $v1, 0x2c($sp)
  00308560  sw         $zero, 0x19c($v1)
  00308564  lw         $v1, 0x2c($sp)
  00308568  sw         $zero, 0x1a0($v1)
  0030856c  lw         $v1, 0x2c($sp)
  00308570  sb         $zero, 0x1b0($v1)
  00308574  lw         $v1, 0x2c($sp)
  00308578  sb         $zero, 0x2b0($v1)
  0030857c  lw         $v1, 0x2c($sp)
  00308580  sb         $zero, 0x3b0($v1)
  00308584  lw         $v1, 0x2c($sp)
  00308588  sb         $zero, 0x4b0($v1)
  0030858c  lw         $v1, 0x2c($sp)
  00308590  sw         $zero, 0x5bc($v1)
  00308594  lw         $v1, 0x2c($sp)
  00308598  sw         $zero, 0x5c0($v1)
  0030859c  lw         $v1, 0x2c($sp)
  003085a0  sw         $v0, 0x5c4($v1)
  003085a4  lw         $v0, 0x2c($sp)
  003085a8  sw         $zero, 0x5b4($v0)
  003085ac  lw         $v0, 0x2c($sp)
  003085b0  sw         $zero, 0x5b8($v0)
  003085b4  lw         $v0, 0x2c($sp)
  003085b8  sw         $zero, 0x5cc($v0)
  003085bc  lw         $v0, 0x2c($sp)
  003085c0  sw         $zero, 0x5c8($v0)
  003085c4  lw         $v0, 0x2c($sp)
  003085c8  sw         $zero, 0x5d0($v0)
  003085cc  lw         $v0, 0x2c($sp)
  003085d0  sb         $zero, 0x5d4($v0)
  003085d4  lw         $v0, 0x2c($sp)
  003085d8  sb         $zero, 0x6d4($v0)
  003085dc  lw         $a0, 0x5f68($at)
  003085e0  jal        func_003CF1B0
  003085e4  addiu      $a3, $a3, -0x5790                       # delay slot; 0x0072a870 " [BigFileName] "
  003085e8  lui        $at, 0x79
  003085ec  lui        $a1, 0x73
  003085f0  lw         $a0, 0x5f68($at)
  003085f4  lui        $a2, 0x31
  003085f8  lui        $a3, 0x73
  003085fc  addiu      $a1, $a1, -0x5780                       # 0x0072a880 "OpenBFS"
  00308600  addiu      $a2, $a2, -0x7ca0                       # 0x00308360 -> func_00308360
  00308604  jal        func_003CF1B0
  00308608  addiu      $a3, $a3, -0x5778                       # delay slot; 0x0072a888 " [BigFileName]"
  0030860c  lui        $at, 0x79
  00308610  lui        $a1, 0x73
  00308614  lw         $a0, 0x5f68($at)
  00308618  lui        $a2, 0x31
  0030861c  lui        $a3, 0x73
  00308620  addiu      $a1, $a1, -0x5768                       # 0x0072a898 "ForceBF"
  00308624  addiu      $a2, $a2, -0x7d00                       # 0x00308300 -> func_00308300
  00308628  jal        func_003CF1B0
  0030862c  addiu      $a3, $a3, -0x5760                       # delay slot; 0x0072a8a0 "No Comment"
  00308630  lui        $at, 0x79
  00308634  lui        $a1, 0x73
  00308638  lw         $a0, 0x5f68($at)
  0030863c  lui        $a2, 0x31
  00308640  lui        $a3, 0x73
  00308644  addiu      $a1, $a1, -0x5750                       # 0x0072a8b0 "CloseBF"
  00308648  addiu      $a2, $a2, -0x7c40                       # 0x003083c0 -> func_003083C0
  0030864c  jal        func_003CF1B0
  00308650  addiu      $a3, $a3, -0x5760                       # delay slot; 0x0072a8a0 "No Comment"
  00308654  lui        $at, 0x79
  00308658  lui        $a1, 0x73
  0030865c  lw         $a0, 0x5f68($at)
  00308660  lui        $a2, 0x31
  00308664  lui        $a3, 0x73
  00308668  addiu      $a1, $a1, -0x5748                       # 0x0072a8b8 "CloneClass"
  0030866c  addiu      $a2, $a2, -0x56b0                       # 0x0030a950 -> func_0030A950
  00308670  jal        func_003CF1B0
  00308674  addiu      $a3, $a3, -0x5730                       # delay slot; 0x0072a8d0 " ClonedClassName ClassName"
  00308678  lw         $v0, 0x2c($sp)
  0030867c  sb         $zero, 0x4b0($v0)
  00308680  lw         $v0, 0x2c($sp)
  00308684  sb         $zero, 0x3b0($v0)
  00308688  lw         $v0, 0x2c($sp)
  0030868c  sb         $zero, 0x5b0($v0)
  00308690  lw         $v0, 0x2c($sp)
  00308694  sb         $zero, 0x5b1($v0)
  00308698  lw         $v0, 0x2c($sp)
  0030869c  sb         $zero, 0x5b2($v0)
  003086a0  lw         $a1, -0x7c8c($gp)
  003086a4  beq        $a1, $zero, .L000
  003086a8  nop                                                # delay slot
  003086ac  lw         $v0, 0x2c($sp)
  003086b0  jal        func_003F45F8
  003086b4  addiu      $a0, $v0, 0x1b0                         # delay slot
.L000:
  003086b8  lw         $a1, -0x7c88($gp)
  003086bc  beq        $a1, $zero, .L001
  003086c0  nop                                                # delay slot
  003086c4  lw         $v0, 0x2c($sp)
  003086c8  jal        func_003F45F8
  003086cc  addiu      $a0, $v0, 0x2b0                         # delay slot
.L001:
  003086d0  lw         $v0, 0x2c($sp)
  003086d4  lui        $a1, 0x73
  003086d8  lw         $a2, -0x7e4c($gp)
  003086dc  addiu      $a1, $a1, -0x5710                       # 0x0072a8f0 "v1.%02d%s%s"
  003086e0  lw         $a3, -0x7c90($gp)
  003086e4  lw         $t0, -0x7c84($gp)
  003086e8  jal        func_00231510
  003086ec  addiu      $a0, $v0, 0x6d4                         # delay slot
  003086f0  lw         $v0, 0x2c($sp)
  003086f4  addiu      $a1, $v0, 0x6d4
  003086f8  beq        $a1, $zero, .L002
  003086fc  addiu      $a0, $v0, 0x5d4                         # delay slot
  00308700  jal        func_003F45F8
  00308704  nop                                                # delay slot
.L002:
  00308708  lw         $v0, 0x2c($sp)
  0030870c  lui        $a1, 0x73
  00308710  addiu      $a1, $a1, -0x5700                       # 0x0072a900 " - Asobo Studio - Internal Cross Technology"
  00308714  jal        func_003F41F8
  00308718  addiu      $a0, $v0, 0x5d4                         # delay slot
  0030871c  lw         $v0, 0x2c($sp)
  00308720  ld         $ra, 0x10($sp)
  00308724  lq         $s0, 0x0($sp)
  00308728  jr         $ra
  0030872c  addiu      $sp, $sp, 0x30                          # delay slot
/* end of func_003083F0 */
