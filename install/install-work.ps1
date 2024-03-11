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

# Copy Shortcuts to Start Menu:
Set-Variable -Name "PROG" "$($env:APPDATA)\Microsoft\Windows\Start Menu\Programs\"

cp "$PROG\Scoop Apps\ShareX.lnk" "$PROG\Startup\"
cp "$PROG\Scoop Apps\Slack.lnk" "$PROG\Startup\"
cp "$PROG\Scoop Apps\Google Chrome.lnk" "$PROG\Startup\"
cp "$PROG\Jetbrains Toolbox\Jetbrains Toolbox.lnk" "$PROG\Startup\"
cp "$PROG\Jetbrains Toolbox\IntelliJ IDEA Ultimate.lnk" "$PROG\Startup\"
cp "C:\ProgramData\Microsoft\Windows\Start Menu\Docker Desktop.lnk" "$PROG\Startup\"