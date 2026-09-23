# scripts\*.txt dosyalarini Sanny Builder ile derler ve oyunun cleo klasorune kopyalar.
# Kullanim: powershell -ExecutionPolicy Bypass -File build.ps1

$ErrorActionPreference = 'Stop'
$root  = $PSScriptRoot
$sanny = 'D:\GTA-SA-DEA\araclar\SannyBuilder\sanny.exe'
$cleo  = 'D:\GTA-SA-DEA\oyun\cleo'
$out   = Join-Path $root 'build'

New-Item -ItemType Directory -Force $out | Out-Null
$failed = 0

foreach ($src in Get-ChildItem (Join-Path $root 'scripts') -Filter *.txt) {
    $cs = Join-Path $out ($src.BaseName + '.cs')
    if (Test-Path $cs) { Remove-Item $cs }

    $p = Start-Process $sanny -ArgumentList '--no-splash', '--mode', 'sa_sbl', '--compile', "`"$($src.FullName)`"", "`"$cs`"" -PassThru
    # Derleme hatasinda Sanny bir hata penceresi acip bekler; 30 sn icinde bitmezse hata say.
    if (-not $p.WaitForExit(30000)) {
        $p.Kill()
        Write-Host "HATA  $($src.Name) (derleme hatasi penceresi, ayrinti icin dosyayi Sanny Builder'da ac)"
        $failed++
        continue
    }
    if ((Test-Path $cs) -and $p.ExitCode -eq 0) {
        Copy-Item $cs $cleo -Force
        Write-Host "OK    $($src.Name) -> cleo\$($src.BaseName).cs"
    } else {
        Write-Host "HATA  $($src.Name) (exit $($p.ExitCode))"
        $failed++
    }
}

if ($failed) { exit 1 }
