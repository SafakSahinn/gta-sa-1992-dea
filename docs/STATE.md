# Story State

Every mission reads and changes one shared story state instead of keeping its own numbers. Slots and rules are defined once in [`scripts/include/state.txt`](../scripts/include/state.txt).

## Storage

The values live in **CLEO shared variables** (`SET_CLEO_SHARED_VAR` / `GET_CLEO_SHARED_VAR`, 1024 slots). From the CLEO 5 source (`CScriptEngine::SaveState` / `LoadState`):

- when the game is saved, all 1024 slots are written to `cleo\cleo_saves\cs<slot>.sav` next to the game's own save;
- when a slot is loaded, they are read back;
- on a new game they are zeroed.

So any script can read the values, and they follow the player's save slot without extra code. The mod uses slots **900–919**.

| Slot | Constant | Meaning |
|---|---|---|
| 900 | `SV_INITIALIZED` | 0 = new game or a save without mod data, 1 = starting values applied |
| 901 | `SV_BALANCE` | Ray's bank balance in dollars. Separate from SA's own cash, which the story treats as off-the-books cash |
| 902 | `SV_CORRUPTION` | 0–100. Honor shown to the player = 100 − corruption |
| 903 | `SV_STORY_DAY` | 0 = Wednesday, 1 = Thursday, 2 = Friday, 3+ = after the deadline |
| 904 | `SV_LAST_CLOCK` | Game clock (minutes since midnight) seen last; used to detect midnight |

## Rules

- **Starting values** (applied by `dea_state` when `SV_INITIALIZED` is 0): balance $450, corruption 0, Wednesday.
- **Story day** advances when the clock drops by more than 12 hours between two checks — i.e. it passed midnight (including sleeping or skipping time across midnight). SA's own weekday is not used.
- **Deadline:** Friday 10:00. Minutes left = `(2 − day) × 1440 + 600 − clock`, never below 0.
- **Corruption tiers:** 0–24 clean, 25–49 grey, 50–74 dirty, 75–100 baron.
- **Game clock speed:** SA's default, 1 game minute = 1 real second. Missions set the clock explicitly at the start of each scene (GDD section 3.2).

## Developer overlay (`dev_state_hud`)

Shown under the wanted stars: balance, corruption and tier, story day and clock, time left until the deadline.

| Key | Effect |
|---|---|
| F6 | +$100 balance |
| F11 | Clock +1 hour (crossing midnight advances the story day) |
| F12 | +5 corruption |
| F4 | Reset: Wednesday 07:30, $450, corruption 0 |
