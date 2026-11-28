/**************************************************************************
 * func_003F45F8
 *
 * address      : 0x003f45f8 .. 0x003f470c  (276 bytes, 69 instructions)
 * discovered by: called
 * called from  : 0x00216aa0, 0x00219758, 0x0022494c, 0x002260c8, 0x00231580, 0x00231628 (+348 more)
 */
glabel func_003F45F8
  003f45f8  daddu      $a3, $a0, $zero
  003f45fc  or         $t0, $a1, $a3
  003f4600  andi       $v0, $t0, 0x7
  003f4604  bne        $v0, $zero, .L004
  003f4608  daddu      $v1, $a3, $zero                         # delay slot
  003f460c  andi       $v0, $t0, 0xf
  003f4610  lui        $t1, 0x101
  003f4614  ori        $t1, $t1, 0x101
  003f4618  dsll       $t1, $t1, 16
  003f461c  ori        $t1, $t1, 0x101
  003f4620  dsll       $t1, $t1, 16
  003f4624  ori        $t1, $t1, 0x101
  003f4628  lui        $a0, 0x8080
  003f462c  ori        $a0, $a0, 0x8080
  003f4630  dsll       $a0, $a0, 16
  003f4634  ori        $a0, $a0, 0x8080
  003f4638  dsll       $a0, $a0, 16
  003f463c  ori        $a0, $a0, 0x8080
  003f4640  bnel       $v0, $zero, .L001
  003f4644  ld         $t2, 0x0($a1)                           # delay slot
  003f4648  pcpyld     $t2, $t1, $t1
  003f464c  lq         $t1, 0x0($a1)
  003f4650  pcpyld     $t0, $a0, $a0
  003f4654  psubb      $v0, $t1, $t2
  003f4658  pnor       $v1, $zero, $t1
  003f465c  pand       $v0, $v0, $v1
  003f4660  pand       $v0, $v0, $t0
  003f4664  pcpyud     $a0, $v0, $t1
  003f4668  or         $v1, $v0, $a0
  003f466c  bne        $v1, $zero, .L003
  003f4670  daddu      $a2, $a3, $zero                         # delay slot
.L000:
  003f4674  sq         $t1, 0x0($a2)
  003f4678  addiu      $a1, $a1, 0x10
  003f467c  lq         $t1, 0x0($a1)
  003f4680  psubb      $v0, $t1, $t2
  003f4684  pnor       $v1, $zero, $t1
  003f4688  pand       $v0, $v0, $v1
  003f468c  pand       $v0, $v0, $t0
  003f4690  pcpyud     $a0, $v0, $t1
  003f4694  or         $v1, $v0, $a0
  003f4698  beq        $v1, $zero, .L000
  003f469c  addiu      $a2, $a2, 0x10                          # delay slot
  003f46a0  b          .L004
  003f46a4  daddu      $v1, $a2, $zero                         # delay slot
.L001:
  003f46a8  dsubu      $v0, $t2, $t1
  003f46ac  nor        $v1, $zero, $t2
  003f46b0  and        $v0, $v0, $v1
  003f46b4  and        $v0, $v0, $a0
  003f46b8  bne        $v0, $zero, .L003
  003f46bc  daddu      $a2, $a3, $zero                         # delay slot
.L002:
  003f46c0  sd         $t2, 0x0($a2)
  003f46c4  addiu      $a1, $a1, 0x8
  003f46c8  ld         $t2, 0x0($a1)
  003f46cc  nor        $v0, $zero, $t2
  003f46d0  dsubu      $v1, $t2, $t1
  003f46d4  and        $v1, $v1, $v0
  003f46d8  and        $v1, $v1, $a0
  003f46dc  beq        $v1, $zero, .L002
  003f46e0  addiu      $a2, $a2, 0x8                           # delay slot
.L003:
  003f46e4  daddu      $v1, $a2, $zero
.L004:
  003f46e8  lbu        $v0, 0x0($a1)
  003f46ec  addiu      $a1, $a1, 0x1
  003f46f0  sb         $v0, 0x0($v1)
  003f46f4  sll        $v0, $v0, 24
  003f46f8  addiu      $v1, $v1, 0x1
  003f46fc  bne        $v0, $zero, .L004
  003f4700  nop                                                # delay slot
  003f4704  jr         $ra
  003f4708  daddu      $v0, $a3, $zero                         # delay slot
/* end of func_003F45F8 */
