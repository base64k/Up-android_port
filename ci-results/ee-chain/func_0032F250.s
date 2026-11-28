/**************************************************************************
 * func_0032F250
 *
 * address      : 0x0032f250 .. 0x003307fc  (5548 bytes, 1387 instructions)
 * discovered by: called
 * called from  : 0x0032f1c8
 * string hint  : "ParticlesManager_Z(\"ParticlesManager\")"
 */
glabel func_0032F250
  0032f250  addiu      $sp, $sp, -0x40
  0032f254  sd         $ra, 0x10($sp)
  0032f258  jal        func_0030CC90
  0032f25c  sq         $s0, 0x0($sp)                           # delay slot
  0032f260  lui        $a0, 0x73
  0032f264  jal        func_002DD080
  0032f268  addiu      $a0, $a0, -0x4358                       # delay slot; 0x0072bca8 "Target Init"
  0032f26c  jal        func_00443850
  0032f270  nop                                                # delay slot
  0032f274  jal        func_00444020
  0032f278  nop                                                # delay slot
  0032f27c  lui        $a0, 0x79
  0032f280  jal        func_004B7A60
  0032f284  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032f288  lui        $at, 0x79
  0032f28c  sw         $v0, 0x57b8($at)
  0032f290  lui        $at, 0x79
  0032f294  lw         $v0, 0x5f70($at)
  0032f298  bne        $v0, $zero, .L002
  0032f29c  lui        $a1, 0x73                               # delay slot
  0032f2a0  lui        $a2, 0x73
  0032f2a4  addiu      $a0, $zero, 0x7d4
  0032f2a8  addiu      $a1, $a1, -0x4348
  0032f2ac  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  0032f2b0  jal        func_002DCB00
  0032f2b4  addiu      $a3, $zero, 0x1be                       # delay slot
  0032f2b8  beq        $v0, $zero, .L000
  0032f2bc  nop                                                # delay slot
  0032f2c0  jal        func_003083F0
  0032f2c4  daddu      $a0, $v0, $zero                         # delay slot
.L000:
  0032f2c8  lui        $at, 0x79
  0032f2cc  sw         $v0, 0x5f70($at)
  0032f2d0  lui        $at, 0x79
  0032f2d4  lw         $a0, 0x5f70($at)
  0032f2d8  lw         $t9, 0x88($a0)
  0032f2dc  lw         $t9, 0xc($t9)
  0032f2e0  jalr       $t9
  0032f2e4  nop                                                # delay slot
  0032f2e8  bne        $v0, $zero, .L001
  0032f2ec  lui        $a0, 0x79                               # delay slot
  0032f2f0  jal        func_00427D60
  0032f2f4  daddu      $a0, $zero, $zero                       # delay slot
  0032f2f8  daddu      $a0, $v0, $zero
  0032f2fc  jal        func_00485540
  0032f300  addiu      $a1, $zero, 0x8                         # delay slot
  0032f304  lui        $a1, 0x73
  0032f308  lui        $a3, 0x73
  0032f30c  daddu      $a2, $v0, $zero
  0032f310  daddu      $a0, $zero, $zero
  0032f314  addiu      $a1, $a1, -0x4328                       # 0x0072bcd8 "Fatal error"
  0032f318  jal        func_003CEC60
  0032f31c  addiu      $a3, $a3, -0x4348                       # delay slot; 0x0072bcb8 "ClassManager_Z"
  0032f320  jal        func_003EFA08
  0032f324  daddu      $a0, $zero, $zero                       # delay slot
  0032f328  b          .L002
  0032f32c  nop                                                # delay slot
.L001:
  0032f330  jal        func_004B7A60
  0032f334  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032f338  lui        $at, 0x79
  0032f33c  sw         $v0, 0x57b8($at)
.L002:
  0032f340  jal        func_00332510
  0032f344  nop                                                # delay slot
  0032f348  jal        func_004854A0
  0032f34c  nop                                                # delay slot
  0032f350  lui        $a0, 0x79
  0032f354  jal        func_004B7A60
  0032f358  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032f35c  lui        $at, 0x79
  0032f360  sw         $v0, 0x57b8($at)
  0032f364  lui        $at, 0x79
  0032f368  lw         $v0, 0x5ffc($at)
  0032f36c  bne        $v0, $zero, .L004
  0032f370  lui        $a1, 0x73                               # delay slot
  0032f374  lui        $a2, 0x73
  0032f378  addiu      $a0, $zero, 0x1404
  0032f37c  addiu      $a1, $a1, -0x4318
  0032f380  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  0032f384  jal        func_002DCB00
  0032f388  addiu      $a3, $zero, 0x1c8                       # delay slot
  0032f38c  beq        $v0, $zero, .L003
  0032f390  nop                                                # delay slot
  0032f394  jal        func_004BA1A0
  0032f398  daddu      $a0, $v0, $zero                         # delay slot
.L003:
  0032f39c  lui        $at, 0x79
  0032f3a0  lui        $a0, 0x79
  0032f3a4  sw         $v0, 0x5ffc($at)
  0032f3a8  jal        func_004B7A60
  0032f3ac  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032f3b0  lui        $at, 0x79
  0032f3b4  sw         $v0, 0x57b8($at)
.L004:
  0032f3b8  jal        func_00241A10
  0032f3bc  nop                                                # delay slot
  0032f3c0  lui        $a0, 0x79
  0032f3c4  jal        func_004B7A60
  0032f3c8  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032f3cc  lui        $at, 0x79
  0032f3d0  sw         $v0, 0x57b8($at)
  0032f3d4  lui        $at, 0x79
  0032f3d8  lw         $v0, 0x5fcc($at)
  0032f3dc  bne        $v0, $zero, .L007
  0032f3e0  nop                                                # delay slot
  0032f3e4  lui        $a1, 0x73
  0032f3e8  lui        $a2, 0x73
  0032f3ec  addiu      $a0, $zero, 0x2ad0
  0032f3f0  addiu      $a1, $a1, -0x4300                       # 0x0072bd00 "StreamManager_Z"
  0032f3f4  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  0032f3f8  jal        func_002DCB00
  0032f3fc  addiu      $a3, $zero, 0x1cd                       # delay slot
  0032f400  beq        $v0, $zero, .L005
  0032f404  nop                                                # delay slot
  0032f408  jal        func_00456020
  0032f40c  daddu      $a0, $v0, $zero                         # delay slot
.L005:
  0032f410  lui        $at, 0x79
  0032f414  sw         $v0, 0x5fcc($at)
  0032f418  lui        $at, 0x79
  0032f41c  jal        func_004567F0
  0032f420  lw         $a0, 0x5fcc($at)                        # delay slot
  0032f424  bne        $v0, $zero, .L006
  0032f428  lui        $a0, 0x79                               # delay slot
  0032f42c  jal        func_00427D60
  0032f430  daddu      $a0, $zero, $zero                       # delay slot
  0032f434  daddu      $a0, $v0, $zero
  0032f438  jal        func_00485540
  0032f43c  addiu      $a1, $zero, 0x8                         # delay slot
  0032f440  lui        $a1, 0x73
  0032f444  lui        $a3, 0x73
  0032f448  daddu      $a2, $v0, $zero
  0032f44c  daddu      $a0, $zero, $zero
  0032f450  addiu      $a1, $a1, -0x4328                       # 0x0072bcd8 "Fatal error"
  0032f454  jal        func_003CEC60
  0032f458  addiu      $a3, $a3, -0x4300                       # delay slot; 0x0072bd00 "StreamManager_Z"
  0032f45c  jal        func_003EFA08
  0032f460  daddu      $a0, $zero, $zero                       # delay slot
  0032f464  b          .L007
  0032f468  nop                                                # delay slot
.L006:
  0032f46c  jal        func_004B7A60
  0032f470  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032f474  lui        $at, 0x79
  0032f478  sw         $v0, 0x57b8($at)
.L007:
  0032f47c  lui        $a0, 0x79
  0032f480  jal        func_004B7A60
  0032f484  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032f488  lui        $at, 0x79
  0032f48c  sw         $v0, 0x57b8($at)
  0032f490  lui        $at, 0x79
  0032f494  lw         $v0, 0x5f8c($at)
  0032f498  bne        $v0, $zero, .L009
  0032f49c  nop                                                # delay slot
  0032f4a0  lui        $a1, 0x73
  0032f4a4  lui        $a2, 0x73
  0032f4a8  addiu      $a0, $zero, 0x44
  0032f4ac  addiu      $a1, $a1, -0x42f0                       # 0x0072bd10 "Mat4x4Buffer_Z"
  0032f4b0  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  0032f4b4  jal        func_002DCB00
  0032f4b8  addiu      $a3, $zero, 0x1ce                       # delay slot
  0032f4bc  beq        $v0, $zero, .L008
  0032f4c0  nop                                                # delay slot
  0032f4c4  jal        func_00360B00
  0032f4c8  daddu      $a0, $v0, $zero                         # delay slot
.L008:
  0032f4cc  lui        $at, 0x79
  0032f4d0  lui        $a0, 0x79
  0032f4d4  sw         $v0, 0x5f8c($at)
  0032f4d8  jal        func_004B7A60
  0032f4dc  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032f4e0  lui        $at, 0x79
  0032f4e4  sw         $v0, 0x57b8($at)
