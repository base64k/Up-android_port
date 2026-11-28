/**************************************************************************
 * func_0032EAA0
 *
 * address      : 0x0032eaa0 .. 0x0032f154  (1716 bytes, 429 instructions)
 * discovered by: called
 * called from  : 0x0032f214
 * string hint  : "_CoreMainLoop(): Before ManipulatorMgr->EndPause()"
 */
glabel func_0032EAA0
  0032eaa0  addiu      $sp, $sp, -0x20
  0032eaa4  lui        $a0, 0x7a
  0032eaa8  lui        $a1, 0x73
  0032eaac  sd         $ra, 0x10($sp)
  0032eab0  addiu      $a0, $a0, -0x70a0
  0032eab4  addiu      $a1, $a1, -0x4960                       # 0x0072b6a0 "_CoreMainLoop(): Beginning"
  0032eab8  jal        func_003F45F8
  0032eabc  swc1       $f20, 0x0($sp)                          # delay slot
  0032eac0  lb         $v0, -0x7438($gp)
  0032eac4  bne        $v0, $zero, .L000
  0032eac8  lui        $at, 0x79                               # delay slot
  0032eacc  addiu      $v0, $zero, 0x1
  0032ead0  lui        $v1, 0x3c88
  0032ead4  sb         $v0, -0x7438($gp)
  0032ead8  ori        $v0, $v1, 0x8889
  0032eadc  sw         $v0, -0x743c($gp)
.L000:
  0032eae0  lb         $v0, 0x680e($at)
  0032eae4  beq        $v0, $zero, .L003
  0032eae8  nop                                                # delay slot
  0032eaec  lui        $at, 0x79
  0032eaf0  lwc1       $f2, 0x6814($at)
  0032eaf4  lwc1       $f1, -0x743c($gp)
  0032eaf8  mtc1       $zero, $f0
  0032eafc  lui        $at, 0x79
  0032eb00  sub.s      $f1, $f2, $f1
  0032eb04  c.le.s     $f1, $f0
  0032eb08  nop
  0032eb0c  bc1t       .L001
  0032eb10  swc1       $f1, 0x6814($at)                        # delay slot
  0032eb14  lui        $a0, 0x79
  0032eb18  jal        func_00338310
  0032eb1c  addiu      $a0, $a0, 0x5f60                        # delay slot
  0032eb20  lui        $a0, 0x79
  0032eb24  jal        func_003383C0
  0032eb28  addiu      $a0, $a0, 0x5f60                        # delay slot
  0032eb2c  b          .L010
  0032eb30  swc1       $f0, -0x743c($gp)                       # delay slot
.L001:
  0032eb34  lui        $at, 0x79
  0032eb38  lwc1       $f20, 0x725c($at)
  0032eb3c  c.eq.s     $f20, $f0
  0032eb40  nop
  0032eb44  bc1t       .L002
  0032eb48  lui        $v0, 0x3c88                             # delay slot
  0032eb4c  lui        $a0, 0x79
  0032eb50  jal        func_003382D0
  0032eb54  addiu      $a0, $a0, 0x5f60                        # delay slot
  0032eb58  mul.s      $f0, $f20, $f0
  0032eb5c  b          .L003
  0032eb60  swc1       $f0, -0x743c($gp)                       # delay slot
.L002:
  0032eb64  ori        $v0, $v0, 0x8889
  0032eb68  sw         $v0, -0x743c($gp)
