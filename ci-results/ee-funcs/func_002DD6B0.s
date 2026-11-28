/**************************************************************************
 * func_002DD6B0
 *
 * address      : 0x002dd6b0 .. 0x002ddd8c  (1756 bytes, 439 instructions)
 * discovered by: called
 * called from  : 0x002dd3e4
 * string hint  : "Game is in PAL mode\n"
 */
glabel func_002DD6B0
  002dd6b0  addiu      $sp, $sp, -0x740
  002dd6b4  lui        $at, 0x79
  002dd6b8  sd         $ra, 0x20($sp)
  002dd6bc  sq         $s1, 0x10($sp)
  002dd6c0  sq         $s0, 0x0($sp)
  002dd6c4  daddu      $s1, $a1, $zero
  002dd6c8  jal        func_00241CD0
  002dd6cc  sw         $zero, 0x7230($at)                      # delay slot
  002dd6d0  lui        $a1, 0x73
  002dd6d4  lui        $a2, 0x73
  002dd6d8  ori        $a0, $zero, 0xa908
  002dd6dc  addiu      $a1, $a1, -0x6658                       # 0x007299a8 "Anonymous New"
  002dd6e0  addiu      $a2, $a2, -0x6648                       # 0x007299b8 "PS2Main_Z.cpp"
  002dd6e4  jal        func_002DCB00
  002dd6e8  addiu      $a3, $zero, 0x14e                       # delay slot
  002dd6ec  beq        $v0, $zero, .L000
  002dd6f0  daddu      $s0, $v0, $zero                         # delay slot
  002dd6f4  jal        func_0030CD80
  002dd6f8  daddu      $a0, $s0, $zero                         # delay slot
  002dd6fc  lui        $v0, 0x76
  002dd700  lui        $at, 0x1
  002dd704  addiu      $v0, $v0, 0x4a00                        # 0x00764a00
  002dd708  addu       $at, $s0, $at
  002dd70c  sw         $v0, -0x5704($at)
  002dd710  ori        $v1, $zero, 0xa900
  002dd714  addu       $a3, $s0, $v1
  002dd718  dsll32     $v0, $zero, 14
  002dd71c  dsrl32     $v0, $v0, 14
  002dd720  lw         $a2, 0x0($a3)
  002dd724  sll        $a1, $v0, 14
  002dd728  lui        $at, 0x1
  002dd72c  addiu      $v0, $zero, -0x1
  002dd730  addu       $at, $s0, $at
  002dd734  dsll32     $v1, $v0, 0
  002dd738  addiu      $v0, $zero, 0x3fff
  002dd73c  or         $a0, $v0, $v1
  002dd740  and        $a0, $a2, $a0
  002dd744  addiu      $v0, $zero, -0x4000
  002dd748  or         $a0, $a0, $a1
  002dd74c  andi       $v1, $zero, 0x3fff
  002dd750  sw         $a0, 0x0($a3)
  002dd754  lhu        $a0, -0x5700($at)
  002dd758  and        $v0, $a0, $v0
  002dd75c  lui        $at, 0x1
  002dd760  or         $v0, $v0, $v1
  002dd764  addu       $at, $s0, $at
  002dd768  sh         $v0, -0x5700($at)
  002dd76c  lui        $at, 0x1
  002dd770  addu       $at, $s0, $at
  002dd774  sw         $zero, -0x56fc($at)
