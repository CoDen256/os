{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

{

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
  
  environment.systemPackages = with pkgs; [

    # terminals and utilities
    kitty
    termius # ssh + sftp
    starship

    # app launchers
    ulauncher
    rofi

    # General use
    obsidian
    telegram-desktop
    google-chrome
    onedrive

    steam

    slack

    # key combiner
    # notion
  ];
}
