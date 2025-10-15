{
  lib,
  config,
  pkgs,
  ...
}:

{
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kate
    konsole
    elisa
];

  services = {
    displayManager.autoLogin.enable = false;
    displayManager.autoLogin.user = "coden";
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };

  fonts.fontconfig.enable = lib.mkForce false;
  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];
}
