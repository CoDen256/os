{
  lib,
  config,
  pkgs,
  inputs,
  system,
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
    jetbrains.idea
    jetbrains.pycharm
    jetbrains.datagrip
    android-studio
    sublime4

    # utils
    postman
    #rpi-imager
    scrcpy


    # Programming languages and tools
    nodejs
    python3
    uv
    # jdk23 # use jetbrains runtime
    # gradle # use wrapper
    maven # use  bundled jetbrains builtin / wrapper
    # kotlin # use jetbrains kotlin

    # tools
    jq
    lazydocker

    # extra (xonsh vs code)
    #python311Packages.python-lsp-server
  ];
}
