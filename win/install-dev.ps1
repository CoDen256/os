###### Folder structure #####
mkdir C:\rev
mkdir C:\dev
mkdir ~\android

##### Scoop APPS #####
scoop bucket add extras java versions
scoop install `
        autohotkey `
        flow-launcher `

        jetbrains-toolbox `
        vscode `

        powertoys `
        7zip `
        notion `
        obsidian `
        vlc `
        sharex `
        treesize-free `

        openjdk21 `
        kotlin `
        maven `
        mvndaemon extras/vcredist2022 `
        gradle `
        python312 `
        nvm `

        gtools `
        openssl `
        curl `
        keystore-explorer `

        postman `
        mobaxterm `
        raspberry-pi-imager `
        wireshark `
        googlechrome `

        yazi ffmpeg poppler fd ripgrep fzf zoxide resvg imagemagick `

        apktool `
        jadx `

        ./manifests\dex-tools.json `
        ./manifests\smali.json `
        ./manifests\baksmali.json `


nvm install --lts

############################################################## ANDROID REV SETUP

# Run Android Studio before and install an sdk
pathed /append $( dir "$( $env:USERPROFILE )\android\sdk\build-tools\*" ).FullName /user
pathed /append "$( $env:USERPROFILE )\android\sdk\platform-tools" /user

# Generate base keystore
keytool -genkey -v -keystore release.keystore -alias main -keyalg RSA -keysize 2048 -validity 10000

############################################################## SHORTCUTS

Set-Variable -Name "PROG" "$( $env:APPDATA )\Microsoft\Windows\Start Menu\Programs\"

cp "$PROG\Scoop Apps\ShareX.lnk" "$PROG\Startup\"
cp "$PROG\Scoop Apps\Google Chrome.lnk" "$PROG\Startup\"
cp "$PROG\Jetbrains Toolbox\Jetbrains Toolbox.lnk" "$PROG\Startup\"


################################################### GIT #
cp git-config/.gitconfig ~/.gitconfig
cp git-config/.default.gitconfig ~/.default.gitconfig

##  if needed
##  cp .alpha.gitconfig ~/.alpha.gitconfig
##  edit ~/.gitconfig ~/.default.gitconfig ~/.alpha.gitconfig


# SSH #
# Add SSH keys to gitlab and github 
ssh-keygen -t rsa -b 4096 -C # "email@gmail.com"


######################################################## MobaXTerm
New-Item -Path "$( $env:USERPROFILE )\OneDrive\docs\MobaXTerm.ini" -ItemType HardLink -Value "$( $env:USERPROFILE )\scoop\apps\MobaXterm\current\MobaXTerm.ini" # to create backup from existing local
New-Item -Path "$( $env:USERPROFILE )\scoop\apps\mobaxterm\current\MobaXTerm.ini" -ItemType HardLink -Value "$( $env:USERPROFILE )\OneDrive\docs\MobaXTerm.ini" # to create new from backup


############################################################## VERIFY
dex-tools
d2j-dex2jar
d2j-jar2dex
smali -v
baksmali -v
apktool -version
jadx --version

# platform tools
adb --version
# build tools
aapt version
apksigner
zipalign
dexdump