### SSH setup
Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*'
Get-Service -Name ssh-agent | Set-Service -StartupType Automatic
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
ssh-keygen -t rsa -b 4096 -C "den.blackshov@gmail.com"  
### Add SSH keys to gitlab and github ##


### Scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
scoop install git

### Setup 
git clone git@github.com:CoDen256/os-setup.git C:\setup
cd C:\setup
git config core.autocrlf true                               # for this project
git config user.email den.blackshov@gmail.com               # for this project
git config user.name Denys Chernyshov                       # for this project

### Install choco & choco packages
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation
choco install packages.config

### For each user:
### ./home-full.ps1
### OR
### ./install/shared-scoop.ps1
### ./install/shared.ps1
### ./install/dev-scoop.ps1
### OR
### ./install/shared-scoop.ps1
### ./install/shared.ps1
### ./install/work-scoop.ps1