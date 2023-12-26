###### CHOCOLATELY
    mkdir ~\tools
    mkdir ~\tools\android
    mkdir ~\portable
    mkdir C:\dev
    mkdir C:\rev
    mkdir C:\setup

    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    choco feature enable -n allowGlobalConfirmation
    choco install packages.config

###### Gtools 
    curl http://www.p-nand-q.com/download/gtools/gtools-current.exe -o gtools.exe   # CLI: `pathed` and `which`
    ./gtools.exe                                                                    # specify installed dir as ~/tools/Gtools
    rm ./gtools.exe                                                                 
    & "$($env:USERPROFILE)\tools\Gtools\pathed.exe" /append "$($env:USERPROFILE)\tools\Gtools\" /user


###### SSH Client + SSH keys
    Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*'
    Get-Service -Name ssh-agent | Set-Service -StartupType Automatic
    Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
    ssh-keygen -t rsa -b 4096 -C "den.blackshov@gmail.com"  # Add to gitlab and github

###### GIT
    ~\tools\git\bin\git.exe clone git@github.com:CoDen256/os-setup.git
    ~\tools\git\bin\git.exe config core.autocrlf true               # for this project
    cp git-configs/.gitconfig ~/.gitconfig
    cp git-configs/.default.gitconfig ~/.default.gitconfig

If needed:

    cp .alpha.gitconfig ~/.alpha.gitconfig

###### Java
    curl https://download.oracle.com/java/21/latest/jdk-21_windows-x64_bin.zip -o jdk.zip
    Expand-Archive .\jdk.zip -DestinationPath ~\tools\java
    setx JAVA_HOME "$($env:USERPROFILE)\tools\java\jdk-21.0.1"
    rm jdk.zip

###### Kotlin
    curl https://github.com/JetBrains/kotlin/releases/download/v1.9.22/kotlin-compiler-1.9.22.zip -o kot.zip
    Expand-Archive .\kot.zip -DestinationPath ~\tools\kotlin
    mv ~\tools\kotlin\kotlinc ~\tools\kotlin\kotlinc-1.9.22
    setx KOTLIN_HOME "$($env:USERPROFILE)\tools\kotlin\kotlinc-1.9.22"
    rm kot.zip
    # However Jetbrains Products will have kotlin bundled in by default somewhere else

###### Python
    curl https://www.python.org/ftp/python/3.12.1/python-3.12.1-amd64.exe -o py.exe
    ./py.exe            # install dir ~/tools/python 
    rm ./py.exe

###### AutoHotKey    
    curl https://www.autohotkey.com/download/ahk-v2.zip -o ahk2.zip
    Expand-Archive .\ahk2.zip -DestinationPath ~\tools\ahk
    
    cp win_layout_aou.ahk "$($env:APPDATA)\Microsoft\Windows\Start Menu\Programs\Startup"
    New-Item -Path "$($env:APPDATA)\Microsoft\Windows\Start Menu\Programs\Startup\win_layout_aou.ahk" -ItemType SymbolicLink -Value win_layout_aou.ahk
    rm ahk2.zip