.L000:
  002dd778  lui        $at, 0x79
  002dd77c  lui        $a1, 0x73
  002dd780  sw         $s0, 0x5f68($at)
  002dd784  lui        $at, 0x79
  002dd788  lw         $a0, 0x5f68($at)
  002dd78c  jal        func_003CFFE0
  002dd790  addiu      $a1, $a1, -0x6638                       # delay slot; 0x007299c8 "_PS2"
  002dd794  lui        $at, 0x79
  002dd798  lui        $a1, 0x73
  002dd79c  lw         $a0, 0x5f68($at)
  002dd7a0  jal        func_003CFFE0
  002dd7a4  addiu      $a1, $a1, -0x6630                       # delay slot; 0x007299d0 "_FORCEBFREAD"
  002dd7a8  lui        $at, 0x79
  002dd7ac  lw         $a0, 0x5f68($at)
  002dd7b0  lui        $at, 0x1
  002dd7b4  addu       $at, $a0, $at
  002dd7b8  lw         $t9, -0x5704($at)
  002dd7bc  lw         $t9, 0x10($t9)
  002dd7c0  jalr       $t9
  002dd7c4  nop                                                # delay slot
  002dd7c8  bne        $v0, $zero, .L001
  002dd7cc  nop                                                # delay slot
  002dd7d0  jal        func_003EFA08
  002dd7d4  addiu      $a0, $zero, 0x14                        # delay slot
.L001:
  002dd7d8  lui        $at, 0x79
  002dd7dc  lw         $a0, 0x5f68($at)
  002dd7e0  lui        $at, 0x1
  002dd7e4  addu       $at, $a0, $at
  002dd7e8  lw         $t9, -0x5704($at)
  002dd7ec  lw         $t9, 0xc($t9)
  002dd7f0  jalr       $t9
  002dd7f4  nop                                                # delay slot
  002dd7f8  lui        $at, 0x79
  002dd7fc  lw         $v1, 0x7230($at)
  002dd800  andi       $v0, $v1, 0x1
  002dd804  beq        $v0, $zero, .L002
  002dd808  lui        $a0, 0x73                               # delay slot
  002dd80c  andi       $v0, $v1, 0x80
  002dd810  beq        $v0, $zero, .L003
  002dd814  daddu      $s0, $zero, $zero                       # delay slot
  002dd818  lui        $a0, 0x73
  002dd81c  addiu      $s0, $zero, 0x1
  002dd820  jal        func_003F2AF8
  002dd824  addiu      $a0, $a0, -0x6620                       # delay slot; 0x007299e0 "Game is in PAL mode\n"
  002dd828  b          .L004
  002dd82c  lb         $v0, -0x74bc($gp)                       # delay slot
.L002:
  002dd830  daddu      $s0, $zero, $zero
.L003:
  002dd834  jal        func_003F2AF8
  002dd838  addiu      $a0, $a0, -0x6600                       # delay slot
  002dd83c  lb         $v0, -0x74bc($gp)
.L004:
  002dd840  bne        $v0, $zero, .L005
  002dd844  lui        $a0, 0x79                               # delay slot
  002dd848  addiu      $v0, $zero, 0x1
  002dd84c  sb         $v0, -0x74bc($gp)
.L005:
  002dd850  daddu      $a1, $s0, $zero
  002dd854  jal        func_004250E0
  002dd858  addiu      $a0, $a0, 0x5c50                        # delay slot
  002dd85c  lui        $a0, 0x79
  002dd860  jal        func_004255D0
  002dd864  addiu      $a0, $a0, 0x5c50                        # delay slot
  002dd868  jal        func_003D9220
  002dd86c  nop                                                # delay slot
  002dd870  lui        $at, 0x79
  002dd874  lw         $v0, 0x7230($at)
  002dd878  andi       $v0, $v0, 0x800
  002dd87c  beq        $v0, $zero, .L006
  002dd880  lui        $a0, 0x79                               # delay slot
  002dd884  lui        $a1, 0x73
  002dd888  addiu      $a0, $a0, 0x7280
  002dd88c  jal        func_003F45F8
  002dd890  addiu      $a1, $a1, -0x6a48                       # delay slot; 0x007295b8
  002dd894  b          .L012
  002dd898  nop                                                # delay slot
