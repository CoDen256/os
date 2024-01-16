Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

scoop install git
scoop bucket add extras
scoop bucket add java
scoop bucket add versions

scoop install googlechrome
scoop install brave
scoop install flow-launcher

scoop install jetbrains-toolbox
scoop install vscode

scoop install openjdk21
scoop install kotlin
scoop install maven
scoop install gradle
scoop install mvndaemon
scoop install extras/vcredist2022
scoop install nvm
nvm install --lts # npm + node # nvm use 20.11.0
scoop install python312

scoop install powertoys

scoop install autohotkey
scoop install openssl
scoop install curl
scoop install keystore-explorer
scoop install gtools
scoop install 7zip

scoop install postman
scoop install mobaxterm

scoop install kubectl
scoop install helm
scoop install krew
scoop install aws
scoop install aws-iam-authenticator
scoop install eksctl

scoop install notion
scoop install obsidian
scoop install slack
scoop install vlc
scoop install sharex
scoop install raspberry-pi-imager
scoop install treesize-free
scoop install wireshark


scoop bucket add games
scoop install steam