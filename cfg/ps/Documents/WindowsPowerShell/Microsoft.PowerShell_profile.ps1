Invoke-Expression (&starship init powershell)

Remove-Item Alias:ls -Force
Remove-Item Alias:cat -Force

function ls {
    eza.exe --icons --sort=name --group-directories-first @args
}

function cat {
    bat.exe @args
}

Set-Alias "sync" "C:\os\win\sync.ps1"
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
