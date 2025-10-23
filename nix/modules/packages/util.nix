{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    nixfmt-rfc-style # nix formatter

    # system maintainance apps
    gparted
    ncdu # cli disk usage analyzer
    baobab # gui disk usage analyser
    duf # Disk Usage/Free Utility

    vlc # video player
    mediawriter # bootable media writer (Fedora Writer)

    # System monitoring and management
    htop 
    btop
    killall
  
    zsh
  ];
}
