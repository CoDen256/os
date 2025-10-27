Invoke-Expression (&starship init powershell)

Remove-Item Alias:ls -Force

function ls {
    eza.exe --icons --sort=name --group-directories-first @args
}

Set-Alias "sync" "C:\os\win\sync.ps1"
