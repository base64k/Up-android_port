/**************************************************************************
 * func_002F6470
 *
 * address      : 0x002f6470 .. 0x002f6904  (1172 bytes, 293 instructions)
 * discovered by: called
 * called from  : 0x002f4420
 * string hint  : "!!DBuffer overflow: %s (%.3fko)"
 */
glabel func_002F6470
  002f6470  addiu      $sp, $sp, -0x230
  002f6474  sd         $ra, 0x10($sp)
  002f6478  sq         $s0, 0x0($sp)
  002f647c  lw         $v1, 0x4640($a0)
  002f6480  daddu      $s0, $a0, $zero
  002f6484  lw         $a1, 0x4650($a0)
  002f6488  lw         $v0, 0x463c($a0)
  002f648c  dsll32     $v1, $v1, 4
  002f6490  dsrl32     $v1, $v1, 4
  002f6494  dsll32     $a0, $a1, 4
  002f6498  dsrl32     $a0, $a0, 4
  002f649c  subu       $v1, $a0, $v1
  002f64a0  sra        $v1, $v1, 4
  002f64a4  subu       $v0, $v0, $v1
  002f64a8  bgez       $v0, .L000
  002f64ac  nop                                                # delay slot
  002f64b0  sll        $v0, $v0, 4
  002f64b4  sb         $zero, 0x20($sp)
  002f64b8  subu       $v1, $zero, $v0
  002f64bc  mtc1       $v1, $f1
  002f64c0  lui        $v0, 0x4480
  002f64c4  mtc1       $v0, $f0
  002f64c8  nop
  002f64cc  cvt.s.w    $f1, $f1
  002f64d0  div.s      $f12, $f1, $f0
  002f64d4  nop
  002f64d8  nop
  002f64dc  jal        func_00201F20
  002f64e0  nop                                                # delay slot
  002f64e4  lui        $a1, 0x73
  002f64e8  lui        $a2, 0x73
  002f64ec  daddu      $a3, $v0, $zero
  002f64f0  addiu      $a0, $sp, 0x20
  002f64f4  addiu      $a1, $a1, -0x5e90                       # 0x0072a170 "!!DBuffer overflow: %s (%.3fko)"
  002f64f8  jal        func_0026F990
  002f64fc  addiu      $a2, $a2, -0x5e70                       # delay slot; 0x0072a190 "Path1/2"
.L000:
  002f6500  lw         $a0, 0x4678($s0)
  002f6504  lw         $v1, 0x4668($s0)
  002f6508  lw         $v0, 0x4664($s0)
  002f650c  dsll32     $a0, $a0, 4
  002f6510  dsll32     $v1, $v1, 4
  002f6514  dsrl32     $a0, $a0, 4
  002f6518  dsrl32     $v1, $v1, 4
  002f651c  subu       $v1, $a0, $v1
  002f6520  sra        $v1, $v1, 4
  002f6524  subu       $v0, $v0, $v1
  002f6528  bgez       $v0, .L001
  002f652c  nop                                                # delay slot
  002f6530  sll        $v0, $v0, 4
  002f6534  sb         $zero, 0xa0($sp)
  002f6538  subu       $v1, $zero, $v0
  002f653c  mtc1       $v1, $f1
  002f6540  lui        $v0, 0x4480
  002f6544  mtc1       $v0, $f0
  002f6548  nop
  002f654c  cvt.s.w    $f1, $f1
  002f6550  div.s      $f12, $f1, $f0
  002f6554  nop
  002f6558  nop
  002f655c  jal        func_00201F20
  002f6560  nop                                                # delay slot
  002f6564  lui        $a1, 0x73
  002f6568  lui        $a2, 0x73
  002f656c  daddu      $a3, $v0, $zero
  002f6570  addiu      $a0, $sp, 0xa0
  002f6574  addiu      $a1, $a1, -0x5e90                       # 0x0072a170 "!!DBuffer overflow: %s (%.3fko)"
  002f6578  jal        func_0026F990
  002f657c  addiu      $a2, $a2, -0x5e68                       # delay slot; 0x0072a198 "Path3"