.L006:
  002dd89c  lw         $a1, 0x0($s1)
  002dd8a0  addiu      $v0, $zero, 0x22
  002dd8a4  lb         $v1, 0x0($a1)
  002dd8a8  bne        $v1, $v0, .L007
  002dd8ac  lui        $a0, 0x79                               # delay slot
  002dd8b0  lui        $a0, 0x79
  002dd8b4  addiu      $a1, $a1, 0x1
  002dd8b8  jal        func_003F45F8
  002dd8bc  addiu      $a0, $a0, 0x7280                        # delay slot
  002dd8c0  lui        $a0, 0x79
  002dd8c4  jal        func_003F470C
  002dd8c8  addiu      $a0, $a0, 0x7280                        # delay slot
  002dd8cc  lui        $v1, 0x79
  002dd8d0  addiu      $v1, $v1, 0x727f
  002dd8d4  addu       $v0, $v1, $v0
  002dd8d8  b          .L008
  002dd8dc  sb         $zero, 0x0($v0)                         # delay slot
.L007:
  002dd8e0  jal        func_003F45F8
  002dd8e4  addiu      $a0, $a0, 0x7280                        # delay slot
.L008:
  002dd8e8  lui        $a0, 0x79
  002dd8ec  jal        func_003F470C
  002dd8f0  addiu      $a0, $a0, 0x7280                        # delay slot
  002dd8f4  lui        $a1, 0x79
  002dd8f8  addiu      $v1, $zero, 0x5c
  002dd8fc  b          .L010
  002dd900  addiu      $a1, $a1, 0x5f60                        # delay slot
.L009:
  002dd904  addiu      $v0, $v0, -0x1
.L010:
  002dd908  addu       $a0, $a1, $v0
  002dd90c  lb         $a0, 0x1320($a0)
  002dd910  beq        $a0, $v1, .L011
  002dd914  nop                                                # delay slot
  002dd918  bgez       $v0, .L009
  002dd91c  nop                                                # delay slot
.L011:
  002dd920  lui        $v1, 0x79
  002dd924  addiu      $v1, $v1, 0x7281
  002dd928  lui        $a1, 0x79
  002dd92c  addu       $v0, $v1, $v0
  002dd930  addiu      $a0, $sp, 0x73c
  002dd934  sb         $zero, 0x0($v0)
  002dd938  addiu      $a1, $a1, 0x7280
  002dd93c  jal        func_003F4C88
  002dd940  addiu      $a2, $zero, 0x2                         # delay slot
  002dd944  sb         $zero, 0x73e($sp)
.L012:
  002dd948  lui        $a0, 0x73
  002dd94c  lui        $a1, 0x79
  002dd950  addiu      $a0, $a0, -0x65e8                       # 0x00729a18 "Path : %s\n"
  002dd954  jal        func_003F2AF8
  002dd958  addiu      $a1, $a1, 0x7280                        # delay slot
  002dd95c  lui        $at, 0x79
  002dd960  lw         $v0, 0x7230($at)
  002dd964  andi       $v0, $v0, 0x800
  002dd968  beq        $v0, $zero, .L018
  002dd96c  daddu      $a0, $zero, $zero                       # delay slot
  002dd970  jal        func_003DF000
  002dd974  daddu      $a0, $zero, $zero                       # delay slot
  002dd978  jal        func_003F9FE0
  002dd97c  daddu      $a0, $zero, $zero                       # delay slot
  002dd980  lui        $a0, 0x73
  002dd984  lui        $a1, 0x79
  002dd988  addiu      $a0, $a0, -0x65e8                       # 0x00729a18 "Path : %s\n"
  002dd98c  jal        func_003DE7C8
  002dd990  addiu      $a1, $a1, 0x7280                        # delay slot
  002dd994  lui        $at, 0x79
  002dd998  lw         $v0, 0x7230($at)
  002dd99c  andi       $v0, $v0, 0x1000
  002dd9a0  beq        $v0, $zero, .L017
  002dd9a4  daddu      $a0, $zero, $zero                       # delay slot
  002dd9a8  lui        $a1, 0x73
  002dd9ac  lui        $a2, 0x79
  002dd9b0  lui        $a3, 0x73
  002dd9b4  lui        $t0, 0x73
  002dd9b8  addiu      $a0, $sp, 0x30
  002dd9bc  addiu      $a1, $a1, -0x65d0                       # 0x00729a30 "cdrom0:\\%s%s%s;1"
  002dd9c0  addiu      $a2, $a2, 0x7280
  002dd9c4  addiu      $a3, $a3, -0x6688                       # 0x00729978 "MODULES\\"
  002dd9c8  addiu      $t0, $t0, -0x65b8                       # 0x00729a48 "IOPRP280.IMG"
  002dd9cc  jal        func_00231510
  002dd9d0  sb         $zero, 0x30($sp)                        # delay slot
