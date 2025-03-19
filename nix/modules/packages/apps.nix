{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

{

  nixpkgs.overlays = [
    (self: super: {
      key-combiner = super.callPackage ../../custom/key-combiner/default.nix { };
    })
  ];

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
    discord

    steam

    slack

    key-combiner
    # key combiner AppImage
    # notion (web)
  ];
}
