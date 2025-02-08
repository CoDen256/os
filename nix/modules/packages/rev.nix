{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
let
in
{

  programs.adb.enable = true; # includes android-tools -> adb + fastboot

  environment.systemPackages = with pkgs; [  

    apktool
    jdk21 # keytool, jarsigner
    
    dex2jar
    jadx # jadx jadx-gui

    mitmproxy

    wireshark
    keystore-explorer
    httptoolkit
    zap
    burpsuite

    
    openssl
    openssh # sshkeygen
    nmap

    # aapt
    # apksigner
    # ~/Android/Sdk/build-tools/35.0.1/ -> aapt zipalign split-select aidl apksigner dexdump
  ];
}
# | apk.sh          |                                                                     |                                                                                                                          |     |
# | uber-apk-signer | zipalign, (re)signing and verifying, multiple signatures            | https://github.com/CoDen256/asdf-uber-apk-signer                                                                         |     |
# | smali/baksmali  | (.dex -> .smali(.class)) (disassembler)                             | https://github.com/CoDen256/asdf-smali                                                                                   |     |
# | apk-editor      | merges apk and does stuff                                           | https://github.com/CoDen256/asdf-apk-editor<br>or nix                                                                    |     |
# | apk-mitm        | applies mitm patch                                                  | https://github.com/niklashigi/apk-mitm + npm                                                                             |     |

# | Fiddler                     | mitm                                                            | AppImage                                        |     |     |
# | Apk Editor Studiohc |                                                                         | AppImage                             |     |     |
