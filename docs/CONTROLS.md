# Controls

## Mod keys

| Key | Action | Context |
|---|---|---|
| `T` | Interact: frisk, search a vehicle, cuff, put a suspect in the car, use an ATM | On foot |
| `B` | Field notebook | Anywhere |
| `P` | Brick phone | Anywhere |
| `M` | MDT car computer | In the DEA car |
| `Y` / `N` | Answer a decision screen | Decision screens |

All of them are unbound in SA's default PC controls. `Y` / `N` are SA's "conversation yes/no" keys, which the game only reads during conversations.

Developer tools (not shipped): `F7` install check, `F8` position overlay, `F9` save position, `F10` teleport through project locations, `F6` / `F11` / `F12` / `F4` story state test keys (see STATE.md), `7` / `8` / `9` force the next frisk outcome.

> Players who remap SA's controls could still collide with these keys. Making mod keys configurable (e.g. through an `.ini` file) is planned.

## SA default PC bindings

Read from the running game (gta_sa.exe 1.0 US) with `scripts/tools/dev_controls_dump.txt` on 2026-09-23. The table lives at `0xB70D08` (`ControlsManager` `0xB70198` + `m_actions` `0xB70`, 59 actions × 32 bytes; layout from [plugin-sdk](https://github.com/DK22Pac/plugin-sdk)).

| # | Action | Keyboard 1 | Keyboard 2 | Mouse |
|---|---|---|---|---|
| 0 | PED_FIREWEAPON | NUM0 | LCTRL | LMB |
| 1 | PED_FIREWEAPON_ALT | `\` | — | — |
| 2 | PED_CYCLE_WEAPON_RIGHT | E | NUMENTER | WHEEL DOWN |
| 3 | PED_CYCLE_WEAPON_LEFT | Q | NUM. | WHEEL UP |
| 4 | GO_FORWARD | UP | W | — |
| 5 | GO_BACK | DOWN | S | — |
| 6 | GO_LEFT | LEFT | A | — |
| 7 | GO_RIGHT | RIGHT | D | — |
| 8 | PED_SNIPER_ZOOM_IN | PGUP | X | WHEEL UP |
| 9 | PED_SNIPER_ZOOM_OUT | PGDN | Z | WHEEL DOWN |
| 10 | VEHICLE_ENTER_EXIT | ENTER | F | — |
| 11 | CAMERA_CHANGE_VIEW | V | HOME | — |
| 12 | PED_JUMPING | LSHIFT | RCTRL | — |
| 13 | PED_SPRINT | SPACE | — | — |
| 14 | PED_LOOKBEHIND | NUM1 | — | MMB |
| 15 | PED_DUCK | C | — | — |
| 16 | PED_ANSWER_PHONE | TAB | — | — |
| 17 | SNEAK_ABOUT | LALT | — | — |
| 18 | VEHICLE_FIREWEAPON | RCTRL | LALT | LMB |
| 19 | VEHICLE_FIREWEAPON_ALT | LCTRL | NUM0 | — |
| 20 | VEHICLE_STEERLEFT | A | LEFT | — |
| 21 | VEHICLE_STEERRIGHT | D | RIGHT | — |
| 22 | VEHICLE_STEERUP | UP | — | — |
| 23 | VEHICLE_STEERDOWN | DOWN | — | — |
| 24 | VEHICLE_ACCELERATE | W | — | — |
| 25 | VEHICLE_BRAKE | S | — | — |
| 26 | VEHICLE_RADIO_STATION_UP | INS | 4 | WHEEL UP |
| 27 | VEHICLE_RADIO_STATION_DOWN | DEL | R | WHEEL DOWN |
| 28 | VEHICLE_RADIO_TRACK_SKIP | F5 | — | — |
| 29 | VEHICLE_HORN | CAPS | H | — |
| 30 | TOGGLE_SUBMISSIONS | 2 | NUM+ | — |
| 31 | VEHICLE_HANDBRAKE | SPACE | RCTRL | — |
| 32 | PED_1RST_PERSON_LOOK_LEFT | NUM4 | — | — |
| 33 | PED_1RST_PERSON_LOOK_RIGHT | NUM6 | — | — |
| 34 | VEHICLE_LOOKLEFT | Q | — | — |
| 35 | VEHICLE_LOOKRIGHT | E | — | — |
| 36 | VEHICLE_LOOKBEHIND | — | — | MMB |
| 37 | VEHICLE_MOUSELOOK | — | — | RMB |
| 38 | VEHICLE_TURRETLEFT | NUM4 | — | — |
| 39 | VEHICLE_TURRETRIGHT | NUM6 | — | — |
| 40 | VEHICLE_TURRETUP | NUM2 | END | — |
| 41 | VEHICLE_TURRETDOWN | NUM8 | DEL | — |
| 42 | PED_CYCLE_TARGET_LEFT | `[` | — | — |
| 43 | PED_CYCLE_TARGET_RIGHT | `]` | — | — |
| 44 | PED_CENTER_CAMERA_BEHIND_PLAYER | `#` | — | — |
| 45 | PED_LOCK_TARGET | DEL | CAPS | RMB |
| 47 | CONVERSATION_YES | Y | — | — |
| 48 | CONVERSATION_NO | N | — | — |
| 49 | GROUP_CONTROL_FWD | G | — | — |
| 50 | GROUP_CONTROL_BWD | H | — | — |
| 51 | PED_1RST_PERSON_LOOK_UP | NUM2 | — | — |
| 52 | PED_1RST_PERSON_LOOK_DOWN | NUM8 | — | — |

Unlisted actions (46, 53–58) have no binding.

**Unbound letters:** B, I, J, K, L, M, O, P, T, U. **Unbound digits:** 1, 3, 5–9, 0. **Unbound function keys:** F1–F4, F6–F12 (F1–F4 may be used by other mods or overlays).
