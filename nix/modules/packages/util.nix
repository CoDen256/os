{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    # system maintainance apps
    gparted
    ncdu # cli disk usage analyzer
    baobab # gui disk usage analyser
    duf # Disk Usage/Free Utility
    imv # image viewer
    vlc
    ydotool # automation
    bootiso

    # System monitoring and management
    htop
    btop
    killall
  
    zsh
  ];
}
