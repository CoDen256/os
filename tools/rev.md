
| tool            | description                                                         |     |
| --------------- | ------------------------------------------------------------------- | --- |
| adb             | interacts with apps and emulators                                   |     |
| aapt            | build tool, apk compilation                                         |     |
| apktool         | (un)packs apk, smali/baksmali                                       |     |
| apk.sh          |                                                                     |     |
|                 |                                                                     |     |
| openssl         | generate cert, ssh key                                              |     |
| ssh-keygen      | generate ssh key                                                    |     |
| keytool         | generate keystore with a key                                        |     |
| jarsigner       | signing JAR files and VERIFY the apk signatures                     |     |
| apksigner       | sign apk                                                            |     |
| uber-apk-signer | zipalign, (re)signing and verifying, multiple signatures            |     |
|                 |                                                                     |     |
| tar/7z          | unpack apk                                                          |     |
| zipalign        | optimization                                                        |     |
|                 |                                                                     |     |
|                 |                                                                     |     |
| smali/baksmali  | (.dex -> .smali(.class)) (disassembler)                             |     |
| dex2jar         | (.dex -> .class(.smali)) and back + dextools (disassembler)         |     |
| jadx            | (.dex -> .class(.smali) -> .java) (CLI) (decompiler + disassembler) |     |
| apk-editor      | merges apk and does stuff                                           |     |
| apk-mitm        | applies mitm patch                                                  |     |
| nmap            |                                                                     |     |
| npcap           |                                                                     |     |
|                 |                                                                     |     |
|                 |                                                                     |     |
|                 |                                                                     |     |
|                 |                                                                     |     |

apps

| app                       | description                                                         |     |
| ------------------------- | ------------------------------------------------------------------- | --- |
| FernFlower/JD-GUI         | (.class -> .java) GUI (decompiler)                                  |     |
| jadx-gui                  | (.dex -> .class(.smali) -> .java) (GUI) (decompiler + disassembler) |     |
| Wireshark                 |                                                                     |     |
| Keystore Explorer         |                                                                     |     |
| HTTP Toolkit              | mitm                                                                |     |
| Burp Suite                | mitm                                                                |     |
| Zap                       | Zed attack proxy, mitm                                              |     |
| Fiddler                   | mitm                                                                |     |
| Apk Lab VS code extension | apk mitm patches,rebuilding apk                                     |     |
| mitm-proxy                |                                                                     |     |
| Apk Editor Studiohc       |                                                                     |     |


check out
- https://github.com/quark-engine/quark-engine
- https://koz.io/using-frida-on-android-without-root/
- https://www.reddit.com/r/netsec/comments/1aklh3z/apksh_makes_reverse_engineering_android_apps/ comments