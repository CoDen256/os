############################################################## FLOW LAUNCHER #
taskkill /f /im Flow*

Set-Variable -Name "FLOW_PATH" (Get-ChildItem -Dir -Path "~\scoop\apps\flow-launcher\current" -Filter 'app*').FullName

Remove-Item -Force -Recurse -Path "$FLOW_PATH\UserData\Plugins"
Remove-Item -Force -Recurse -Path "$FLOW_PATH\UserData\Themes"
Remove-Item -Force -Recurse -Path "$FLOW_PATH\UserData\Settings"

New-Item -Path "$FLOW_PATH\UserData\Settings" -ItemType Junction -Value $PWD\flow-launcher\dev\Settings
New-Item -Path "$FLOW_PATH\UserData\Themes" -ItemType Junction -Value $PWD\flow-launcher\dev\Themes
New-Item -Path "$FLOW_PATH\UserData\Plugins" -ItemType Junction -Value $PWD\flow-launcher\dev\Plugins
Start-Process -FilePath "~\scoop\apps\flow-launcher\current\Flow.Launcher.exe"


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

# Terminal Ubuntu zsh + oh my zsh

wsl sudo apt update
wsl sudo apt install git zsh -y
wsl sh -c '$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)'


# [Terminal Ubuntu zsh Pure](https://turlucode.com/oh-my-zsh-installation-guide/)

wsl git clone https://github.com/sindresorhus/pure ~/.oh-my-zsh/custom/pure
wsl ln -s ~/.oh-my-zsh/custom/pure/pure.zsh ~/.oh-my-zsh/custom
wsl ln -s ~/.oh-my-zsh/custom/pure/async.zsh ~/.oh-my-zsh/custom
wsl sed -i s/robbyrussel/refined/g ~/.zshrc                     # change ZSH_THEME to refined

################################################### YAZI
$env:YAZI_FILE_ONE = "$( $env:USERPROFILE )\scoop\apps\git\current\usr\bin\file.exe"
$env:YAZI_CONFIG_HOME = "$HOME\.config\yazi"

############################################################## EXTRA

# Bing Wallpapers #
curl https://go.microsoft.com/fwlink/?linkid=2126594 -o ~\Downloads\bing.exe
~\Downloads\bing.exe
rm ~\Downloads\bing.exe


# XODO PDF #
# [Install via Microsoft store](
Start-Process "ms-windows-store://pdp?hl=en-us&gl=ps&productid=9WZDNCRDJXP4&mode=mini&pos=5%2C6%2C1920%2C902&referrer=storeforweb&source=https%3A%2F%2Fwww.google.com%2F"


############################################################### IDE SETUP
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