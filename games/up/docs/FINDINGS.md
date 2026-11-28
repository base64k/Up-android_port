# Up: findings

What the binary revealed, as it is learned. Everything here was found from the
player's own disc image with the engine's tools; nothing of the game is in the
repository.

## The disc

| | |
|---|---|
| Title | Disney/Pixar Up (PS2) |
| Region | USA |
| Disc id | SLUS-21864 → the program is `SLUS_218.64` |
| The program's ELF | taken from the disc with `isotool.py extract` |

`game.json` names the program; `scripts/build_apk.sh` compares it with the
disc's `SYSTEM.CNF` on every build, so a wrong image is caught in seconds
instead of hours.

## The program (what the analysis says)

Not yet run on this game - the first CI run fills this in:

- the compiler (the ELF's `.comment` section) and the SDK version,
- the middleware (`RCS $Id:` strings, the SDK's module names),
- the VU regions (microcode in the image: `vudis.py --stats`),
- the size of the program and the number of functions (`analyze.py`),
- how much of it decompiles and verifies (`derive.py`, `lift.py`,
  `progress.py`).

## The subsystems the port has to understand

Each entry: what it is, the addresses, and how it was found. The game's own
code is the point - override as little as possible.

- **Boot** - what the program does before the first frame: the kernel's
  services it asks for, the IOP's modules it loads, the disc it reads.
- **The menus** - how they are drawn and what the port has to hook for the
  on-screen controls.
- **Streaming** - how the game's data is read (the disc's files it opens).
- **Audio** - the SPU2's use, the ADPCM/IRX it needs.
- **VU** - the microcode, if the game has any (VU1 for the geometry).

## The port's own findings

- The engine was built for Burnout 3 (RenderWare); Up's middleware is
  different, so what the host already provides and what it does not is the
  first thing the `smoke` run's report answers.

## Audio: the sound driver and call 6 (under investigation)

Everything below about call 6 comes from the previous session's runs against
the player's disc. It has **not** been re-verified in this checkout — no disc
image is present locally (`.gitignore` keeps `disc/` out; CI fetches it from
the player's Drive file). Treat it as a hypothesis, not a confirmed fact.

**What was observed**

- RPC call 6 writes the decoder's output on top of call 83's input: the bytes
  `CF`, then `00`, at EE address `0x01F7FCF3`, between DMA streams to that same
  EE range. Confirmed across runs.
- The decoder (`UnPack_Z`) reproduces all 83 calls exactly from the disc
  image's data, so the disc data itself is not the problem.

**What is still unknown**

- The IOP poll flag at `0x1AEF8`: it is written by the host stand-in
  (`patch_iop.py`), not by the sound module itself (ZNASND). The program
  counter cited for the write, `pc 0x100C0`, points at data, not code — so the
  real driver handshake has not been found, and answers to RPCs sent to server
  `0x01000002` are guesses.
- Which RPC, or which EE-side write, should set flag `0x1AEF8`, and what the
  driver expects from the EE.

**Working hypothesis (unproven)**

The sound driver never gets the right answer from the EE, so the EE picks the
wrong buffers for the stream — a likely explanation for the crash around the
25-second mark, before the menu appears.

---

## What the engine actually provides for sound (verified from engine source)

The `engine/` submodule is now initialized (commit `65c46e975a0c7f2c2eef67d283c97fe856a8040e`). Reading
`engine/host/src/` shows the host's sound/IOP implementation:

**libsd (iop_libs.cpp)** — all 32 exports implemented:
- `sceSdInit`, `sceSdQuit`, `sceSdSetParam`, `sceSdGetParam`
- `sceSdSetSwitch`, `sceSdGetSwitch`, `sceSdSetAddr`, `sceSdGetAddr`
- `sceSdSetCoreAttr`, `sceSdGetCoreAttr`, `sceSdNote2Pitch`, `sceSdPitch2Note`
- `sceSdProcBatch`, `sceSdProcBatchEx` (batch voice parameter ops)
- `sceSdVoiceTrans`, `sceSdBlockTrans`, `sceSdVoiceTransStatus`, `sceSdBlockTransStatus`
- `sceSdSetTransCallback`, `sceSdSetIrqCallback`, `sceSdSetTransIntrHandler`, `sceSdSetSpu2IntrHandler`
- `sceSdSetEffectAttr`, `sceSdGetEffectAttr`, `sceSdClearEffectWorkArea`, `sceSdStopTrans`
- Plus argument getters for trans/SPU2 interrupt handlers

**SPU2 (spu2.cpp / spu2.h)** — full sound processor:
- 2 cores, 48 kHz mixing, ADPCM voice decoding with Gaussian interpolation
- ADSR envelopes, reverb unit (PS1 SPU algorithm), dry/wet mixes per core
- Sound-data input ring buffers (PCM streaming, 0x200 bytes left + 0x200 right per tick)
- SPU RAM (2 MiB), voice transfer (VoiceTrans/BlockTrans into SPU RAM)
- IRQA interrupts on transfer completion and half-buffer boundaries
- `EnableSound()` hooks the host's audio output callback

**IOP module execution (iop_vm.cpp / loadfile.cpp)**:
- `RunModule("NAME.IRX")` — port names IOP modules to run from the disc (iop_vm.cpp:472); modules are loaded from the disc image
- `LoadModule()` — loads ELF IRX images, applies R3000 relocations, patches import stubs to host HLE functions (iop_vm.cpp:483)
- Modules run as IOP threads under the IOP kernel scheduler; SIF commands go to/from the EE
- `--iop-trace` logs every IOP library call a module makes
- `RunsModule(path)` — checks if a module is named to run

**SIF/RPC (iop.cpp)**:
- Server 0x80000006 = loadfile (loads modules from disc or IOP memory)
- Server 0x80000009 = RPC bind, 0x8000000A = RPC call (answered with RPC-end packets)
- Servers with no host implementation still bind; calls are noted so the report says which IOP services the game needs

**Audio pipeline status** — verified from engine source, the pipeline IS wired:
- `EnableSound()` is called from `host.cpp` when `--audio` or `--audio-wav` is given, wiring `Spu2::SetOutput` to `AudioFrames()` (iop_libs.cpp)
- `SoundInterrupts()` is called in the IOP interpreter's scheduler loop (iop_vm.cpp:396) — handles transfer-complete and half-buffer interrupts, advances SPU2 playback
- `SdBlockTrans()` sets up streaming buffers at 48 kHz / 16-bit stereo (192,000 bytes/sec)
- `SdVoiceTrans()` writes voice data into SPU RAM
- So: when `--audio` is given, the SPU2 decodes, mixes, and plays output through `AudioFrames()`

**What the port still needs for sound**: the sound DRIVER handshake between EE and IOP. The IOP flag `0x1AEF8` must be set by the right RPC or EE-side write, and the sound modules (LIBSD, SDRDRV, CRI_ADXI) must run on the IOP via `RunModule()`.

---

## Reference ports and how they handled sound

**DQ8-Recompiled** (Sinan-Karakaya/DQ8-Recompiled, PR #1) — most relevant:
- Runs IOP modules LIBSD, SDRDRV, MODHSYN, MODMIDI, MODMSIN, SKSOUND, SKHSYNTH, SKMIDI, SKMSIN, PCMPLAY **unmodified** on an emulated IOP
- The game's own libsdr and Sound Kit code talks to them over SIF exactly as on console
- `sceSdRemoteInit`, `sceSdRemote`, `sceSdTransToIOP` are runtime placeholders (game's own versions run)
- `sceSifCallRpc` is bound to the runtime (not stubbed) — the game's copy needs the real SIF setup
- `--mute` keeps drivers running without playing

**Shinobi-PS2-Recomp** (TheRealAfsan/Shinobi-PS2-Recomp, issue #2):
- CRI ADX/Sofdec streams PCM from EE to CRI_ADXI.IRX via "RNA" output over SIF ring buffers
- Fix: HLE the RNA output on the host side instead of sending PCM to the IOP; play on host with exact sample accounting
- CRI_ADXI loses track of right-channel chunks under emulation; right-channel ranges never returned

**KOF XI recomp** (Tel-BR/kof-xi-recomp, issue #9):
- Brings PS2Recomp-Fixer's SPU2 into ps2xIOP, clocked by emulated IOP time
- Sound from original LIBSD, SDRDRV, CRI_ADXI modules through PCSX2-matched SPU2

**Known PS2 sound IRX modules** (retroreversing.com):
- `libsd.irx` — Sound Library (627 exports)
- `sdrdrv.irx` — Sound Driver (476 exports)
- `cri_adxi.irx` — CRI ADX streamed audio (73 exports)

---

## Disc download blocker (this checkout)

The player's disc file is on Google Drive:
`Disney-Pixar Up (USA) (EnFr).zip`, ID `1LIzZFzNoXUteK5fnJLT1P6vGoIxg1fDA`, ~916 MB.

All download methods fail in this sandbox with SSL/TLS connection resets:
- `gdown` (via `scripts/fetch_disc.sh`): `SSLZeroReturnError`
- `curl` to `drive.google.com` and `drive.usercontent.google.com`: `SSL_ERROR_SYSCALL`
- `wget`: `GnuTLS: The TLS connection was non-properly terminated`
- Python `urllib` with unverified SSL: same EOF error
- Google Drive connector `download_file`: file is 916 MB, exceeds the 100 MiB workspace limit

The `disc/up.iso` file exists but is 0 bytes. **CI (GitHub Actions runners) can fetch it** — `.github/workflows/android-apk.yml` uses `scripts/fetch_disc.sh` with `UP_DRIVE_FILE_ID=1LIzZFzNoXUteK5fnJLT1P6vGoIxg1fDA` and caches the result. The blocker is only in this sandbox's network. The disc must be obtained before the `analyze.py → signatures.py → lift.py` pipeline can run against `SLUS_218.64`.

---

## Next steps (blocked on the disc)

1. **Get the disc image** — the SSL/TLS blocker is only in this sandbox; CI runners can fetch it. Options:
   - Run CI (`.github/workflows/android-apk.yml`) which fetches via `scripts/fetch_disc.sh` and caches `disc/up.iso`
   - Resolve the sandbox's TLS block to `drive.google.com` / `drive.usercontent.google.com`
   - Google Drive connector: file is 916 MB, exceeds the 100 MiB workspace limit
2. **Extract the program**: `python engine/tools/isotool.py extract disc/up.iso SLUS_218.64 -o games/up/extracted/`
3. **Analyze**: `python engine/tools/analyze.py --game games/up`
4. **Name functions**: `python engine/tools/signatures.py --game games/up name`
5. **Lift to C++**: `python engine/tools/lift.py --game games/up --structure --emit --csv`
6. **Build and run**: `python engine/tools/port.py --game games/up` — the smoke test's report says where the game stops; that report is the bring-up measure.
7. **Find the sound handshake**: with the disc, re-verify call 6 / `0x1AEF8` against `SLUS_218.64`; check which RPC or EE-side write must set the flag, using `--iop-trace` to see which IOP library calls the sound modules make.
8. **Record verified entries** in `games/up/config/functions.csv`.

**Reference approach for sound**: follow the DQ8 port — name the game's IOP sound modules (likely LIBSD, SDRDRV, CRI_ADXI) to run via `ps2host::iop::RunModule()`, keep `sceSifCallRpc` bound to the runtime (not stubbed), and let the game's own sound code talk to them over SIF. The host's libsd and SPU2 implementations are already in place.

---

## Engine API verified from source (for port code in `games/up/port/overrides.cpp`)

**Override mechanism** (`host.h`, `host.cpp`):
- `ps2host::Override(u32 address, GuestFunction function, const char* name)` — replaces a guest function at an address; the original is callable as `F_<ADDRESS>(c)` via `GuestCall`
- `ps2host::RegisterGameOverrides()` — called from `engine/host/src/main.cpp` at start; implemented in the game's `port/overrides.cpp`
- `ps2host::ApplySdkOverrides()` — applies host implementations of SDK library routines by name (from the game's dispatch table)
- `ps2host::ApplySdkPatterns()` — finds SDK routines by instruction hash in the executable's bytes

**Sound API** (`run.h`, `audio.cpp`):
- `ps2host::OpenAudio()` / `CloseAudio()` — opens/closes the sound device
- `ps2host::AudioFrames(const short* frames, unsigned count)` — the SPU2 calls this with mixed 16-bit stereo at 48 kHz
- `ps2host::OpenWavDump(path)` / `AudioActive()` — WAV recording and activity check
- `ps2host::AudioVolume()` / `SetAudioVolume(percent)` — master volume

**IOP API** (`run.h`, `iop.cpp`, `iop_vm.h`):
- `ps2host::iop::RunModule(file_name)` — names an IOP module to run from the disc
- `ps2host::iop::RunsModule(path)` — checks if a module is named to run
- `ps2host::RegisterRpcServer(u32 server_id, RpcServer)` — registers a host RPC server
- `ps2host::InstallIopServers()` / `InstallLoadFile()` / `InstallFileIo()` / `InstallDbc()` / `InstallMcserv()` — installs IOP services

**Device/run API** (`run.h`):
- `ps2host::SetPath2Filter(filter)` — intercepts VIF1 DIRECT/PATH2 blocks before the GS (for 2D/HUD widescreen)
- `ps2host::AddIdleLoop(address)` — names a wait loop so virtual time skips to the next event
- `ps2host::SetFastForward(factor)` / `SetBlankRate(hz)` — real-time speed control
- `ps2host::SetFastDisc(bool)` / `SetFastLoadingDefault(bool)` — disc read timing
- `ps2host::SetVuFastDefault(bool)` / `SetFramePacingDefault(bool)` — VU1 and frame pacing defaults
- `ps2host::SetPadHook(hook)` / `SetControllerFilter(filter)` — input hooks
- `ps2host::SetKeyboardMapper(mapper)` — keyboard to pad mapping
- `ps2host::AddPortOptions(options)` — PC settings panel pages
- `ps2host::SetCaptureHook(hook)` — F12 capture hook

---

## Port code structure (what goes in `games/up/port/`)

| File | Purpose |
|------|---------|
| `CMakeLists.txt` | Build: links `engine/host`, lists `overrides.cpp`, generated sources |
| `overrides.cpp` | `RegisterGameOverrides()` — host implementations of game functions by address |
| `port/runs/<name>.args` | Scripted test runs (`--virtual-time`, `--press`, etc.) |
| `port/runs/README.md` | Documents each run: what it reaches, at which frames |
| `port/icon.ico` | The port's icon (original art, never from the disc) |
| `port/release/README.txt` | Player-facing README |
| `config/functions.csv` | Function name table (address, name, status, source, notes) |
| `docs/FINDINGS.md` | What the binary revealed (this file) |

---

## What the host already provides vs. what Up needs

**Already provided by `engine/host`:**
- EE kernel services (threads, semaphores, alarms, timers, SIF, syscalls)
- IOP: libsd (all 32 exports), SPU2 (full sound processor), module loading, SIF/RPC
- GS: software renderer, GPU renderer (Vulkan), VIF1/VU1
- Devices: CD/DVD, file I/O, memory card, pads, IPU (MPEG movies)
- Audio output pipeline fully wired: `EnableSound()` → `AudioFrames()` via SPU2 output callback; `SoundInterrupts()` called in IOP scheduler; `SdBlockTrans()` sets up 48 kHz streaming
- SDK library routines by name (GsSyncPath, KernelStore, TtyWrite, etc.)
- PC features: window, settings panel, texture pack, mouse, controller, rumble

**What Up's port must add (in `port/overrides.cpp`):**
- Function overrides discovered from the analysis (addresses from `functions.csv`)
- IOP sound modules to run (`RunModule("LIBSD.IRX")`, `RunModule("SDRDRV.IRX")`, etc.)
- Sound handshake: which RPC or EE-side write sets IOP flag `0x1AEF8`
- Any hardware-specific behavior the host doesn't model

---

## PCSX2 Wiki info on Up (SLUS-21864)

- Developer: Asobo Studio, Publisher: THQ, Released: 2026-05-26
- Status: Playable on PCSX2 Windows and Linux
- Known issue: TLB Miss crash when aiming the mirror (NTSC version only)
- Fixed issue: Bad text (garbled subtitles) — fixed in PCSX2 v1.7.5880
- Widescreen supported natively


## Where the port stands (latest)

**A real phone run** (Mali-G57, Vulkan 1.3, arm64, uploaded log `up.log`):
the game drew about 10,700 frames through the GPU renderer (`[gpu] frame`), with
`0 of 0 GPU pipelines made` (no `port/gpu_pipelines.h` then - now generated from
the run's keys, 8 of them). The ZNASND RPC server answered guessed replies: the
game polled procedure 772 20,929 times with the same request. The run ended with
`vkAcquireNextImageKHR failed (-1000000000)` (VK_ERROR_SURFACE_LOST_KHR) four
times: the engine's swapchain path gives up on that error (`vulkan_display.cpp`,
`Check` after the acquire), so a surface lost in the middle of a play ends the
display. That is the engine's to handle (recreate the surface), not the game's.
Patch `0015-surface-lost-made-again.patch` does that (`gpu/src/vulkan_display.cpp`): the
surface and the swapchain are made again from the window, and the lost picture is
not shown instead of ending the display.

**Device-specific data is not portable.** `gpu_pipeline_cache.bin` is the
driver's own pipeline cache (Mali's binary; the engine saves it as
`gpu_pipeline_cache.bin` and the driver ignores another GPU's). The upload
(`gpu_pipeline_cache.bin.txt`, 400,377 bytes) is the raw binary under a `.txt` name:
its bytes are not UTF-8, and its Vulkan header reads header size 0x20, version 1, vendor
0x13B5 (ARM), device 0x90910010 (the Mali-G57). The driver checks that header and
ignores a cache that is not its own. It is git-ignored (`*.bin`) and not committed:
the engine writes the file on the device itself. Adreno, Mali and Helio builds each
make their own.

**The sound driver is the game's own code now.** `ZNASND.IRX` used to be
"its services are the host's": the host answered its RPC with guesses, and the
driver never ran. Now `RunModule("ZNASND.IRX")` runs it in the IOP interpreter.
Two engine gaps stood in the way, kept as patches in `games/up/engine-patches/`
(applied to the engine checkout by CI; the submodule's commit is unchanged):

1. `0001-iop-hardware-registers.patch`: IOP hardware registers (0x1F80xxxx, seen
   as 0xBF80xxxx) are kept as written, not a stop. (`0xBF801404` was the stop.)
2. `0002-timrman-overflow-and-setters.patch`: `timrman#21` SetOverflowHandler,
   and the timer setters #7, #9, #10, #11.
3. `0003-strtok-cdstatus-cdbreak.patch`: `sysclib#35` strtok, `cdvdman#28`
   sceCdStatus, `cdvdman#39` sceCdBreak.
4. `0004-timer-clock-sifcmd-ioman-placeholders.patch`: `GetTimerCounter` counts
   with the clock while the timer runs (before it returned 0 every time, so
   the thread polling it never left its wait); `sceSifBindRpc` and
   `sceSifCallRpc` (sifcmd #15, #16) answer 0 ("not bound", "not called"); the
   file manager's `ioman` opens fail with -1. The placeholders are there so
   the trace shows what the module asks for; they are not the real calls.

5. `0005-sifrpc-client-bind-and-call.patch`: the IOP's SIF RPC client as
   ps2sdk's IOP library has it (`iop/system/sifcmd/src/sifrpc.c`, below):
   `sceSifBindRpc` sets the client's `server` (offset 36) to the module's
   server, or leaves it NULL when no module serves the id, and returns 0 in
   both cases. `sceSifCallRpc` sends the arguments to the server's queue, waits
   for the answer when blocking, runs the end function, then returns.
6. `0006-ioman-disc-files.patch`: `ioman_open`, `iomanX_read`, `iomanX_lseek`,
   `iomanX_close` read the disc's files (`GuestDisc().ReadFile`); a file the
   disc does not have is -2 (ENOENT), and the report names each file opened.

The patches apply in this order (0001 to 0006) on the engine checkout; CI
checks it (`ci-results/engine-build.txt`).

The trace of the run (CI, `--iop-trace`, `ci-results/iop-trace.txt`) shows the
driver's path: libsd init (`sceSdInit`, `sceSdSetCoreAttr`, `sceSdSetParam`),
its own thread registering RPC server `0x01000001` (`sceSifRegisterRpc`,
`sceSifRpcLoop`), `AllocHardTimer`, `SetupHardTimer`, `SetOverflowHandler`.

**Latest CI run, 45428902827** (patches 0001-0004, engine `65c46e9`): it no
longer stops at an unimplemented import (`0 'is not implemented'` lines in the
report; 633 distinct functions). It stops in a loop instead: the driver's
thread runs `sceSifBindRpc(client, 0x01000002, 0)` again and again, each time
answered 0 and printing `[IOP] Check that ZnaSnd.irx have been loaded...`
(about 4,600 times in the trace; the trace is capped at 20,000 lines). IOP time
is 90%, and the run ends with every thread waiting (`600 frames of interrupts
woke none`). The EE binds the IOP servers `0x80000001`, `0x80000592`,
`0x80000593`, `0x80000003` and `0x80000006`; nothing binds or registers
`0x01000002`. So the blocker is that server: the sound driver waits for a
partner that never appears, and the placeholder 0 for `sceSifBindRpc` keeps it
waiting. Which side serves `0x01000002` (the EE, or a second module the EE
loads) is not known yet. The real `sceSifBindRpc` return convention and the
client struct's layout are not confirmed; they need the driver's disassembly
(from the disc, which is only available in CI).

**The SIF RPC client, as ps2sdk's IOP library does it (proven reference).**
`sceSifBindRpc` does not fail when no server has the id. It returns 0 and
leaves `cd->server` NULL; the caller's loop waits for it (`Check that ZnaSnd.irx
have been loaded...` is that loop). A bound client's `cd->server` is what
`sceSifCallRpc` sends to. The end function runs on the reply, whether the call
blocks or not. The `SifRpcClientData_t` layout: header 16 bytes (pkt_addr,
rpc_id, sema_id, mode), then command (16), buf (20), cbuf (24), end_function
(28), end_param (32), server (36). The source is ps2sdk's
`iop/system/sifcmd/src/sifrpc.c` and `common/include/sifrpc-common.h`.
So the trace's loop means: no module registers server `0x01000002` in this
port. Who should (the EE, a second module, or the disc's own file) is what
`ci-results/disc-modules.txt` answers: a CI step scans the disc's `MODULES`
folder and the program for the `ZnaSnd` string and the server ids
(`scripts/disc_modules.py`).

**What the disc's own files say (CI, `ci-results/disc-modules.txt`, run 45441846187).**
The EE loads exactly six modules: `SIO2MAN`, `PADMAN`, `MCMAN`, `MCSERV`,
`LIBSD`, `ZNASND` (the program's strings). `SDRDRV.IRX` is on the disc but the
EE never loads it. (The first reading of this scan counted the bytes
`02 00 00 01` wherever they occur: LIBSD, SDRDRV, the EE program. Those hits
are not literal words: every one is at an odd or unaligned offset, so they
are bytes across instruction boundaries. No aligned `0x01000002` word exists
in any disc module or in the EE program.) `ZNASND.IRX` itself has the strings "ZnaSnd.irx Loaded
Successfully...", "Error while init SifRpc" and "Check that ZnaSnd.irx have
been loaded...": that is its own load check. The sound driver's partner
server is therefore most likely the real `LIBSD.IRX`'s. In the port, LIBSD is
the host's (`RunModule` is not called for it), so no module serves 0x01000002.
ps2sdk's `sdrdrv` registers `0x80000701` (a later SDK); the game's is older, so
its ids are not ps2sdk's.

Run 45446669116 (`RunModule("LIBSD.IRX")`, patches 0001-0006): LIBSD now runs
as code (`running cdrom0:\\MODULES\\LIBSD.IRX;1 ... entry 0x000100B0`), and
ZNASND prints "ZnaSnd.irx Loaded Successfully...". But LIBSD's start only
registers its library and returns: it makes no `sceSifRegisterRpc`. The bind
for `0x01000002` still returns NULL, every time (the trace's loop). So server
`0x01000002` is not LIBSD's. Its only other IOP candidate is `SDRDRV`, which
the EE never loads.

The next candidate is the EE: an IOP client can bind a server the EE
registered (SIF is two-way; ps2sdk's EE `sifrpc.c` has `_request_bind`). The
EE program builds `0x01000002` in its code, and `disc-modules.txt` now counts
the `lui`+`ori` pairs that do that (in the EE program and in each module),
which says whether the EE registers it. Until the EE's registration is
served to the IOP, the bind waits: a host server would have to guess the
procedures, which is what the port's earlier guessed replies showed does not
move the game.

**Runs 45450438599, 45456522278, 45462705479 (the same code, plus the scan).**
- 45450438599 (`RunModule("LIBSD.IRX")`, patches 0001-0006): smoke stopped
  on "every thread is waiting", 633 distinct functions, 58.8 s, IOP 94.2%.
  LIBSD runs (`entry 0x000100B0`), ZNASND prints "Loaded Successfully", and
  the `sceSifBindRpc(…, 0x01000002)` loop continues.
- 45456522278 (same, with the module names in the scan): same stop, 61.4 s.
- 45462705479 (same code, the scan's code listing): same stop, 633 distinct,
  47.4 s, IOP 93.0%. The summary is `ci-results/smoke-summary.txt`.

**Who registers which server (from the trace, `ci-results/iop-trace.txt`).**
The only `sceSifRegisterRpc` in the run is
`sifcmd#17 sceSifRegisterRpc(…, 0x01000001, …) -> 0 from 0x00015EB8`, and the
bind is `sceSifBindRpc(…, 0x01000002, …) from 0x00016128`. Both addresses are
inside ZNASND (its `lui`+`ori` for `0x01000001` is at file offset 0x5A8 and
for `0x01000002` at 0x820; the call sites differ by the same amount). So
ZNASND registers its own server, `0x01000001`, and binds to `0x01000002`,
which another side must register.

**The EE registers server `0x01000002` (run 45467618323, `disc-modules.txt`).**
No module on the disc holds the id as data. The EE program does build it, in
code, at program address `0x24D5BC`:
`lui v0,0x0100; ori a1,v0,2; jal 0x003DFC38` with `a0`=sp+48 (the server
data), `a2`=0x0044D3A0 (a function), `a3`=0x007A8400 (a buffer), `t0`=`t1`=0,
and the queue on the stack. That is the seven arguments of
`sceSifRegisterRpc(sd, sid, func, buff, cfunc, cbuff, qd)`. So the EE serves
`0x01000002`, and ZNASND's bind for it is a client bind to the EE. The other
`lui 0x0100` hits in the EE program (0xE7634, 0xE7B48, 0xEE9A4, 0x261A6C) use
other constants (`0x101`, `0x6000_0002`) and are not this id.
The EE also binds `0x01000001` (ZNASND's own server) at `0x24CEE4`:
`lui v0,0x0100; ori a1,v0,1; jal 0x003DF798`, `a0`=0x007A7BC0, `a2`=0, which is
`sceSifBindRpc(sd, 0x01000001, 0)`.

**Why the port never gets there.** The EE binds only the `0x8000xxxx` IOP
servers in the port (`[host] SIF: bound to IOP server …` lines of
`port-report.txt`). It never binds `0x01000001`, so it never reaches `0x24CEE4`
or `0x24D5BC`. Its thread 1 waits in `sceSifCallRpc` → `WaitSema` (the
smoke summary), a call that is not to an unimplemented server (no `SIF: call
… no host implementation` line). So the stall is in an earlier EE call. The
IOP side's loop (`sceSifBindRpc(0x01000002)`) is the ZNASND's poll for the EE
server, which the EE would register only after that call returns.

**The EE's server table is not the IOP's.** The port's IOP bind
(`SifBindRpcClient` in `iop_libs.cpp`, patch 0005) looks only in the IOP's
`rpc_servers` and the host's table. An EE-registered server (`sceSifRegisterRpc`
on the EE) is in EE memory and never reaches it, so the IOP's bind returns 0
even once the EE has registered `0x01000002`. Patch 0005 needs a second look-up
into the EE's registrations (the EE's `sceSifRegisterRpc` call, `0x003DFC38`
in this program) when the EE is up; without it the EE registration does not
serve the IOP.

**Earlier reading of the same scan (corrected).** The first reading counted the
bytes `02 00 00 01` wherever they occur (LIBSD, SDRDRV, the EE program). Every
such hit is at an unaligned offset, so they are bytes across instruction
boundaries, not literals. No aligned `0x01000002` word exists in any disc module
or in the EE program.

**Patches 0007-0010 and the EE's load (runs 45530173257, 45534355291, 45537324174, 45541066304, 45543826201, 45547139945).**
- 0007 (log): every distinct EE `sceSifCallRpc` with its server, procedure, and
  EE callers. The EE's calls in the port are: `0x80000001` (SIO2MAN-era
  server), `0x80000592` CdInit, `0x80000593`, `0x80000006` LoadFile (procedure
  0, 512 bytes: the module's path). The last one is the load of ZNASND. The
  EE never calls `0x01000001`, so `0x24CEE4` and `0x24D5BC` are not reached.
- 0008 (fix, the one real bug found): a bind for a server that is not there
  returned 0 at once, so ZNASND's loop (about 4,600 binds) never let the IOP
  run return to the load. Now the bind waits 1 ms (as the library's bind does).
  Smoke: 60 s and IOP 94% before; 12.7 s and IOP 9-11% after. The stop is now
  the same "every thread is waiting".
- 0009 (log): the SIF replies queued and delivered. LIBSD's load returns
  (`start returned 0`, `loaded`) and its reply reaches the EE. ZNASND's start
  does not return: after its `[IOP] ZnaSnd.irx Loaded Successfully...` the
  loader thread makes no more calls, so no "start returned" line appears.
- 0010 (log): would print the loader's pc after 0.2 s of waiting in
  `LoadModule`, but it does not fire: the spin is not in the loop that checks
  the time. So the place where ZNASND's start spins is still unknown.

**The EE's server table.** The IOP's bind (patch 0005) looks in the IOP's
servers only. Even once the EE has registered `0x01000002`, the IOP's bind
returns 0 unless the port reads the EE's registrations. That is still open.

**Runs 45554406369 and 45557930345 (patch 0011: a probe in the IOP's run loop).**
The probe prints the thread states and the loader's code 0.2 s (then 20 ms)
after a module's start begins. It never printed, in either run. Every run now
stops at exactly 12.7 s, which looks like the smoke's "600 frames of
interrupts woke none" watchdog (about 47 frames a second), not like the
loader's own time. So the watchdog may stop the run before the loader's start
has run long enough to show. Also, `Execute` runs a thread with its interrupts
off past its quantum, up to 1,000,000 instructions per call (`kInterruptsOffMax`),
so a spin with interrupts off returns to `Run` only every 1,000,000 instructions.

Next: stamp the wall clock on "running ZNASND" and on the stop, to see how long
the start had before the stop; if it is short, make the watchdog count only
the EE's frames that really advance.

**Next steps (updated):**
1. Find where ZNASND's start spins after "Loaded Successfully": log the
   loader's pc from inside `Run` (for example at each slice, after 0.2 s), and
   decode the words around it (the code is in the loaded image; the dump is
   what 0010 was meant to print).
2. Once the start returns, check that the EE's call to `0x80000006` gets its
   answer, and then whether the EE reaches `0x24CEE4` (bind `0x01000001`) and
   `0x24D5BC` (register `0x01000002`).
3. Make the IOP's bind see the EE's registrations for `0x01000002`.

**Open questions for the port (not yet in the code):**
- The menu has not been seen on any run. What the EE waits for is the sound
  driver's status (procedure 772 polling); whether the module now answers it
  is what the next CI run shows.
- The engine's `AddIdleLoop` overrides (five wait loops) are still in place;
  they skip virtual time in waits the real driver should now resolve. Remove
  them if the menu needs the real waits.
- FPS counter: on by default now (`fps_counter`, F1 toggles, the choice kept
  in the settings file). `fps_detail` in the engine adds CPU.

**Next steps:**
1. Find the EE call the EE waits on before `0x24CEE4`: log each EE
   `sceSifCallRpc` with its server id, procedure, and the EE's caller (the host
   note for the kRpcCall case in `iop.cpp` logs only unimplemented servers).
   That call's reply is what stops the EE and so the registration.
2. Make the IOP's `sceSifBindRpc` see the EE's registered servers (the EE's
   `sceSifRegisterRpc` for `0x01000002` in the program's `0x003DFC38`), so the
   IOP's bind returns the server once the EE has registered it.
3. Patches 0005 and 0006 are in place; their effect is in the trace's `ioman`
   lines and the bind loop. The trace is capped at 20,000 lines.
4. Do not publish the APK until the menu appears (the user's condition).

**Runs 45569467257, 45573559671 and 45581017566 (patch 0013; the full host trace).**

*A correction to the notes above.* `ci-results/port-report.txt` keeps only the
first 4,500 and the last 4,500 lines of the report ("... lines left out ..."),
so the middle of a run is missing from it. The conclusions "ZNASND's start never
returns" and "no `LOADER` / `every thread waits` line" were drawn from that cut
file and are wrong. `ci-results/host-trace.txt` (new in 45581017566) holds every
`[host]` line; it is short (126 lines), so it is not cut. `iop-trace.txt` is the
`[iop]` lines, capped at 20,000.

*Patch 0013 had two faults, both fixed.* The first diff held the whole 0001–0012
chain (`git diff` compares with the pristine engine), so it did not apply on top
of 0012. The probe patch 0011 also clears `g_probe_thread` before `Run()`, so the
dump printed nothing. 0013 keeps its own `g_loader_thread`.

*The run, from host-trace.txt (45581017566):*
1. LIBSD: `start returned 0`, `loaded` at 1060347 ms.
2. ZNASND: `start returned 0`, `loaded` at 1060359 ms. It registers the IOP server
   `0x01000001` (its thread 3 runs `sceSifRpcLoop`, trace line 5638).
3. EE: `SIF: bound to IOP server 0x01000001`, then `SIF: EE call, server 0x00000000
   (at 0x0002E1EC), procedure 513, 32 bytes sent`, from `0x0044CEE0`.
4. IOP: `RPC 0x01000001 procedure 513 ... served by a module`. The handler (IOP
   thread 3) calls `sceSifBindRpc(…, 0x01000002, mode 0)`, which returns "waits"
   and is retried about 1,050 times (`[IOP] Check that ZnaSnd.irx have been
   loaded...` between the tries). No reply to 513 is ever delivered.
5. EE: `every thread waits` at 1061430 ms, then after 601 frames it gives up.

*What blocks it (working hypothesis, not verified):* a deadlock. The handler for
513 waits for the EE to register the server `0x01000002`. The EE is waiting for
the reply to 513, so the registration (`sceSifRegisterRpc`, `0x24D5BC` in the
program, `9120ca7`) has not run. Either it runs after the 513 call in the
program's own order (then the handler must not block there, and the question is
why the port's bind waits), or it runs in an EE thread that never runs in the
engine (EE thread 2, entry `0x003DD2A0`, ran once, waits on a semaphore).

*Added to the workflow (not yet run):* `ci-results/ee-code.txt`, the EE functions
at `0x24CEE4` (the bind of 0x01000001), `0x24D5BC` (the registration of
0x01000002), `0x44CEE0` (the caller of 513) and `0x3DD2A0` (EE thread 2's entry),
from `engine/tools/disasm.py --game games/up --addr …`.

**Next steps:**
1. Read `ci-results/ee-code.txt`: the order of the bind, the 513 call, and the
   registration; and whether `0x24D5BC` is reached from the main thread before
   the 513 call.
2. If it is reached only after the 513 reply, the program expects the IOP handler
   not to wait for `0x01000002`: check the `sceSifBindRpc` mode and the port's
   bind behaviour (patch 0008 makes a bind wait 1 ms when no server exists).
3. If it is reached in EE thread 2, log that thread's wait (semaphore id, who
   signals it) with a new log-only patch.

**Runs 45585891104 and 45595639376 (the EE code the run stops at).**
- `ci-results/ee-code.txt`: the caller of the RPC 513 is `func_0044CEE0`. It first
  waits while `func_003DFB60(0x7A7BC0)` is nonzero (sleeping 10 ms each time), then
  sends 32 bytes from `0x7A7C00`. The trace's `0x007A7C00` is that buffer.
- `ci-results/ee-code.txt`: EE thread 2 is `func_003DD2A0`, a worker for a queue of
  one-byte commands. It waits on the semaphore at `[0x7A0000 - 0x53A0]`
  (`0x79AC60`). It is not the thread that registers `0x01000002`.
- **Correction:** the addresses `0x24CEE4` and `0x24D5BC` from `9120ca7` are not
  call sites in this analysis. `0x24CEE4` is a `nop` and `0x24D5BC` is a `daddu`
  (`ci-results/ee-code-24.txt`, lines 1033 and 1501). They were probably wrong, or
  they were return addresses from another run. The EE's `sceSifRegisterRpc` and
  `sceSifBindRpc` calls for `0x01000002` and `0x01000001` must be found by their
  constants (`lui`/`ori` of `0x0100`/`0x0002` and `0x0100`/`0x0001`), not by these
  addresses.

**Next steps (replace the earlier ones):**
1. Find every EE call that loads `0x01000002` or `0x01000001` as an argument
   (a scan of `disasm.py --all` in CI, saved as a grep result), and which of them
   is a `sceSifRegisterRpc` (`jal` to the same target as the other registrations).
2. Check whether that registration is reached before the RPC 513 call.
3. If it comes only after the reply, the bind in the IOP handler must not wait.
   If it is in a thread that does not run, log that thread's wait.

**Runs 45606669485, 45611623898, 45617023584 (the RPC ids in the EE program).**
- `scripts/ee_rpc_ids.py` (new) tracks the constants a function loads (lui, addiu,
  ori) and prints the calls after each load. In `ci-results/ee-rpc-ids.txt`:
  - `func_0044CDC0` at `0x44CDEC` loads `0x01000001`, then `func_003DF798` (the bind).
  - `func_0044D4A0` at `0x44D4CC` loads `0x01000002`, then `func_003DFC38` (the
    registration: `sceSifRegisterRpc(…, 0x01000002, handler 0x44D3A0, …)`) and
    `func_003E0050` (`sceSifRpcLoop`). So `0x44D4A0` is the body of the EE's RPC
    server thread for `0x01000002`.
- `func_0044D4A0` has no direct caller (`ci-results/ee-callers.txt`): it is only
  reachable as a thread's entry. So the thread is created somewhere, and the stop
  report lists only two EE threads (1: the main one, entry `0x200008`; 2: the
  command worker, entry `0x3DD2A0`). The registration thread never ran.
- `func_0044CDC0` (the client's start): `func_003DF000`, then `func_0044D190`, then a
  loop `sceSifBindRpc(0x7A7BC0, 0x01000001, 0)` until the client's `server` field
  (`0x7A7BE4`, offset 36) is set, then `func_003DC820`, then `func_0044CEE0(1, 0x201)`
  (the RPC 513). `func_0044D190` runs before the bind and is the next thing to read:
  it is the likely place of the thread creation for `0x44D4A0`.
- The earlier addresses `0x24CEE4` / `0x24D5BC` are not in use (see above); the
  program's own addresses are `0x44CDEC` (bind) and `0x44D4CC` (registration).

**Disc download:** the Google Drive connector can read the zip's metadata (916,253,681
bytes, MD5 `c2bdf10f…`, the same as before), but it cannot put the file in the sandbox:
`download_file` returns at most 100 MB into the model's context, and the sandbox reaches
only github, npm and pypi. The CI downloads the disc.

**Next steps:**
1. Read `ci-results/ee-funcs/func_0044D190.s`: what it creates, with which entry, and
   whether the creation succeeds (the thread count at the stop says it does not).
2. Find the callers of `func_0044D190` and `func_0044CDC0` (the `ee-callers.txt`
   lists the callers of `0x44CDC0`: `func_002DEC40`, then `func_0032F250`).
3. Check `CreateThread` / `StartThread` in the engine's kernel for the case that
   silently drops the thread (no error in the log).

**Run 45620249406: the registration thread exists, and the bind cannot see it (the cause).**
- The stop report lists three EE threads, not two: `thread 3: sleeping, priority 4,
  entry 0x0044D4A0, ran 1 times`, sleeping in `sceSifRpcLoop` (`func_003E0050`). So
  the EE's server for `0x01000002` is created and registered. (`func_0044D190` creates
  it: `CreateThread` with `{entry 0x44D4A0, stack from func_002DCB70 (AllocSysMemory-like,
  0x2800 bytes), priority 4}`, then `StartThread`. Thread 2 is created the same way.)
- The IOP's `sceSifBindRpc(0x01000002)` (patch 0005, `SifBindRpcClient` in
  `iop_libs.cpp`) looks only in `vm.rpc_servers`, the IOP's own servers. The EE's
  registration is not in any table the IOP side reads. So the bind returns "no server"
  and the handler for RPC 513 waits, forever (patch 0008 only makes it wait 1 ms).
- So the port is missing one path: an IOP bind (and the calls after it) for a server
  that the EE registered. On the real console the EE's SIF library answers the bind
  from its own server table. Options for the engine (not yet chosen):
  (a) on a bind with no IOP server, forward the bind to the EE as a SIF message and let
      the game's own EE sifrpc code answer it (faithful; needs the SIF path IOP→EE);
  (b) override the EE's `sceSifRegisterRpc` (`func_003DFC38`) to record `sid → server`
      in a host table, and let the bind use that table (smaller; the calls after the bind
      must then also reach the EE thread, which needs the same IOP→EE delivery).
- Engine state: the `engine/` submodule was not initialised in this session; it is
  now (`65c46e9`). The patch chain 0001–0013 applies cleanly on it (checked).

**Next steps:**
1. Choose (a) or (b) above. Both need the IOP's call to reach an EE thread, so the
   next patch is the IOP→EE delivery of a call and its reply.
2. Log that delivery first (log-only patch): the IOP's bind and call for `0x01000002`,
   and whether the EE thread 3 wakes.

**Decision: option (a), the EE's own sifrpc answers (patch 0014).** Option (b) would
still need the IOP→EE delivery for calls, so the delivery is built once, for both.

What patch 0014 does (`engine/host/src/iop_vm.cpp`, `iop_libs.cpp`, `iop.cpp`):
- `sceSifBindRpc` with no IOP server for the sid sends the EE a bind packet (0x80000009:
  `sid` at 32, `cd` = the IOP's client at 28), queued like the other SIF replies. A
  blocking bind waits (`Wait::RpcReply`) for the answer.
- The EE's sifrpc (ps2sdk's `_request_bind`, in the game's own code) answers with an
  RPC-end (0x80000008): `cid` 0x80000009 at 32, `sd` 36, `buf` 40, `cbuf` 44. The IOP
  copies `buf`, `cbuf`, `sd` into the client (20, 24, 36). With `sd` NULL (no server for
  the sid yet) the caller waits 1 ms before it asks again, as patch 0008 did.
- `sceSifCallRpc` on such a server sends a call packet (0x8000000A): `rpc_number` 32,
  `send_size` 36, `recvbuf` 40 (the IOP's receive address: the EE DMAs its data there),
  `recv_size` 44, `rmode` 1 (the answer's data arrives with its packet), `sd` 52. The
  arguments are written into the EE server's buffer (`buf` from the bind) first.
- The EE's answer to a call (cid 0x8000000A) runs the end function and wakes the caller.

Layouts: ps2sdk `common/include/sifrpc-common.h` (`SifRpcBindPkt_t`, `SifRpcCallPkt_t`,
`SifRpcRendPkt_t`), the same offsets `iop.cpp` already reads for the EE's requests.

Not verified yet: that the game's EE interrupt handler takes the bind packet (it does
for the replies the engine already sends), and that the EE's registration sets
`active_queue` (ps2sdk: `sceSifSetRpcQueue`). The log lines `[host] IOP: binds RPC…`,
`IOP: the EE's bind answer: server 0x…` and `IOP: RPC procedure … on the EE` show both.

### Where the EE main thread waits (runs 45657847582, 45670428784)

- Bind delivery is confirmed (run 45647073822): the IOP binds `0x01000002` on the
  EE, the EE's answer comes back, and RPC 513 is answered. The port now reaches
  the EE's wait in `0x0047DB38`, which is not the bind any more.
- The wait is on the word `0x007A982C` (`lw $v0,-0x67d4($v1)`, `$v1 = 0x7B0000`).
  The loop is in `func_0047DAE0` (CI `ci-results/ee-flag/func_0047DAE0.s`). The
  loop spins until the flag is nonzero, then sends one RPC-like request through
  `func_003DED88` (sceSifCallRpc wrapper) with server id/handle `-0x67e0` and a
  36-byte packet at `0x7A96F0`. It does up to 32 rounds.
- `func_0047C300` sets the handle to `0xB` and registers the EE command handler
  `func_0047BF98` for SIF command id `0xB` through `func_003DEB88` (sceSifAddCmdHandler:
  table at `0x7A4A28`, 12-byte entries). Then it clears the flag to 0. Only
  `func_0047BF98` writes the flag (it stores the result of `func_0047B8E8`).
  So the EE waits for an IOP command `0xB` before it sends anything.
- Write trace (45657847582 and again 45670428784): the flag is written once, as
  zero, by `0x47C300`. No nonzero write happens.
- IOP side (45670428784, `ci-results/iop-sendcmd.txt`): no `sceSifSendCmd` from
  the IOP at all, and no sifcmd#10/#12/#13 call in the trace. LIBSD and ZNASND do
  not send command `0xB`. SDRDRV is never loaded by the EE (see above).
- Conclusion: the EE blocks on a command from the IOP that no module in the port
  sends. Which IOP module sends `0xB` on the console is not yet known. Candidates to
  check: the IOP side of the sound-driver handshake (LIBSD/SDRDRV), or a
  `sceSifSendCmd` from another IOP module that is not run.
- Open: the result of the `AddIdleLoop(0x0047DB38)` run (45651299149) is unknown
  (the watch timed out; no result was read). The loop at `0x47DB38` is the flag wait
  above, not INTC polling.

- Run 45683487799 (`3a24cdb`, patches 0001-0015): the APK builds (`success`). The PC
  smoke still stops at the time limit in the loop at `0x0047DB38`, with the same guest stack
  (`0x0047DAE0` ... `0x00200008`), 689 functions. Patch 0015 is not reached in the smoke
  (no surface is lost there); its effect is the phone's, and is not yet read from a phone run.

### SDRDRV runs; the EE's sound code now crashes (runs 45745992539, 45748859929)

- **Why SDRDRV never ran**: `RunModule` only names a module; a module starts only when the EE
  loads it with `LoadFile` (`loadfile.cpp`). The EE loads six modules and not SDRDRV, so
  the list entry did nothing. Patch `0016-sdrdrv-starts-with-libsd.patch`: when the EE
  loads LIBSD, the host first starts SDRDRV from the disc (once).
- **SDRDRV's start** (CI): it creates a thread that registers the RPC server `0x80000701` and
  waits in `sceSifRpcLoop`. Its `_start` returns 2 (not 0 or 1; the engine only reports it).
  Patch `0017-sdrdrv-host-imports.patch`: the four imports it takes at start, which the host
  lacked (`loadcore#7`, `sifcmd#24`, `sifcmd#25`, `thbase#22`/`#23`), now answer.
- **Progress**: the smoke test runs 2,083 functions (689 before), past the wait at
  `0x0047DB38`; the EE's game thread runs (`ran 122`), and `0x007A982C` is not written.
- **New stop**: a write at `0x02000000`, outside guest memory, from `func_00426350`
  (`ci-results/ee-code-crash.txt`). It is the sound code: `sb $a1,0xF1($a0)` on an object
  `$a0` taken from its caller `func_0032ED94` (not in the dump: the dump stops at 300 lines
  of `func_0032EAA0`). Once the run it was a read at `0x08C20FB0` (timing varies), then
  deterministically the write.
- The EE's sound calls go to ZNASND (server `0x01000001`, procedures 772 and 1797-1812,
  from `0x0044CEE0` and `0x0044D040`), not to SDRDRV's `0x80000701`, which the EE never calls.
  So the bad object is probably built from a reply of ZNASND's. Next: dump `func_0032ED94`
  and read what the reply carries into that object.

- **The crash is in the main loop's manager update** (`ci-results/ee-code-crash.txt`, run
  45751647187): `func_0032ED40` is `_CoreMainLoop`; it logs "Before ManipulatorMgr->Update()"
  and calls `func_00426350` with the global at `0x795F94` as `$a0`. That object pointer is
  bad (the write goes to `0x795F94 + 0xF1 = 0x02000000`), and it is the same each run now.
- The stores into `0x795F94` were not found by the literal offset search (run 45755111967,
  `ci-results/ee-writers.txt`: no matches for `sw/sd` at 0x5F94/0x5F98/0x5F70). They are
  probably aligned `sq` stores at `0x5F90`, or a store through another base register. Next:
  search `sq` at `0x5F90`/`0x5F80` and the global's other readers, or find who builds the
  ManipulatorMgr (the game's init, near the heap that `SetupHeap` gave it).

### The proven method: a golden trace (what DQ8-Recompiled does)

DQ8-Recompiled checks its port against a golden trace: the log of the real, unmodified
game run in PCSX2 with its own debug log enabled. The log is produced by a pnach that
restores compile-time-stubbed debug call sites (their entries replaced with a jump into the
game's own printf path, whose TTY output PCSX2 shows). `tools/oracle/logdiff.py` then
reports the first divergence between the golden log and the port's log.

For Up this needs three things we do not have yet:

1. **The stubs.** The game's debug printf path is stubbed in the retail code. Our logs have
   no `[tty]` line in any run: the TTY write (`0x3DDB68`, a ring-buffer writer; its caller is
   `0x3DCBB8`) is never called. `0x3F45F8` is not a log routine: it copies a string
   (memcpy/strcpy with a 16-byte loop). So the entries to restore are elsewhere: stubbed
   printf-like functions (a `jr $ra` body) with many call sites whose first argument is a
   string. A CI pass listing those (from `/tmp/ee-asm`) would give the candidates.
2. **A golden trace**, from PCSX2 with the BIOS and the user's disc (SLUS-21864). It cannot
   be made in this sandbox (no BIOS, no PCSX2 run, the disc is on Google Drive).
3. **The comparison**: the port's `[tty]` lines (the same text) against the golden log, first
   divergence first. `logdiff.py`'s categories are DQ8's; Up's would be the same idea.

Until (1) and (2) exist, the crash in `_CoreMainLoop` (the manager pointer at `0x795F94`)
stays unexplained. Its address and value also vary between runs (`0x02000000`,
`0x08C20FB0`, `0xF6FFFF42`), so it depends on timing or on uninitialised memory.

### Correction: the game's own debug output does run (kputs)

The earlier note "no debug output runs" was wrong. The engine turns the EE kernel's `kputs`
(service 0x10) into `[guest]` lines (`engine/host/src/kernel.cpp`), and Up calls it once,
right after the `_CoreMainLoop` startup:

    [guest] Path : (null)

It appears in CI port-report.txt (run 45759204670 and earlier) and in the phone log
`up-2.log`. The string pointer is null when the game prints it, so something it expects
to be set is not, before it calls `0x00231510`. Only one line in a whole run means the
game rarely calls `kputs`; the absence of other lines proves nothing. The `[tty]` ring
buffer (`0x3DDB68`) is a separate path.

### The phone run does not crash where the headless run does

`up-2.log` (Mali-G57) goes on to frame 1100 with the same 562 draws per frame and audio
playing; the stop is `vkQueuePresentKHR failed (-1000000000)`, the surface loss that patch
0015 addresses. The CI smoke run stops in `ManipulatorMgr->Update` instead, at a varying
address. So the crash belongs to the headless run, not to the game on a phone. Next: find
out what differs between the two (timing, the stop condition, or the uninitialised
`Path` value) before chasing the `0x795F94` writer.

### Three checks, done in parallel (after c1cca2d)

**1. The EE debug stubs.** The game's debug output is `Deci2Call` (syscall 0x7C) with
`$a0 = 0x10`, which the engine shows as `[guest]`. `scripts/ee_find.py` lists the functions
with that call and their callers over the whole-disc disassembly (`ci-results/ee-find.txt`).
The phone run's `Path : (null)` comes from there, not from a `[tty]` line.

**2. The writer of the ManipulatorMgr pointer (0x795F94).** Found by `scripts/ee_find.py`
(the base register is tracked through `lui $at, 0x79`, which the earlier offset search missed).
`func_0032F250` (the "ParticlesManager_Z" init, called from `func_0032F1B0`) does:

    if (g_0x795F94 == 0) {                       // 0x330380
        v0 = func_002DCB00(0xFC, "ManipulatorManager_Z", "Main_Z.cpp", 0x1EB);  // 0x3303A0
        if (v0 != 0) { ...init the object... }   // 0x3303A8 skips the init when v0 == 0
    }
    g_0x795F94 = v0;                             // 0x330444
    ...

So the pointer is whatever the allocator `func_002DCB00` returns, unless it was already set. The
crash is a read through that pointer. The allocator's dump is added to CI (`ci-results/ee-funcs/`).
Open question: whether `func_002DCB00` returns a valid address in the headless run.

**3. `start returned 2` is not an error.** In ps2sdk, a module's `_start` returns
`MODULE_RESIDENT_END` (0) or `MODULE_NO_RESIDENT_END` (1). The success path of `mcserv`
(ps2sdk source, `mcserv.c`) returns `MODULE_REMOVABLE_END`, which is 2. So SDRDRV started
normally; patch 0017 is not involved in this.

**4. Patch 0015 is not in the phone build yet.** A surface loss is `VK_ERROR_SURFACE_LOST_KHR`,
which is `-1000000000`. Patch 0015 handles it silently (`surface_lost_`, then `RecreateSurface`)
and logs `the surface made again`. `up-2.log` has neither the recovery line nor the silence:
it logs `vkQueuePresentKHR failed (-1000000000)` through `Check()`, which is the pre-0015
behaviour. So the phone's build predates 0015, and 0015 is still unverified on a device.

**5. The GPU pipeline cache.** `*.bin` is in `.gitignore`, and no `.bin` is tracked.

### Run 45764916555 and 45767596301 (the three checks, with the tools)

- **The debug print is `func_003DD900`.** `scripts/ee_find.py` finds `Deci2Call` (syscall 0x7C)
  through its wrapper `func_003DC9D0`, and the call with `$a0 = 0x10` is in `func_003DD900`
  (`ci-results/ee-find.txt`). The phone trace shows `[call] 0x003DD900` right before
  `[guest] Path : (null)`. So the `[guest]` line is `func_003DD900`'s output.
- **The allocator is `func_002DC710`.** `func_002DCB00` (`ManipulatorManager_Z`) tail-jumps to
  `func_002DCE30`, which in turn is `j func_002DC710`. Its body is dumped in the next run.
- **The pointer is cleared after the loop.** `func_0032F1B0` runs the init (`func_0032F250`), then
  loops on `func_0032EAA0` until `func_002DD6A0` returns non-zero, then calls `func_00331230`,
  which does `sw $zero, 0x5F94`. So the pointer is valid only during the loop, and the crash is a
  read through it after something other than the loop exit has run.
- **Run 45767596301 stopped on `0x08C20FB0`** (the crash address varies between runs, as before).

### Run 45770284829: the print chain

- `func_003DD900(p)` is the kputs wrapper: it stores `p` on the stack and calls the Deci2Call
  wrapper `func_003DC9D0` with `$a0 = 0x10` (kputs) and the string's address. Its only caller in
  the dump is `func_003DDEB0`.
- `func_002DC710` is not the allocator. It is a short function that calls `func_004B68C0` with
  `a0 + 0x24` and bumps two counters. The allocator body is therefore one step further (the
  dump of `func_004B68C0` is added to the next run).
- Run 45770284829 stopped on `0xFFFFF000`, outside guest memory: the crash address varies per
  run (`0x02000000`, `0x08C20FB0`, `0xF6FFFF42`, `0xFFFFF000`).
- Open: who calls `func_003DDEB0` with a null `Path` (the next run dumps it and its callers).

### The print path, to the character

- `func_003DDEB0(c)` is the character output of the game's `printf`: it appends `c` to a buffer
  (`0x79B480`, the count at `0x713784`) and sends the buffer through `func_003DD900` (`kputs`) on
  a newline or at 126 characters. It has no direct `jal` callers, so `printf` calls it through a
  function pointer. That is why its callers list is empty.
- `func_003F2AF8` is printf-like (the `Language: %d` and `App : %s` lines in `func_002DD240`).
- `(null)` is what `printf` writes for a null `%s`, so the caller that passed a null `Path` is the
  one to find. The disassembly writes the strings it loads as comments, so the next run greps for
  the `"Path` string (`ci-results/ee-string-path.txt`, `ci-results/ee-path/`).

### The "Path : (null)" print, found in the disassembly (run 45778783877)

The disassembly writes each string it loads as a comment, so the grep for `"Path` found the
print directly (`ci-results/ee-string-path.txt`):

- `func_002DD6B0` (called from `main`, `func_002DD240`, at `0x2DD3E4`; its string hint is
  "Game is in PAL mode") builds the boot path at `0x797280`. It scans back from the end of that
  string for the last `\` (`0x5C`), writes a NUL after it, copies two bytes with `func_003F4C88`,
  and then calls `printf("Path : %s\n", 0x797280)` (`0x2DD94C..0x2DD954`). It calls the same
  print a second time at `0x2DD988`, after `func_003DE7C8`.
- So the text is the game's own boot path, and `(null)` is what printf writes for the buffer as the
  game left it at that point. The writers of `0x797280` are the next question
  (`ci-results/ee-find-path-buf.txt`).
- The chain, from the game's `printf` to the engine: `printf` (`0x3F2AF8`) calls `0x3DDEB0` per
  character, which sends each line through `0x3DD900` (`kputs`, `Deci2Call(0x10)`), which the
  engine prints as `[guest]`.

### The root cause: the start-up code reads argc/argv from the SetupThread block (patch 0018)

`crt0` (ps2sdk, `ee/startup/src/crt0.c`, which the game's start at `0x200008` follows) does not take
`$a0`/`$a1` for `main`. It passes `SetupThread`'s fourth argument (`$a3`, `args`) and reads
`argc` and `argv` from that `struct sargs` (`argc`, `argv[16]`, `payload[256]`), which the
kernel/loader fills in. The engine's `SetupThread` ignored `$a3`, so `argc = 0` and `argv` was
null, and `main` read `argv[0]` as `(null)`: `Path : (null)` (`func_002DD6B0`).

Patch `0018-ee-argv.patch` (kernel.cpp, host.cpp): `SetupThread` writes `argc = 1` and `argv[0]` to
the `args` block, with the program's path in its payload. The path is the disc's boot path
(`Disc::BootPath()`), or the ELF's name under `cdrom0` for a run without a disc.

Check: the next smoke run should print `[guest] Path : cdrom0:\SLUS_...;1`, not `(null)`, and the
port should go past the stop it had before (the ManipulatorMgr read at `0x795F94`).

### Patch 0018 is delivered, and it does not change the "(null)" print (run 45793678244)

- The entry `0x200008` (`ci-results/ee-entry.txt`) is the game's own start code: it clears bss,
  calls `SetupThread` with `$a3 = args` (`0x7AAF40`), `SetupHeap(0x7AB390, ...)`, and then
  `main(argc = lw [args], argv = args + 4)`. Our block has exactly that layout.
- The engine log now shows `[host] SetupThread: program args at 007AAF40 (argc 1, argv[0] "\SLUS_218.64;1")`.
  The path has no `cdrom0:` device prefix (`Disc::BootPath()` returns it without); the kernel's
  argv[0] has one. That is a small thing to fix in the next patch.
- `[guest] Path : (null)` remains. So the `(null)` is not `argv[0]`. The print reads the buffer
  `0x797280`, which `func_002DD6B0` copies from (`func_003F4C88`), and nothing in the dumps writes
  that buffer directly. The next question is who fills `0x797280` before `func_002DD6B0` runs (the
  disc's boot path read, or a directory search that returns nothing in the port).
- The run stopped on a write at `0x02000000`, 2083 functions, the same as before patch 0018. The
  argument fix did not move the stop; the crash is still the ManipulatorMgr pointer (`0x795F94`).

### The GPU pipeline cache (gpu_pipeline_cache.bin-3.txt) and the phone run up-3.log

- **The cache is a real binary.** It is 400377 bytes and is not UTF-8. Its Vulkan header
  (VkPipelineCacheHeaderVersionOne): headerSize 32, version 1, vendorID 0x13B5 (ARM), deviceID
  0x90910010 (Mali-G57), and a pipelineCacheUUID. The three uploaded copies (`bin.txt`, `bin-2`,
  `bin-3`) share the header and differ from byte 77353 on, as the cache grows between runs.
- **It is not committed, and it is not needed in the repository.** The root `.gitignore` ignores
  `*.bin` on purpose ("anything derived from [the game's files] that contains the game's code or
  assets"). A pipeline cache is derived from the game's shaders and draws. The README says the
  repository holds no game material. The APK writes its own cache beside its settings on the
  device (`SetPipelineCacheDir`, `OpenPipelineCache`, `SavePipelineCache`) and reads it at the
  next start; the driver ignores a cache that is not its own.
- **up-3.log (the phone, with patch 0018):**
  - the build has the SetupThread line (`program args at 007AAF40`), so 0018 is in it;
  - `[guest] Path : (null)` is still there (line 463);
  - the run stops in the same place as the CI runs: `stopped: a write at 0x02000000`,
    2083 functions, the same stack (`0x00200008 -> 0x002DD240 -> 0x0032F1B0 -> 0x0032EAA0 ->
    0x00426350`). So the device fails the same way as the headless run;
  - the frames: 0 draws up to frame 400, 562 draws per frame from frame 500, 694 MB of textures;
  - the first start made 7 pipelines in 5.3 s; the pipelines known from the start took 13.9 s;
  - no `vkQueuePresentKHR` or `vkAcquireNextImageKHR` failure, and no surface-lost line, so patch
    0015 is neither confirmed nor refuted by this run;
  - the swapchain is 1600x720 (earlier logs: 1528x672), so this is another screen or window size.

### Patch 0019: the physical gap is a null handler; the stop moves to a read at 0xFFFFF000 (run 45819298381)

- **The gap.** On the PS2, physical 0x02000000-0x0FFFFFFF has no memory (only 32 MB of RDRAM is
  fitted). PCSX2 maps that range to a null handler (`memMapPhy` in `pcsx2/Memory.cpp`:
  `vtlb_MapHandler(null_handler, Ps2MemSize::ExposedRam, 0x10000000 - Ps2MemSize::ExposedRam)`).
  The engine faulted on it. Patch `0019-open-gap-is-a-null-handler.patch` (`host/src/memory.cpp`)
  makes a read there return 0 and a write go nowhere, as PCSX2 does. The device registers from
  0x10000000 on still fault when unmapped.
- **The result.** Run 45819298381 (CI) no longer stops at the write to 0x02000000. It stops at
  `a read at 0xFFFFF000, outside guest memory`, with the same 2083 functions and the same stack
  (`0x00200008 -> 0x002DD240 -> 0x0032F1B0 -> 0x0032EAA0 -> 0x00426350 -> 0x00426E00 -> 0x00356A60
  -> 0x0041B550 -> 0x004C49A0 -> 0x003078A0 -> 0x003079C0 -> 0x0032DE20 -> 0x0032DF60 -> 0x002DCC40
  -> 0x004B66F0`). A read at -0x1000 is a list pointer that the game followed from an object it
  had already corrupted. So the gap was a symptom: the game's data is wrong before that point.
- **What the code shows (the CI's `ci-results/ee-funcs`, `ee-find.txt`):**
  - `_CoreMainLoop` (`0x32EAA0`) calls the managers' updates. `0x426350` walks lists of objects
    (`+0xA0`, `+0xB0`, `+0xC0`, `+0xD0`, `+0xD8`) found through the global `0x795F70`, and
    `0x426E00` follows each list (`lw $s0, 0($a0)`, then `+0x10`).
  - The global `0x795F94` (the ManipulatorManager, `ManipulatorManager_Z`, `Main_Z.cpp` line 491)
    is set in `0x32F250` (`ParticlesManager_Z` and the other managers are created there) from an
    allocation through `0x2DCB00 -> 0x2DC710 -> 0x4B68C0` (the game's own heap allocator, with the
    block counters at 0x410/0x414). `0x331230` zeroes these globals.
  - The heap is set by `SetupHeap(0x7B4C70, -1)`: the end is the stack base 0x1FA8800, which is
    right (`kernel.cpp`, `case 0x3D`).
- **Next.** The chain 0x0032DE20 -> 0x0032DF60 -> 0x002DCC40 -> 0x004B66F0 is where the bad read is
  made, and its callers are under `0x3079C0`. Their dumps are in `ci-results/ee-chain/` (run
  after 0019's CI run). The first write of a bad pointer must be found there, by the golden-trace
  method above or by a write watch on the object's list head.

### Runs 45823459924 and 45826349148: the results push, and the stop at 0x10010000

- Run 45823459924 finished, but its results were refused by the push (the branch had moved while it
  ran; the rebase conflicted on `ci-results/port-report.txt`). The workflow now retries twice and lets
  this run's results win (`-X theirs`). Run 45826349148 pushed its results (`d82b2d7`).
- Its stop: `a read at 0x10010000, outside guest memory`. That is the first address past the EE
  register window (0x10000000, 64 KB): a pointer the game built from an object it had corrupted.
  Same 2083 functions, same chain up to `0x0032DE80 -> 0x0032DFA0` (the return addresses; the
  functions there are not dumped yet). The timing varies between runs, so the stack's last frames
  vary too.
- **The working hypothesis (the arena).** The ManipulatorMgr's object was at `0x01FFFF0F` (the
  write to `0x02000000` came from `0x795F94 + 0xF1`), i.e. inside the stack
  (`0x1FA8800-0x2000000`, set by the entry's `SetupThread`). `SetupHeap(0x7B4C70, -1)` ends the heap
  at the stack base, but the game's allocator hands out memory above it, so its arena must end at
  the top of RAM (or be read from somewhere else). The arena's bounds are in the pool at
  `0x7957B0` (counters at +0x410/+0x414, bitmaps at +0x428; `func_004B8800`). Next: who writes
  `0x795BC0-0x795C00` (`ci-results/ee-find-arena.txt`), and what `func_003E5D58` and `func_003E4E68`
  (named `GetMemorySize_or_rfu` by the analysis) return.
- The watch (`UP_SMOKE_WATCH`) now takes several addresses: the flag `0x7A982C`, and the
  ManipulatorMgr's globals `0x795F94` and `0x795F70`. Their `[write]` lines give the object's
  address and the function that stored it (`ci-results/write-trace.txt`).

### Run 45840674608: the object is not overlapped; the bad pointer changes from run to run

- The ManipulatorMgr's object is at `0x9E40B0` (its global `0x795F94` is set to it in `0x32F250`,
  from the allocator). Its fields at `+0xA0..+0xA8` and `+0xF0..+0xF8` are written by `0x2E05B0`
  during the same creation (`0x32F250 -> 0x43E880 -> 0x43EB40 -> 0x2DCC10 -> 0x2DCE50 -> 0x2DC7F0
  -> 0x4B7080 -> 0x4B6DB0 -> 0x2E05B0`). The stored values are pairs of 16-bit coordinates
  (`0x0170/0x0140/0x0110/0x0080/0x0050/0x0020`, `0x0172/0x0142/...`, a step of 0x30): a UI layout
  table, written by the object's own init. So the object is not overlapped by another allocation,
  and the list-head reading (`+0xA0` as a list) was wrong: it is an embedded table.
- **The bad read is not the same in each run:** `0xFFFFF000` (45819298381), `0x10010000` (45826349148,
  45835554148), `0x14F74845` (45840674608), and the write to `0x02000000` before patch 0019. A pointer
  that changes between runs is read from memory that holds different data each time: uninitialised
  memory, a reply or a DMA buffer the host filled differently, or a value from the clock. It is not
  a fixed bug in the game's list.
- **Next:** find what feeds the bad pointer. The reads are in `0x426E00` (the list walk) and the
  update it calls (`0x356A60`), so the pointer comes from an object the update reads. Check which
  host-filled buffers (SIF replies of 64 bytes, the RPC answers of ZNASND, the DMA into RAM) reach
  that object, and whether any of them is filled from wall-clock time (the engine's wall-clock
  marks, patch 0012). Only the run-to-run variation of the stop separates these.

### Runs 45862933405 to 45880604054: the determinism check (what makes two runs the same)

- Two runs of the same binary with the same arguments differ from the first SIF reply on. Run 45859080626, and again 45862933405, 45867494664, 45872070165 and 45875917801: the first difference is at `268c268`, where the SIF reply is delivered at `663783095825 ns` in run 1 and `673855515906 ns` in run 2 (about 10.07 s of virtual time). The same two numbers come out of every run, so the gap is systematic, not noise.
- Cleared as the cause: the settings file and the GPU pipeline cache beside the binary (the check now deletes `pc_settings.ini` and `gpu_pipeline_cache.bin` before each run; the difference stayed), and the wall clock in the engine's virtual clock (`ClockNs` is the scheduler's clock under `--virtual-time`, and `SetVirtualClock` takes the flag at `host.cpp:854`; the flag is parsed at `host.cpp:1031`). The VblankTimer thread is not started in a virtual-time run (`StartRealTimeThreads` runs only for `realtime`).
- Not the cause, as tested: `--gs-inline --vif1-sync` (run 45875917801). The host's watchdog stopped run 1 with exit 3 ("the host is in a loop of its own", `host.cpp:830`) after 6397 lines. So `--gs-inline` cannot be part of a repeatable run; the check is back to `--virtual-time` alone.
- Still open: what the second run does differently in its first 10 s of virtual time. Candidates not yet read: the order in which the timer and the IOP get their first slices (`threads.cpp` idle loops, `AddIdleLoop` in `overrides.cpp` 67–75), and the disc's first reads (`cdvd.cpp` 81–85).
- Bug found in the check and fixed: a run without a report was reported as DIFFERENT with the old summary (the summary was not rewritten, and the copy step copied nothing). The check now always writes `summary.txt` with `FAILED: run N ended without a report (exit X)`, and it no longer deletes every `*.bin` beside the binary (only the pipeline cache).
- The working menu is not affected by this: the stop at `0x10010000` (run 45859080626 and later) is still the game's blocker. The determinism check is for finding the repeatable trace, not for the port's fix.

### Runs 45935372804 to 45947696479: the fault's registers, and the unpacker that reads them

- **The fault's registers (patch 0020, runs 45941747782, 45944191104).** A fault prints the thread's registers and the stack words above its stack pointer (`[regs]` in the report). In run 45941747782 the stop is `a read at 0x10010000` in `0x32DFA0` (the LZ unpacker, called from `0x32DE80`, `UnPack_Z.cpp`): `a1` (its packed input) = `0x10010000`, `a2` (its output) = `0x0E5F9F7F`, `sp` = `0x1FFF9E0`, `ra` = `0x32DF48`.
- **Where the input and output come from.** `0x3079C0` is called from `0x3078A0` with `a1` = the object's field `+0x2c` (`s2`). The unpacker's input is `s2[0] + 0x18 + offset`, where the offset comes from the lookup `0x2E05B0` (in `0x3079C0`'s frame, `sp+0x54`). The output is `s2[4]` (the object's `+0x30`). `s2[0]` is a plausible RAM pointer at the entry of `0x3078A0` (the entry diagnostic logged nothing), so the bad values are in the object's table (`+0x18`/`+0x10` tables, set by `0x4C4BB0`) or in the lookup's offset.
- **The stop moves between runs in real time.** Run 45944191104 stops at `a read at 0x14F74845` inside `0x3097C0` (called from `0x30A240` ← `0x3078F0` ← `0x3078A0`): the lookup itself, reading an index. `r02` = `0xFFFFFFFF94F74841` is a sign-extended 32-bit value. So the table or index holds a corrupt value that varies with timing; the smoke run is real-time, which is why the value changes.
- **The virtual-time run (the reproducible one) is not reproducible on this runner.** It stopped at `0x10010000` in runs 45872070165 and before, with the same deletions as the later runs. Since then the runs end with exit 3 after 6397 lines: "the run did not stop 20 s after its time limit - the host is in a loop of its own", and the guest call stack is empty. The same code passed in 45872070165 and failed in 45947696479 (with patch 0020 set aside), so this is the runner's timing (the host stops late), not a change in the code. Removing the settings file or the pipeline cache is not the cause (45947696479 keeps both).
- **Diagnostic overrides hang the run.** Two port overrides (`0x3078A0` and `0x32DE80`, calling the original `lifted::F_<ADDR>`) were tried; the virtual-time run then stopped with exit 3 (45935372804). They were removed. Do not override functions with loops for diagnostics: the scheduler's abort at a loop head unwinds through the override.
- **Next:** make the virtual-time run finish on this runner (a longer wait before the watchdog, or the frames written after the run), then watch writes to the object's `+0x2c`/`+0x30` and the lookup's table (the address comes from the stack words in `[regs]`). Until then, the real-time smoke run gives the stop and its registers only.

### Run 45982144915: the disc's data is right (engine patch 0021)

- Patch 0021 logs the CRC-32 of every read of the disc (`[disc] read lsn L count C crc X`); `scripts/disc_crc_check.py` compares each with the same sectors of `up.iso`. Result (`ci-results/disc-crc.txt`): 43 distinct reads, 43 the same, 0 different. The disc's data reaches the engine intact, so the bad pointer at the stop is not from the disc's bytes.
- The stop is unchanged: `a read at 0x10010000` (smoke, real time).
- `GetMemorySize` (syscall 0x7F) is never called by the game (no `kernel ... (0x7F)` note), so it is not the cause.
- Next suspects, in order: (1) the SIF DMA copies (`SetDma`, `iop_libs.cpp` ~1130, and `SifDma`, `iop.cpp` ~239): a destination in `0x02000000–0x0FFFFFFF` drops the bytes silently (patch 0019); (2) where the 0x10010000 comes from in `0x3079C0`'s `s2` table.
- The determinism check is off in the workflow (`if: ${{ false }}`): it costs ~6 minutes per run and gave no new result since 45872070165.

### The engine's own verification now runs on Linux (patches 0022, 0023)

- Until now `lift.py` verified nothing on Linux: its C++ check needs MSVC, so every lifted function was marked `NOT VERIFIED` ("nothing is verified"). Patches 0022 (`cppcheck.py`) and 0023 (`liftcheck.py`) build the same check with g++ (`-O2`, shared library). Checked locally on toy functions; CI confirmed it (run 46008029161: 14 of 15 verified).
- Crash chain (`ci-results/chain-outcomes.json`, run 46010074964): `0x3078A0`, `0x3078F0`, `0x3079C0`, `0x3097C0`, `0x30A240`, `0x32DE80`, `0x32DFA0` (the LZ unpacker), `0x32EAA0`, `0x356A60`, `0x41B550`, `0x426350`, `0x426E00`, `0x4C49A0`, `0x4C4F40`: **verified** (the whole register file and memory agree with the original on random cases). `0x32F1B0`: untestable (the main loop; the original does not end on random inputs). So the translation of the crash chain is not the bug, on the cases tested. The unpacker hypothesis of the earlier runs is refuted.
- `AddIdleLoop` (`overrides.cpp`, `0x356AF0` in `0x356A60`) changes only the time slice (`threads.cpp` ~696), not the state.
- Full verification (`ci-results/verify-all.txt`, 19,492 functions, 4 cores): did not finish in 120 minutes (3,500 of 4,873 per worker). Per-function outcomes are only written at the end, so a timeout loses them. Next: shard it (`--only` lists, one job each) so each shard finishes; every `disagrees` outcome then names a real translation bug to fix by the method.
- Where the bug must be, if the translation is right: the runtime around the code. Candidates: the SIF DMA (`SetDma`, `iop_libs.cpp`; writes above 32 MB dropped by patch 0019), the threads (a second thread writing the same object), or inputs the random cases do not reach.

### Run 46054404218 (full verification, sharded) and the first disagreement (investigate=true, runs 46062026356, 46062432950, 46062700495)

- Full verification, six shards: 19,492 functions; 18,417 verified; 1,066 untestable; 8 `lifted run failed` (`0xDEAD0000`, a call to a missing callee); 1 `disagrees`: `0x002A7BF0` (r8: lifted `0x1809090`, original `0x0`). Summary in `ci-results/verify/summary.txt`.
- `0x002A7BF0` is not on the crash chain. Its original code, read over the full extent the lifter follows (`ci-results/investigate/002A7BF0.range.txt`; the analysis range stops at `0x2A7CA4`, the lifter's runs to `0x2A8288`), leaves `$t0` as the last `daddu $t0,$s7` value, or as whatever `0x2A7A40` leaves (it returns through `0x2A7030`, which preserves `$t0`). So the difference comes from `$s7` or from `0x2A7A40`.
- The callees on that path: `0x2A7030`, `0x2A6FC0`, `0x2A6D70`, `0x2067D0`, `0x2074F0`, `0x208CF0` are `verified`. **`0x2A7A40` is `untestable: only 1 cases ran`**: the random memory profiles almost never give the original a valid object to work on (it loops over a list at stride 0x4C). So the one unchecked link is `0x2A7A40`, and the disagreement is probably in its (unverified) translation or in the harness's modelling of it.
- `0x2A7A40` is on the same object family as the UI code (a `0x5F70` global object, 16-byte table entries, float divides): it may be part of the menu path. Checking it needs real inputs, not random ones (a call-time capture of the original's registers and memory from the running game, replayed through the harness), which is not built yet.
- Lesson: `disasm.py --addr` reports the analysis range, which can be shorter than the code the lifter translates. Dump with `--range` over the lifter's extent before reading a disagreement.

### Runs 46062026356 to 46076146788: the untested writers, and the disc read's timing (engine patch 0024)

- **The writers of the ManipulatorMgr's global (`0x795F80..A0`) are not verified.** `0x32F250` and `0x331230` are `untestable: ExecutionLimit` on random inputs; `0x43E880` too. They are large set-up functions that call through pointers (`jalr $t9`, 194 to 1,461 lines), so random memory sends them into loops or wild calls. Their translation is unchecked, and they are on the path that creates the object the bad pointer comes from. (`ci-results/investigate/0032F250.s.txt`, `00331230.s.txt`, `0043E880.s.txt`.)
- **The lookup `0x3097C0` is a hash table** (a bitmap of occupied slots, 8-byte entries; key 0 is a special case). It is verified, so a bad index comes from the table's contents, not from the lookup.
- **Patch 0024: a disc read's data reaches the EE buffer when the read ends.** `NCommand` case 1 (`sceCdRead` through cdvdfsv) wrote the sectors into the buffer when asked, and only delayed the RPC reply. The data is now queued with the reply (`DelayRpcWrite`) and written at delivery. Result (run `46076146788`): the stop is `a read at 0xFFFFF000` (it was `0x10010000`), with the same guest call stack. So the early write is not the cause of the stop, though the change is right and is kept.
- **The stop moves between real-time runs** (`0x10010000`, `0xFFFFF000`, `0x14F74845`) with the same call stack. The value varies, so the bad pointer is timing-dependent. Without a repeatable run its writer cannot be found.
- **Smoke runs took about two hours**, because the one-process full verification (`Every lifted function verified…`, 120-minute timeout) ran on every smoke run and never finished. It is now off (`if: ${{ false }}`); `verify=true` does the same work in six shards.
- **Next:** a repeatable run. The virtual-time run (`UP_DET_FLAGS=--virtual-time`) ended with exit 3 ("the host is in a loop of its own", `host.cpp` 800–837): the host, not the guest, is stuck. The determinism step is off (`if: ${{ false }}`). Turning it on with `PS2HOST_STUCK_RAM` gives the stuck point and the IOP's threads.
- **Not yet checked:** the SIF path. cdvdman's `sceCdRead` puts the sectors in an IOP buffer (`0x31740`), and `SetDma` (`iop_libs.cpp` ~1130) copies them to the EE. The CRC check (patch 0021) covers only the host's read from `up.iso`, not the IOP buffer or the copy.

### Reference recompilers (PS2Recomp and DQ8-Recompiled), read from source (this turn)

- **PS2Recomp** (github.com/ran-j/PS2Recomp, GPL-3.0): static recompiler and runtime. Modules: ps2xAnalyzer (writes a TOML config: stubs, skips, instruction patches), ps2xRecomp (R5900 to C++), ps2xRuntime (memory, dispatch, syscalls), ps2xIOP (IRX modules on an R3000 interpreter, with a virtual IOP kernel). Its documented preferred input is a Ghidra export of the function map.
- **DQ8-Recompiled** (github.com/Sinan-Karakaya/DQ8-Recompiled, GPL-3.0 per LICENSE): a game built on PS2Recomp. NTSC-U SLUS_212.07 reaches field gameplay; the game's own IOP sound modules run unmodified on an emulated IOP (their Architecture page). Per-revision inputs in `config/SLUS_212.07/` (functions CSVs, dq8.toml, overlays). Wiki Testing page: "A fully automated end-to-end reference trace and RAM comparison pipeline is not currently established."
- **The golden trace DQ8 uses** (`tools/oracle/`): the retail game in PCSX2, with a pnach that restores two debug-log call sites (`tools/oracle/pnach/SLUS-21207_F4715852.pnach`), so the game prints file loads, VRAM allocations, IOP allocations and thread create/delete. `tools/oracle/logdiff.py` reports the first divergence against the runtime's log, by category. The same idea applies to Up: the game's own debug output does run (see "Correction: the game's own debug output does run (kputs)").
- **Blocker for that golden trace: a PS2 BIOS.** PCSX2 does not run without a BIOS dump from the user's own console (PCSX2 has no open replacement). The BIOS is not in the repository and is not downloaded from the internet. The user has to supply their own dump, as with the disc.
- Our engine already does what both do: it reimplements the EE services in the runtime and runs the IOP modules on an interpreter. So the recompiler alone does not explain the runtime garbage. What it adds is the reference method (the golden trace and `logdiff`), not a different translation.

## The reference run: PCSX2 with the owner's BIOS and disc (CI, `reference=true`)

- The BIOS dump's main ROM is `SCPH-90001_BIOS_V18_USA_230.ROM0` (4 MiB, with ROM1,
  NVM, MEC, INF). `scripts/fetch_bios.sh` picks `*.ROM0` (not the same-size `.DIFF`).
- PCSX2 v2.8.2 (the official Linux AppImage) runs the disc (SLUS-21864 in its log;
  the ELF is `SLUS_218.64`). Headless under Xvfb, with a PulseAudio null sink (without
  it PCSX2 opens a modal "Failed to create or configure audio stream" dialog that takes
  every key) and the keyboard bound to the first pad (without bindings the game gets
  no input). The game reaches the title, the intro, and a menu ("Back"); the IOP loops
  `MENU.JOE` / `MUSICMENU.JOE`, which is the menu's data.
- The savestate on shutdown (`SaveStateOnShutdown`) is read by `scripts/ee_snapshot.py`
  (zstd entries, `eeMemory.bin` = the EE's 32 MiB). `ci-results/reference/ee-snapshot.txt`
  holds only numbers: the words at the addresses the port's stop is about, and the
  non-zero RAM pages.
- Compared with the port: `0x795F70 = 0x007BD3D0` and `0x795F94 = 0x009E40B0` in the
  reference, the same values the port writes (`0x0032F250`). `0x795F80..0x795FA0` are
  pointers into the heap (`0x9D…`/`0x9E…`). `0x0032F250`, `0x00331230`, `0x0043E880`
  hold the code's prologues in the reference RAM, so those functions are the game's.
- Not yet established: the reference's RAM at the port's stop (`0x10010000`, a hardware
  address that reads 0 in the reference's RAM). The next differential step is the RAM
  of the port at the same logical point, compared page by page with `ee-snapshot.txt`.
- Artifacts: the screenshots and the savestate are artifacts only (`up-reference`);
  the repository keeps the text (`ci-results/reference/`).

### The first RAM comparison (CI run 46149039572, `ci-results/ram-compare.txt`)

- The port's RAM at its stop (patch 0025, `PS2HOST_RAM_DUMP`) against the reference's
  savestate (60 s, the menu): 3676 of 8192 pages differ, 106 runs.
- Equal at the addresses the port's stop is about: `0x795F70..0x795FA0`, `0x795F94`,
  `0x0032F250`, `0x0043E880` (the same words in both). So the ManipulatorMgr tables and
  the functions that write them are right in the port.
- Expected differences, not bugs: the reference's low RAM (`0x00000000..0x00018000`)
  holds the BIOS kernel, which the port does not model; the stacks and heap are at
  different points of the run (the reference is in the menu, the port at its stop).
- Next: a reference savestate at the same point as the port's stop (about 6-8 s after
  start, `UP_REFERENCE_SECONDS`), then the differences in the code and the game's
  data only, not the heap.

## Two public PS2 static recompilers, studied (what applies to Up)

- **ran-j/PS2Recomp** (`ps2xAnalyzer`, `ps2xRecomp`, `ps2xRuntime`, `ps2xIOP`): the same
  design as ours - a translator, a runtime with HLE kernel, IRX modules interpreted.
  Its `SetSyscall` stores the game's handler in an override table (`setEeSyscallOverride`),
  as our kernel reads the table at `0x80001000`. Its stripped-ELF workflow is
  `handler@0xADDR` stubs, which we have as address-bound overrides already. Nothing in it
  explains our stop at `0x10010000`.
- **exoteric33/ps2-native-recomp** (built on ps2-web-recomp): the build runs the game
  headless for up to 3600 frames, pressing Start and Cross on a timer, and each time the
  game jumps to untranslated code the build translates it and runs again (up to 8 times).
  Runtime translation of code the analysis missed works the same way as our `--discover`.
  Its "AOT window capture" (`PS2_CAPTURE_AOT_*`) saves selected EE RAM windows at chosen
  frames, the same idea as our RAM dump.
- Conclusion: neither repository gives a ready fix for our stop. The method that works
  here is the differential one: the reference's RAM at a time aligned with the port's stop.
  The `--value` search in `scripts/ram_compare.py` finds where the bad pointer is stored.

### Runs 46149039572 to 46153985873: the reference at 6 s, and the EE's bad read (patch 0026)

- **The reference at 6 s** (`UP_REFERENCE_SECONDS=6`, run 46151517092): the ELF's code is in
  memory (`0x0032F250` and `0x0043E880` have their prologues), but the ManipulatorMgr's globals
  are still 0 (`0x795F94`, `0x795F70`). So 6 s is before the game's init, not the menu. The port
  at its stop has them set (`0x795F94 = 0x009E40B0`). The 60 s and 900 s references are the
  menu. Comparing at the game's own events (the first write to `0x795F94`) is the way to align them.
- **The value 0x10010000 is in the game's data** (`ram-compare.txt`, `--value`): the port has it
  at `0x006DD380`, `0x006DF5C8`, `0x006E2A58`, `0x006F9C08`, `0x0070E250`, and so does the
  reference at the same five addresses. So it is a constant in the game's table, not a corruption.
- **Patch 0026: unmapped EE hardware reads return 0.** The port stopped on a read at 0x10010000
  (the first address past the 64 KB EE register window), which faults. PCSX2's `HwRead.cpp`
  default case, for an unknown hardware address, logs "Unknown Hardware Read" and returns 0; a
  write is ignored. Patch 0019 already did that for the physical gap 0x02000000-0x0FFFFFFF. The
  patch extends it to 0x10010000-0x1FFFFFFF. Run 46153985873: the EE stop is gone, the run goes on.
- **The next stop is on the IOP** (`stopped: IOP: instruction 0x00000001 at 0x000C2EE0`). Thread 7
  (cdvdman, entry 0x1C2D0) is at 0x000C2EE4 when it stops. The IOP executed a word that is data
  (0x00000001, a SPECIAL funct that does not exist), so a jump went to a wrong or stale address.
  The thread's loop (`sceCdStatus`, `sceCdSync`, `sceCdGetError`, `DelayThread(0x1F4)` from
  0x1C2FC) runs right up to the wake-up; the address is 0x10000 below the cdvdman code at 0x1C2E0.
  Checked in the engine: the thread's context is run in place, `Vm::Call` keeps its own, the
  wake-up sets only `r[2]`, and `R_MIPS_HI16` relocation has the carry (+0x8000) right. So the jump
  is from the module's code, not the scheduler. The word at 0xC2EE0 is 1 and the SIF DMA descriptor
  is at 0xC2EF4 (`sceSifSetDma(0xC2EF4, 1, 0x9000)`), so 0xC2EE0 is the EE's transfer area.
- **Patch 0027 (diagnostic only):** an IOP stop now prints the instruction run before the bad one
  (`previous_executing`), its word, and all 32 registers. The next run shows which `jr`/`jalr`
  took the thread there.

### Run 46156045070: the IOP stop with its registers (patch 0027)

- The stop moved: `stopped: IOP: instruction 0x005090F0 at 0x0008BF08`, after the instruction at
  `0x0008BF04 = 0x00500000`. Thread 7 (cdvdman) has `sp = 0x000C2FA8` and `$ra = 0x0001C304`
  (its return to the code after `DelayThread(0x1F4)` from 0x1C2FC). So **cdvdman's stack lies at
  0xC2xxx**: the earlier stop at `0xC2EE0`/`0xC2EE4` was not a code address at all but a word in
  that thread's own stack frame (the SIF DMA descriptors `0xC2F4C..0xC2F7C` are its locals too).
  The word there was 1, so a return address the thread had saved on its stack was overwritten
  and the thread returned into data. The `0x10000` difference I took for a relocation error
  was the wrong idea; the cause is a write into the stack.
- `0x005090F0` and `0x00500000` are data words (SPECIAL funct 0x30 = TGE, which the interpreter
  does not implement, and an unused `sll`). So the thread went through data after the bad return.
- **Who writes the stack:** not yet known. The cdvdman stack is written by the thread itself
  (CpuSuspendIntr, SIF DMA setups) and possibly by an EE-to-IOP SIF DMA whose destination falls in
  the stack. Patch 0028 (`PS2HOST_IOP_WATCH=0xC2D00-0xC2FD0`, set in the smoke step) reports every
  byte of that range that changes, with the thread and its last instruction.

### Runs 46159167991, 46161674065: the stop keeps moving (the cause is the run's timing)

- Five real-time runs of the same code now stop at five different places: EE `0xFFFFF000`,
  `0x10010000` (before patch 0026), `0xF8AD2C78` (run 46161674065, the EE read), IOP instruction
  `0x000C2EE0` / `0x0008BF08` (cdvdman's stack, run 46156045070). The guest's call stack at the EE
  stop is the same every time (`0x200008 -> ... -> 0x32DFA0`); only the bad value changes.
- So the bad pointer is written at a time that varies, not by one fixed instruction. The IOP
  stack watch (patch 0028) did not catch the write in the run that stopped on the EE (its report is
  printed only on an IOP stop). The per-quantum granularity of the watch also shows normal stack
  use of cdvdman (its own `sw ra`) as "changes", so the writer has to be separated from them.
- **Next, in order:** (1) make the IOP stop report also the EE read stop (a `ReadFault` path), so the
  watch's report comes with every bad read; (2) find the wall-clock inputs that change a guest
  write's timing (patch 0012 "wall-clock marks", `host.cpp` virtual_time 863-884), since a variable
  stop is a race between the host and the guest; (3) make the run repeatable before chasing the
  pointer again (the determinism check, `scripts/determinism_check.sh`).