.L009:
  0032f4e8  lui        $a0, 0x79
  0032f4ec  jal        func_004B7A60
  0032f4f0  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032f4f4  lui        $at, 0x79
  0032f4f8  sw         $v0, 0x57b8($at)
  0032f4fc  lui        $at, 0x79
  0032f500  lw         $v0, 0x5f90($at)
  0032f504  bne        $v0, $zero, .L011
  0032f508  nop                                                # delay slot
  0032f50c  lui        $a1, 0x73
  0032f510  lui        $a2, 0x73
  0032f514  addiu      $a0, $zero, 0x44
  0032f518  addiu      $a1, $a1, -0x42f0                       # 0x0072bd10 "Mat4x4Buffer_Z"
  0032f51c  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  0032f520  jal        func_002DCB00
  0032f524  addiu      $a3, $zero, 0x1cf                       # delay slot
  0032f528  beq        $v0, $zero, .L010
  0032f52c  nop                                                # delay slot
  0032f530  jal        func_00360B00
  0032f534  daddu      $a0, $v0, $zero                         # delay slot
.L010:
  0032f538  lui        $at, 0x79
  0032f53c  lui        $a0, 0x79
  0032f540  sw         $v0, 0x5f90($at)
  0032f544  jal        func_004B7A60
  0032f548  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032f54c  lui        $at, 0x79
  0032f550  sw         $v0, 0x57b8($at)
.L011:
  0032f554  lui        $at, 0x79
  0032f558  lui        $a1, 0x73
  0032f55c  lw         $a0, 0x5f68($at)
  0032f560  lui        $a2, 0x36
  0032f564  lui        $a3, 0x73
  0032f568  addiu      $a1, $a1, -0x42e0                       # 0x0072bd20 "GetMatrixUsage"
  0032f56c  addiu      $a2, $a2, 0x2470                        # 0x00362470 -> func_00362470
  0032f570  jal        func_003CF1B0
  0032f574  addiu      $a3, $a3, -0x42d0                       # delay slot; 0x0072bd30 "No Comment"
  0032f578  lui        $at, 0x79
  0032f57c  lb         $v0, 0x680f($at)
  0032f580  bne        $v0, $zero, .L012
  0032f584  nop                                                # delay slot
  0032f588  jal        func_002DEC40
  0032f58c  nop                                                # delay slot
.L012:
  0032f590  lui        $at, 0x79
  0032f594  lw         $v0, 0x5f6c($at)
  0032f598  bne        $v0, $zero, .L015
  0032f59c  nop                                                # delay slot
  0032f5a0  lui        $a0, 0x79
  0032f5a4  jal        func_004B7A60
  0032f5a8  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032f5ac  lui        $at, 0x79
  0032f5b0  sw         $v0, 0x57b8($at)
  0032f5b4  lui        $at, 0x79
  0032f5b8  lw         $v0, 0x5f6c($at)
  0032f5bc  bne        $v0, $zero, .L015
  0032f5c0  nop                                                # delay slot
  0032f5c4  lui        $a1, 0x73
  0032f5c8  lui        $a2, 0x73
  0032f5cc  addiu      $a0, $zero, 0x3220
  0032f5d0  addiu      $a1, $a1, -0x42c0                       # 0x0072bd40 "Renderer_Z"
  0032f5d4  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  0032f5d8  jal        func_002DCB00
  0032f5dc  addiu      $a3, $zero, 0x1da                       # delay slot
  0032f5e0  beq        $v0, $zero, .L013
  0032f5e4  nop                                                # delay slot
  0032f5e8  jal        func_003951E0
  0032f5ec  daddu      $a0, $v0, $zero                         # delay slot
.L013:
  0032f5f0  lui        $at, 0x79
  0032f5f4  addiu      $a1, $zero, 0x100
  0032f5f8  sw         $v0, 0x5f6c($at)
  0032f5fc  lui        $at, 0x79
  0032f600  lw         $a0, 0x5f6c($at)
  0032f604  lw         $t9, 0x2200($a0)
  0032f608  lw         $t9, 0xc($t9)
  0032f60c  jalr       $t9
  0032f610  daddu      $a2, $a1, $zero                         # delay slot
  0032f614  bne        $v0, $zero, .L014
  0032f618  lui        $a0, 0x79                               # delay slot
  0032f61c  jal        func_00427D60
  0032f620  daddu      $a0, $zero, $zero                       # delay slot
  0032f624  daddu      $a0, $v0, $zero
  0032f628  jal        func_00485540
  0032f62c  addiu      $a1, $zero, 0x8                         # delay slot
  0032f630  lui        $a1, 0x73
  0032f634  lui        $a3, 0x73
  0032f638  daddu      $a2, $v0, $zero
  0032f63c  daddu      $a0, $zero, $zero
  0032f640  addiu      $a1, $a1, -0x4328                       # 0x0072bcd8 "Fatal error"
  0032f644  jal        func_003CEC60
  0032f648  addiu      $a3, $a3, -0x42c0                       # delay slot; 0x0072bd40 "Renderer_Z"
  0032f64c  jal        func_003EFA08
  0032f650  daddu      $a0, $zero, $zero                       # delay slot
  0032f654  b          .L015
  0032f658  nop                                                # delay slot
.L014:
  0032f65c  jal        func_004B7A60
  0032f660  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032f664  lui        $at, 0x79
  0032f668  sw         $v0, 0x57b8($at)
.L015:
  0032f66c  lui        $at, 0x79
  0032f670  lw         $v0, 0x5fdc($at)
  0032f674  bne        $v0, $zero, .L019
  0032f678  nop                                                # delay slot
  0032f67c  lui        $a0, 0x79
  0032f680  jal        func_004B7A60
  0032f684  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032f688  lui        $at, 0x79
  0032f68c  sw         $v0, 0x57b8($at)
  0032f690  lui        $at, 0x79
  0032f694  lw         $v0, 0x5fdc($at)
  0032f698  bne        $v0, $zero, .L019
  0032f69c  nop                                                # delay slot
  0032f6a0  lui        $a1, 0x73
  0032f6a4  lui        $a2, 0x73
  0032f6a8  addiu      $a0, $zero, 0x10
  0032f6ac  addiu      $a1, $a1, -0x42b0                       # 0x0072bd50 "PlayerInfoList_Z"
  0032f6b0  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  0032f6b4  jal        func_002DCB00
  0032f6b8  addiu      $a3, $zero, 0x1dc                       # delay slot
  0032f6bc  beq        $v0, $zero, .L018
  0032f6c0  nop                                                # delay slot
  0032f6c4  sw         $v0, 0x24($sp)
  0032f6c8  jal        func_00456700
  0032f6cc  daddu      $a0, $v0, $zero                         # delay slot
  0032f6d0  lw         $v0, 0x24($sp)
  0032f6d4  lui        $a1, 0x73
  0032f6d8  lui        $a2, 0x73
  0032f6dc  addiu      $a0, $zero, 0x8
  0032f6e0  addiu      $a1, $a1, -0x4298                       # 0x0072bd68 "Anonymous New"
  0032f6e4  addiu      $a2, $a2, -0x4288                       # 0x0072bd78 "PlayerInfo_Z.h"
  0032f6e8  addiu      $a3, $zero, 0x44
  0032f6ec  jal        func_002DCB00
  0032f6f0  sw         $zero, 0x4($v0)                         # delay slot
  0032f6f4  beq        $v0, $zero, .L016
  0032f6f8  dsll32     $v1, $zero, 14                          # delay slot
  0032f6fc  lw         $a3, 0x0($v0)
  0032f700  dsrl32     $v1, $v1, 14
  0032f704  sll        $a2, $v1, 14
  0032f708  addiu      $v1, $zero, -0x1
  0032f70c  dsll32     $a0, $v1, 0
  0032f710  addiu      $v1, $zero, 0x3fff
  0032f714  or         $a1, $v1, $a0
  0032f718  and        $a1, $a3, $a1
  0032f71c  addiu      $v1, $zero, -0x4000
  0032f720  or         $a1, $a1, $a2
  0032f724  andi       $a0, $zero, 0x3fff
  0032f728  sw         $a1, 0x0($v0)
  0032f72c  lhu        $a1, 0x0($v0)
  0032f730  and        $v1, $a1, $v1
  0032f734  or         $v1, $v1, $a0
  0032f738  sh         $v1, 0x0($v0)
  0032f73c  sw         $zero, 0x4($v0)
.L016:
  0032f740  lw         $v1, 0x24($sp)
  0032f744  lui        $a1, 0x73
  0032f748  lui        $a2, 0x73
  0032f74c  addiu      $a0, $zero, 0x8
  0032f750  addiu      $a1, $a1, -0x4298                       # 0x0072bd68 "Anonymous New"
  0032f754  addiu      $a2, $a2, -0x4288                       # 0x0072bd78 "PlayerInfo_Z.h"
  0032f758  addiu      $a3, $zero, 0x45
  0032f75c  jal        func_002DCB00
  0032f760  sw         $v0, 0x8($v1)                           # delay slot
  0032f764  beq        $v0, $zero, .L017
  0032f768  dsll32     $v1, $zero, 14                          # delay slot
  0032f76c  lw         $a3, 0x0($v0)
  0032f770  dsrl32     $v1, $v1, 14
  0032f774  sll        $a2, $v1, 14
  0032f778  addiu      $v1, $zero, -0x1
  0032f77c  dsll32     $a0, $v1, 0
  0032f780  addiu      $v1, $zero, 0x3fff
  0032f784  or         $a1, $v1, $a0
  0032f788  and        $a1, $a3, $a1
  0032f78c  addiu      $v1, $zero, -0x4000
  0032f790  or         $a1, $a1, $a2
  0032f794  andi       $a0, $zero, 0x3fff
  0032f798  sw         $a1, 0x0($v0)
  0032f79c  lhu        $a1, 0x0($v0)
  0032f7a0  and        $v1, $a1, $v1
  0032f7a4  or         $v1, $v1, $a0
  0032f7a8  sh         $v1, 0x0($v0)
  0032f7ac  sw         $zero, 0x4($v0)