.L013:
  002dd9d4  jal        func_003E4C28
  002dd9d8  addiu      $a0, $sp, 0x30                          # delay slot
  002dd9dc  nop
  002dd9e0  nop
  002dd9e4  nop
  002dd9e8  nop
  002dd9ec  beq        $v0, $zero, .L013
  002dd9f0  nop                                                # delay slot
.L014:
  002dd9f4  nop
  002dd9f8  jal        func_003E4BD8
  002dd9fc  nop                                                # delay slot
  002dda00  nop
  002dda04  nop
  002dda08  nop
  002dda0c  nop
  002dda10  beq        $v0, $zero, .L014
  002dda14  nop                                                # delay slot
  002dda18  jal        func_003DF000
  002dda1c  daddu      $a0, $zero, $zero                       # delay slot
  002dda20  jal        func_003F9FE0
  002dda24  daddu      $a0, $zero, $zero                       # delay slot
  002dda28  lui        $at, 0x79
  002dda2c  lw         $v0, 0x7230($at)
  002dda30  andi       $v0, $v0, 0x2000
  002dda34  beq        $v0, $zero, .L015
  002dda38  addiu      $a0, $zero, 0x1                         # delay slot
  002dda3c  jal        func_003FA970
  002dda40  addiu      $a0, $zero, 0x2                         # delay slot
  002dda44  b          .L016
  002dda48  nop                                                # delay slot
.L015:
  002dda4c  jal        func_003FA970
  002dda50  nop                                                # delay slot
.L016:
  002dda54  jal        func_003E09B8
  002dda58  nop                                                # delay slot
  002dda5c  b          .L019
  002dda60  nop                                                # delay slot
.L017:
  002dda64  jal        func_003FA4B8
  002dda68  nop                                                # delay slot
  002dda6c  b          .L019
  002dda70  nop                                                # delay slot
.L018:
  002dda74  jal        func_003DF000
  002dda78  nop                                                # delay slot
.L019:
  002dda7c  jal        func_003E37A8
  002dda80  nop                                                # delay slot
  002dda84  lui        $at, 0x79
  002dda88  lw         $v0, 0x7230($at)
  002dda8c  andi       $v0, $v0, 0x800
  002dda90  beq        $v0, $zero, .L020
  002dda94  sb         $zero, 0x130($sp)                       # delay slot
  002dda98  lui        $a1, 0x73
  002dda9c  lui        $a2, 0x73
  002ddaa0  lui        $a3, 0x73
  002ddaa4  addiu      $a0, $sp, 0x130
  002ddaa8  addiu      $a1, $a1, -0x6698                       # 0x00729968 "cdrom0:\\%s%s;1"
  002ddaac  addiu      $a2, $a2, -0x6688                       # 0x00729978 "MODULES\\"
  002ddab0  jal        func_00231510
  002ddab4  addiu      $a3, $a3, -0x65a8                       # delay slot; 0x00729a58 "SIO2MAN.IRX"
  002ddab8  b          .L022
  002ddabc  addiu      $a0, $sp, 0x130                         # delay slot