.L003:
  0032eb6c  lui        $a0, 0x7a
  0032eb70  lui        $a1, 0x73
  0032eb74  addiu      $a0, $a0, -0x70a0
  0032eb78  jal        func_003F45F8
  0032eb7c  addiu      $a1, $a1, -0x4940                       # delay slot; 0x0072b6c0 "_CoreMainLoop(): Before MemManager->Update()"
  0032eb80  lwc1       $f12, -0x743c($gp)
  0032eb84  lui        $a0, 0x79
  0032eb88  jal        func_002DC880
  0032eb8c  addiu      $a0, $a0, 0x57b0                        # delay slot
  0032eb90  lui        $a0, 0x7a
  0032eb94  lui        $a1, 0x73
  0032eb98  addiu      $a0, $a0, -0x70a0
  0032eb9c  jal        func_003F45F8
  0032eba0  addiu      $a1, $a1, -0x4910                       # delay slot; 0x0072b6f0 "_CoreMainLoop(): Before NetManager->Update()"
  0032eba4  lui        $at, 0x79
  0032eba8  lw         $v0, 0x5fd8($at)
  0032ebac  beq        $v0, $zero, .L004
  0032ebb0  nop                                                # delay slot
  0032ebb4  lui        $a0, 0x79
  0032ebb8  jal        func_00338440
  0032ebbc  addiu      $a0, $a0, 0x5f60                        # delay slot
  0032ebc0  lui        $at, 0x79
  0032ebc4  lw         $a0, 0x5fd8($at)
  0032ebc8  lw         $t9, 0x0($a0)
  0032ebcc  lw         $t9, 0x8($t9)
  0032ebd0  jalr       $t9
  0032ebd4  mov.s      $f12, $f0                               # delay slot
