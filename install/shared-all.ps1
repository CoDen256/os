scoop install autohotkey

# AUTOHOTKEY 2 #
# Also allow to run as admin for all users in the properties of AutoHotkeyUX.exe
New-Item -Path "$($env:APPDATA)\Microsoft\Windows\Start Menu\Programs\Startup\win_layout_aou.vbs" -ItemType SymbolicLink -Value "win_layout_aou.vbs"
# .vbs is needed to run the ahk script as admin on startup, because some of the shortcuts are ignore inside the terminal


# Bing Wallpapers #
curl https://go.microsoft.com/fwlink/?linkid=2126594 -o ~\Downloads\bing.exe
~\Downloads\bing.exe
rm ~\Downloads\bing.exe