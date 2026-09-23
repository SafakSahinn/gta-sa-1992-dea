# Mekân Konumları

Oyunda `dea_konum` scriptiyle (F9) kaydedildi, 2026-09-23. Scriptlerde kullanılan tek kaynak: [`scripts/include/konumlar.txt`](../scripts/include/konumlar.txt).

| # | Mekân | X | Y | Z | Yön | İç mekân | Bölge | Durum |
|---|---|---|---|---|---|---|---|---|
| 1 | Cross ailesinin evi (kapı önü) | 2191.52 | -1275.61 | 25.16 | 2.5 | 0 | JEF2 | Kaydedildi |
| 2 | LSPD/DEA bürosu (iç mekân girişi) | 246.78 | 63.90 | 1003.64 | 0.0 | 6 | — | Kaydedildi |
| 2 | LSPD/DEA bürosu (dış kapı) | ~1541 | ~-1675 | — | — | 0 | Pershing Sq. | **Yaklaşık, kaydedilecek** |
| 3 | Idlewood benzinliğinin arkası | 1904.32 | -1795.20 | 13.54 | 273.8 | 0 | IWD3A | Kaydedildi |
| 4 | All Saints General Hospital girişi | 1177.39 | -1323.29 | 14.07 | 98.0 | 0 | MKT1 | Kaydedildi |
| 5 | Jefferson Motel (oda içi) | 2240.04 | -1170.66 | 1029.80 | 93.3 | 15 | — | Kaydedildi |
| 5 | Jefferson Motel (dış kapı) | ~2229 | ~-1160 | — | — | 0 | Jefferson | **Yaklaşık, kaydedilecek** |
| 6 | Ocean Docks konteyner alanı | 2781.21 | -2542.61 | 13.64 | 91.4 | 0 | LDOC4 | Kaydedildi |

Notlar:
- İç mekân koordinatları dış dünyadan ~1000 birim yukarıdadır; oraya ışınlarken `set_area_visible` ile iç mekân numarası da verilmelidir.
- All Saints'in iç mekânı yoktur (GDD Açık Karar #4).