.L001:
  002f6580  lw         $v1, 0x4650($s0)
  002f6584  lui        $v0, 0x1000
  002f6588  ori        $a1, $v0, 0x19
  002f658c  lui        $a0, 0x600
  002f6590  daddu      $v0, $zero, $zero
  002f6594  sw         $a1, 0x0($v1)
  002f6598  lw         $v1, 0x4650($s0)
  002f659c  sw         $zero, 0x4($v1)
  002f65a0  lw         $v1, 0x4650($s0)
  002f65a4  sw         $zero, 0x8($v1)
  002f65a8  lw         $v1, 0x4650($s0)
  002f65ac  sw         $a0, 0xc($v1)
  002f65b0  lw         $v1, 0x4650($s0)
  002f65b4  addiu      $v1, $v1, 0x10
  002f65b8  sw         $v1, 0x4650($s0)
.L002:
  002f65bc  lw         $a1, 0x4650($s0)
  002f65c0  addiu      $v0, $v0, 0x8
  002f65c4  slti       $v1, $v0, 0x18
  002f65c8  addiu      $a0, $a1, 0x10
  002f65cc  sw         $a0, 0x4650($s0)
  002f65d0  sq         $zero, 0x0($a1)
  002f65d4  lw         $a1, 0x4650($s0)
  002f65d8  addiu      $a0, $a1, 0x10
  002f65dc  sw         $a0, 0x4650($s0)
  002f65e0  sq         $zero, 0x0($a1)
  002f65e4  lw         $a1, 0x4650($s0)
  002f65e8  addiu      $a0, $a1, 0x10
  002f65ec  sw         $a0, 0x4650($s0)
  002f65f0  sq         $zero, 0x0($a1)
  002f65f4  lw         $a1, 0x4650($s0)
  002f65f8  addiu      $a0, $a1, 0x10
  002f65fc  sw         $a0, 0x4650($s0)
  002f6600  sq         $zero, 0x0($a1)
  002f6604  lw         $a1, 0x4650($s0)
  002f6608  addiu      $a0, $a1, 0x10
  002f660c  sw         $a0, 0x4650($s0)
  002f6610  sq         $zero, 0x0($a1)
  002f6614  lw         $a1, 0x4650($s0)
  002f6618  addiu      $a0, $a1, 0x10
  002f661c  sw         $a0, 0x4650($s0)
  002f6620  sq         $zero, 0x0($a1)
  002f6624  lw         $a1, 0x4650($s0)
  002f6628  addiu      $a0, $a1, 0x10
  002f662c  sw         $a0, 0x4650($s0)
  002f6630  sq         $zero, 0x0($a1)
  002f6634  lw         $a1, 0x4650($s0)
  002f6638  addiu      $a0, $a1, 0x10
  002f663c  sw         $a0, 0x4650($s0)
  002f6640  bne        $v1, $zero, .L002
  002f6644  sq         $zero, 0x0($a1)                         # delay slot
  002f6648  lw         $v0, 0x4650($s0)
  002f664c  lui        $v1, 0x600
  002f6650  daddu      $a0, $s0, $zero
  002f6654  sw         $v1, 0x0($v0)
  002f6658  lw         $v0, 0x4650($s0)
  002f665c  sw         $zero, 0x4($v0)
  002f6660  lw         $v0, 0x4650($s0)
  002f6664  sw         $zero, 0x8($v0)
  002f6668  lw         $v0, 0x4650($s0)
  002f666c  sw         $zero, 0xc($v0)
  002f6670  lw         $v0, 0x4650($s0)
  002f6674  addiu      $v0, $v0, 0x10
  002f6678  jal        func_002F6910
  002f667c  sw         $v0, 0x4650($s0)                        # delay slot
  002f6680  lw         $a0, 0x4650($s0)
  002f6684  lw         $v1, 0x4640($s0)
  002f6688  lw         $v0, 0x463c($s0)
  002f668c  dsll32     $a0, $a0, 4
  002f6690  dsll32     $v1, $v1, 4
  002f6694  dsrl32     $a0, $a0, 4
  002f6698  dsrl32     $v1, $v1, 4
  002f669c  subu       $v1, $a0, $v1
  002f66a0  sra        $v1, $v1, 4
  002f66a4  subu       $v0, $v0, $v1
  002f66a8  bgez       $v0, .L003
  002f66ac  nop                                                # delay slot
  002f66b0  sll        $v0, $v0, 4
  002f66b4  sb         $zero, 0x120($sp)
  002f66b8  subu       $v1, $zero, $v0
  002f66bc  mtc1       $v1, $f1
  002f66c0  lui        $v0, 0x4480
  002f66c4  mtc1       $v0, $f0
  002f66c8  nop
  002f66cc  cvt.s.w    $f1, $f1
  002f66d0  div.s      $f12, $f1, $f0
  002f66d4  nop
  002f66d8  nop
  002f66dc  jal        func_00201F20
  002f66e0  nop                                                # delay slot
  002f66e4  lui        $a1, 0x73
  002f66e8  lui        $a2, 0x73
  002f66ec  daddu      $a3, $v0, $zero
  002f66f0  addiu      $a0, $sp, 0x120
  002f66f4  addiu      $a1, $a1, -0x5e90                       # 0x0072a170 "!!DBuffer overflow: %s (%.3fko)"
  002f66f8  jal        func_0026F990
  002f66fc  addiu      $a2, $a2, -0x5e60                       # delay slot; 0x0072a1a0 "Path 1/2"
