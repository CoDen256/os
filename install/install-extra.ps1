############################################################## SCOOP AND GIT
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

scoop install git
scoop bucket add extras


######################################### AUTOHOTKEY 2 #

scoop install autohotkey

# AUTOHOTKEY 2 AUTOUPDATE #
# Also allow to run as admin for all users in the properties of AutoHotkeyUX.exe
# New-Item -Path "$($env:APPDATA)\Microsoft\Windows\Start Menu\Programs\Startup\win_layout_aou.vbs" -ItemType SymbolicLink -Value "win_layout_aou.vbs"
# .vbs is needed to run the ahk script as admin on startup, because some of the shortcuts are ignore inside the terminal
New-Item -Path "$($env:APPDATA)\Microsoft\Windows\Start Menu\Programs\Startup\win_layout_aou.ahk" -ItemType SymbolicLink -Value "win_layout_aou-extra.ahk"

# AUTOHOTKEY ONETIME INSTALL #
# cp "win_layout_aou.ahk" "$($env:APPDATA)\Microsoft\Windows\Start Menu\Programs\Startup\win_layout_aou.ahk" 



######################################### FLOW LAUNCHER #
scoop install flow-launcher

taskkill /f /im Flow*

Set-Variable -Name "FLOW_PATH" (Get-ChildItem -Dir -Path "~\scoop\apps\flow-launcher\current" -Filter 'app*').FullName

Remove-Item -Force -Recurse -Path "$FLOW_PATH\UserData\Plugins" 
Remove-Item -Force -Recurse -Path "$FLOW_PATH\UserData\Themes"
Remove-Item -Force -Recurse -Path "$FLOW_PATH\UserData\Settings"

New-Item -Path "$FLOW_PATH\UserData\Settings" -ItemType Junction -Value $PWD\flow-launcher\extra\Settings
New-Item -Path "$FLOW_PATH\UserData\Themes" -ItemType Junction -Value $PWD\flow-launcher\extra\Themes
New-Item -Path "$FLOW_PATH\UserData\Plugins" -ItemType Junction -Value $PWD\flow-launcher\extra\Plugins
Start-Process -FilePath "~\scoop\apps\flow-launcher\current\Flow.Launcher.exe" 

################################# SCOOP
mkdir ~\games

scoop install vscode 

scoop install powertoys
scoop install 7zip
scoop install notion
scoop install obsidian
scoop install vlc
scoop install treesize-free

scoop bucket add games

scoop install steam
scoop install discord
scoop install telegram

############################################################# GIT
# SSH #
# Add SSH keys to gitlab and github 
ssh-keygen -t rsa -b 4096 -C # "email@gmail.com"


################################################################# IDE SETUP
###### VS Code
code.exe

# 1. Login via Github
# 2. Turn the sync on


################################################### Terminal
# [Install fonts for windows if you are using zsh agnoster](https://slmeng.medium.com/how-to-install-powerline-fonts-in-windows-b2eedecace58):

git clone https://github.com/powerline/fonts
Set-ExecutionPolicy Bypass
.\fonts\install.ps1
Remove-Item -Force -Recurse -Path "fonts" 
 

# Use `settings.json` in Windows terminal

New-Item -Path "C:\Users\denys\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -ItemType SymbolicLink -Value .\win-terminal\settings-extra.json -Force



# Bing Wallpapers #
curl https://go.microsoft.com/fwlink/?linkid=2126594 -o ~\Downloads\bing.exe
~\Downloads\bing.exe
rm ~\Downloads\bing.exe