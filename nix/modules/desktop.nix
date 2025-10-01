{
  lib,
  config,
  pkgs,
  ...
}:

{
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
];

  services = {
    displayManager.autoLogin.enable = false;
    displayManager.autoLogin.user = "coden";
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };
}