.L004:
  0032ebd8  lui        $a0, 0x7a
  0032ebdc  lui        $a1, 0x73
  0032ebe0  addiu      $a0, $a0, -0x70a0
  0032ebe4  jal        func_003F45F8
  0032ebe8  addiu      $a1, $a1, -0x48e0                       # delay slot; 0x0072b720 "_CoreMainLoop(): Before UpdateVolatileBlocks()"
  0032ebec  lui        $at, 0x79
  0032ebf0  lwc1       $f12, -0x743c($gp)
  0032ebf4  jal        func_0043F380
  0032ebf8  lw         $a0, 0x5fd0($at)                        # delay slot
  0032ebfc  lui        $a0, 0x7a
  0032ec00  lui        $a1, 0x73
  0032ec04  addiu      $a0, $a0, -0x70a0
  0032ec08  jal        func_003F45F8
  0032ec0c  addiu      $a1, $a1, -0x48b0                       # delay slot; 0x0072b750 "_CoreMainLoop(): Before StreamMgr->Update()"
  0032ec10  lui        $at, 0x79
  0032ec14  lwc1       $f12, -0x743c($gp)
  0032ec18  jal        func_00456970
  0032ec1c  lw         $a0, 0x5fcc($at)                        # delay slot
  0032ec20  lui        $a0, 0x7a
  0032ec24  lui        $a1, 0x73
  0032ec28  addiu      $a0, $a0, -0x70a0
  0032ec2c  jal        func_003F45F8
  0032ec30  addiu      $a1, $a1, -0x4880                       # delay slot; 0x0072b780 "_CoreMainLoop(): Before IGAMgr->Update()"
  0032ec34  lui        $at, 0x79
  0032ec38  lw         $a0, 0x5fe0($at)
  0032ec3c  lw         $t9, 0x0($a0)
  0032ec40  lw         $t9, 0x18($t9)
  0032ec44  jalr       $t9
  0032ec48  lwc1       $f12, -0x743c($gp)                      # delay slot
  0032ec4c  lui        $a0, 0x7a
  0032ec50  lui        $a1, 0x73
  0032ec54  addiu      $a0, $a0, -0x70a0
  0032ec58  jal        func_003F45F8
  0032ec5c  addiu      $a1, $a1, -0x4850                       # delay slot; 0x0072b7b0 "_CoreMainLoop(): Before BeginRender()"
  0032ec60  lui        $at, 0x79
  0032ec64  lw         $a0, 0x5f6c($at)
  0032ec68  lw         $t9, 0x2200($a0)
  0032ec6c  lw         $t9, 0x1c($t9)
  0032ec70  jalr       $t9
  0032ec74  nop                                                # delay slot
  0032ec78  lui        $a0, 0x7a
  0032ec7c  lui        $a1, 0x73
  0032ec80  addiu      $a0, $a0, -0x70a0
  0032ec84  jal        func_003F45F8
  0032ec88  addiu      $a1, $a1, -0x4820                       # delay slot; 0x0072b7e0 "_CoreMainLoop(): Before InitFrame()"
  0032ec8c  lui        $at, 0x79
  0032ec90  lw         $a0, 0x5fac($at)
  0032ec94  lw         $t9, 0x30($a0)
  0032ec98  lw         $t9, 0x1c($t9)
  0032ec9c  jalr       $t9
  0032eca0  nop                                                # delay slot
  0032eca4  lui        $a0, 0x7a
  0032eca8  lui        $a1, 0x73
  0032ecac  addiu      $a0, $a0, -0x70a0
  0032ecb0  jal        func_003F45F8
  0032ecb4  addiu      $a1, $a1, -0x47f0                       # delay slot; 0x0072b810 "_CoreMainLoop(): Before SavingMgr->Update()"
  0032ecb8  lui        $at, 0x79
  0032ecbc  lw         $a0, 0x5fb8($at)
  0032ecc0  lw         $t9, 0x8($a0)
  0032ecc4  lw         $t9, 0xac($t9)
  0032ecc8  jalr       $t9
  0032eccc  lwc1       $f12, -0x743c($gp)                      # delay slot
  0032ecd0  lui        $a0, 0x7a
  0032ecd4  lui        $a1, 0x73
  0032ecd8  addiu      $a0, $a0, -0x70a0
  0032ecdc  jal        func_003F45F8
  0032ece0  addiu      $a1, $a1, -0x47c0                       # delay slot; 0x0072b840 "_CoreMainLoop(): Before InputMgr->UpdateInput()"
  0032ece4  lui        $at, 0x79
  0032ece8  lw         $a0, 0x5fa8($at)
  0032ecec  lw         $t9, 0x1a8($a0)
  0032ecf0  lw         $t9, 0x24($t9)
  0032ecf4  jalr       $t9
  0032ecf8  lwc1       $f12, -0x743c($gp)                      # delay slot
  0032ecfc  lui        $a0, 0x7a
  0032ed00  lui        $a1, 0x73
  0032ed04  addiu      $a0, $a0, -0x70a0
  0032ed08  jal        func_003F45F8
  0032ed0c  addiu      $a1, $a1, -0x4790                       # delay slot; 0x0072b870 "_CoreMainLoop(): Before ScriptInputMgr->Update()"
  0032ed10  lui        $at, 0x79
  0032ed14  lw         $a0, 0x5fb4($at)
  0032ed18  lw         $t9, 0x0($a0)
  0032ed1c  lw         $t9, 0xc($t9)
  0032ed20  jalr       $t9
  0032ed24  lwc1       $f12, -0x743c($gp)                      # delay slot
  0032ed28  lui        $a0, 0x7a
  0032ed2c  lui        $a1, 0x73
  0032ed30  addiu      $a0, $a0, -0x70a0
  0032ed34  jal        func_003F45F8
  0032ed38  addiu      $a1, $a1, -0x4750                       # delay slot; 0x0072b8b0 "_CoreMainLoop(): Before ScriptMgr->Update()"
  0032ed3c  lui        $at, 0x79
  0032ed40  lw         $a0, 0x5f7c($at)
  0032ed44  lw         $t9, 0x30($a0)
  0032ed48  lw         $t9, 0x94($t9)
  0032ed4c  jalr       $t9
  0032ed50  lwc1       $f12, -0x743c($gp)                      # delay slot
  0032ed54  lui        $a0, 0x7a
  0032ed58  lui        $a1, 0x73
  0032ed5c  addiu      $a0, $a0, -0x70a0
  0032ed60  jal        func_003F45F8
  0032ed64  addiu      $a1, $a1, -0x4720                       # delay slot; 0x0072b8e0 "_CoreMainLoop(): Before GameMgr->Update()"
  0032ed68  lui        $at, 0x79
  0032ed6c  lwc1       $f12, -0x743c($gp)
  0032ed70  jal        func_00314DF0
  0032ed74  lw         $a0, 0x5f98($at)                        # delay slot
  0032ed78  lui        $a0, 0x7a
  0032ed7c  lui        $a1, 0x73
  0032ed80  addiu      $a0, $a0, -0x70a0
  0032ed84  jal        func_003F45F8
  0032ed88  addiu      $a1, $a1, -0x46f0                       # delay slot; 0x0072b910 "_CoreMainLoop(): Before ManipulatorMgr->Update()"
  0032ed8c  lui        $at, 0x79
  0032ed90  lwc1       $f12, -0x743c($gp)
  0032ed94  jal        func_00426350
  0032ed98  lw         $a0, 0x5f94($at)                        # delay slot
  0032ed9c  lui        $a0, 0x7a
  0032eda0  lui        $a1, 0x73
  0032eda4  addiu      $a0, $a0, -0x70a0
  0032eda8  jal        func_003F45F8
  0032edac  addiu      $a1, $a1, -0x4910                       # delay slot; 0x0072b6f0 "_CoreMainLoop(): Before NetManager->Update()"
  0032edb0  lui        $at, 0x79
  0032edb4  lw         $v0, 0x5fd8($at)
  0032edb8  beq        $v0, $zero, .L005
  0032edbc  nop                                                # delay slot
  0032edc0  lui        $a0, 0x79
  0032edc4  jal        func_00338440
  0032edc8  addiu      $a0, $a0, 0x5f60                        # delay slot
  0032edcc  lui        $at, 0x79
  0032edd0  lw         $a0, 0x5fd8($at)
  0032edd4  lw         $t9, 0x0($a0)
  0032edd8  lw         $t9, 0xc($t9)
  0032eddc  jalr       $t9
  0032ede0  mov.s      $f12, $f0                               # delay slot
