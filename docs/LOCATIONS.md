# Locations

Recorded in-game with the `dev_locator` script (F9) on 2026-09-23. The single source used by scripts is [`scripts/include/locations.txt`](../scripts/include/locations.txt).

| # | Location | X | Y | Z | Heading | Interior | Zone |
|---|---|---|---|---|---|---|---|
| 1 | Cross family house (front door) | 2191.52 | -1275.61 | 25.16 | 2.5 | 0 | JEF2 |
| 2 | LSPD/DEA office (outside door) | 1553.53 | -1674.94 | 16.20 | 267.9 | 0 | PER1 |
| 2 | LSPD/DEA office (interior entry) | 246.78 | 63.90 | 1003.64 | 0.0 | 6 | — |
| 3 | Behind the Idlewood gas station | 1904.32 | -1795.20 | 13.54 | 273.8 | 0 | IWD3A |
| 4 | All Saints General Hospital entrance | 1177.39 | -1323.29 | 14.07 | 98.0 | 0 | MKT1 |
| 5 | Jefferson Motel (outside door) | 2231.42 | -1159.67 | 25.83 | 269.4 | 0 | JEF1A |
| 5 | Jefferson Motel (room interior) | 2240.04 | -1170.66 | 1029.80 | 93.3 | 15 | — |
| 6 | Ocean Docks container yard | 2781.21 | -2542.61 | 13.64 | 91.4 | 0 | LDOC4 |

Notes:
- Interior coordinates sit roughly 1000 units above the outside world; when teleporting there, the interior id must be set too (`set_area_visible`, `set_char_area_visible`).
- All Saints has no interior (GDD Open Decision #4).
- Heading is in degrees: 0 = north, 90 = west, 180 = south, 270 = east.
