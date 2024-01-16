### SSH setup
Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*'
Get-Service -Name ssh-agent | Set-Service -StartupType Automatic
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
ssh-keygen -t rsa -b 4096 -C "den.blackshov@gmail.com"  
### Add SSH keys to gitlab and github ##

### Setup 
git clone git@github.com:CoDen256/os-setup.git C:\setup
cd C:\setup
git config core.autocrlf true                               # for this project
git config user.email den.blackshov@gmail.com               # for this project
git config user.name Denys Chernyshov                       # for this project

### Run ./install/system.ps1
### Run ./install/shared-scoop.ps1
### Run ./install/shared.ps1
### Run ./install/{type}/{type}.ps1