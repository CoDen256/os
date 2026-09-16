param([Parameter(Position=1, Mandatory=$false)]
[string]$action="stow",
[Switch]$push
)

function Copy-ConfigFile {
    param(
        [Parameter(Mandatory)]
        [string]$Src,

        [Parameter(Mandatory)]
        [string]$Dest
    )

    if (Test-Path $Src) {
        if (-not (Test-Path $Dest)) {
            New-Item -ItemType Directory -Path $Dest -Force | Out-Null
        }

        Copy-Item -Path $Src -Destination $Dest -Force
        Write-Host "Copied $Src to $Dest" -ForegroundColor Green
    } else {
        Write-Host "File not found at $Src" -ForegroundColor Yellow
    }
}
$idea_base = Join-Path $HOME "scoop\apps\idea\current\"
& "$PSScriptRoot\stow.ps1" $action -src $PSScriptRoot\..\cfg -dest $HOME yazi,wt,starship,ps -force
& "$PSScriptRoot\stow.ps1" $action -src $PSScriptRoot\..\cfg -dest C:\\ ahk
& "$PSScriptRoot\stow.ps1" $action -src $PSScriptRoot\..\cfg\jetbrains\ -dest $idea_base idea
Write-Host "#####"


######## sync flow-launcher TODO: symlink is better
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

scoop export -c > "$PSScriptRoot\..\cfg\scoop\${Env:COMPUTERNAME}.json"

# sync scoop
Write-Host "#####"
Write-Host "Syncing Choco"  -ForegroundColor Green
choco upgrade all

choco export "$PSScriptRoot\..\cfg\choco\${Env:COMPUTERNAME}.config"

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