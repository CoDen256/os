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

  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  environment.systemPackages = with pkgs; [

    # terminals and utilities
    termius # ssh + sftp
    starship

    # General use
    obsidian
    telegram-desktop
    discord
    stirling-pdf

    steam
    prismlauncher

  ];
}
