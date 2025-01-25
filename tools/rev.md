
| tool            | description                                                         | source                                                                                                                   |     |
| --------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | --- |
| adb             | interacts with apps and emulators                                   | android sdk platform-tools or https://github.com/lzhiyong/android-sdk-tools or nix                                       |     |
| aapt            | build tool, apk compilation                                         | android sdk build-tools or https://github.com/ronnnnn/asdf-aapt2 or https://github.com/lzhiyong/android-sdk-tools or nix |     |
| apktool         | (un)packs apk, smali/baksmali                                       | https://github.com/CoDen256/asdf-apktool<br>or nix                                                                       |     |
| apk.sh          |                                                                     |                                                                                                                          |     |
|                 |                                                                     |                                                                                                                          |     |
| openssl         | generate cert, ssh key                                              | apt nix                                                                                                                  |     |
| ssh-keygen      | generate ssh key                                                    | apt nix                                                                                                                  |     |
| keytool         | generate keystore with a key                                        | java home                                                                                                                |     |
| jarsigner       | signing JAR files and VERIFY the apk signatures                     | java home                                                                                                                |     |
| apksigner       | sign apk                                                            | android sdk build-tools or nix                                                                                           |     |
| uber-apk-signer | zipalign, (re)signing and verifying, multiple signatures            | https://github.com/CoDen256/asdf-uber-apk-signer                                                                         |     |
|                 |                                                                     |                                                                                                                          |     |
| tar/7z          | unpack apk                                                          | apt or nix                                                                                                               |     |
| zipalign        | optimization                                                        | android sdk build-tools or https://github.com/lzhiyong/android-sdk-tools                                                 |     |
|                 |                                                                     |                                                                                                                          |     |
|                 |                                                                     |                                                                                                                          |     |
| smali/baksmali  | (.dex -> .smali(.class)) (disassembler)                             | https://github.com/CoDen256/asdf-smali                                                                                   |     |
| dex2jar         | (.dex -> .class(.smali)) and back + dextools (disassembler)         | https://github.com/CoDen256/asdf-dex2jar<br>or nix                                                                       |     |
| jadx            | (.dex -> .class(.smali) -> .java) (CLI) (decompiler + disassembler) | https://github.com/CoDen256/asdf-jadx<br>or nix                                                                          |     |
| apk-editor      | merges apk and does stuff                                           | https://github.com/CoDen256/asdf-apk-editor<br>or nix                                                                    |     |
| apk-mitm        | applies mitm patch                                                  | https://github.com/niklashigi/apk-mitm + npm                                                                             |     |
| nmap            |                                                                     | apt                                                                                                                      |     |
|                 |                                                                     |                                                                                                                          |     |
| dexdump         |                                                                     | android sdk build-tools or https://github.com/lzhiyong/android-sdk-tools                                                 |     |
| fastboot        |                                                                     | android sdk platform-tools orr https://github.com/lzhiyong/android-sdk-tools<br>or nix                                   |     |
| aidl            |                                                                     | android sdk build-tools or https://github.com/lzhiyong/android-sdk-tools                                                 |     |
| split-select    |                                                                     | andriod sdk build tools or https://github.com/lzhiyong/android-sdk-tools                                                 |     |
|                 |                                                                     |                                                                                                                          |     |

apps

| app                         | description                                                         | src                                             |     |     |
| --------------------------- | ------------------------------------------------------------------- | ----------------------------------------------- | --- | --- |
| FernFlower/JD-GUI           | (.class -> .java) GUI (decompiler)                                  |                                                 |     |     |
| jadx-gui                    | (.dex -> .class(.smali) -> .java) (GUI) (decompiler + disassembler) | https://github.com/CoDen256/asdf-jadx<br>or nix |     |     |
| Wireshark                   |                                                                     | apt or nix                                      |     |     |
| Keystore Explorer           |                                                                     | deb or nix                                      |     |     |
| HTTP Toolkit                | mitm                                                                | deb or nix                                      |     |     |
| Burp Suite                  | mitm                                                                | jar/nix                                         |     |     |
| Zap                         | Zed attack proxy, mitm                                              | tar.gz/flat/snap/nix                            |     |     |
| Fiddler                     | mitm                                                                | AppImage                                        |     |     |
| Apk Lab VS code extension   | apk mitm patches,rebuilding apk                                     | vs code extension                               |     |     |
| mitm-proxy                  |                                                                     | pipx, zip, nix                                  |     |     |
| ==Apk Editor Studiohc== |                                                                     | ==AppImage==                                |     |     |


check out
- https://github.com/quark-engine/quark-engine
- https://koz.io/using-frida-on-android-without-root/
- https://www.reddit.com/r/netsec/comments/1aklh3z/apksh_makes_reverse_engineering_android_apps/ comments