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
  virtualisation = {
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };

  programs.adb.enable = true;

  environment.systemPackages = with pkgs; [

    vscode
    jetbrains.idea-ultimate
    jetbrains.pycharm-community
    android-studio
    postman

    # Programming languages and tools
    python3
    python3Packages.pip
    jdk
    maven

    rpi-imager

    
  ];

}
