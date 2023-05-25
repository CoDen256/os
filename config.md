###### CHOCOLATELY #########
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation
choco install packages.config

###### WSL ######
wsl --install 
# installs wsl 2

###### GIT ######
# set git config global
git config --global user.name "Denys Chernyshov"
git config --global user.email "denys-chernyshov@"
# locally
git config user.email "den.blackshov@gmail.com" 


###### Flow launcher ######
#  - enable saving of settings in one folder via portable mode
# Copy UserData to C:\Users\denbl\AppData\Local\FlowLauncher\app-1.9.5\UserData\Settings
# - verify python directory


###### Terminal ######
# 1.Install fonts for windows if you are using zsh agnoster:
# https://slmeng.medium.com/how-to-install-powerline-fonts-in-windows-b2eedecace58
# https://github.com/powerline/fonts -> download
cd fonts-master
Set-ExecutionPolicy Bypass
./install.ps1

# 2.use settings.json in windows terminal

## 3.Terminal Ubuntu zsh + oh my zsh
sudo apt update
sudo apt install git zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## 4. Terminal Ubuntu zsh Pure (https://turlucode.com/oh-my-zsh-installation-guide/)
cd ~/.oh-my-zsh/custom 
git clone https://github.com/sindresorhus/pure 
ln -s pure/pure.zsh-theme . 
ln -s pure/async.zsh . 
# Change in ~/.zshrc the ZSH_THEME to ZSH_THEME=refined

## 5. Terminal Git bash zsh (https://gist.github.com/fworks/af4c896c9de47d827d4caa6fd7154b6b)
# install peazip to unpack .zst and delete it
# unpack .zst file
# unpack .tar file to C:/ProgramFiles/Git or where it is located, so that the usr folder is merged
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd ~/.oh-my-zsh/custom
git clone https://github.com/sindresorhus/pure 
ln -s pure/pure.zsh-theme . 
ln -s pure/async.zsh . 


## BRAVE ## 
# bitwarden -> sync code
# Profiles:
# 1. Home (different primary google account)
# 2. Chill
# 3. Work
# Extensions:
1. Bitwarden
2. Languagetool
3. Stayfocusd
4. Vimium
5. json vue
6. Colorzilla
7. Mendeley
8. Reverso context
9. (SponsorBlock for Youtube)


## VISUAL STUDIO CODE ##
# just login via github and turn the sync on


### TOOLBOX ###
# https://www.jetbrains.com/de-de/toolbox-app/
# 1.intellij
# 2.datagrip
# Login to Jetbrains account for CoDen(not CoDen256)
# Open Intellij -> File -> Manage IDE Settings -> Enable sync from accont -> Login -> 
# -> Manage IDE Settings -> Load from Account 
# -> Manage IDE Settings -> IDE Settings Sync -> Select plugins to sync

## XODO PDF VIEIWER ## 
## CANVA ## 
# via Microsoft Store

## JAVA 17 ##
# https://download.oracle.com/java/17/latest/jdk-17_windows-x64_bin.msi
# JAVA_HOME = C:\Program Files...\Java\jdk-17
# PATH = PATH + JAVA_HOME\bin
# verify
# java -verions
# mvn -v


## MAVEN ##


## GENERATE SSH KEY ##
## Add ssh key for gitlab
## Add ssh key for github

## Fix startup ##
# Discord -> log in -> Windows settings -> disable tray and disable startup\
# Disable jetbrains toolbox, canva, discord, edge
# Fix autostartup

## AHK DISABLE WIN, LAYOUT, AUO ##
# ctrl tab -> run -> shell:startup 
# put win_layout_auo.ahk 