.L005:
  0032ede4  lui        $a0, 0x7a
  0032ede8  lui        $a1, 0x73
  0032edec  addiu      $a0, $a0, -0x70a0
  0032edf0  jal        func_003F45F8
  0032edf4  addiu      $a1, $a1, -0x46b0                       # delay slot; 0x0072b950 "_CoreMainLoop(): Before SoundMgr->Update()"
  0032edf8  lui        $at, 0x79
  0032edfc  lw         $a0, 0x5fac($at)
  0032ee00  lw         $t9, 0x30($a0)
  0032ee04  lw         $t9, 0x20($t9)
  0032ee08  jalr       $t9
  0032ee0c  lwc1       $f12, -0x743c($gp)                      # delay slot
  0032ee10  lui        $a0, 0x7a
  0032ee14  lui        $a1, 0x73
  0032ee18  addiu      $a0, $a0, -0x70a0
  0032ee1c  jal        func_003F45F8
  0032ee20  addiu      $a1, $a1, -0x4680                       # delay slot; 0x0072b980 "_CoreMainLoop(): Before MainRdr->Draw()"
  0032ee24  lui        $at, 0x79
  0032ee28  lw         $a0, 0x5f6c($at)
  0032ee2c  lw         $t9, 0x2200($a0)
  0032ee30  lw         $t9, 0x24($t9)
  0032ee34  jalr       $t9
  0032ee38  lwc1       $f12, -0x743c($gp)                      # delay slot
  0032ee3c  lui        $a0, 0x7a
  0032ee40  lui        $a1, 0x73
  0032ee44  addiu      $a0, $a0, -0x70a0
  0032ee48  jal        func_003F45F8
  0032ee4c  addiu      $a1, $a1, -0x4650                       # delay slot; 0x0072b9b0 "_CoreMainLoop(): Before ParticlesMgr->Update()"
  0032ee50  lui        $at, 0x79
  0032ee54  lw         $a0, 0x5fbc($at)
  0032ee58  lw         $t9, 0x0($a0)
  0032ee5c  lw         $t9, 0xc($t9)
  0032ee60  jalr       $t9
  0032ee64  lwc1       $f12, -0x743c($gp)                      # delay slot
  0032ee68  lui        $a0, 0x7a
  0032ee6c  lui        $a1, 0x73
  0032ee70  addiu      $a0, $a0, -0x70a0
  0032ee74  jal        func_003F45F8
  0032ee78  addiu      $a1, $a1, -0x4620                       # delay slot; 0x0072b9e0 "_CoreMainLoop(): Before LowLevelUpdateProgram()"
  0032ee7c  lui        $at, 0x79
  0032ee80  lwc1       $f12, -0x743c($gp)
  0032ee84  jal        func_004609A0
  0032ee88  lw         $a0, 0x5f88($at)                        # delay slot
  0032ee8c  jal        func_002DF6A0
  0032ee90  lwc1       $f12, -0x743c($gp)                      # delay slot
  0032ee94  lui        $a0, 0x7a
  0032ee98  lui        $a1, 0x73
  0032ee9c  addiu      $a0, $a0, -0x70a0
  0032eea0  jal        func_003F45F8
  0032eea4  addiu      $a1, $a1, -0x45f0                       # delay slot; 0x0072ba10 "_CoreMainLoop(): Before  gData.GetDeltaTime()"
  0032eea8  lui        $a0, 0x79
  0032eeac  jal        func_00338310
  0032eeb0  addiu      $a0, $a0, 0x5f60                        # delay slot
  0032eeb4  lui        $a0, 0x79
  0032eeb8  jal        func_003383C0
  0032eebc  addiu      $a0, $a0, 0x5f60                        # delay slot
  0032eec0  lui        $at, 0x79
  0032eec4  lw         $v1, 0x5f70($at)
  0032eec8  swc1       $f0, -0x743c($gp)
  0032eecc  lb         $v0, 0x69($v1)
  0032eed0  bne        $v0, $zero, .L006
  0032eed4  sb         $zero, 0x69($v1)                        # delay slot
  0032eed8  lui        $at, 0x79
  0032eedc  lb         $v0, 0x6820($at)
  0032eee0  beq        $v0, $zero, .L008
  0032eee4  nop                                                # delay slot
