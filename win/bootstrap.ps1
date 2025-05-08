### SYSTEM WIDE INSTALLATION, done once ###

### SSH setup
Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*'
Get-Service -Name ssh-agent | Set-Service -StartupType Automatic
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0


### Scoop and must-have apps
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

scoop install git
scoop bucket add extras

### Setup folder
git clone git@github.com:CoDen256/os.git C:\os
cd C:\os
git config core.autocrlf true                               # for this setup project only
git config user.email den.blackshov@gmail.com               # for this setup project only
git config user.name Denys Chernyshov                       # for this setup project only


### Install choco & choco packages system wide
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation
choco install docker-desktop devtoys autoruns

### Choose flavour
# C:\os\win\install-dev.ps1
# C:\os\win\install-work.ps1
# C:\os\win\install-extra.ps1
C:\os\win\install-common.ps1

### Run stow at the end of the install to link all the needed files from admin
C:\os\win\stow.ps1