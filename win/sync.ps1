param([Parameter(Position=1, Mandatory=$false)]
[string]$action="stow"
)

& "$PSScriptRoot\stow.ps1" $action -src $PSScriptRoot\..\cfg -dest $HOME yazi,wt,starship
& "$PSScriptRoot\stow.ps1" $action -src $PSScriptRoot\..\cfg -dest C:\\ ahk

scoop update *


# sync keymap


# sync flow-launcher


# sync scoop