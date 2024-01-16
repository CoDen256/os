
###### Update Path and link tools

    pathed /append "$($env:USERPROFILE)\tools\android" /user
    pathed /append "$($env:USERPROFILE)\tools\android\dex-tools" /user
    pathed /append "$($env:USERPROFILE)\tools\android\dex-tools\bin" /user
    pathed /append "$($env:USERPROFILE)\tools\android\jadx\bin" /user

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