.L017:
  0032f7b0  lw         $v1, 0x24($sp)
  0032f7b4  sw         $v0, 0xc($v1)
  0032f7b8  lw         $v0, 0x24($sp)
  0032f7bc  nop
.L018:
  0032f7c0  lui        $at, 0x79
  0032f7c4  lui        $a0, 0x79
  0032f7c8  sw         $v0, 0x5fdc($at)
  0032f7cc  jal        func_004B7A60
  0032f7d0  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032f7d4  lui        $at, 0x79
  0032f7d8  sw         $v0, 0x57b8($at)
.L019:
  0032f7dc  lui        $at, 0x79
  0032f7e0  lw         $v0, 0x5fac($at)
  0032f7e4  bne        $v0, $zero, .L022
  0032f7e8  nop                                                # delay slot
  0032f7ec  lui        $a0, 0x79
  0032f7f0  jal        func_004B7A60
  0032f7f4  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032f7f8  lui        $at, 0x79
  0032f7fc  sw         $v0, 0x57b8($at)
  0032f800  lui        $at, 0x79
  0032f804  lw         $v0, 0x5fac($at)
  0032f808  bne        $v0, $zero, .L022
  0032f80c  nop                                                # delay slot
  0032f810  lui        $a1, 0x73
  0032f814  lui        $a2, 0x73
  0032f818  addiu      $a0, $zero, 0xfb0
  0032f81c  addiu      $a1, $a1, -0x4278                       # 0x0072bd88 "SoundManager_Z"
  0032f820  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  0032f824  jal        func_002DCB00
  0032f828  addiu      $a3, $zero, 0x1dd                       # delay slot
  0032f82c  beq        $v0, $zero, .L020
  0032f830  nop                                                # delay slot
  0032f834  jal        func_0035DD00
  0032f838  daddu      $a0, $v0, $zero                         # delay slot
.L020:
  0032f83c  lui        $at, 0x79
  0032f840  sw         $v0, 0x5fac($at)
  0032f844  lui        $at, 0x79
  0032f848  lw         $a0, 0x5fac($at)
  0032f84c  lw         $t9, 0x30($a0)
  0032f850  lw         $t9, 0x18($t9)
  0032f854  jalr       $t9
  0032f858  nop                                                # delay slot
  0032f85c  bne        $v0, $zero, .L021
  0032f860  lui        $a0, 0x79                               # delay slot
  0032f864  jal        func_00427D60
  0032f868  daddu      $a0, $zero, $zero                       # delay slot
  0032f86c  daddu      $a0, $v0, $zero
  0032f870  jal        func_00485540
  0032f874  addiu      $a1, $zero, 0x8                         # delay slot
  0032f878  lui        $a1, 0x73
  0032f87c  lui        $a3, 0x73
  0032f880  daddu      $a2, $v0, $zero
  0032f884  daddu      $a0, $zero, $zero
  0032f888  addiu      $a1, $a1, -0x4328                       # 0x0072bcd8 "Fatal error"
  0032f88c  jal        func_003CEC60
  0032f890  addiu      $a3, $a3, -0x4278                       # delay slot; 0x0072bd88 "SoundManager_Z"
  0032f894  jal        func_003EFA08
  0032f898  daddu      $a0, $zero, $zero                       # delay slot
  0032f89c  b          .L022
  0032f8a0  nop                                                # delay slot
.L021:
  0032f8a4  jal        func_004B7A60
  0032f8a8  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032f8ac  lui        $at, 0x79
  0032f8b0  sw         $v0, 0x57b8($at)
.L022:
  0032f8b4  lui        $at, 0x79
  0032f8b8  lw         $v0, 0x5fa8($at)
  0032f8bc  bne        $v0, $zero, .L025
  0032f8c0  nop                                                # delay slot
  0032f8c4  lui        $a0, 0x79
  0032f8c8  jal        func_004B7A60
  0032f8cc  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032f8d0  lui        $at, 0x79
  0032f8d4  sw         $v0, 0x57b8($at)
  0032f8d8  lui        $at, 0x79
  0032f8dc  lw         $v0, 0x5fa8($at)
  0032f8e0  bne        $v0, $zero, .L025
  0032f8e4  nop                                                # delay slot
  0032f8e8  lui        $a1, 0x73
  0032f8ec  lui        $a2, 0x73
  0032f8f0  addiu      $a0, $zero, 0x2c4
  0032f8f4  addiu      $a1, $a1, -0x4260                       # 0x0072bda0 "InputPlatForm_Z"
  0032f8f8  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  0032f8fc  jal        func_002DCB00
  0032f900  addiu      $a3, $zero, 0x1de                       # delay slot
  0032f904  beq        $v0, $zero, .L023
  0032f908  nop                                                # delay slot
  0032f90c  lui        $v1, 0x77
  0032f910  sw         $v0, 0x28($sp)
  0032f914  addiu      $v1, $v1, -0x6b40                       # 0x007694c0
  0032f918  sw         $v1, 0x1a8($v0)
  0032f91c  lw         $a3, 0x28($sp)
  0032f920  dsll32     $v0, $zero, 14
  0032f924  dsrl32     $v0, $v0, 14
  0032f928  addiu      $v1, $zero, -0x1
  0032f92c  sll        $a1, $v0, 14
  0032f930  dsll32     $a0, $v1, 0
  0032f934  addiu      $v0, $zero, 0x3fff
  0032f938  andi       $v1, $zero, 0x3fff
  0032f93c  or         $a0, $v0, $a0
  0032f940  addiu      $v0, $zero, -0x4000
  0032f944  lw         $a2, 0x0($a3)
  0032f948  and        $a0, $a2, $a0
  0032f94c  or         $a0, $a0, $a1
  0032f950  sw         $a0, 0x0($a3)
  0032f954  lw         $a1, 0x28($sp)
  0032f958  lhu        $a0, 0x0($a1)
  0032f95c  and        $v0, $a0, $v0
  0032f960  or         $v0, $v0, $v1
  0032f964  sh         $v0, 0x0($a1)
  0032f968  lw         $v0, 0x28($sp)
  0032f96c  sw         $zero, 0x4($v0)
  0032f970  lw         $v0, 0x28($sp)
  0032f974  jal        func_002FA910
  0032f978  addiu      $a0, $v0, 0x8                           # delay slot
  0032f97c  lw         $a2, 0x28($sp)
  0032f980  dsll32     $v0, $zero, 14
  0032f984  dsrl32     $v0, $v0, 14
  0032f988  sll        $a1, $v0, 14
  0032f98c  addiu      $v0, $zero, -0x1
  0032f990  dsll32     $v1, $v0, 0
  0032f994  addiu      $v0, $zero, 0x3fff
  0032f998  addiu      $a2, $a2, 0x28
  0032f99c  or         $a0, $v0, $v1
  0032f9a0  sw         $a2, 0x38($sp)
  0032f9a4  addiu      $v0, $zero, -0x4000
  0032f9a8  lw         $a3, 0x38($sp)
  0032f9ac  andi       $v1, $zero, 0x3fff
  0032f9b0  lw         $a2, 0x0($a3)
  0032f9b4  and        $a0, $a2, $a0
  0032f9b8  or         $a0, $a0, $a1
  0032f9bc  sw         $a0, 0x0($a3)
  0032f9c0  lw         $a1, 0x38($sp)
  0032f9c4  lhu        $a0, 0x0($a1)
  0032f9c8  and        $v0, $a0, $v0
  0032f9cc  or         $v0, $v0, $v1
  0032f9d0  sh         $v0, 0x0($a1)
  0032f9d4  lw         $v0, 0x38($sp)
  0032f9d8  sw         $zero, 0x4($v0)
  0032f9dc  lw         $v0, 0x38($sp)
  0032f9e0  jal        func_0032E0A0
  0032f9e4  addiu      $a0, $v0, 0x8                           # delay slot
  0032f9e8  lw         $a2, 0x38($sp)
  0032f9ec  dsll32     $v0, $zero, 14
  0032f9f0  dsrl32     $v0, $v0, 14
  0032f9f4  sll        $a1, $v0, 14
  0032f9f8  addiu      $v0, $zero, -0x1
  0032f9fc  dsll32     $v1, $v0, 0
  0032fa00  addiu      $v0, $zero, 0x3fff
  0032fa04  sw         $zero, 0x14($a2)
  0032fa08  or         $a0, $v0, $v1
  0032fa0c  lw         $a2, 0x38($sp)
  0032fa10  addiu      $v0, $zero, -0x4000
  0032fa14  andi       $v1, $zero, 0x3fff
  0032fa18  sw         $zero, 0x18($a2)
  0032fa1c  lw         $a2, 0x28($sp)
  0032fa20  addiu      $a2, $a2, 0x44
  0032fa24  sw         $a2, 0x3c($sp)
  0032fa28  lw         $a3, 0x3c($sp)
  0032fa2c  lw         $a2, 0x0($a3)
  0032fa30  and        $a0, $a2, $a0
  0032fa34  or         $a0, $a0, $a1
  0032fa38  sw         $a0, 0x0($a3)
  0032fa3c  lw         $a1, 0x3c($sp)
  0032fa40  lhu        $a0, 0x0($a1)
  0032fa44  and        $v0, $a0, $v0
  0032fa48  or         $v0, $v0, $v1
  0032fa4c  sh         $v0, 0x0($a1)
  0032fa50  lw         $v0, 0x3c($sp)
  0032fa54  sw         $zero, 0x4($v0)
  0032fa58  lw         $v0, 0x3c($sp)
  0032fa5c  jal        func_0032E0A0
  0032fa60  addiu      $a0, $v0, 0x8                           # delay slot
  0032fa64  lw         $t0, 0x3c($sp)
  0032fa68  dsll32     $v0, $zero, 14
  0032fa6c  dsrl32     $v0, $v0, 14
  0032fa70  lui        $a1, 0x22
  0032fa74  sll        $t1, $v0, 14
  0032fa78  lui        $a2, 0x22
  0032fa7c  addiu      $v0, $zero, -0x1
  0032fa80  addiu      $a3, $zero, 0x8
  0032fa84  dsll32     $v1, $v0, 0
  0032fa88  addiu      $a1, $a1, 0x6e60                        # 0x00226e60 -> func_00226E60
  0032fa8c  addiu      $v0, $zero, 0x3fff
  0032fa90  addiu      $a2, $a2, 0x6d90                        # 0x00226d90 -> func_00226D90
  0032fa94  sw         $zero, 0x14($t0)
  0032fa98  or         $a0, $v0, $v1
  0032fa9c  lw         $t2, 0x3c($sp)
  0032faa0  addiu      $v0, $zero, -0x4000
  0032faa4  andi       $v1, $zero, 0x3fff
  0032faa8  daddu      $t0, $a3, $zero
  0032faac  sw         $zero, 0x18($t2)
  0032fab0  lw         $t3, 0x28($sp)
  0032fab4  lw         $t2, 0x60($t3)
  0032fab8  and        $a0, $t2, $a0
  0032fabc  or         $a0, $a0, $t1
  0032fac0  sw         $a0, 0x60($t3)
  0032fac4  lw         $t1, 0x28($sp)
  0032fac8  lhu        $a0, 0x60($t1)
  0032facc  and        $v0, $a0, $v0
  0032fad0  or         $v0, $v0, $v1
  0032fad4  sh         $v0, 0x60($t1)
  0032fad8  lw         $v0, 0x28($sp)
  0032fadc  sw         $zero, 0x64($v0)
  0032fae0  lw         $v0, 0x28($sp)
  0032fae4  jal        func_003D9750
  0032fae8  addiu      $a0, $v0, 0x68                          # delay slot
  0032faec  lw         $v0, 0x28($sp)
  0032faf0  addiu      $a1, $zero, -0x3
  0032faf4  addiu      $a0, $zero, -0x1
  0032faf8  addiu      $v1, $zero, 0x1
  0032fafc  sb         $zero, 0xa8($v0)
  0032fb00  lw         $v0, 0x28($sp)
  0032fb04  sb         $zero, 0x1b0($v0)
  0032fb08  lw         $v0, 0x28($sp)
  0032fb0c  sh         $a1, 0x2b4($v0)
  0032fb10  lw         $v0, 0x28($sp)
  0032fb14  sh         $a1, 0x2b8($v0)
  0032fb18  lw         $v0, 0x28($sp)
  0032fb1c  sh         $zero, 0x2b6($v0)
  0032fb20  lw         $v0, 0x28($sp)
  0032fb24  sh         $zero, 0x2ba($v0)
  0032fb28  lw         $v0, 0x28($sp)
  0032fb2c  sw         $a0, 0x2bc($v0)
  0032fb30  lw         $v0, 0x28($sp)
  0032fb34  sb         $zero, 0x24($v0)
  0032fb38  lw         $v0, 0x28($sp)
  0032fb3c  sb         $v1, 0x25($v0)
  0032fb40  lw         $v0, 0x28($sp)
  0032fb44  sb         $zero, 0x26($v0)
  0032fb48  lw         $v0, 0x28($sp)
  0032fb4c  sw         $zero, 0x1ac($v0)
  0032fb50  lw         $v0, 0x28($sp)
  0032fb54  sb         $zero, 0x1b0($v0)
  0032fb58  lw         $v0, 0x28($sp)
  0032fb5c  sw         $zero, 0x2c0($v0)
  0032fb60  lw         $v0, 0x28($sp)
  0032fb64  nop
