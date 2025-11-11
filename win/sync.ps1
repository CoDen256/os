param([Parameter(Position=1, Mandatory=$false)]
[string]$action="stow",
[Switch]$push
)

& "$PSScriptRoot\stow.ps1" $action -src $PSScriptRoot\..\cfg -dest $HOME yazi,wt,starship,ps
& "$PSScriptRoot\stow.ps1" $action -src $PSScriptRoot\..\cfg -dest C:\\ ahk

Write-Host "#####"
############# sync keymap
$base = Join-Path $HOME "AppData\Roaming\JetBrains"
$dest = "$PSScriptRoot\..\cfg\jetbrains\idea"

# Find all IntelliJIdea directories
$ideaDirs = Get-ChildItem -Path $base -Directory -Filter "IntelliJIdea*" | Sort-Object Name -Descending

if ($ideaDirs.Count -eq 0) {
    Write-Host "No IntelliJIdea directories found in $base" -ForegroundColor Red
    exit 1
}

# Pick the latest (by name)
$latestIdeaDir = $ideaDirs[0].FullName
Write-Host "Latest IntelliJ IDEA config folder: $latestIdeaDir" -ForegroundColor Cyan

# Build full source path
$src = Join-Path $latestIdeaDir "keymaps\zmk.xml"
$colors = Join-Path $latestIdeaDir "colors\_@user_GapStyle 4_3.icls"

# Check if the source file exists
if (Test-Path $src) {
    # Ensure destination directory exists
    if (-not (Test-Path $dest)) {
        New-Item -ItemType Directory -Path $dest -Force | Out-Null
    }

    # Copy file
    Copy-Item -Path $src -Destination $dest -Force
    Copy-Item -Path $colors -Destination $dest -Force
    Write-Host "Copied $src to $dest" -ForegroundColor Green
} else {
    Write-Host "Keymap file not found at $src" -ForegroundColor Yellow
}

######## sync flow-launcher
Write-Host "#####"
# Define base paths
$base = Join-Path $HOME "scoop\apps\flow-launcher\current"

# Find the app folder that starts with "app-" (e.g., app-2.0.2, app-2.1.0)
$appDir = Get-ChildItem -Path $base -Directory -Filter "app-*" | Sort-Object Name -Descending | Select-Object -First 1

if (-not $appDir) {
    Write-Host "No app-* folder found under $base" -ForegroundColor Red
    exit 1
}
$srcBase = Join-Path $appDir.FullName "UserData"
$destBase = "$PSScriptRoot\..\cfg\flow-launcher\UserData"

# Define paths to copy
$paths = @(
    @{ Src = Join-Path $srcBase "Settings\Settings.json"; Dest = Join-Path $destBase "Settings\Settings.json" },
    @{ Src = Join-Path $srcBase "Themes";                 Dest = $destBase }
)

foreach ($item in $paths) {
    $src = $item.Src
    $dest = $item.Dest

    if (Test-Path $src) {
        # Create destination directory if it doesn't exist
        $destDir = Split-Path $dest -Parent
        if (-not (Test-Path $destDir)) {
            New-Item -ItemType Directory -Path $destDir -Force | Out-Null
        }

        # Copy the file or folder
        Copy-Item -Path $src -Destination $dest -Recurse -Force
        Write-Host "Copied $src -> $dest" -ForegroundColor Green
    } else {
        Write-Host "Source not found: $src" -ForegroundColor Yellow
    }
}

# sync scoop
Write-Host "#####"
Write-Host "Syncing Scoop" -ForegroundColor Green
scoop update *

scoop export -c > "$PSScriptRoot\..\cfg\scoop\${Env:UserName}.json"

# sync scoop
Write-Host "#####"
Write-Host "Syncing Choco"  -ForegroundColor Green
choco upgrade all

choco export "$PSScriptRoot\..\cfg\choco\${Env:UserName}.xml"

# git push
if ($push){
    Write-Host "#####"
    $timestamp = (Get-Date).ToString('MM/dd/yyyy HH:mm:ss')
    $message = "sync at $timestamp"
    $repo = Resolve-Path "$PSScriptRoot\.."
    Write-Host "Git pushing $repo : '$message'" -ForegroundColor Green
    git -C $repo fetch origin
    git -C $repo add $repo
    git -C $repo commit -m $message
    git -C $repo push -u origin master
}