.L003:
  002f6700  lw         $a0, 0x4678($s0)
  002f6704  lw         $v1, 0x4668($s0)
  002f6708  lw         $v0, 0x4664($s0)
  002f670c  dsll32     $a0, $a0, 4
  002f6710  dsll32     $v1, $v1, 4
  002f6714  dsrl32     $a0, $a0, 4
  002f6718  dsrl32     $v1, $v1, 4
  002f671c  subu       $v1, $a0, $v1
  002f6720  sra        $v1, $v1, 4
  002f6724  subu       $v0, $v0, $v1
  002f6728  bgez       $v0, .L004
  002f672c  nop                                                # delay slot
  002f6730  sll        $v0, $v0, 4
  002f6734  sb         $zero, 0x1a0($sp)
  002f6738  subu       $v1, $zero, $v0
  002f673c  mtc1       $v1, $f1
  002f6740  lui        $v0, 0x4480
  002f6744  mtc1       $v0, $f0
  002f6748  nop
  002f674c  cvt.s.w    $f1, $f1
  002f6750  div.s      $f12, $f1, $f0
  002f6754  nop
  002f6758  nop
  002f675c  jal        func_00201F20
  002f6760  nop                                                # delay slot
  002f6764  lui        $a1, 0x73
  002f6768  lui        $a2, 0x73
  002f676c  daddu      $a3, $v0, $zero
  002f6770  addiu      $a0, $sp, 0x1a0
  002f6774  addiu      $a1, $a1, -0x5e90                       # 0x0072a170 "!!DBuffer overflow: %s (%.3fko)"
  002f6778  jal        func_0026F990
  002f677c  addiu      $a2, $a2, -0x5e50                       # delay slot; 0x0072a1b0 "Path 3"
