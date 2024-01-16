###### Gtools 
    curl http://www.p-nand-q.com/download/gtools/gtools-current.exe -o gtools.exe   # CLI: `pathed` and `which`
    ./gtools.exe                                                                    # specify installed dir as ~/tools/Gtools
    rm ./gtools.exe                                                                 
    & "$($env:USERPROFILE)\tools\Gtools\pathed.exe" /append "$($env:USERPROFILE)\tools\Gtools\" /user

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
    rm ahk2.zip

##### Default open VS Code
    # can't find a solution
    # cmd.exe /c 'assoc .="No_Extension"'
    # cmd 'ftype "No_Extension"="C:\Program Files\Microsoft VS Code\Code.exe" "%1"'
    # not working? -> try this https://www.itprotoday.com/windows-78/how-do-i-create-default-association-files-no-extension



    # apktool (choose latest)
    wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/windows/apktool.bat -o ~/tools/android/apktool.bat
    wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.9.1.jar -o ~/tools/android/apktool.jar


    # jadx 
    wget https://github.com/skylot/jadx/releases/download/v1.4.7/jadx-1.4.7.zip -o jadx.zip
    Expand-Archive .\jadx.zip -DestinationPath ~\tools\android\jadx
    rm .\jadx.zip