.L023:
  0032fb68  lui        $at, 0x79
  0032fb6c  sw         $v0, 0x5fa8($at)
  0032fb70  lui        $at, 0x79
  0032fb74  lw         $a0, 0x5fa8($at)
  0032fb78  lw         $t9, 0x1a8($a0)
  0032fb7c  lw         $t9, 0xc($t9)
  0032fb80  jalr       $t9
  0032fb84  nop                                                # delay slot
  0032fb88  bne        $v0, $zero, .L024
  0032fb8c  lui        $a0, 0x79                               # delay slot
  0032fb90  jal        func_00427D60
  0032fb94  daddu      $a0, $zero, $zero                       # delay slot
  0032fb98  daddu      $a0, $v0, $zero
  0032fb9c  jal        func_00485540
  0032fba0  addiu      $a1, $zero, 0x8                         # delay slot
  0032fba4  lui        $a1, 0x73
  0032fba8  lui        $a3, 0x73
  0032fbac  daddu      $a2, $v0, $zero
  0032fbb0  daddu      $a0, $zero, $zero
  0032fbb4  addiu      $a1, $a1, -0x4328                       # 0x0072bcd8 "Fatal error"
  0032fbb8  jal        func_003CEC60
  0032fbbc  addiu      $a3, $a3, -0x4260                       # delay slot; 0x0072bda0 "InputPlatForm_Z"
  0032fbc0  jal        func_003EFA08
  0032fbc4  daddu      $a0, $zero, $zero                       # delay slot
  0032fbc8  b          .L025
  0032fbcc  nop                                                # delay slot
.L024:
  0032fbd0  jal        func_004B7A60
  0032fbd4  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032fbd8  lui        $at, 0x79
  0032fbdc  sw         $v0, 0x57b8($at)
.L025:
  0032fbe0  lui        $at, 0x79
  0032fbe4  lw         $v0, 0x5fb8($at)
  0032fbe8  bne        $v0, $zero, .L028
  0032fbec  nop                                                # delay slot
  0032fbf0  lui        $a0, 0x79
  0032fbf4  jal        func_004B7A60
  0032fbf8  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032fbfc  lui        $at, 0x79
  0032fc00  sw         $v0, 0x57b8($at)
  0032fc04  lui        $at, 0x79
  0032fc08  lw         $v0, 0x5fb8($at)
  0032fc0c  bne        $v0, $zero, .L028
  0032fc10  nop                                                # delay slot
  0032fc14  lui        $a1, 0x73
  0032fc18  lui        $a2, 0x73
  0032fc1c  addiu      $a0, $zero, 0xc
  0032fc20  addiu      $a1, $a1, -0x4250                       # 0x0072bdb0 "SaveGame_Z"
  0032fc24  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  0032fc28  jal        func_002DCB00
  0032fc2c  addiu      $a3, $zero, 0x1df                       # delay slot
  0032fc30  beq        $v0, $zero, .L026
  0032fc34  lui        $at, 0x79                               # delay slot
  0032fc38  lui        $a0, 0x76
  0032fc3c  addiu      $v1, $zero, 0x2
  0032fc40  addiu      $a0, $a0, 0x55b0                        # 0x007655b0
  0032fc44  sw         $a0, 0x8($v0)
  0032fc48  sw         $zero, 0x0($v0)
  0032fc4c  sw         $v1, 0x4($v0)
.L026:
  0032fc50  sw         $v0, 0x5fb8($at)
  0032fc54  lui        $at, 0x79
  0032fc58  lw         $a0, 0x5fb8($at)
  0032fc5c  lw         $t9, 0x8($a0)
  0032fc60  lw         $t9, 0x18($t9)
  0032fc64  jalr       $t9
  0032fc68  nop                                                # delay slot
  0032fc6c  bne        $v0, $zero, .L027
  0032fc70  lui        $a0, 0x79                               # delay slot
  0032fc74  jal        func_00427D60
  0032fc78  daddu      $a0, $zero, $zero                       # delay slot
  0032fc7c  daddu      $a0, $v0, $zero
  0032fc80  jal        func_00485540
  0032fc84  addiu      $a1, $zero, 0x8                         # delay slot
  0032fc88  lui        $a1, 0x73
  0032fc8c  lui        $a3, 0x73
  0032fc90  daddu      $a2, $v0, $zero
  0032fc94  daddu      $a0, $zero, $zero
  0032fc98  addiu      $a1, $a1, -0x4328                       # 0x0072bcd8 "Fatal error"
  0032fc9c  jal        func_003CEC60
  0032fca0  addiu      $a3, $a3, -0x4250                       # delay slot; 0x0072bdb0 "SaveGame_Z"
  0032fca4  jal        func_003EFA08
  0032fca8  daddu      $a0, $zero, $zero                       # delay slot
  0032fcac  b          .L028
  0032fcb0  nop                                                # delay slot
.L027:
  0032fcb4  jal        func_004B7A60
  0032fcb8  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032fcbc  lui        $at, 0x79
  0032fcc0  sw         $v0, 0x57b8($at)