.L020:
  002ddac0  lui        $a1, 0x73
  002ddac4  lui        $a2, 0x73
  002ddac8  lui        $a3, 0x73
  002ddacc  addiu      $a0, $sp, 0x130
  002ddad0  addiu      $a1, $a1, -0x6678                       # 0x00729988 "host0:%s%s"
  002ddad4  addiu      $a2, $a2, -0x6668                       # 0x00729998 "..\\ModulesPS2\\"
  002ddad8  jal        func_00231510
  002ddadc  addiu      $a3, $a3, -0x65a8                       # delay slot; 0x00729a58 "SIO2MAN.IRX"
.L021:
  002ddae0  addiu      $a0, $sp, 0x130
.L022:
  002ddae4  daddu      $a1, $zero, $zero
  002ddae8  jal        func_003E46F8
  002ddaec  daddu      $a2, $zero, $zero                       # delay slot
  002ddaf0  nop
  002ddaf4  nop
  002ddaf8  bltz       $v0, .L021
  002ddafc  nop                                                # delay slot
  002ddb00  lui        $at, 0x79
  002ddb04  lw         $v0, 0x7230($at)
  002ddb08  andi       $v0, $v0, 0x800
  002ddb0c  beq        $v0, $zero, .L023
  002ddb10  sb         $zero, 0x230($sp)                       # delay slot
  002ddb14  lui        $a1, 0x73
  002ddb18  lui        $a2, 0x73
  002ddb1c  lui        $a3, 0x73
  002ddb20  addiu      $a0, $sp, 0x230
  002ddb24  addiu      $a1, $a1, -0x6698                       # 0x00729968 "cdrom0:\\%s%s;1"
  002ddb28  addiu      $a2, $a2, -0x6688                       # 0x00729978 "MODULES\\"
  002ddb2c  jal        func_00231510
  002ddb30  addiu      $a3, $a3, -0x6598                       # delay slot; 0x00729a68 "PADMAN.IRX"
  002ddb34  b          .L025
  002ddb38  addiu      $a0, $sp, 0x230                         # delay slot
.L023:
  002ddb3c  lui        $a1, 0x73
  002ddb40  lui        $a2, 0x73
  002ddb44  lui        $a3, 0x73
  002ddb48  addiu      $a0, $sp, 0x230
  002ddb4c  addiu      $a1, $a1, -0x6678                       # 0x00729988 "host0:%s%s"
  002ddb50  addiu      $a2, $a2, -0x6668                       # 0x00729998 "..\\ModulesPS2\\"
  002ddb54  jal        func_00231510
  002ddb58  addiu      $a3, $a3, -0x6598                       # delay slot; 0x00729a68 "PADMAN.IRX"
.L024:
  002ddb5c  addiu      $a0, $sp, 0x230
.L025:
  002ddb60  daddu      $a1, $zero, $zero
  002ddb64  jal        func_003E46F8
  002ddb68  daddu      $a2, $zero, $zero                       # delay slot
  002ddb6c  nop
  002ddb70  nop
  002ddb74  bltz       $v0, .L024
  002ddb78  nop                                                # delay slot
  002ddb7c  lui        $at, 0x79
  002ddb80  lw         $v0, 0x7230($at)
  002ddb84  andi       $v0, $v0, 0x800
  002ddb88  beq        $v0, $zero, .L026
  002ddb8c  sb         $zero, 0x330($sp)                       # delay slot
  002ddb90  lui        $a1, 0x73
  002ddb94  lui        $a2, 0x73
  002ddb98  lui        $a3, 0x73
  002ddb9c  addiu      $a0, $sp, 0x330
  002ddba0  addiu      $a1, $a1, -0x6698                       # 0x00729968 "cdrom0:\\%s%s;1"
  002ddba4  addiu      $a2, $a2, -0x6688                       # 0x00729978 "MODULES\\"
  002ddba8  jal        func_00231510
  002ddbac  addiu      $a3, $a3, -0x6588                       # delay slot; 0x00729a78 "MCMAN.IRX"
  002ddbb0  b          .L028
  002ddbb4  addiu      $a0, $sp, 0x330                         # delay slot
