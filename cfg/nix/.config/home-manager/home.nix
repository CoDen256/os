{ config, pkgs, ... }:

{
  home.username = "coden";
  home.homeDirectory = "/home/coden";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [

    mesa-demos

    git
    xonsh
    mise

    ulauncher # gtk
    rofi

    stow
    curl
    wget

    yazi
    # kitty ## opengl
    gtk3
    xapp
    xdg-desktop-portal-xapp
    nixGLWrapper
    nixGL.nixGLMesa
    ghostty ## opengl
    warp-terminal # opengl
    zoxide
    fzf
    termius # opengl

    onedrive
    gparted ## gtk
    timeshift # sudo
    slack
    obsidian # opengl
    google-chrome # gtk opengl

    mitmproxy
    httptoolkit
    zap
    burpsuite
    keystore-explorer
    wireshark #  gtk, and wireless not working


    openssl
    nmap
    openssh

  ];

  programs.home-manager.enable = true;
}
