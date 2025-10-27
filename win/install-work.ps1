###### FOLDER STRUCTURE
mkdir ~/ome
mkdir ~/dev



####### SCOOP APPS #
scoop import C:\os\cfg\scoop\...json

################################################## SHORTCUTS
# Copy Shortcuts to Start Menu:
Set-Variable -Name "PROG" "$($env:APPDATA)\Microsoft\Windows\Start Menu\Programs\"

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