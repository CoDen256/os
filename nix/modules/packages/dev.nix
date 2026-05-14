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
    jetbrains.datagrip
    android-studio
    sublime4

    # utils
    postman
    #rpi-imager
    scrcpy
    lmstudio


    # Programming languages and tools
    nodejs
    python312
    uv
    # jdk23 # use jetbrains runtime
    # gradle # use wrapper
    maven # use  bundled jetbrains builtin / wrapper
    # kotlin # use jetbrains kotlin

    # tools
    jq
    lazydocker


    python312Packages.parselmouth
    # nix lang server
    nixd

    # extra (xonsh vs code)
    python312Packages.python-lsp-server
  ];
}