.L028:
  0032fcc4  lui        $at, 0x79
  0032fcc8  lw         $v0, 0x5fb0($at)
  0032fccc  bne        $v0, $zero, .L031
  0032fcd0  nop                                                # delay slot
  0032fcd4  lui        $a0, 0x79
  0032fcd8  jal        func_004B7A60
  0032fcdc  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032fce0  lui        $at, 0x79
  0032fce4  sw         $v0, 0x57b8($at)
  0032fce8  lui        $at, 0x79
  0032fcec  lw         $v0, 0x5fb0($at)
  0032fcf0  bne        $v0, $zero, .L031
  0032fcf4  nop                                                # delay slot
  0032fcf8  lui        $a1, 0x73
  0032fcfc  lui        $a2, 0x73
  0032fd00  addiu      $a0, $zero, 0x50
  0032fd04  addiu      $a1, $a1, -0x4240                       # 0x0072bdc0 "Movie_Z"
  0032fd08  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  0032fd0c  jal        func_002DCB00
  0032fd10  addiu      $a3, $zero, 0x1e0                       # delay slot
  0032fd14  beq        $v0, $zero, .L029
  0032fd18  lui        $at, 0x79                               # delay slot
  0032fd1c  lui        $a0, 0x76
  0032fd20  dsll32     $v1, $zero, 14
  0032fd24  addiu      $a0, $a0, 0x6640                        # 0x00766640
  0032fd28  dsrl32     $v1, $v1, 14
  0032fd2c  sw         $a0, 0x40($v0)
  0032fd30  sll        $a2, $v1, 14
  0032fd34  lw         $a3, 0x18($v0)
  0032fd38  addiu      $v1, $zero, -0x1
  0032fd3c  dsll32     $a0, $v1, 0
  0032fd40  addiu      $v1, $zero, 0x3fff
  0032fd44  or         $a1, $v1, $a0
  0032fd48  addiu      $v1, $zero, -0x4000
  0032fd4c  andi       $a0, $zero, 0x3fff
  0032fd50  and        $a1, $a3, $a1
  0032fd54  or         $a1, $a1, $a2
  0032fd58  sw         $a1, 0x18($v0)
  0032fd5c  lhu        $a1, 0x18($v0)
  0032fd60  and        $v1, $a1, $v1
  0032fd64  or         $v1, $v1, $a0
  0032fd68  sh         $v1, 0x18($v0)
  0032fd6c  sw         $zero, 0x1c($v0)
.L029:
  0032fd70  sw         $v0, 0x5fb0($at)
  0032fd74  lui        $at, 0x79
  0032fd78  lw         $a0, 0x5fb0($at)
  0032fd7c  lw         $t9, 0x40($a0)
  0032fd80  lw         $t9, 0xc($t9)
  0032fd84  jalr       $t9
  0032fd88  nop                                                # delay slot
  0032fd8c  bne        $v0, $zero, .L030
  0032fd90  lui        $a0, 0x79                               # delay slot
  0032fd94  jal        func_00427D60
  0032fd98  daddu      $a0, $zero, $zero                       # delay slot
  0032fd9c  daddu      $a0, $v0, $zero
  0032fda0  jal        func_00485540
  0032fda4  addiu      $a1, $zero, 0x8                         # delay slot
  0032fda8  lui        $a1, 0x73
  0032fdac  lui        $a3, 0x73
  0032fdb0  daddu      $a2, $v0, $zero
  0032fdb4  daddu      $a0, $zero, $zero
  0032fdb8  addiu      $a1, $a1, -0x4328                       # 0x0072bcd8 "Fatal error"
  0032fdbc  jal        func_003CEC60
  0032fdc0  addiu      $a3, $a3, -0x4240                       # delay slot; 0x0072bdc0 "Movie_Z"
  0032fdc4  jal        func_003EFA08
  0032fdc8  daddu      $a0, $zero, $zero                       # delay slot
  0032fdcc  b          .L031
  0032fdd0  nop                                                # delay slot
.L030:
  0032fdd4  jal        func_004B7A60
  0032fdd8  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032fddc  lui        $at, 0x79
  0032fde0  sw         $v0, 0x57b8($at)
.L031:
  0032fde4  lui        $at, 0x79
  0032fde8  lw         $a0, 0x5f6c($at)
  0032fdec  lw         $t9, 0x2200($a0)
  0032fdf0  lw         $t9, 0x44($t9)
  0032fdf4  jalr       $t9
  0032fdf8  addiu      $a1, $zero, 0x1                         # delay slot
  0032fdfc  lui        $a0, 0x79
  0032fe00  jal        func_004B7A60
  0032fe04  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032fe08  lui        $at, 0x79
  0032fe0c  sw         $v0, 0x57b8($at)
  0032fe10  lui        $at, 0x79
  0032fe14  lw         $v0, 0x5fd0($at)
  0032fe18  bne        $v0, $zero, .L033
  0032fe1c  nop                                                # delay slot
  0032fe20  lui        $a1, 0x73
  0032fe24  lui        $a2, 0x73
  0032fe28  addiu      $a0, $zero, 0x10
  0032fe2c  addiu      $a1, $a1, -0x4238                       # 0x0072bdc8 "VolatileMgr_Z"
  0032fe30  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  0032fe34  jal        func_002DCB00
  0032fe38  addiu      $a3, $zero, 0x1e3                       # delay slot
  0032fe3c  beq        $v0, $zero, .L032
  0032fe40  nop                                                # delay slot
  0032fe44  jal        func_0043E880
  0032fe48  daddu      $a0, $v0, $zero                         # delay slot
.L032:
  0032fe4c  lui        $at, 0x79
  0032fe50  lui        $a0, 0x79
  0032fe54  sw         $v0, 0x5fd0($at)
  0032fe58  jal        func_004B7A60
  0032fe5c  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032fe60  lui        $at, 0x79
  0032fe64  sw         $v0, 0x57b8($at)
.L033:
  0032fe68  lui        $a0, 0x79
  0032fe6c  jal        func_004B7A60
  0032fe70  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032fe74  lui        $at, 0x79
  0032fe78  sw         $v0, 0x57b8($at)
  0032fe7c  lui        $at, 0x79
  0032fe80  lw         $v0, 0x5f78($at)
  0032fe84  bne        $v0, $zero, .L035
  0032fe88  nop                                                # delay slot
  0032fe8c  lui        $a1, 0x73
  0032fe90  lui        $a2, 0x73
  0032fe94  addiu      $a0, $zero, 0x3030
  0032fe98  addiu      $a1, $a1, -0x4220                       # 0x0072bde0 "MaterialManager_Z"
  0032fe9c  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  0032fea0  jal        func_002DCB00
  0032fea4  addiu      $a3, $zero, 0x1e4                       # delay slot
  0032fea8  beq        $v0, $zero, .L034
  0032feac  nop                                                # delay slot
  0032feb0  jal        func_0035BF90
  0032feb4  daddu      $a0, $v0, $zero                         # delay slot
.L034:
  0032feb8  lui        $at, 0x79
  0032febc  lui        $a0, 0x79
  0032fec0  sw         $v0, 0x5f78($at)
  0032fec4  jal        func_004B7A60
  0032fec8  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032fecc  lui        $at, 0x79
  0032fed0  sw         $v0, 0x57b8($at)
.L035:
  0032fed4  lui        $a0, 0x79
  0032fed8  jal        func_004B7A60
  0032fedc  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032fee0  lui        $at, 0x79
  0032fee4  sw         $v0, 0x57b8($at)
  0032fee8  lui        $at, 0x79
  0032feec  lw         $v0, 0x5f74($at)
  0032fef0  bne        $v0, $zero, .L037
  0032fef4  nop                                                # delay slot
  0032fef8  lui        $a1, 0x73
  0032fefc  lui        $a2, 0x73
  0032ff00  addiu      $a0, $zero, 0x20
  0032ff04  addiu      $a1, $a1, -0x4208                       # 0x0072bdf8 "WorldManager_Z"
  0032ff08  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  0032ff0c  jal        func_002DCB00
  0032ff10  addiu      $a3, $zero, 0x1e5                       # delay slot
  0032ff14  beq        $v0, $zero, .L036
  0032ff18  nop                                                # delay slot
  0032ff1c  jal        func_003BA310
  0032ff20  daddu      $a0, $v0, $zero                         # delay slot
.L036:
  0032ff24  lui        $at, 0x79
  0032ff28  lui        $a0, 0x79
  0032ff2c  sw         $v0, 0x5f74($at)
  0032ff30  jal        func_004B7A60
  0032ff34  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032ff38  lui        $at, 0x79
  0032ff3c  sw         $v0, 0x57b8($at)
.L037:
  0032ff40  lui        $a0, 0x79
  0032ff44  jal        func_004B7A60
  0032ff48  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032ff4c  lui        $at, 0x79
  0032ff50  sw         $v0, 0x57b8($at)
  0032ff54  lui        $at, 0x79
  0032ff58  lw         $v0, 0x5f80($at)
  0032ff5c  bne        $v0, $zero, .L039
  0032ff60  nop                                                # delay slot
  0032ff64  lui        $a1, 0x73
  0032ff68  lui        $a2, 0x73
  0032ff6c  addiu      $a0, $zero, 0x18
  0032ff70  addiu      $a1, $a1, -0x41f0                       # 0x0072be10 "ColSurfaceCache_Z"
  0032ff74  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  0032ff78  jal        func_002DCB00
  0032ff7c  addiu      $a3, $zero, 0x1e6                       # delay slot
  0032ff80  beq        $v0, $zero, .L038
  0032ff84  daddu      $s0, $v0, $zero                         # delay slot
  0032ff88  jal        func_00330D20
  0032ff8c  daddu      $a0, $s0, $zero                         # delay slot
  0032ff90  lui        $v0, 0x76
  0032ff94  addiu      $v0, $v0, 0x5a38                        # 0x00765a38
  0032ff98  sw         $v0, 0x14($s0)
