# Compiles scripts\*.txt with Sanny Builder 4 and copies the .cs files into the game's cleo folder.
#
# Usage:
#   powershell -ExecutionPolicy Bypass -File build.ps1
#
# Paths come from (first match wins):
#   1. parameters:   build.ps1 -GameDir "C:\Games\GTA San Andreas" -SannyExe "C:\Tools\SannyBuilder\sanny.exe"
#   2. environment:  GTASA_DIR, SANNY_EXE
#   3. build.local.ps1 next to this file (not committed), e.g.
#        $GameDir  = 'C:\Games\GTA San Andreas'
#        $SannyExe = 'C:\Tools\SannyBuilder\sanny.exe'

param(
    [string]$GameDir = $env:GTASA_DIR,
    [string]$SannyExe = $env:SANNY_EXE
)

$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot

$localConfig = Join-Path $root 'build.local.ps1'
if ((-not $GameDir -or -not $SannyExe) -and (Test-Path $localConfig)) {
    $cliGameDir = $GameDir; $cliSannyExe = $SannyExe
    . $localConfig
    if ($cliGameDir) { $GameDir = $cliGameDir }
    if ($cliSannyExe) { $SannyExe = $cliSannyExe }
}

if (-not $SannyExe -or -not (Test-Path $SannyExe)) { throw "Sanny Builder not found. Set -SannyExe, SANNY_EXE or build.local.ps1." }
$cleoDir = Join-Path $GameDir 'cleo'
if (-not $GameDir -or -not (Test-Path $cleoDir)) { throw "CLEO folder not found in '$GameDir'. Set -GameDir, GTASA_DIR or build.local.ps1." }

$outDir = Join-Path $root 'build'
New-Item -ItemType Directory -Force $outDir | Out-Null
$failed = 0

# Only top-level files are scripts; scripts\include\ holds shared files pulled in with {$INCLUDE}.
foreach ($src in Get-ChildItem (Join-Path $root 'scripts') -Filter *.txt -File) {
    $cs = Join-Path $outDir ($src.BaseName + '.cs')
    if (Test-Path $cs) { Remove-Item $cs }

    $p = Start-Process $SannyExe -ArgumentList '--no-splash', '--mode', 'sa_sbl', '--compile', "`"$($src.FullName)`"", "`"$cs`"" -PassThru
    # On a compile error Sanny opens an error dialog and waits; treat a 30 s hang as a failure.
    if (-not $p.WaitForExit(30000)) {
        $p.Kill()
        Write-Host "FAIL  $($src.Name) (compile error dialog - open the file in Sanny Builder for details)"
        $failed++
        continue
    }
    if ((Test-Path $cs) -and $p.ExitCode -eq 0) {
        Copy-Item $cs $cleoDir -Force
        Write-Host "OK    $($src.Name) -> cleo\$($src.BaseName).cs"
    } else {
        Write-Host "FAIL  $($src.Name) (exit $($p.ExitCode))"
        $failed++
    }
}

if ($failed) { exit 1 }
