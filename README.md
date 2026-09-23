# GTA SA: 1992 DEA

GTA San Andreas için hikâye modu. 1992 Los Santos'ta DEA ajanı Raymond Cross, eşinin kanser tedavisi için gereken parayı bulmaya çalışırken rozetiyle vicdanı arasında kalır.

Tasarım belgesi: [docs/GDD.md](docs/GDD.md)

## Gereksinimler

- GTA San Andreas **v1.0 US**
- CLEO 5 (Ultimate ASI Loader ile)
- SilentPatch, Mod Loader (önerilir)

## Geliştirme

Scriptler `scripts/` altında Sanny Builder 4 kaynak dosyaları (`.txt`) olarak durur.

```powershell
powershell -ExecutionPolicy Bypass -File build.ps1
```

Bu komut her scripti derleyip `.cs` dosyasını oyunun `cleo` klasörüne kopyalar. Derlenen dosyalar repoya eklenmez (`build/`).

| Script | Ne yapar |
|---|---|
| `dea_merhaba` | F7'ye basınca ekranda "RAY CROSS - DEA" yazar (kurulum testi) |
