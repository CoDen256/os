# GIT #
cp git-configs/.gitconfig ~/.gitconfig
cp git-configs/.default.gitconfig ~/.default.gitconfig

##  if needed
##  cp .alpha.gitconfig ~/.alpha.gitconfig
##  edit ~/.gitconfig ~/.default.gitconfig ~/.alpha.gitconfig


# FLOW LAUNCHER #
taskkill /f /im Flow*

Set-Variable -Name "FLOW_PATH" (Get-ChildItem -Dir -Path "$($env:USERPROFILE)\scoop\apps\flow-launcher\current\" -Filter 'app*').FullName

Remove-Item -Force -Recurse -Path "$FLOW_PATH\UserData\Plugins" 
Remove-Item -Force -Recurse -Path "$FLOW_PATH\UserData\Themes"
Remove-Item -Force -Recurse -Path "$FLOW_PATH\UserData\Settings"

New-Item -Path "$FLOW_PATH\UserData\Settings" -ItemType Junction -Value $PWD\flow-launcher\Settings
New-Item -Path "$FLOW_PATH\UserData\Themes" -ItemType Junction -Value $PWD\flow-launcher\Themes
New-Item -Path "$FLOW_PATH\UserData\Plugins" -ItemType Junction -Value $PWD\flow-launcher\Plugins
Start-Process -FilePath "$($env:USERPROFILE)\scoop\apps\flow-launcher\current\Flow.Launcher.exe"

# WSL 2 #
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --update
wsl --set-default-version 2
wsl --install -d Ubuntu-22.04

###### Terminal
# [Install fonts for windows if you are using zsh agnoster](https://slmeng.medium.com/how-to-install-powerline-fonts-in-windows-b2eedecace58):

git clone https://github.com/powerline/fonts
Set-ExecutionPolicy Bypass
.\fonts\install.ps1
Remove-Item -Force -Recurse -Path "fonts" 
 

# Use `settings.json` in Windows terminal

New-Item -Path "$($env:LOCALAPPDATA)\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -ItemType SymbolicLink -Value .\win-terminal\settings.json -Force

# Terminal Ubuntu zsh + oh my zsh

wsl sudo apt update
wsl sudo apt install git zsh -y
wsl sh -c '$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)'


# [Terminal Ubuntu zsh Pure](https://turlucode.com/oh-my-zsh-installation-guide/)

wsl git clone https://github.com/sindresorhus/pure ~/.oh-my-zsh/custom/pure
wsl ln -s ~/.oh-my-zsh/custom/pure/pure.zsh ~/.oh-my-zsh/custom
wsl ln -s ~/.oh-my-zsh/custom/pure/async.zsh ~/.oh-my-zsh/custom
wsl sed -i s/robbyrussel/refined/g ~/.zshrc                     # change ZSH_THEME to refined

###### VS Code
vscode.exe

# 1. Login via Github
# 2. Turn the sync on


###### Jetbrains Toolbox ###
jetbrains-toolbox.exe

# - IntelliJ
# - DataGrip
# - Pycharm
# - Android Studio

# 1. Login via Jetbrains account
# 2. E.g. IntelliJ -> File -> Manage IDE Settings -> Settings Sync


###### XODO PDF
# [Install via Microsoft store](
Start-Process "ms-windows-store://pdp?hl=en-us&gl=ps&productid=9WZDNCRDJXP4&mode=mini&pos=5%2C6%2C1920%2C902&referrer=storeforweb&source=https%3A%2F%2Fwww.google.com%2F"

###### Bing Wallpapers
curl https://go.microsoft.com/fwlink/?linkid=2126594 -o ~\Downloads\bing.exe
~\Downloads\bing.exe
rm ~\Downloads\bing.exe


######
New-Item -Path "$($env:USERPROFILE)\OneDrive\Documents\MobaXTerm.ini" -ItemType HardLink -Value "$($env:USERPROFILE)\scoop\apps\MobaXterm\current\MobaXTerm.ini" # to create backup from existing
New-Item -Path "$($env:USERPROFILE)\scoop\apps\MobaXterm\current\MobaXTerm.ini" -ItemType HardLink -Value "$($env:USERPROFILE)\OneDrive\Documents\MobaXTerm.ini" # to create new from backup