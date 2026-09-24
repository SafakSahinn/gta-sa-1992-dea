# GTA SA: 1992 DEA

A story mod for GTA San Andreas. Los Santos, 1992: DEA agent Raymond Cross needs $12,500 by Friday for his wife's cancer treatment — and the only legal way to earn it pays $15 a package. Somewhere between his badge and his conscience, a cartel lieutenant is waiting with a bag of cash.

> **Status:** early development — Phases 0–2 done, Phase 3 (police mechanics) next. Nothing playable yet beyond developer tools.

- Design document: [docs/GDD.md](docs/GDD.md) · Turkish: [docs/tr/GDD.md](docs/tr/GDD.md)
- Recorded locations: [docs/LOCATIONS.md](docs/LOCATIONS.md)
- Controls and SA default bindings: [docs/CONTROLS.md](docs/CONTROLS.md)
- Story state (balance, day, deadline, corruption): [docs/STATE.md](docs/STATE.md)

## Roadmap

| Phase | Goal | Status |
|---|---|---|
| 0 | Tooling: downgrade to 1.0 US, CLEO 5, Sanny Builder, build script, first script | Done |
| 1 | Survey: record locations, check key bindings | Done (Turkish font test postponed to localization) |
| 2 | Story state: balance, story day, deadline countdown, corruption, save/load | Done |
| 3 | Police mechanics prototype: frisk, surrender/flee/fight, chase, cuff, turn in, use-of-force rule | In progress (frisk + dice done) |
| 4 | UI: pager, field notebook, ATM, brick phone, MDT | Planned |
| 5 | Mission 1: Routine Patrol and Balance Shock | Planned |
| 6 | Mission 2 + Free Patrol Day | Planned |
| 7 | Mission 3 + fate screen | Planned |
| 8 | Testing and first release (Chapters 1–2) | Planned |

## Languages

English is the primary language of the code and the game. Turkish dialogue is planned as an additional localization.

## Requirements

- GTA San Andreas **v1.0 US** (Steam / Rockstar Launcher copies must be downgraded)
- [CLEO 5](https://github.com/cleolibrary/CLEO5) with an ASI loader
- [SilentPatch](https://github.com/CookiePLMonster/SilentPatch) (recommended)

## Building

Scripts live in `scripts/` as [Sanny Builder 4](https://github.com/sannybuilder/dev) sources (`.txt`); shared files in `scripts/include/` are pulled in with `{$INCLUDE}`. One-off tools in `scripts/tools/` are not built automatically (`dev_controls_dump` writes the game's current key bindings to `cleo\dea_controls.txt`).

1. Tell the build where your game and Sanny Builder are — create `build.local.ps1` (not committed):
   ```powershell
   $GameDir  = 'C:\Games\GTA San Andreas'
   $SannyExe = 'C:\Tools\SannyBuilder\sanny.exe'
   ```
   or set the `GTASA_DIR` / `SANNY_EXE` environment variables, or pass `-GameDir` / `-SannyExe`.
2. Run:
   ```powershell
   powershell -ExecutionPolicy Bypass -File build.ps1
   ```
   Every script is compiled into `build/` and the `.cs` file is copied into the game's `cleo` folder. Compiled files are not committed.

> **Sanny Builder pitfall:** the command-line compiler can silently drop lines — e.g. a variable named after a built-in class (`hud`, `file`, `zone`...) or an unrecognized enum constant. Use compound camelCase names and verify important scripts with `sanny.exe --no-splash --mode sa_sbl --decompile in.cs out.txt`.

## Scripts

| Script | Purpose |
|---|---|
| `dea_hello` | Installation check — press F7 to show "RAY CROSS - DEA" |
| `dea_state` | Story state manager — applies starting values on a new game, advances the story day at midnight |
| `dea_police` | Police mechanics (in progress) — T next to a pedestrian: stop and frisk; 70% surrender, 20% flee, 10% draws a pistol |
| `dev_locator` | Developer tool — F8 position overlay, F9 appends the position to `cleo\dea_locations.txt`, F10 teleports through the project locations |
| `dev_state_hud` | Developer tool — story state overlay; F6 +$100, F11 +1 hour, F12 +5 corruption, F4 reset; 7/8/9 force the next frisk outcome |
