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


  environment.systemPackages = with pkgs; [

    # editors
    vscode
    jetbrains.idea-ultimate
    jetbrains.pycharm-community
    jetbrains.datagrip
    android-studio

    # utils
    postman
    rpi-imager


    # Programming languages and tools
    python3

    # jdk23 # use jetbrains runtime
    # gradle # use wrapper
    # maven # use  bundled jetbrains builtin / wrapper
    # kotlin # use jetbrains kotlin

    # tools
    jq


    # extra
    python311Packages.python-lsp-server

  ];
}