.L006:
  0032eee8  lui        $at, 0x79
  0032eeec  lb         $v0, 0x6820($at)
  0032eef0  beq        $v0, $zero, .L007
  0032eef4  lui        $v0, 0x3d08                             # delay slot
  0032eef8  lui        $a0, 0x7a
  0032eefc  lui        $a1, 0x73
  0032ef00  addiu      $a0, $a0, -0x70a0
  0032ef04  jal        func_003F45F8
  0032ef08  addiu      $a1, $a1, -0x45c0                       # delay slot; 0x0072ba40 "_CoreMainLoop(): Before UnpauseAppRequested()"
  0032ef0c  lui        $a0, 0x7a
  0032ef10  lui        $a1, 0x73
  0032ef14  lui        $at, 0x79
  0032ef18  addiu      $a0, $a0, -0x70a0
  0032ef1c  addiu      $a1, $a1, -0x4590                       # 0x0072ba70 "_CoreMainLoop(): Before ScriptMgr->EndPause()"
  0032ef20  jal        func_003F45F8
  0032ef24  sb         $zero, 0x6820($at)                      # delay slot
  0032ef28  lui        $at, 0x79
  0032ef2c  lui        $a0, 0x7a
  0032ef30  lw         $v0, 0x5f7c($at)
  0032ef34  lui        $a1, 0x73
  0032ef38  addiu      $a0, $a0, -0x70a0
  0032ef3c  addiu      $a1, $a1, -0x4560                       # 0x0072baa0 "_CoreMainLoop(): Before ManipulatorMgr->EndPause()"
  0032ef40  jal        func_003F45F8
  0032ef44  sb         $zero, 0x0($v0)                         # delay slot
  0032ef48  lui        $at, 0x79
  0032ef4c  lui        $a0, 0x7a
  0032ef50  lw         $v0, 0x5f94($at)
  0032ef54  lui        $a1, 0x73
  0032ef58  addiu      $a0, $a0, -0x70a0
  0032ef5c  addiu      $a1, $a1, -0x4520                       # 0x0072bae0 "_CoreMainLoop(): Before MaterialMgr->EndPause()"
  0032ef60  jal        func_003F45F8
  0032ef64  sb         $zero, 0xf0($v0)                        # delay slot
  0032ef68  lui        $at, 0x79
  0032ef6c  lui        $a0, 0x7a
  0032ef70  lw         $v0, 0x5f78($at)
  0032ef74  lui        $a1, 0x73
  0032ef78  addiu      $a0, $a0, -0x70a0
  0032ef7c  addiu      $a1, $a1, -0x44f0                       # 0x0072bb10 "_CoreMainLoop(): Before GameMgr->EndPause()"
  0032ef80  jal        func_003F45F8
  0032ef84  sb         $zero, 0x3028($v0)                      # delay slot
  0032ef88  lui        $at, 0x79
  0032ef8c  lui        $a0, 0x7a
  0032ef90  lw         $v0, 0x5f98($at)
  0032ef94  lui        $a1, 0x73
  0032ef98  addiu      $a0, $a0, -0x70a0
  0032ef9c  addiu      $a1, $a1, -0x44c0                       # 0x0072bb40 "_CoreMainLoop(): Before InputMgr->EndPause()"
  0032efa0  jal        func_003F45F8
  0032efa4  sb         $zero, 0x3c($v0)                        # delay slot
  0032efa8  lui        $at, 0x79
  0032efac  lw         $v0, 0x5fa8($at)
  0032efb0  sb         $zero, 0x26($v0)
  0032efb4  lui        $v0, 0x3d08