###### Flow Launcher
    taskkill /f /im Flow*

    Set-Variable -Name "FLOW_PATH_BUILT_IN" (Get-ChildItem -Dir -Path "$($env:LOCALAPPDATA)\FlowLauncher\" -Filter 'app*').FullName
    Remove-Item -Force -Recurse -Path "$FLOW_PATH_BUILT_IN\Plugins\Flow.Launcher.Plugin.Explorer" 
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
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
    wsl --update
    wsl --set-default-version 2
    wsl --install -d Ubuntu-22.04

###### Terminal
[Install fonts for windows if you are using zsh agnoster](https://slmeng.medium.com/how-to-install-powerline-fonts-in-windows-b2eedecace58):

    git clone https://github.com/powerline/fonts
    Set-ExecutionPolicy Bypass
    .\fonts\install.ps1
    Remove-Item -Force -Recurse -Path "fonts" 
 

Use `settings.json` in Windows terminal

    New-Item -Path "$($env:LOCALAPPDATA)\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -ItemType SymbolicLink -Value .\win-terminal\settings.json -Force

Terminal Ubuntu zsh + oh my zsh

    wsl sudo apt update
    wsl sudo apt install git zsh -y
    wsl sh -c '$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)'


[Terminal Ubuntu zsh Pure](https://turlucode.com/oh-my-zsh-installation-guide/)

    cd ~/.oh-my-zsh/custom
    wsl git clone https://github.com/sindresorhus/pure ~/.oh-my-zsh/custom/pure
    wsl ln -s ~/.oh-my-zsh/custom/pure/pure.zsh ~/.oh-my-zsh/custom
    wsl ln -s ~/.oh-my-zsh/custom/pure/async.zsh ~/.oh-my-zsh/custom
    wsl sed -i s/robbyrussel/refined/g ~/.zshrc                     # change ZSH_THEME to refined

###### VS Code
1. Login via Github
2. Turn the sync on

###### Jetbrains Toolbox ###

- IntelliJ
- DataGrip
- Pycharm
- Android Studio

1. Login via Jetbrains account
2. E.g. IntelliJ -> File -> Manage IDE Settings -> Settings Sync

##### Android Studio and toolchain

1. Install SDK at ~/tools/android/sdk
2. Install tools


| Tool              | Description                                                              |
|-------------------|--------------------------------------------------------------------------|
| adb               | interacts with apps and emulators                                        |
| aapt              | build tool, apk compilation                                              |
| apktool           | (un)packs apk, smali/baksmali                                            |
| smali/baksmali    | (.dex -> .smali(.class)) (disassembler)                                  |
| keytool           | generate keystore with a key                                             |
| jarsigner         | sign apk with the key                                                    |
| tar/7z            | unpack apk                                                               |
| apksigner         | sign apk                                                                 |
| zipalign          | optimization                                                             |
|                   |                                                                          |
| dex2jar           | (.dex -> .class(.smali)) and back + dextools (disassembler)              |
| jadx              | (.dex -> .class(.smali) -> .java) (CLI + UI) (decompiler + disassembler) |
| FernFlower/JD-GUI | (.class -> .java) + GUI (decompiler)                                     |


    # zipalign, appt, apksigner, dexdump under ~\tools\android\sdk\build-tools\<version>\
    # adb under ~\tools\android\sdk\platform-tools
    # 7z in Program Files/7-Zip + tar in PATH
    # keytool, jarsigner is available in JAVA_HOME/bin


    # apktool (choose latest)
    wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/windows/apktool.bat -o ~/tools/android/apktool.bat
    wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.9.1.jar -o ~/tools/android/apktool.jar


    # smali, baksmali (choose latest)
    wget https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.5.2.jar -o ~/tools/android/baksmali.jar
    wget https://bitbucket.org/JesusFreke/smali/downloads/smali-2.5.2.jar -o ~/tools/android/smali.jar
    cp ./android-tools/* ~/tools/android/


    # dex2jar (smali, baksmali, dex2jar, jar2dex, dex-tools)
    wget https://github.com/pxb1988/dex2jar/releases/download/v2.4/dex-tools-v2.4.zip -o dex.zip
    Expand-Archive .\dex.zip -DestinationPath ~\tools\android\
    mv ~\tools\android\dex-tools* ~\tools\android\dex-tools
    rm .\dex.zip


    # jadx 
    wget https://github.com/skylot/jadx/releases/download/v1.4.7/jadx-1.4.7.zip -o jadx.zip
    Expand-Archive .\jadx.zip -DestinationPath ~\tools\android\jadx
    rm .\jadx.zip

###### Update Path and link tools
    New-Item -Path "$($env:USERPROFILE)\tools\maven\" -ItemType SymbolicLink -Value C:\ProgramData\chocolatey\lib\maven\apache-maven*

    New-Item -Path "$($env:USERPROFILE)\tools\gradle\" -ItemType SymbolicLink -Value C:\ProgramData\chocolatey\lib\gradle\tools\gradle-*
    setx GRADLE_HOME $(dir C:\ProgramData\chocolatey\lib\gradle\tools\gradle-*).FullName

    pathed /append "$($env:JAVA_HOME)\bin" /user
    pathed /append "$($env:KOTLIN_HOME)\bin" /user   
    pathed /append "$($env:USERPROFILE)\tools\maven\bin" /user 
    pathed /append "$($env:USERPROFILE)\tools\gradle\bin" /user
    pathed /append "$($env:USERPROFILE)\tools\openssl\bin" /user
    pathed /append "$($env:USERPROFILE)\tools\git\bin" /user
    pathed /append "$($env:USERPROFILE)\tools\git\" /user 
    pathed /append "$($env:USERPROFILE)\tools\ahk\" /user
    pathed /append "$($env:USERPROFILE)\tools\android" /user
    pathed /append "$($env:USERPROFILE)\tools\android\dex-tools" /user
    pathed /append "$($env:USERPROFILE)\tools\android\dex-tools\bin" /user
    pathed /append "$($env:USERPROFILE)\tools\android\jadx\bin" /user
    pathed /append "$($env:USERPROFILE)\tools" /user

    pathed /append $(dir "$($env:USERPROFILE)\tools\android\sdk\build-tools\*").FullName 
    pathed /append "$($env:USERPROFILE)\tools\android\sdk\platform-tools" /user     
    pathed /append "C:\Program Files\7-Zip" /user                                   

    mvn -v
    gradle -v
    java -version
    kotlinc -version
    python --version
    git --version
    7z

    dex-tools 
    d2j-dex2jar
    d2j-jar2dex
    smali -v
    baksmali -v
    apktool -version
    aapt version
    adb --version
    jadx --version

##### Default open VS Code
    cmd.exe /c 'assoc .="No_Extension"'
    cmd 'ftype "No_Extension"="C:\Program Files\Microsoft VS Code\Code.exe" "%1"'
    # not working? -> try this https://www.itprotoday.com/windows-78/how-do-i-create-default-association-files-no-extension


##### MobaXTerm
    New-Item -Path "$($env:USERPROFILE)\OneDrive\Documents\MobaXTerm.ini" -ItemType HardLink -Value "$($env:APPDATA)\MobaXterm\MobaXTerm.ini" # to create backup from existing
    New-Item -Path "$($env:APPDATA)\MobaXterm\MobaXTerm.ini" -ItemType HardLink -Value "$($env:USERPROFILE)\OneDrive\Documents\MobaXTerm.ini" # to create new from backup

###### XODO PDF
[Install via Microsoft store](ms-windows-store://pdp?hl=en-us&gl=ps&productid=9WZDNCRDJXP4&mode=mini&pos=5%2C6%2C1920%2C902&referrer=storeforweb&source=https%3A%2F%2Fwww.google.com%2F)

###### Bing Wallpapers
    curl https://go.microsoft.com/fwlink/?linkid=2126594 -o ~\Downloads\bing.exe
    ./bing.exe
    rm bing.exe

###### Fix Autostart apps