.L038:
  0032ff9c  lui        $a0, 0x79
  0032ffa0  lui        $at, 0x79
  0032ffa4  addiu      $a0, $a0, 0x57d4
  0032ffa8  jal        func_004B7A60
  0032ffac  sw         $s0, 0x5f80($at)                        # delay slot
  0032ffb0  lui        $at, 0x79
  0032ffb4  sw         $v0, 0x57b8($at)
.L039:
  0032ffb8  lui        $a0, 0x79
  0032ffbc  jal        func_004B7A60
  0032ffc0  addiu      $a0, $a0, 0x57d4                        # delay slot
  0032ffc4  lui        $at, 0x79
  0032ffc8  sw         $v0, 0x57b8($at)
  0032ffcc  lui        $at, 0x79
  0032ffd0  lw         $v0, 0x5f88($at)
  0032ffd4  bne        $v0, $zero, .L041
  0032ffd8  nop                                                # delay slot
  0032ffdc  lui        $a1, 0x73
  0032ffe0  lui        $a2, 0x73
  0032ffe4  addiu      $a0, $zero, 0x4c
  0032ffe8  addiu      $a1, $a1, -0x41d0                       # 0x0072be30 "ColTriangleCache_Z"
  0032ffec  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  0032fff0  jal        func_002DCB00
  0032fff4  addiu      $a3, $zero, 0x1e8                       # delay slot
  0032fff8  beq        $v0, $zero, .L040
  0032fffc  nop                                                # delay slot
  00330000  sw         $v0, 0x2c($sp)
  00330004  addiu      $a1, $zero, -0x1
  00330008  lw         $t0, 0x8($v0)
  0033000c  dsll32     $v1, $zero, 14
  00330010  dsrl32     $v1, $v1, 14
  00330014  addiu      $a0, $zero, 0x3fff
  00330018  dsll32     $a1, $a1, 0
  0033001c  sll        $v1, $v1, 14
  00330020  or         $a3, $a0, $a1
  00330024  andi       $a2, $zero, 0x3fff
  00330028  addiu      $a1, $zero, -0x4000
  0033002c  and        $a0, $t0, $a3
  00330030  or         $a0, $a0, $v1
  00330034  sw         $a0, 0x8($v0)
  00330038  lw         $a0, 0x2c($sp)
  0033003c  lhu        $v0, 0x8($a0)
  00330040  and        $v0, $v0, $a1
  00330044  or         $v0, $v0, $a2
  00330048  sh         $v0, 0x8($a0)
  0033004c  lw         $v0, 0x2c($sp)
  00330050  sw         $zero, 0xc($v0)
  00330054  lw         $a0, 0x2c($sp)
  00330058  lw         $v0, 0x10($a0)
  0033005c  and        $v0, $v0, $a3
  00330060  or         $v0, $v0, $v1
  00330064  sw         $v0, 0x10($a0)
  00330068  lw         $a0, 0x2c($sp)
  0033006c  lhu        $v0, 0x10($a0)
  00330070  and        $v0, $v0, $a1
  00330074  or         $v0, $v0, $a2
  00330078  sh         $v0, 0x10($a0)
  0033007c  lw         $v0, 0x2c($sp)
  00330080  sw         $zero, 0x14($v0)
  00330084  lw         $a0, 0x2c($sp)
  00330088  lw         $v0, 0x24($a0)
  0033008c  and        $v0, $v0, $a3
  00330090  or         $v0, $v0, $v1
  00330094  sw         $v0, 0x24($a0)
  00330098  lw         $v1, 0x2c($sp)
  0033009c  lhu        $v0, 0x24($v1)
  003300a0  and        $v0, $v0, $a1
  003300a4  or         $v0, $v0, $a2
  003300a8  sh         $v0, 0x24($v1)
  003300ac  lw         $v0, 0x2c($sp)
  003300b0  sw         $zero, 0x28($v0)
  003300b4  jal        func_00460530
  003300b8  lw         $a0, 0x2c($sp)                          # delay slot
  003300bc  lw         $v0, 0x2c($sp)
  003300c0  nop
.L040:
  003300c4  lui        $at, 0x79
  003300c8  lui        $a0, 0x79
  003300cc  sw         $v0, 0x5f88($at)
  003300d0  jal        func_004B7A60
  003300d4  addiu      $a0, $a0, 0x57d4                        # delay slot
  003300d8  lui        $at, 0x79
  003300dc  sw         $v0, 0x57b8($at)
.L041:
  003300e0  lui        $a0, 0x79
  003300e4  jal        func_004B7A60
  003300e8  addiu      $a0, $a0, 0x57d4                        # delay slot
  003300ec  lui        $at, 0x79
  003300f0  sw         $v0, 0x57b8($at)
  003300f4  lui        $at, 0x79
  003300f8  lw         $v0, 0x5fe4($at)
  003300fc  bne        $v0, $zero, .L043
  00330100  nop                                                # delay slot
  00330104  lui        $a1, 0x73
  00330108  lui        $a2, 0x73
  0033010c  addiu      $a0, $zero, 0x54
  00330110  addiu      $a1, $a1, -0x41b0                       # 0x0072be50 "PrimitiveBuffersPool_Z"
  00330114  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  00330118  jal        func_002DCB00
  0033011c  addiu      $a3, $zero, 0x1e9                       # delay slot
  00330120  beq        $v0, $zero, .L042
  00330124  nop                                                # delay slot
  00330128  sw         $v0, 0x30($sp)
  0033012c  sw         $zero, 0x0($v0)
  00330130  lw         $v0, 0x30($sp)
  00330134  sw         $zero, 0x4($v0)
  00330138  lw         $v0, 0x30($sp)
  0033013c  sw         $zero, 0x8($v0)
  00330140  lw         $v0, 0x30($sp)
  00330144  sw         $zero, 0xc($v0)
  00330148  lw         $v0, 0x30($sp)
  0033014c  sw         $zero, 0x10($v0)
  00330150  lw         $v0, 0x30($sp)
  00330154  sw         $zero, 0x14($v0)
  00330158  lw         $v0, 0x30($sp)
  0033015c  sw         $zero, 0x18($v0)
  00330160  lw         $v0, 0x30($sp)
  00330164  sw         $zero, 0x1c($v0)
  00330168  lw         $v0, 0x30($sp)
  0033016c  sw         $zero, 0x20($v0)
  00330170  lw         $v0, 0x30($sp)
  00330174  sw         $zero, 0x24($v0)
  00330178  lw         $v0, 0x30($sp)
  0033017c  jal        func_00330A90
  00330180  addiu      $a0, $v0, 0x28                          # delay slot
  00330184  lw         $a2, 0x30($sp)
  00330188  addiu      $a3, $zero, -0x1
  0033018c  dsll32     $v0, $zero, 14
  00330190  dsll32     $v1, $a3, 0
  00330194  dsrl32     $v0, $v0, 14
  00330198  sll        $a1, $v0, 14
  0033019c  addiu      $v0, $zero, 0x3fff
  003301a0  or         $a0, $v0, $v1
  003301a4  sw         $zero, 0x40($a2)
  003301a8  addiu      $v0, $zero, -0x4000
  003301ac  lw         $a2, 0x30($sp)
  003301b0  andi       $v1, $zero, 0x3fff
  003301b4  sw         $zero, 0x44($a2)
  003301b8  lw         $a2, 0x30($sp)
  003301bc  sw         $a3, 0x48($a2)
  003301c0  lw         $a2, 0x30($sp)
  003301c4  sw         $zero, 0x38($a2)
  003301c8  lw         $a2, 0x30($sp)
  003301cc  sw         $zero, 0x3c($a2)
  003301d0  lw         $a3, 0x30($sp)
  003301d4  lw         $a2, 0x4c($a3)
  003301d8  and        $a0, $a2, $a0
  003301dc  or         $a0, $a0, $a1
  003301e0  sw         $a0, 0x4c($a3)
  003301e4  lw         $a1, 0x30($sp)
  003301e8  lhu        $a0, 0x4c($a1)
  003301ec  and        $v0, $a0, $v0
  003301f0  or         $v0, $v0, $v1
  003301f4  sh         $v0, 0x4c($a1)
  003301f8  lw         $v0, 0x30($sp)
  003301fc  sw         $zero, 0x50($v0)
  00330200  lw         $v0, 0x30($sp)
  00330204  nop
.L042:
  00330208  lui        $at, 0x79
  0033020c  lui        $a0, 0x79
  00330210  sw         $v0, 0x5fe4($at)
  00330214  jal        func_004B7A60
  00330218  addiu      $a0, $a0, 0x57d4                        # delay slot
  0033021c  lui        $at, 0x79
  00330220  sw         $v0, 0x57b8($at)
