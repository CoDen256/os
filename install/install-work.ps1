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

# AUTOHOTKEY ONETIME INSTALL #
cp "win_layout_aou.ahk" "$($env:APPDATA)\Microsoft\Windows\Start Menu\Programs\Startup\win_layout_aou.ahk" 



######################################### FLOW LAUNCHER #
scoop install flow-launcher

taskkill /f /im Flow*

Set-Variable -Name "FLOW_PATH" (Get-ChildItem -Dir -Path "~\scoop\apps\flow-launcher\current" -Filter 'app*').FullName

Remove-Item -Force -Recurse -Path "$FLOW_PATH\UserData\Plugins" 
Remove-Item -Force -Recurse -Path "$FLOW_PATH\UserData\Themes"
Remove-Item -Force -Recurse -Path "$FLOW_PATH\UserData\Settings"

New-Item -Path "$FLOW_PATH\UserData\Settings" -ItemType Junction -Value $PWD\flow-launcher\work\Settings
New-Item -Path "$FLOW_PATH\UserData\Themes" -ItemType Junction -Value $PWD\flow-launcher\work\Themes
New-Item -Path "$FLOW_PATH\UserData\Plugins" -ItemType Junction -Value $PWD\flow-launcher\work\Plugins
Start-Process -FilePath "~\scoop\apps\flow-launcher\current\Flow.Launcher.exe" 

########################################## SCOOP APPS #

mkdir C:\ome

scoop install jetbrains-toolbox 
scoop install vscode 

scoop install powertoys
scoop install 7zip
scoop install notion
scoop install obsidian
scoop install vlc
scoop install sharex
scoop install treesize-free

scoop bucket add java
scoop bucket add versions

scoop install openjdk21
scoop install kotlin
scoop install maven
scoop install mvndaemon extras/vcredist2022
scoop install gradle
scoop install python312
scoop install nvm
nvm install --lts

scoop install gtools
scoop install openssl
scoop install curl
scoop install keystore-explorer

scoop install postman
scoop install mobaxterm

scoop install slack
scoop install googlechrome

scoop install kubectl
scoop install helm
scoop install krew
scoop install aws
scoop install aws-iam-authenticator
scoop install eksctl
scoop install lens

################################################## SHORTCUTS
# Copy Shortcuts to Start Menu:
Set-Variable -Name "PROG" "$($env:APPDATA)\Microsoft\Windows\Start Menu\Programs\"

cp "$PROG\Scoop Apps\ShareX.lnk" "$PROG\Startup\"
cp "$PROG\Scoop Apps\Slack.lnk" "$PROG\Startup\"
cp "$PROG\Scoop Apps\Google Chrome.lnk" "$PROG\Startup\"
cp "$PROG\Jetbrains Toolbox\Jetbrains Toolbox.lnk" "$PROG\Startup\"
cp "$PROG\Jetbrains Toolbox\IntelliJ IDEA Ultimate.lnk" "$PROG\Startup\"
cp "C:\ProgramData\Microsoft\Windows\Start Menu\Docker Desktop.lnk" "$PROG\Startup\"



################################################### GIT #
cp git-config/.gitconfig ~/.gitconfig
cp git-config/.default.gitconfig ~/.default.gitconfig

##  if needed
##  cp .alpha.gitconfig ~/.alpha.gitconfig
##  edit ~/.gitconfig ~/.default.gitconfig ~/.alpha.gitconfig


# SSH #
# Add SSH keys to gitlab and github 
ssh-keygen -t rsa -b 4096 -C # "email@gmail.com"


##################################################### WSL 2 #
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism.exe /online /enable-feature /featurename:Microsoft-Hyper-V /all
bcdedit /set hypervisorlaunchtype Auto

wsl --update
wsl --set-default-version 2
wsl --install -d Ubuntu-22.04

################################################### Terminal
# [Install fonts for windows if you are using zsh agnoster](https://slmeng.medium.com/how-to-install-powerline-fonts-in-windows-b2eedecace58):

git clone https://github.com/powerline/fonts
Set-ExecutionPolicy Bypass
.\fonts\install.ps1
Remove-Item -Force -Recurse -Path "fonts" 
 

# Use `settings.json` in Windows terminal

New-Item -Path "C:\Users\denys\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -ItemType SymbolicLink -Value .\win-terminal\settings-work.json -Force

# Terminal Ubuntu zsh + oh my zsh

wsl sudo apt update
wsl sudo apt install git zsh -y
wsl sh -c '$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)'


# [Terminal Ubuntu zsh Pure](https://turlucode.com/oh-my-zsh-installation-guide/)

wsl git clone https://github.com/sindresorhus/pure ~/.oh-my-zsh/custom/pure
wsl ln -s ~/.oh-my-zsh/custom/pure/pure.zsh ~/.oh-my-zsh/custom
wsl ln -s ~/.oh-my-zsh/custom/pure/async.zsh ~/.oh-my-zsh/custom
wsl sed -i s/robbyrussel/refined/g ~/.zshrc                     # change ZSH_THEME to refined


################################################################# IDE SETUP
###### VS Code
code.exe

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


######################################################## XODO PDF
# [Install via Microsoft store](
Start-Process "ms-windows-store://pdp?hl=en-us&gl=ps&productid=9WZDNCRDJXP4&mode=mini&pos=5%2C6%2C1920%2C902&referrer=storeforweb&source=https%3A%2F%2Fwww.google.com%2F"


######################################################## MobaXTerm
New-Item -Path "$($env:USERPROFILE)\OneDrive\docs\MobaXTerm.ini" -ItemType HardLink -Value "$($env:USERPROFILE)\scoop\apps\MobaXterm\current\MobaXTerm.ini" # to create backup from existing local
New-Item -Path "$($env:USERPROFILE)\scoop\apps\mobaxterm\current\MobaXTerm.ini" -ItemType HardLink -Value "$($env:USERPROFILE)\OneDrive\docs\MobaXTerm.ini" # to create new from backup


############################################################  Verify
mvn -v
gradle -v
java -version
kotlinc -version
python --version
git --version
7z
python --version


############################################################## EXTRA

# Bing Wallpapers #
curl https://go.microsoft.com/fwlink/?linkid=2126594 -o ~\Downloads\bing.exe
~\Downloads\bing.exe
rm ~\Downloads\bing.exe