.L004:
  002f6780  lwc1       $f0, 0x4650($s0)
  002f6784  lui        $a2, 0x1000
  002f6788  lui        $v0, 0x600
  002f678c  addiu      $a3, $sp, 0x22c
  002f6790  ori        $a1, $v0, 0x8000
  002f6794  lui        $v1, 0x7000
  002f6798  lui        $v0, 0xfff
  002f679c  lui        $at, 0x7a
  002f67a0  ori        $t0, $v0, 0xffff
  002f67a4  ori        $t1, $a2, 0x9030
  002f67a8  ori        $t2, $a2, 0x9020
  002f67ac  daddu      $a0, $zero, $zero
  002f67b0  swc1       $f0, 0x0($a3)
  002f67b4  lw         $v0, 0x4650($s0)
  002f67b8  sw         $a2, 0x0($v0)
  002f67bc  lw         $v0, 0x4650($s0)
  002f67c0  sw         $zero, 0x4($v0)
  002f67c4  lw         $v0, 0x4650($s0)
  002f67c8  sw         $zero, 0x8($v0)
  002f67cc  lw         $v0, 0x4650($s0)
  002f67d0  sw         $a1, 0xc($v0)
  002f67d4  lw         $v0, 0x4650($s0)
  002f67d8  addiu      $v0, $v0, 0x10
  002f67dc  sw         $v0, 0x4650($s0)
  002f67e0  lw         $v0, 0x4650($s0)
  002f67e4  sw         $v1, 0x0($v0)
  002f67e8  lw         $v0, 0x4650($s0)
  002f67ec  sw         $zero, 0x4($v0)
  002f67f0  lw         $v0, 0x4650($s0)
  002f67f4  sw         $zero, 0x8($v0)
  002f67f8  lw         $v0, 0x4650($s0)
  002f67fc  sw         $zero, 0xc($v0)
  002f6800  lw         $v0, 0x4650($s0)
  002f6804  addiu      $v0, $v0, 0x10
  002f6808  sw         $v0, 0x4650($s0)
  002f680c  lw         $v1, 0x22c($sp)
  002f6810  and        $v0, $v1, $t0
  002f6814  sw         $v1, 0x78c4($at)
  002f6818  sw         $v0, 0x0($t1)
  002f681c  jal        func_003DC820
  002f6820  sw         $zero, 0x0($t2)                         # delay slot
  002f6824  sync
  002f6828  sync
  002f682c  lui        $v0, 0x1000
  002f6830  addiu      $v1, $zero, 0x145
  002f6834  ori        $v0, $v0, 0x9000
  002f6838  addiu      $a0, $zero, 0x1
  002f683c  jal        func_002DCF30
  002f6840  sw         $v1, 0x0($v0)                           # delay slot
  002f6844  lbu        $v1, 0x111c($s0)
  002f6848  addiu      $v0, $s0, 0x4654
  002f684c  lui        $at, 0x7a
  002f6850  daddu      $a0, $zero, $zero
  002f6854  sll        $v1, $v1, 2
  002f6858  addu       $v0, $v0, $v1
  002f685c  lw         $v0, 0x0($v0)
  002f6860  sw         $v0, 0x78c8($at)
  002f6864  dsll32     $v0, $v0, 4
  002f6868  lui        $at, 0x1001
  002f686c  dsrl32     $v0, $v0, 4
  002f6870  sw         $v0, -0x5fd0($at)
  002f6874  lui        $at, 0x1001
  002f6878  jal        func_003DC820
  002f687c  sw         $zero, -0x5fe0($at)                     # delay slot
  002f6880  sync
  002f6884  sync
  002f6888  addiu      $v0, $zero, 0x105
  002f688c  lui        $at, 0x1001
  002f6890  jal        func_002E0480
  002f6894  sw         $v0, -0x6000($at)                       # delay slot
  002f6898  swc1       $f0, 0x12c8($s0)
  002f689c  addiu      $v0, $s0, 0x462c
  002f68a0  lbu        $v1, 0x111c($s0)
  002f68a4  lui        $at, 0x7a
  002f68a8  daddu      $a0, $zero, $zero
  002f68ac  sll        $v1, $v1, 2
  002f68b0  addu       $v0, $v0, $v1
  002f68b4  lw         $v0, 0x0($v0)
  002f68b8  sw         $v0, 0x78c4($at)
  002f68bc  dsll32     $v0, $v0, 4
  002f68c0  lui        $at, 0x1001
  002f68c4  dsrl32     $v0, $v0, 4
  002f68c8  sw         $v0, -0x6fd0($at)
  002f68cc  lui        $at, 0x1001
  002f68d0  jal        func_003DC820
  002f68d4  sw         $zero, -0x6fe0($at)                     # delay slot
  002f68d8  sync
  002f68dc  sync
  002f68e0  addiu      $v0, $zero, 0x145
  002f68e4  lui        $at, 0x1001
  002f68e8  daddu      $a0, $s0, $zero
  002f68ec  jal        func_002F60B0
  002f68f0  sw         $v0, -0x7000($at)                       # delay slot
  002f68f4  ld         $ra, 0x10($sp)
  002f68f8  lq         $s0, 0x0($sp)
  002f68fc  jr         $ra
  002f6900  addiu      $sp, $sp, 0x230                         # delay slot
/* end of func_002F6470 */
