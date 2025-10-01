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
}
