<#
.SYNOPSIS
    Creates symlinks for JetBrains IDE keymaps from a central configuration file.
.DESCRIPTION
    This script finds all JetBrains IDE folders (IntelliJ, PyCharm, DataGrip) in a user's APPDATA directory,
    creates 'keymaps' folders if they don't exist, and creates symlinks to a central keymap configuration file.
.PARAMETER TargetUsername
    The username of the user whose APPDATA directory should be used (required when running as admin).
.PARAMETER KeymapSource
    The source keymap file to create symlinks to (default: C:\os\cfg\jetbrains\zmk\shortcuts\zmk.xml).
.EXAMPLE
    .\Configure-JetBrainsKeymaps.ps1 -TargetUsername "johndoe"
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$user,

    [string]$base = "C:\os"
)
# Function to get user's APPDATA path
function Get-UserAppDataPath {
    param (
        [string]$username
    )

    $appDataPath = "C:\Users\$username\AppData\Roaming"
    if (Test-Path -Path $appDataPath)
    {
        return $appDataPath
    }
    Write-Error "Failed to get APPDATA path for user '$username': $appDataPath does not exist"
    exit 1
}

$appDataPath = Get-UserAppDataPath -username $user
$KeymapSource = "$base\cfg\jetbrains\zmk\shortcuts\zmk.xml"
$LayoutSource = "$base\cfg\ahk\layout.ahk"
$TerminalSource = "$base\cfg\win-terminal\settings-work.json" # TODO work -> dev or smhth
$YaziSource = "$base\cfg\yazi\.config\yazi" # TODO work -> dev or smhth
$TargetAutorun = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"
$TerminalPath = "C:\Users\$user\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
$jetBrainsPath = Join-Path $appDataPath "JetBrains"
$YaziPath = "C:\Users\$user\.yazi"

# Verify the source keymap file exists
if (-not (Test-Path $KeymapSource)) {
    Write-Error "Keymap source file does not exist: $KeymapSource"
    exit 1
}

if (-not (Test-Path $jetBrainsPath)) {
    Write-Error "JetBrains folder not found in $jetBrainsPath"
    exit 1
}

# Patterns to match JetBrains IDE folders
$patterns = @("IntelliJIdea*", "PyCharm*", "DataGrip*")

# Find all matching folders
$ideFolders = Get-ChildItem -Path $jetBrainsPath -Directory |
        Where-Object { $_.Name -like "IntelliJIdea*" -or $_.Name -like "PyCharm*" -or $_.Name -like "DataGrip*" }

if ($ideFolders.Count -eq 0) {
    Write-Host "No JetBrains IDE folders found in $jetBrainsPath"
    exit 0
}

# Process each IDE folder
foreach ($folder in $ideFolders) {
    $keymapsPath = Join-Path $folder.FullName "keymaps"

    # Create keymaps directory if it doesn't exist
    if (-not (Test-Path $keymapsPath)) {
        try {
            New-Item -ItemType Directory -Path $keymapsPath -Force | Out-Null
            Write-Host "Created directory: $keymapsPath"
        }
        catch {
            Write-Error "Failed to create directory $keymapsPath : $_"
            continue
        }
    }

    $symlinkPath = Join-Path $keymapsPath "zmk.xml"

    # Create symlink (will overwrite if it exists)
    try {
        if (Test-Path $symlinkPath) {
            Remove-Item $symlinkPath -Force
        }

        $null = New-Item -ItemType SymbolicLink -Path $symlinkPath -Target $KeymapSource -Force
        Write-Host "Created symlink: $symlinkPath -> $KeymapSource"
    }
    catch {
        Write-Error "Failed to create symlink at $symlinkPath : $_"
        exit 1
    }
}

Write-Host "Keymap configuration completed for $($ideFolders.Count) JetBrains IDEs"


$AutorunPath = "$TargetAutorun\layout.ahk"
try
{
    $null = New-Item -ItemType SymbolicLink -Force -Path $AutorunPath -Target $LayoutSource
    Write-Host "Created symlink: $AutorunPath -> $LayoutSource"
}
catch
{
    Write-Error "Failed to create symlink at $AutorunPath -> $LayoutSource : $_"
    exit 1
}


$TerminalPathSettings = "$TerminalPath\settings.json"
try
{
    $null = New-Item -ItemType SymbolicLink -Force -Path $TerminalPathSettings -Target $TerminalSource
    Write-Host "Created symlink: $TerminalPathSettings -> $TerminalSource"
}
catch
{
    Write-Error "Failed to create symlink at $TerminalPathSettings -> $TerminalSource : $_"
    exit 1
}

try
{
    if (Test-Path $YaziPath) {
        Remove-Item $YaziPath -Force -Recurse
        Write-Host "Removed $YaziPath"
    }
    $null = New-Item -ItemType Junction -Force -Path $YaziPath -Target $YaziSource
    Write-Host "Created hardlink: $YaziPath -> $YaziSource"
}
catch
{
    Write-Error "Failed to create hardlink at $YaziPath -> $YaziSource : $_"
    exit 1
}