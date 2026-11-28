/*
 * Up's host implementations of guest functions.
 *
 * An override replaces the translated function at its address: the way a port
 * redirects code that drives hardware the host provides differently, and the
 * way the PC features hook in. Register them here with
 * ps2host::Override(address, function, "why"); the original stays callable as
 * F_<ADDRESS>(c). See the engine's docs/PORTING.md and the ps2-port skill.
 *
 * Override as little as possible: the game's own code is the point.
 *
 * Sound driver: ZNASND.IRX is the game's own sound driver (IOP module 6). It
 * runs for real in the IOP interpreter (RunModule below), with the sound
 * library's imports bound to the host's libsd. What the engine lacks for it
 * is in games/up/engine-patches/ (applied in order to the engine checkout by
 * CI before every build; the submodule's commit is not changed):
 *   0001 the IOP hardware registers (0xBF80xxxx), kept as written;
 *   0002 the sound timer library's SetOverflowHandler and its setters;
 *   0003 strtok, sceCdStatus and sceCdBreak;
 *   0004 the timer's counter running with the clock, the IOP RPC client and
 *        the file manager as placeholders (the trace names what is asked).
 *   0005 the IOP's SIF RPC client as ps2sdk's library has it: sceSifBindRpc
 *        and sceSifCallRpc (blocking and no-wait, with end functions);
 *   0006 ioman_open, iomanX_read, iomanX_lseek, iomanX_close on the disc's files.
 * Each is the engine's to take in upstream.
 *
 * Earlier attempts that are NOT here any more (see git history and
 * docs/FINDINGS.md): answering ZNASND's RPC server 0x01000001 with guessed
 * replies (iop_servers.cpp), which never unblocked the game.
 */

#include "ps2host/host.h"
#include "ps2host/iop_vm.h"
#include "ps2host/run.h"
#include "ps2host/settings.h"

#include "gpu_pipelines.h"

void RegisterGameOverrides() {
    // The game's own sound driver, from the disc, in the IOP interpreter. The
    // sound library (LIBSD.IRX) stays the host's: its exports are the host's
    // libsd, which ZNASND imports.
    // The sound library runs for real as the EE loads it (LIBSD.IRX, the sound
    // driver's remote): its RPC server is the one ZNASND binds (0x01000002),
    // which the host's own library lacks. The EE loads LIBSD before ZNASND.
    ps2host::iop::RunModule("LIBSD.IRX");
    // SDRDRV is the sound driver's own IOP module: the EE never loads it, so it starts
    // with the EE's load of LIBSD (engine patch 0016, loadfile.cpp). It registers the RPC
    // server 0x01000002 that ZNASND binds and the EE waits on.
    ps2host::iop::RunModule("SDRDRV.IRX");
    ps2host::iop::RunModule("ZNASND.IRX");

    // The GPU pipelines this game draws with (scripted runs, the engine's own
    // keys): made in the background from the start, so the first race or menu
    // makes none in the middle of it. Regenerate with
    // engine/tools/make_pipeline_hints.py when the engine's pipeline keys change.
    ps2host::SetGpuPipelineHints(kGpuPipelineHints, sizeof(kGpuPipelineHints) / sizeof(kGpuPipelineHints[0]));

    // The FPS counter on by default (F1 turns it off, and the choice is kept in
    // the settings file). On a phone: the frame rate in the corner of the screen.
    if (ps2host::Setting("fps_counter", "").empty()) ps2host::RunSetting("fps_counter", "on");

    // Name the wait loops the game spins in while it waits for something the
    // host answers late (the sound driver's status, text loading). The host
    // skips virtual time in these loops so the game moves past them instead of
    // burning real time. Addresses seen in CI smoke runs.
    ps2host::AddIdleLoop(0x0044AA50u);
    ps2host::AddIdleLoop(0x00356AF0u);
    ps2host::AddIdleLoop(0x0030CCB4u);
    ps2host::AddIdleLoop(0x0045A738u);
    ps2host::AddIdleLoop(0x003F4674u);
    // The EE's main thread after the sound driver is bound (0x47DAE0, from the
    // game's init at 0x32F250): it polls INTC_STAT for the vertical blank, 216
    // million reads in a 300 s run. Named, it waits asleep for the blank.
    ps2host::AddIdleLoop(0x0047DB38u);
}
