###### CHOCOLATELY
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    choco feature enable -n allowGlobalConfirmation
    choco install packages.config

###### AutoHotKey
Install manually
    
    curl https://www.autohotkey.com/download/ahk-v2.exe -o ahk2.exe
    ./ahk2.exe
    cp win_layout_aou.ahk "$($env:APPDATA)\Microsoft\Windows\Start Menu\Programs\Startup"
    New-Item -Path "$($env:APPDATA)\Microsoft\Windows\Start Menu\Programs\Startup\win_layout_aou.ahk" -ItemType SymbolicLink -Value win_layout_aou.ahk
    rm ./ahk2.exe

###### SSH Keys

    ssh-keygen -t rsa -b 4096 -C "den.blackshov@gmail.com"  # Add to gitlab and github

###### GIT
    git config core.autocrlf true               # for this project
    cp git-configs/.gitconfig ~/.gitconfig
    cp git-configs/.default.gitconfig ~/.default.gitconfig

If needed:

    cp .alpha.gitconfig ~/.alpha.gitconfig

###### Flow Launcher
    taskkill /f /im Flow*

    Set-Variable -Name "FLOW_PATH_BUILT_IN" (Get-ChildItem -Dir -Path "$($env:LOCALAPPDATA)\FlowLauncher\" -Filter 'app*').FullName
    Remove-Item -Force -Recurse -Path "$FLOW_PATH_BUILT_IN\Plugins\Flow.Launcher.Plugin.Explorer" 
    Remove-Item -Force -Recurse -Path "$FLOW_PATH_BUILT_IN\Plugins\Flow.Launcher.Plugin.Url" 
    Remove-Item -Force -Recurse -Path "$FLOW_PATH_BUILT_IN\Plugins\Flow.Launcher.Plugin.BrowserBookmark"

    Set-Variable -Name "FLOW_PATH" "$($env:APPDATA)\FlowLauncher"
    Remove-Item -Force -Recurse -Path "$FLOW_PATH\Plugins" 
    Remove-Item -Force -Recurse -Path "$FLOW_PATH\Themes"
    Remove-Item -Force -Recurse -Path "$FLOW_PATH\Settings"

    New-Item -Path "$FLOW_PATH\Settings" -ItemType Junction -Value $PWD\flow-launcher\Settings
    New-Item -Path "$FLOW_PATH\Themes" -ItemType Junction -Value $PWD\flow-launcher\Themes
    New-Item -Path "$FLOW_PATH\Plugins" -ItemType Junction -Value $PWD\flow-launcher\Plugins
    Start-Process -FilePath "$($env:LOCALAPPDATA)\FlowLauncher\Flow.Launcher.exe"

###### WSL 2 Install
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart\
    wsl --update
    wsl --set-default-version 2
    wsl --install -d Ubuntu-22.04

###### Terminal
1. Install fonts for windows if you are using zsh agnoster:
https://slmeng.medium.com/how-to-install-powerline-fonts-in-windows-b2eedecace58


    git clone https://github.com/powerline/fonts
    Set-ExecutionPolicy Bypass
    .\fonts\install.ps1
    Remove-Item -Force -Recurse -Path "fonts" 
    

2. Use `settings.json` in Windows terminal

    New-Item -Path "$($env:LOCALAPPDATA)\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -ItemType SymbolicLink -Value .\win-terminal\settings.json -Force

3. Terminal Ubuntu zsh + oh my zsh


    wsl sudo apt update
    wsl sudo apt install git zsh -y
    wsl sh -c '$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)'


4. Terminal Ubuntu zsh Pure (https://turlucode.com/oh-my-zsh-installation-guide/)


    cd ~/.oh-my-zsh/custom
    wsl git clone https://github.com/sindresorhus/pure ~/.oh-my-zsh/custom/pure
    wsl ln -s ~/.oh-my-zsh/custom/pure/pure.zsh ~/.oh-my-zsh/custom
    wsl ln -s ~/.oh-my-zsh/custom/pure/async.zsh ~/.oh-my-zsh/custom
    wsl sed -i s/robbyrussel/refined/g ~/.zshrc                     # change ZSH_THEME to refined


###### Java
# https://download.oracle.com/java/17/latest/jdk-17_windows-x64_bin.msi
# JAVA_HOME = C:\Program Files...\Java\jdk-17
# PATH = PATH + JAVA_HOME\bin
# verify
# java -verions
# mvn -v

###### VS Code
1. Login via Github
2. Turn the sync on

###### Jetbrains Toolbox ###

- IntelliJ
- DataGrip
- Pycharm
- Android Studio

1. Login via Jetbrains account
2. IntelliJ -> File -> Manage IDE Settings -> Settings Sync



###### XODO PDF
[Install via Microsoft store](ms-windows-store://pdp?hl=en-us&gl=ps&productid=9WZDNCRDJXP4&mode=mini&pos=5%2C6%2C1920%2C902&referrer=storeforweb&source=https%3A%2F%2Fwww.google.com%2F)

###### Fix Autostart apps
