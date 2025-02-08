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
  # https://nixos.wiki/wiki/Android
  # https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/android.section.md
  # https://github.com/tadfisher/android-nixpkgs

  nixpkgs.overlays = [
    (self: super: {
      apk-editor = super.callPackage ../../custom/apk-editor/default.nix { };
    })

    (self: super: {
      uber-apk-signer = super.callPackage ../../custom/uber-apk-signer/default.nix { };
    })
  ];

  programs.adb.enable = true; # includes android-tools -> adb + fastboot
  nixpkgs.config.android_sdk.accept_license = true;
  environment.systemPackages = with pkgs; [
    #androidenv.androidPkgs.platform-tools

    apktool
    apk-editor
    uber-apk-signer
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
    # ~/Android/Sdk/build-tools/35.0.1/ -> aapt apksigner # zipalign split-select aidl apksigner dexdump
  ];
}
# | apk.sh          |                                                                     |                                                                                                                          |     |
# | smali/baksmali  | (.dex -> .smali(.class)) (disassembler)                             | https://github.com/CoDen256/asdf-smali                                                                                   |     |
# | apk-mitm        | applies mitm patch                                                  | https://github.com/niklashigi/apk-mitm + npm                                                                             |     |

# | Fiddler                     | mitm                                                            | AppImage                                        |     |     |
# | Apk Editor Studiohc |                                                                         | AppImage                             |     |     |
