param([Parameter(Position=1, Mandatory=$false)]
[string]$action="stow"
)

& "$PSScriptRoot\stow.ps1" $action -src $PSScriptRoot\..\cfg -dest $HOME yazi,wt
& "$PSScriptRoot\stow.ps1" $action -src $PSScriptRoot\..\cfg -dest C:\\ ahk
scoop update *
