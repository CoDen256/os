
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