.L026:
  002ddbb8  lui        $a1, 0x73
  002ddbbc  lui        $a2, 0x73
  002ddbc0  lui        $a3, 0x73
  002ddbc4  addiu      $a0, $sp, 0x330
  002ddbc8  addiu      $a1, $a1, -0x6678                       # 0x00729988 "host0:%s%s"
  002ddbcc  addiu      $a2, $a2, -0x6668                       # 0x00729998 "..\\ModulesPS2\\"
  002ddbd0  jal        func_00231510
  002ddbd4  addiu      $a3, $a3, -0x6588                       # delay slot; 0x00729a78 "MCMAN.IRX"
.L027:
  002ddbd8  addiu      $a0, $sp, 0x330
.L028:
  002ddbdc  daddu      $a1, $zero, $zero
  002ddbe0  jal        func_003E46F8
  002ddbe4  daddu      $a2, $zero, $zero                       # delay slot
  002ddbe8  nop
  002ddbec  nop
  002ddbf0  bltz       $v0, .L027
  002ddbf4  nop                                                # delay slot
  002ddbf8  lui        $at, 0x79
  002ddbfc  lw         $v0, 0x7230($at)
  002ddc00  andi       $v0, $v0, 0x800
  002ddc04  beq        $v0, $zero, .L029
  002ddc08  sb         $zero, 0x430($sp)                       # delay slot
  002ddc0c  lui        $a1, 0x73
  002ddc10  lui        $a2, 0x73
  002ddc14  lui        $a3, 0x73
  002ddc18  addiu      $a0, $sp, 0x430
  002ddc1c  addiu      $a1, $a1, -0x6698                       # 0x00729968 "cdrom0:\\%s%s;1"
  002ddc20  addiu      $a2, $a2, -0x6688                       # 0x00729978 "MODULES\\"
  002ddc24  jal        func_00231510
  002ddc28  addiu      $a3, $a3, -0x6578                       # delay slot; 0x00729a88 "MCSERV.IRX"
  002ddc2c  b          .L031
  002ddc30  addiu      $a0, $sp, 0x430                         # delay slot
.L029:
  002ddc34  lui        $a1, 0x73
  002ddc38  lui        $a2, 0x73
  002ddc3c  lui        $a3, 0x73
  002ddc40  addiu      $a0, $sp, 0x430
  002ddc44  addiu      $a1, $a1, -0x6678                       # 0x00729988 "host0:%s%s"
  002ddc48  addiu      $a2, $a2, -0x6668                       # 0x00729998 "..\\ModulesPS2\\"
  002ddc4c  jal        func_00231510
  002ddc50  addiu      $a3, $a3, -0x6578                       # delay slot; 0x00729a88 "MCSERV.IRX"
.L030:
  002ddc54  addiu      $a0, $sp, 0x430
.L031:
  002ddc58  daddu      $a1, $zero, $zero
  002ddc5c  jal        func_003E46F8
  002ddc60  daddu      $a2, $zero, $zero                       # delay slot
  002ddc64  nop
  002ddc68  nop
  002ddc6c  bltz       $v0, .L030
  002ddc70  nop                                                # delay slot
  002ddc74  lui        $at, 0x79
  002ddc78  lw         $v0, 0x7230($at)
  002ddc7c  andi       $v0, $v0, 0x800
  002ddc80  beq        $v0, $zero, .L032
  002ddc84  sb         $zero, 0x530($sp)                       # delay slot
  002ddc88  lui        $a1, 0x73
  002ddc8c  lui        $a2, 0x73
  002ddc90  lui        $a3, 0x73
  002ddc94  addiu      $a0, $sp, 0x530
  002ddc98  addiu      $a1, $a1, -0x6698                       # 0x00729968 "cdrom0:\\%s%s;1"
  002ddc9c  addiu      $a2, $a2, -0x6688                       # 0x00729978 "MODULES\\"
  002ddca0  jal        func_00231510
  002ddca4  addiu      $a3, $a3, -0x6568                       # delay slot; 0x00729a98 "LIBSD.IRX"
  002ddca8  b          .L034
  002ddcac  addiu      $a0, $sp, 0x530                         # delay slot
