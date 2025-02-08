{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

{
  environment.systemPackages = with pkgs; [

    # General use
    obsidian
    telegram-desktop
    google-chrome
    onedrive
    slack
  ];
}
