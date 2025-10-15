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
      }; # and still when running intellij says permission denied and srw-rw---- 1 root docker 0 11. Feb 17:29 /var/run/docker.sock
      # -> fixed by sudo chmod 666 /var/run/docker.sock
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
    scrcpy


    # Programming languages and tools
    python3
    # jdk23 # use jetbrains runtime
    # gradle # use wrapper
    maven # use  bundled jetbrains builtin / wrapper
    # kotlin # use jetbrains kotlin

    # tools
    jq
    lazydocker
  ];
}