.L007:
  0032efb8  ori        $v0, $v0, 0x8889
  0032efbc  sw         $v0, -0x743c($gp)
.L008:
  0032efc0  lui        $at, 0x79
  0032efc4  lui        $a0, 0x7a
  0032efc8  lw         $v0, 0x7248($at)
  0032efcc  lui        $a1, 0x73
  0032efd0  lwc1       $f0, -0x743c($gp)
  0032efd4  addiu      $a0, $a0, -0x70a0
  0032efd8  addiu      $a1, $a1, -0x4490                       # 0x0072bb70 "_CoreMainLoop(): Before Cons->Update()"
  0032efdc  lui        $at, 0x79
  0032efe0  addiu      $v0, $v0, 0x1
  0032efe4  lwc1       $f1, 0x724c($at)
  0032efe8  add.s      $f0, $f1, $f0
  0032efec  lui        $at, 0x79
  0032eff0  sw         $v0, 0x7248($at)
  0032eff4  lui        $at, 0x79
  0032eff8  jal        func_003F45F8
  0032effc  swc1       $f0, 0x724c($at)                        # delay slot
  0032f000  lui        $at, 0x79
  0032f004  lw         $a0, 0x5f68($at)
  0032f008  lui        $at, 0x1
  0032f00c  addu       $at, $a0, $at
  0032f010  lw         $t9, -0x5704($at)
  0032f014  lw         $t9, 0x28($t9)
  0032f018  jalr       $t9
  0032f01c  lwc1       $f12, -0x743c($gp)                      # delay slot
  0032f020  lui        $a0, 0x7a
  0032f024  lui        $a1, 0x73
  0032f028  addiu      $a0, $a0, -0x70a0
  0032f02c  jal        func_003F45F8
  0032f030  addiu      $a1, $a1, -0x4460                       # delay slot; 0x0072bba0 "_CoreMainLoop(): Before ClassMgr->Update()"
  0032f034  lui        $at, 0x79
  0032f038  lw         $a0, 0x5f70($at)
  0032f03c  lw         $t9, 0x88($a0)
  0032f040  lw         $t9, 0x14($t9)
  0032f044  jalr       $t9
  0032f048  lwc1       $f12, -0x743c($gp)                      # delay slot
  0032f04c  lui        $a0, 0x7a
  0032f050  lui        $a1, 0x73
  0032f054  addiu      $a0, $a0, -0x70a0
  0032f058  jal        func_003F45F8
  0032f05c  addiu      $a1, $a1, -0x4460                       # delay slot; 0x0072bba0 "_CoreMainLoop(): Before ClassMgr->Update()"
  0032f060  lui        $at, 0x79
  0032f064  lw         $a0, 0x5fec($at)
  0032f068  lw         $t9, 0x0($a0)
  0032f06c  lw         $t9, 0x14($t9)
  0032f070  jalr       $t9
  0032f074  lwc1       $f12, -0x743c($gp)                      # delay slot
  0032f078  lui        $a0, 0x7a
  0032f07c  lui        $a1, 0x73
  0032f080  addiu      $a0, $a0, -0x70a0
  0032f084  jal        func_003F45F8
  0032f088  addiu      $a1, $a1, -0x4430                       # delay slot; 0x0072bbd0 "_CoreMainLoop(): Before Z_Verify()"
  0032f08c  lui        $a0, 0x7a
  0032f090  lui        $a1, 0x73
  0032f094  addiu      $a0, $a0, -0x70a0
  0032f098  jal        func_003F45F8
  0032f09c  addiu      $a1, $a1, -0x4400                       # delay slot; 0x0072bc00 "_CoreMainLoop(): Before MainRdr->EndRender()"
  0032f0a0  lui        $at, 0x79
  0032f0a4  lw         $a0, 0x5f6c($at)
  0032f0a8  lw         $t9, 0x2200($a0)
  0032f0ac  lw         $t9, 0x20($t9)
  0032f0b0  jalr       $t9
  0032f0b4  lwc1       $f12, -0x743c($gp)                      # delay slot
  0032f0b8  lui        $at, 0x79
  0032f0bc  lw         $a0, 0x5f7c($at)
  0032f0c0  lw         $t9, 0x30($a0)
  0032f0c4  lw         $t9, 0x98($t9)
  0032f0c8  jalr       $t9
  0032f0cc  nop                                                # delay slot
  0032f0d0  lui        $at, 0x79
  0032f0d4  lw         $a0, 0x5f70($at)
  0032f0d8  lw         $t9, 0x88($a0)
  0032f0dc  lw         $t9, 0x18($t9)
  0032f0e0  jalr       $t9
  0032f0e4  nop                                                # delay slot
  0032f0e8  lui        $a0, 0x7a
  0032f0ec  lui        $a1, 0x73
  0032f0f0  addiu      $a0, $a0, -0x70a0
  0032f0f4  jal        func_003F45F8
  0032f0f8  addiu      $a1, $a1, -0x43d0                       # delay slot; 0x0072bc30 "_CoreMainLoop(): Before MainRdr->WaitForRetrace()"
  0032f0fc  lui        $at, 0x79
  0032f100  lw         $a0, 0x5f6c($at)
  0032f104  lw         $t9, 0x2200($a0)
  0032f108  lw         $t9, 0x2c($t9)
  0032f10c  jalr       $t9
  0032f110  lwc1       $f12, -0x743c($gp)                      # delay slot
  0032f114  lui        $at, 0x79
  0032f118  lb         $v0, 0x680e($at)
  0032f11c  beq        $v0, $zero, .L009
  0032f120  lui        $a0, 0x7a                               # delay slot
  0032f124  lui        $at, 0x79
  0032f128  lwc1       $f0, 0x6818($at)
  0032f12c  lui        $at, 0x79
  0032f130  swc1       $f0, 0x6814($at)
.L009:
  0032f134  lui        $a1, 0x73
  0032f138  addiu      $a0, $a0, -0x70a0
  0032f13c  jal        func_003F45F8
  0032f140  addiu      $a1, $a1, -0x4390                       # delay slot; 0x0072bc70 "_CoreMainLoop(): End"
.L010:
  0032f144  ld         $ra, 0x10($sp)
  0032f148  lwc1       $f20, 0x0($sp)
  0032f14c  jr         $ra
  0032f150  addiu      $sp, $sp, 0x20                          # delay slot
/* end of func_0032EAA0 */
