### SYSTEM WIDE INSTALLATION, done once ###

### SSH setup
Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*'
Get-Service -Name ssh-agent | Set-Service -StartupType Automatic
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0


### Scoop and must-have apps
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

scoop install git -g
scoop bucket add extras

### Setup folder
git clone git@github.com:CoDen256/os-setup.git C:\setup
cd C:\setup
git config core.autocrlf true                               # for this setup project only
git config user.email den.blackshov@gmail.com               # for this setup project only
git config user.name Denys Chernyshov                       # for this setup project only


# FLOW LAUNCHER #
# (System wide with embedded python)
scoop install flow-launcher -g

taskkill /f /im Flow*

Set-Variable -Name "FLOW_PATH" (Get-ChildItem -Dir -Path "C:\ProgramData\scoop\apps\flow-launcher\current" -Filter 'app*').FullName

Remove-Item -Force -Recurse -Path "$FLOW_PATH\UserData\Plugins" 
Remove-Item -Force -Recurse -Path "$FLOW_PATH\UserData\Themes"
Remove-Item -Force -Recurse -Path "$FLOW_PATH\UserData\Settings"

New-Item -Path "$FLOW_PATH\UserData\Settings" -ItemType Junction -Value $PWD\flow-launcher\Settings
New-Item -Path "$FLOW_PATH\UserData\Themes" -ItemType Junction -Value $PWD\flow-launcher\Themes
New-Item -Path "$FLOW_PATH\UserData\Plugins" -ItemType Junction -Value $PWD\flow-launcher\Plugins
Start-Process -FilePath "C:\ProgramData\scoop\apps\flow-launcher\current\Flow.Launcher.exe" 


# System wide Apps (for saving space) #
scoop install jetbrains-toolbox -g
scoop install vscode -g 

### Install choco & choco packages system wide
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation
choco install packages.config

# Move Shortrcuts on Startup 
# C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup
# Flow Launcher
# Docker Desktop

### For each user:
### ./shared-all.ps1
### ./install-home.ps1
### OR
### ./shared-all.ps1
### ./shared-work-dev.ps1
### ./install-dev.ps1
### OR
### ./shared-all.ps1
### ./shared-work-dev.ps1
### ./install-work.ps1