{
  lib,
  config,
  pkgs,
  ...
}:

{
  # https://github.com/AlexNabokikh/nix-config/blob/master/modules/home-manager/desktop/kde/default.nix
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kate
    konsole
    elisa

    # remove dolphin
    dolphin
    dolphin-plugins
];

  # plasma-manager home manager for Plasma

  services = {
    displayManager.autoLogin.enable = false;
    displayManager.autoLogin.user = "coden";
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };

  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];
}