.L043:
  00330224  lui        $a0, 0x79
  00330228  jal        func_004B7A60
  0033022c  addiu      $a0, $a0, 0x57d4                        # delay slot
  00330230  lui        $at, 0x79
  00330234  sw         $v0, 0x57b8($at)
  00330238  lui        $at, 0x79
  0033023c  lw         $v0, 0x5fe8($at)
  00330240  bne        $v0, $zero, .L045
  00330244  nop                                                # delay slot
  00330248  lui        $a1, 0x73
  0033024c  lui        $a2, 0x73
  00330250  addiu      $a0, $zero, 0x54
  00330254  addiu      $a1, $a1, -0x41b0                       # 0x0072be50 "PrimitiveBuffersPool_Z"
  00330258  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  0033025c  jal        func_002DCB00
  00330260  addiu      $a3, $zero, 0x1ea                       # delay slot
  00330264  beq        $v0, $zero, .L044
  00330268  nop                                                # delay slot
  0033026c  sw         $v0, 0x34($sp)
  00330270  sw         $zero, 0x0($v0)
  00330274  lw         $v0, 0x34($sp)
  00330278  sw         $zero, 0x4($v0)
  0033027c  lw         $v0, 0x34($sp)
  00330280  sw         $zero, 0x8($v0)
  00330284  lw         $v0, 0x34($sp)
  00330288  sw         $zero, 0xc($v0)
  0033028c  lw         $v0, 0x34($sp)
  00330290  sw         $zero, 0x10($v0)
  00330294  lw         $v0, 0x34($sp)
  00330298  sw         $zero, 0x14($v0)
  0033029c  lw         $v0, 0x34($sp)
  003302a0  sw         $zero, 0x18($v0)
  003302a4  lw         $v0, 0x34($sp)
  003302a8  sw         $zero, 0x1c($v0)
  003302ac  lw         $v0, 0x34($sp)
  003302b0  sw         $zero, 0x20($v0)
  003302b4  lw         $v0, 0x34($sp)
  003302b8  sw         $zero, 0x24($v0)
  003302bc  lw         $v0, 0x34($sp)
  003302c0  jal        func_00330A90
  003302c4  addiu      $a0, $v0, 0x28                          # delay slot
  003302c8  lw         $a2, 0x34($sp)
  003302cc  addiu      $a3, $zero, -0x1
  003302d0  dsll32     $v0, $zero, 14
  003302d4  dsll32     $v1, $a3, 0
  003302d8  dsrl32     $v0, $v0, 14
  003302dc  sll        $a1, $v0, 14
  003302e0  addiu      $v0, $zero, 0x3fff
  003302e4  or         $a0, $v0, $v1
  003302e8  sw         $zero, 0x40($a2)
  003302ec  addiu      $v0, $zero, -0x4000
  003302f0  lw         $a2, 0x34($sp)
  003302f4  andi       $v1, $zero, 0x3fff
  003302f8  sw         $zero, 0x44($a2)
  003302fc  lw         $a2, 0x34($sp)
  00330300  sw         $a3, 0x48($a2)
  00330304  lw         $a2, 0x34($sp)
  00330308  sw         $zero, 0x38($a2)
  0033030c  lw         $a2, 0x34($sp)
  00330310  sw         $zero, 0x3c($a2)
  00330314  lw         $a3, 0x34($sp)
  00330318  lw         $a2, 0x4c($a3)
  0033031c  and        $a0, $a2, $a0
  00330320  or         $a0, $a0, $a1
  00330324  sw         $a0, 0x4c($a3)
  00330328  lw         $a1, 0x34($sp)
  0033032c  lhu        $a0, 0x4c($a1)
  00330330  and        $v0, $a0, $v0
  00330334  or         $v0, $v0, $v1
  00330338  sh         $v0, 0x4c($a1)
  0033033c  lw         $v0, 0x34($sp)
  00330340  sw         $zero, 0x50($v0)
  00330344  lw         $v0, 0x34($sp)
  00330348  nop
.L044:
  0033034c  lui        $at, 0x79
  00330350  lui        $a0, 0x79
  00330354  sw         $v0, 0x5fe8($at)
  00330358  jal        func_004B7A60
  0033035c  addiu      $a0, $a0, 0x57d4                        # delay slot
  00330360  lui        $at, 0x79
  00330364  sw         $v0, 0x57b8($at)
.L045:
  00330368  lui        $a0, 0x79
  0033036c  jal        func_004B7A60
  00330370  addiu      $a0, $a0, 0x57d4                        # delay slot
  00330374  lui        $at, 0x79
  00330378  sw         $v0, 0x57b8($at)
  0033037c  lui        $at, 0x79
  00330380  lw         $v0, 0x5f94($at)
  00330384  bne        $v0, $zero, .L048
  00330388  nop                                                # delay slot
  0033038c  lui        $a1, 0x73
  00330390  lui        $a2, 0x73
  00330394  addiu      $a0, $zero, 0xfc
  00330398  addiu      $a1, $a1, -0x4190                       # 0x0072be70 "ManipulatorManager_Z"
  0033039c  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  003303a0  jal        func_002DCB00
  003303a4  addiu      $a3, $zero, 0x1eb                       # delay slot
  003303a8  beq        $v0, $zero, .L047
  003303ac  nop                                                # delay slot
  003303b0  lui        $v1, 0x76
  003303b4  daddu      $a1, $v0, $zero
  003303b8  addiu      $v1, $v1, 0x5a28                        # 0x00765a28
  003303bc  sw         $v1, 0xf8($v0)
  003303c0  addiu      $a0, $v0, 0xe0
.L046:
  003303c4  sw         $zero, 0x4($a1)
  003303c8  sw         $zero, 0x0($a1)
  003303cc  addiu      $a1, $a1, 0x8
  003303d0  sltu       $v1, $a1, $a0
  003303d4  nop
  003303d8  nop
  003303dc  bne        $v1, $zero, .L046
  003303e0  nop                                                # delay slot
  003303e4  sw         $zero, 0xe4($v0)
  003303e8  dsll32     $v1, $zero, 14
  003303ec  sw         $zero, 0xe0($v0)
  003303f0  dsrl32     $v1, $v1, 14
  003303f4  lw         $a3, 0xe8($v0)
  003303f8  sll        $a2, $v1, 14
  003303fc  addiu      $v1, $zero, -0x1
  00330400  dsll32     $a0, $v1, 0
  00330404  addiu      $v1, $zero, 0x3fff
  00330408  or         $a1, $v1, $a0
  0033040c  addiu      $v1, $zero, -0x4000
  00330410  andi       $a0, $zero, 0x3fff
  00330414  and        $a1, $a3, $a1
  00330418  or         $a1, $a1, $a2
  0033041c  sw         $a1, 0xe8($v0)
  00330420  lhu        $a1, 0xe8($v0)
  00330424  and        $v1, $a1, $v1
  00330428  or         $v1, $v1, $a0
  0033042c  sh         $v1, 0xe8($v0)
  00330430  sw         $zero, 0xec($v0)
  00330434  sb         $zero, 0xf0($v0)
  00330438  sb         $zero, 0xf1($v0)
.L047:
  0033043c  lui        $at, 0x79
  00330440  lui        $a0, 0x79
  00330444  sw         $v0, 0x5f94($at)
  00330448  jal        func_004B7A60
  0033044c  addiu      $a0, $a0, 0x57d4                        # delay slot
  00330450  lui        $at, 0x79
  00330454  sw         $v0, 0x57b8($at)
.L048:
  00330458  lui        $a0, 0x79
  0033045c  jal        func_004B7A60
  00330460  addiu      $a0, $a0, 0x57d4                        # delay slot
  00330464  lui        $at, 0x79
  00330468  sw         $v0, 0x57b8($at)
  0033046c  lui        $at, 0x79
  00330470  lw         $v0, 0x5f98($at)
  00330474  bne        $v0, $zero, .L050
  00330478  nop                                                # delay slot
  0033047c  lui        $a1, 0x73
  00330480  lui        $a2, 0x73
  00330484  addiu      $a0, $zero, 0x44
  00330488  addiu      $a1, $a1, -0x4178                       # 0x0072be88 "GameManager_Z"
  0033048c  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  00330490  jal        func_002DCB00
  00330494  addiu      $a3, $zero, 0x1ec                       # delay slot
  00330498  beq        $v0, $zero, .L049
  0033049c  nop                                                # delay slot
  003304a0  jal        func_00314AF0
  003304a4  daddu      $a0, $v0, $zero                         # delay slot
.L049:
  003304a8  lui        $at, 0x79
  003304ac  lui        $a0, 0x79
  003304b0  sw         $v0, 0x5f98($at)
  003304b4  jal        func_004B7A60
  003304b8  addiu      $a0, $a0, 0x57d4                        # delay slot
  003304bc  lui        $at, 0x79
  003304c0  sw         $v0, 0x57b8($at)
.L050:
  003304c4  lui        $a0, 0x79
  003304c8  jal        func_004B7A60
  003304cc  addiu      $a0, $a0, 0x57d4                        # delay slot
  003304d0  lui        $at, 0x79
  003304d4  sw         $v0, 0x57b8($at)
  003304d8  lui        $at, 0x79
  003304dc  lw         $v0, 0x5fa0($at)
  003304e0  bne        $v0, $zero, .L052
  003304e4  nop                                                # delay slot
  003304e8  lui        $a1, 0x73
  003304ec  lui        $a2, 0x73
  003304f0  addiu      $a0, $zero, 0x12c
  003304f4  addiu      $a1, $a1, -0x4160                       # 0x0072bea0 "AnimationManager_Z"
  003304f8  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  003304fc  jal        func_002DCB00
  00330500  addiu      $a3, $zero, 0x1ed                       # delay slot
  00330504  beq        $v0, $zero, .L051
  00330508  nop                                                # delay slot
  0033050c  jal        func_003C3430
  00330510  daddu      $a0, $v0, $zero                         # delay slot
.L051:
  00330514  lui        $at, 0x79
  00330518  lui        $a0, 0x79
  0033051c  sw         $v0, 0x5fa0($at)
  00330520  jal        func_004B7A60
  00330524  addiu      $a0, $a0, 0x57d4                        # delay slot
  00330528  lui        $at, 0x79
  0033052c  sw         $v0, 0x57b8($at)
