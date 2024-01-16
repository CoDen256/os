###### CHOCOLATELY
    mkdir ~\tools
    mkdir ~\tools\android
    mkdir ~\portable


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
