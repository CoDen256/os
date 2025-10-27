<#
.SYNOPSIS
    Simple GNU stow-like implementation in PowerShell.

.DESCRIPTION
    This script allows you to stow (symlink) and unstow (remove) packages
    from a 'src' directory into a target directory.
#>
param(
    [Parameter(Position=0, Mandatory=$true)]
    [ValidateSet("stow", "unstow")]
    [string]$Action,

    [Parameter(Position=1, Mandatory=$true)]
    [string]$src,

    [Parameter(Position=2, Mandatory=$false)]
    [string]$dest = "$HOME",

    [Parameter(Position=3, Mandatory=$true)]
    [string[]]$pkgs
)

function New-SafeSymlink {
    param(
        [string]$Source,
        [string]$Destination
    )

    if (Test-Path $Destination) {
        Write-Host "⚠️ Skipping existing: $Destination"
        return
    }

    # Create parent directories as needed
    $parent = Split-Path $Destination
    if (!(Test-Path $parent)) {
        Write-Host "Creating $parent for $Destination"
        New-Item -ItemType Directory -Force -Path $parent | Out-Null
    }

    Write-Host "✅ Linked $Destination -> $Source"
    New-Item -ItemType SymbolicLink -Path $Destination -Target $Source | Out-Null
}

function Cleanup {
    param(
        [string]$src
    )
    $parent = Split-Path $src
    if (-not (Get-ChildItem -Path $parent)) {
        Write-Host "🗑️ Removing empty folder: $parent"
        Remove-Item $parent
        Cleanup $parent
    }
}

function Remove-Symlink {
    param(
        [string]$Destination
    )
    if (Test-Path $Destination) {
        Remove-Item -Force $Destination
        Write-Host "❌ Removed link: $Destination"

        Cleanup -src $Destination
    }
}

function Invoke-Stow {
    param(
        [string]$src,
        [string]$dest,
        [string]$pkg
    )

    $PkgPath = Join-Path $src $pkg
    Write-Host "Stowing $PkgPath to $dest"
    if (!(Test-Path $PkgPath)) {
        Write-Host "❌ Package not found: $pkg"
        return
    }

    Get-ChildItem -Path $PkgPath -Recurse | ForEach-Object {
        if (-not $_.PSIsContainer) {
            $relPath = $_.FullName.Substring($PkgPath.Length).TrimStart('\')
            $resolved = Join-Path $dest $relPath
            New-SafeSymlink -Source $_.FullName -Destination $resolved
        }
    }
    Write-Host ""
}

function Invoke-Unstow {
    param(
        [string]$src,
        [string]$dest,
        [string]$pkg
    )

    $PkgPath = Join-Path $src $pkg
    if (!(Test-Path $PkgPath)) {
        Write-Host "❌ Package not found: $pkg"
        return
    }

    Get-ChildItem -Path $PkgPath -Recurse | ForEach-Object {
        if (-not $_.PSIsContainer)
        {
            $relPath = $_.FullName.Substring($PkgPath.Length).TrimStart('\')
            $resolved = Join-Path $dest $relPath
            Remove-Symlink -Destination $resolved
        }
    }
    Write-Host ""
}

# --- Main Execution ---

$userRole = [Security.Principal.WindowsIdentity]::GetCurrent()
$adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator
$userStatus = [Security.Principal.WindowsPrincipal]::new($userRole)
if (!($userStatus.IsInRole($adminRole))) {
    Write-Error -Category PermissionDenied 'You need administration permissions'
    exit 5 # 5 is the 'Access denied.' error code (net helpmsg 5)
}

if (-not $pkgs) {
    $pkgs = Get-ChildItem -Directory -Path $src | Select-Object -ExpandProperty Name
}

foreach ($pkg in $pkgs) {
    switch ($Action) {
        "stow"   { Invoke-Stow -src (Resolve-Path $src).Path -dest (Resolve-Path $dest).Path -pkg $pkg  }
        "unstow" { Invoke-Unstow -src (Resolve-Path $src).Path -dest (Resolve-Path $dest).Path -pkg $pkg }
    }
}
