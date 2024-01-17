Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

scoop install git
scoop bucket add extras
scoop bucket add games

scoop install brave

scoop install autohotkey
scoop install flow-launcher

scoop install notion
scoop install obsidian
scoop install vlc
scoop install sharex

scoop install steam
scoop install discord
scoop install telegram

# AUTOHOTKEY 2 #
cp win_layout_aou.ahk "$($env:APPDATA)\Microsoft\Windows\Start Menu\Programs\Startup"
New-Item -Path "$($env:APPDATA)\Microsoft\Windows\Start Menu\Programs\Startup\win_layout_aou.ahk" -ItemType SymbolicLink -Value win_layout_aou.ahk

# MICROSOFT BING #
curl https://go.microsoft.com/fwlink/?linkid=2126594 -o ~\Downloads\bing.exe
~\Downloads\bing.exe
rm ~\Downloads\bing.exe