scoop install autohotkey
scoop install flow-launcher

# AUTOHOTKEY 2 #
# Also allow to run as admin for all users in the properties of AutoHotkeyUX.exe
New-Item -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\win_layout_aou.vbs" -ItemType SymbolicLink -Value "win_layout_aou.vbs"
# runas /user:Administrator "cmdName parameters"
# .vbs is needed to run the ahk script as admin on startup, because some of the shortcuts are ignore inside the terminal

# FLOW LAUNCHER #
# (System wide with embedded python)
taskkill /f /im Flow*

Set-Variable -Name "FLOW_PATH" (Get-ChildItem -Dir -Path "C:\ProgramData\scoop\apps\flow-launcher\current" -Filter 'app*').FullName

Remove-Item -Force -Recurse -Path "$FLOW_PATH\UserData\Plugins" 
Remove-Item -Force -Recurse -Path "$FLOW_PATH\UserData\Themes"
Remove-Item -Force -Recurse -Path "$FLOW_PATH\UserData\Settings"

New-Item -Path "$FLOW_PATH\UserData\Settings" -ItemType Junction -Value $PWD\flow-launcher\Settings
New-Item -Path "$FLOW_PATH\UserData\Themes" -ItemType Junction -Value $PWD\flow-launcher\Themes
New-Item -Path "$FLOW_PATH\UserData\Plugins" -ItemType Junction -Value $PWD\flow-launcher\Plugins
Start-Process -FilePath "C:\ProgramData\scoop\apps\flow-launcher\current\Flow.Launcher.exe" 


# Bing Wallpapers #
curl https://go.microsoft.com/fwlink/?linkid=2126594 -o ~\Downloads\bing.exe
~\Downloads\bing.exe
rm ~\Downloads\bing.exe