.L032:
  002ddcb0  lui        $a1, 0x73
  002ddcb4  lui        $a2, 0x73
  002ddcb8  lui        $a3, 0x73
  002ddcbc  addiu      $a0, $sp, 0x530
  002ddcc0  addiu      $a1, $a1, -0x6678                       # 0x00729988 "host0:%s%s"
  002ddcc4  addiu      $a2, $a2, -0x6668                       # 0x00729998 "..\\ModulesPS2\\"
  002ddcc8  jal        func_00231510
  002ddccc  addiu      $a3, $a3, -0x6568                       # delay slot; 0x00729a98 "LIBSD.IRX"
.L033:
  002ddcd0  addiu      $a0, $sp, 0x530
.L034:
  002ddcd4  daddu      $a1, $zero, $zero
  002ddcd8  jal        func_003E46F8
  002ddcdc  daddu      $a2, $zero, $zero                       # delay slot
  002ddce0  nop
  002ddce4  nop
  002ddce8  bltz       $v0, .L033
  002ddcec  nop                                                # delay slot
  002ddcf0  lui        $at, 0x79
  002ddcf4  lw         $v0, 0x7230($at)
  002ddcf8  andi       $v0, $v0, 0x800
  002ddcfc  beq        $v0, $zero, .L035
  002ddd00  sb         $zero, 0x630($sp)                       # delay slot
  002ddd04  lui        $a1, 0x73
  002ddd08  lui        $a2, 0x73
  002ddd0c  lui        $a3, 0x73
  002ddd10  addiu      $a0, $sp, 0x630
  002ddd14  addiu      $a1, $a1, -0x6698                       # 0x00729968 "cdrom0:\\%s%s;1"
  002ddd18  addiu      $a2, $a2, -0x6688                       # 0x00729978 "MODULES\\"
  002ddd1c  jal        func_00231510
  002ddd20  addiu      $a3, $a3, -0x6558                       # delay slot; 0x00729aa8 "ZNASND.IRX"
  002ddd24  b          .L037
  002ddd28  addiu      $a0, $sp, 0x630                         # delay slot
.L035:
  002ddd2c  lui        $a1, 0x73
  002ddd30  lui        $a2, 0x73
  002ddd34  lui        $a3, 0x73
  002ddd38  addiu      $a0, $sp, 0x630
  002ddd3c  addiu      $a1, $a1, -0x6678                       # 0x00729988 "host0:%s%s"
  002ddd40  addiu      $a2, $a2, -0x6668                       # 0x00729998 "..\\ModulesPS2\\"
  002ddd44  jal        func_00231510
  002ddd48  addiu      $a3, $a3, -0x6558                       # delay slot; 0x00729aa8 "ZNASND.IRX"
.L036:
  002ddd4c  addiu      $a0, $sp, 0x630
.L037:
  002ddd50  daddu      $a1, $zero, $zero
  002ddd54  jal        func_003E46F8
  002ddd58  daddu      $a2, $zero, $zero                       # delay slot
  002ddd5c  nop
  002ddd60  nop
  002ddd64  bltz       $v0, .L036
  002ddd68  nop                                                # delay slot
  002ddd6c  lui        $a0, 0x79
  002ddd70  jal        func_002E0200
  002ddd74  addiu      $a0, $a0, 0x5f60                        # delay slot
  002ddd78  ld         $ra, 0x20($sp)
  002ddd7c  lq         $s1, 0x10($sp)
  002ddd80  lq         $s0, 0x0($sp)
  002ddd84  jr         $ra
  002ddd88  addiu      $sp, $sp, 0x740                         # delay slot
/* end of func_002DD6B0 */
