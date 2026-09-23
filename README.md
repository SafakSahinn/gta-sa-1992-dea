# GTA SA: 1992 DEA

A story mod for GTA San Andreas. Los Santos, 1992: DEA agent Raymond Cross needs $12,500 by Friday for his wife's cancer treatment — and the only legal way to earn it pays $15 a package. Somewhere between his badge and his conscience, a cartel lieutenant is waiting with a bag of cash.

> **Status:** early development (Phase 1 of 8). Nothing playable yet beyond developer tools.

- Design document: [docs/GDD.md](docs/GDD.md) · Turkish: [docs/tr/GDD.md](docs/tr/GDD.md)
- Recorded locations: [docs/LOCATIONS.md](docs/LOCATIONS.md)
- Controls and SA default bindings: [docs/CONTROLS.md](docs/CONTROLS.md)

## Languages

English is the primary language of the code and the game. Turkish dialogue is planned as an additional localization.

## Requirements

- GTA San Andreas **v1.0 US** (Steam / Rockstar Launcher copies must be downgraded)
- [CLEO 5](https://github.com/cleolibrary/CLEO5) with an ASI loader
- [SilentPatch](https://github.com/CookiePLMonster/SilentPatch) (recommended)

## Building

Scripts live in `scripts/` as [Sanny Builder 4](https://github.com/sannybuilder/dev) sources (`.txt`); shared files in `scripts/include/` are pulled in with `{$INCLUDE}`.

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
| `dev_locator` | Developer tool — F8 position overlay, F9 appends the position to `cleo\dea_locations.txt`, F10 teleports through the project locations |
| `dev_controls_dump` | Developer tool — writes the game's current key bindings to `cleo\dea_controls.txt` once after loading |
