mkdir C:\rev
mkdir C:\dev
mkdir ~\android

scoop bucket add extras
scoop bucket add java
scoop bucket add versions

scoop install jetbrains-toolbox
scoop install vscode

scoop install openjdk21
scoop install kotlin
scoop install maven
scoop install mvndaemon extras/vcredist2022
scoop install gradle
scoop install python312
scoop install nvm
nvm install lts

scoop install gtools
scoop install openssl
scoop install curl
scoop install keystore-explorer
scoop install 7zip

scoop install postman
scoop install mobaxterm
scoop install raspberry-pi-imager
scoop install wireshark

scoop install notion
scoop install obsidian
scoop install vlc
scoop install sharex
scoop install treesize-free
scoop install brave

scoop install apktool
scoop install android-clt # instead of sdk platforms tools
scoop install jadx


scoop install ./manifests\dex-tools.json
scoop install ./manifests\smali.json
scoop install ./manifests\baksmali.json

pathed /append $(dir "$($env:USERPROFILE)\tools\android\sdk\build-tools\*").FullName 
pathed /append "$($env:USERPROFILE)\tools\android\sdk\platform-tools" /user     

pathed /append "$($env:USERPROFILE)\tools\android" /user
pathed /append "$($env:USERPROFILE)\tools\android\dex-tools" /user
pathed /append "$($env:USERPROFILE)\tools\android\dex-tools\bin" /user
pathed /append "$($env:USERPROFILE)\tools\android\jadx\bin" /user


dex-tools 
d2j-dex2jar
d2j-jar2dex
smali -v
baksmali -v
apktool -version
aapt version
adb --version
jadx --version