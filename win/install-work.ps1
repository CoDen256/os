###### FOLDER STRUCTURE
mkdir ~/ome
mkdir ~/dev



####### SCOOP APPS #

scoop bucket add extras java versions

scoop install
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
    pipx `

    gtools `
    openssl `
    curl `
    jq `
    keystore-explorer `

    postman `
    mobaxterm `

    slack `
    googlechrome `

    kubectl `
    helm `
    krew `
    aws `
    aws-iam-authenticator `
    eksctl `
    lens `

    yazi ffmpeg poppler fd ripgrep fzf zoxide resvg imagemagick

nvm install --lts

################################################## SHORTCUTS
# Copy Shortcuts to Start Menu:
Set-Variable -Name "PROG" "$($env:APPDATA)\Microsoft\Windows\Start Menu\Programs\"

cp "$PROG\Scoop Apps\ShareX.lnk" "$PROG\Startup\"
cp "$PROG\Scoop Apps\Slack.lnk" "$PROG\Startup\"
cp "$PROG\Scoop Apps\Google Chrome.lnk" "$PROG\Startup\"
cp "$PROG\Jetbrains Toolbox\Jetbrains Toolbox.lnk" "$PROG\Startup\"
cp "$PROG\Jetbrains Toolbox\IntelliJ IDEA Ultimate.lnk" "$PROG\Startup\"
cp "C:\ProgramData\Microsoft\Windows\Start Menu\Docker Desktop.lnk" "$PROG\Startup\"


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
New-Item -Path "$($env:USERPROFILE)\OneDrive\docs\MobaXTerm.ini" -ItemType HardLink -Value "$($env:USERPROFILE)\scoop\apps\MobaXterm\current\MobaXTerm.ini" # to create backup from existing local
New-Item -Path "$($env:USERPROFILE)\scoop\apps\mobaxterm\current\MobaXTerm.ini" -ItemType HardLink -Value "$($env:USERPROFILE)\OneDrive\docs\MobaXTerm.ini" # to create new from backup


############################################################  Verify
mvn -v
gradle -v
java -version
kotlinc -version
python --version
git --version
7z
python --version