.L052:
  00330530  lui        $a0, 0x79
  00330534  jal        func_004B7A60
  00330538  addiu      $a0, $a0, 0x57d4                        # delay slot
  0033053c  lui        $at, 0x79
  00330540  sw         $v0, 0x57b8($at)
  00330544  lui        $at, 0x79
  00330548  lw         $v0, 0x5fe0($at)
  0033054c  bne        $v0, $zero, .L055
  00330550  nop                                                # delay slot
  00330554  lui        $a1, 0x73
  00330558  lui        $a2, 0x73
  0033055c  addiu      $a0, $zero, 0x38
  00330560  addiu      $a1, $a1, -0x4148                       # 0x0072beb8 "IGAManager_Z"
  00330564  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  00330568  jal        func_002DCB00
  0033056c  addiu      $a3, $zero, 0x1ee                       # delay slot
  00330570  beq        $v0, $zero, .L053
  00330574  nop                                                # delay slot
  00330578  jal        func_004C6E70
  0033057c  daddu      $a0, $v0, $zero                         # delay slot
.L053:
  00330580  lui        $at, 0x79
  00330584  sw         $v0, 0x5fe0($at)
  00330588  lui        $at, 0x79
  0033058c  lw         $a0, 0x5fe0($at)
  00330590  lw         $t9, 0x0($a0)
  00330594  lw         $t9, 0xc($t9)
  00330598  jalr       $t9
  0033059c  nop                                                # delay slot
  003305a0  bne        $v0, $zero, .L054
  003305a4  lui        $a0, 0x79                               # delay slot
  003305a8  jal        func_00427D60
  003305ac  daddu      $a0, $zero, $zero                       # delay slot
  003305b0  daddu      $a0, $v0, $zero
  003305b4  jal        func_00485540
  003305b8  addiu      $a1, $zero, 0x8                         # delay slot
  003305bc  lui        $a1, 0x73
  003305c0  lui        $a3, 0x73
  003305c4  daddu      $a2, $v0, $zero
  003305c8  daddu      $a0, $zero, $zero
  003305cc  addiu      $a1, $a1, -0x4328                       # 0x0072bcd8 "Fatal error"
  003305d0  jal        func_003CEC60
  003305d4  addiu      $a3, $a3, -0x4148                       # delay slot; 0x0072beb8 "IGAManager_Z"
  003305d8  jal        func_003EFA08
  003305dc  daddu      $a0, $zero, $zero                       # delay slot
  003305e0  b          .L055
  003305e4  nop                                                # delay slot
.L054:
  003305e8  jal        func_004B7A60
  003305ec  addiu      $a0, $a0, 0x57d4                        # delay slot
  003305f0  lui        $at, 0x79
  003305f4  sw         $v0, 0x57b8($at)
.L055:
  003305f8  lui        $a0, 0x79
  003305fc  jal        func_004B7A60
  00330600  addiu      $a0, $a0, 0x57d4                        # delay slot
  00330604  lui        $at, 0x79
  00330608  sw         $v0, 0x57b8($at)
  0033060c  lui        $at, 0x79
  00330610  lw         $v0, 0x5fec($at)
  00330614  bne        $v0, $zero, .L058
  00330618  nop                                                # delay slot
  0033061c  lui        $a1, 0x73
  00330620  lui        $a2, 0x73
  00330624  addiu      $a0, $zero, 0x4
  00330628  addiu      $a1, $a1, -0x4138                       # 0x0072bec8 "XRamManager_Z"
  0033062c  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  00330630  jal        func_002DCB00
  00330634  addiu      $a3, $zero, 0x1ef                       # delay slot
  00330638  beq        $v0, $zero, .L056
  0033063c  lui        $at, 0x79                               # delay slot
  00330640  lui        $v1, 0x76
  00330644  addiu      $v1, $v1, 0x59e0                        # 0x007659e0
  00330648  sw         $v1, 0x0($v0)
.L056:
  0033064c  sw         $v0, 0x5fec($at)
  00330650  lui        $at, 0x79
  00330654  lw         $a0, 0x5fec($at)
  00330658  lw         $t9, 0x0($a0)
  0033065c  lw         $t9, 0xc($t9)
  00330660  jalr       $t9
  00330664  nop                                                # delay slot
  00330668  bne        $v0, $zero, .L057
  0033066c  lui        $a0, 0x79                               # delay slot
  00330670  jal        func_00427D60
  00330674  daddu      $a0, $zero, $zero                       # delay slot
  00330678  daddu      $a0, $v0, $zero
  0033067c  jal        func_00485540
  00330680  addiu      $a1, $zero, 0x8                         # delay slot
  00330684  lui        $a1, 0x73
  00330688  lui        $a3, 0x73
  0033068c  daddu      $a2, $v0, $zero
  00330690  daddu      $a0, $zero, $zero
  00330694  addiu      $a1, $a1, -0x4328                       # 0x0072bcd8 "Fatal error"
  00330698  jal        func_003CEC60
  0033069c  addiu      $a3, $a3, -0x4138                       # delay slot; 0x0072bec8 "XRamManager_Z"
  003306a0  jal        func_003EFA08
  003306a4  daddu      $a0, $zero, $zero                       # delay slot
  003306a8  b          .L058
  003306ac  nop                                                # delay slot
.L057:
  003306b0  jal        func_004B7A60
  003306b4  addiu      $a0, $a0, 0x57d4                        # delay slot
  003306b8  lui        $at, 0x79
  003306bc  sw         $v0, 0x57b8($at)
.L058:
  003306c0  lui        $a0, 0x73
  003306c4  jal        func_002DD080
  003306c8  addiu      $a0, $a0, -0x4128                       # delay slot; 0x0072bed8 "Zouna Init"
  003306cc  jal        func_00241A20
  003306d0  nop                                                # delay slot
  003306d4  lui        $a0, 0x73
  003306d8  jal        func_002DD080
  003306dc  addiu      $a0, $a0, -0x4118                       # delay slot; 0x0072bee8 "Game Init"
  003306e0  lui        $a0, 0x79
  003306e4  jal        func_004B7A60
  003306e8  addiu      $a0, $a0, 0x57d4                        # delay slot
  003306ec  lui        $at, 0x79
  003306f0  sw         $v0, 0x57b8($at)
  003306f4  lui        $at, 0x79
  003306f8  lw         $v0, 0x5fa4($at)
  003306fc  bne        $v0, $zero, .L060
  00330700  nop                                                # delay slot
  00330704  lui        $a1, 0x73
  00330708  lui        $a2, 0x73
  0033070c  addiu      $a0, $zero, 0x8c
  00330710  addiu      $a1, $a1, -0x4108                       # 0x0072bef8 "SystemDatas_Z"
  00330714  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  00330718  jal        func_002DCB00
  0033071c  addiu      $a3, $zero, 0x1f7                       # delay slot
  00330720  beq        $v0, $zero, .L059
  00330724  nop                                                # delay slot
  00330728  jal        func_003AA640
  0033072c  daddu      $a0, $v0, $zero                         # delay slot
.L059:
  00330730  lui        $at, 0x79
  00330734  lui        $a0, 0x79
  00330738  sw         $v0, 0x5fa4($at)
  0033073c  jal        func_004B7A60
  00330740  addiu      $a0, $a0, 0x57d4                        # delay slot
  00330744  lui        $at, 0x79
  00330748  sw         $v0, 0x57b8($at)
.L060:
  0033074c  lui        $a0, 0x79
  00330750  jal        func_004B7A60
  00330754  addiu      $a0, $a0, 0x57d4                        # delay slot
  00330758  lui        $at, 0x79
  0033075c  sw         $v0, 0x57b8($at)
  00330760  lui        $at, 0x79
  00330764  lw         $v0, 0x5fbc($at)
  00330768  bne        $v0, $zero, .L062
  0033076c  nop                                                # delay slot
  00330770  lui        $a1, 0x73
  00330774  lui        $a2, 0x73
  00330778  addiu      $a0, $zero, 0x2c
  0033077c  addiu      $a1, $a1, -0x40f0                       # 0x0072bf10 "ParticlesManager_Z(\"ParticlesManager\")"
  00330780  addiu      $a2, $a2, -0x4338                       # 0x0072bcc8 "Main_Z.cpp"
  00330784  jal        func_002DCB00
  00330788  addiu      $a3, $zero, 0x1f8                       # delay slot
  0033078c  beq        $v0, $zero, .L061
  00330790  daddu      $s0, $v0, $zero                         # delay slot
  00330794  lui        $a1, 0x73
  00330798  daddu      $a0, $s0, $zero
  0033079c  jal        func_003388C0
  003307a0  addiu      $a1, $a1, -0x40c0                       # delay slot; 0x0072bf40 "ParticlesManager"
  003307a4  lui        $v0, 0x76
  003307a8  addiu      $v0, $v0, 0x59d0                        # 0x007659d0
  003307ac  sw         $v0, 0x0($s0)
.L061:
  003307b0  lui        $a0, 0x79
  003307b4  lui        $at, 0x79
  003307b8  addiu      $a0, $a0, 0x57d4
  003307bc  jal        func_004B7A60
  003307c0  sw         $s0, 0x5fbc($at)                        # delay slot
  003307c4  lui        $at, 0x79
  003307c8  sw         $v0, 0x57b8($at)
.L062:
  003307cc  lui        $at, 0x79
  003307d0  lw         $a0, 0x5f7c($at)
  003307d4  lw         $t9, 0x30($a0)
  003307d8  lw         $t9, 0xc($t9)
  003307dc  jalr       $t9
  003307e0  nop                                                # delay slot
  003307e4  jal        func_003378F0
  003307e8  nop                                                # delay slot
  003307ec  ld         $ra, 0x10($sp)
  003307f0  lq         $s0, 0x0($sp)
  003307f4  jr         $ra
  003307f8  addiu      $sp, $sp, 0x40                          # delay slot
/* end of func_0032F250 */
