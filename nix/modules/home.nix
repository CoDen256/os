{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
with lib.hm.gvariant;
{
  home = {
    username = "coden";
    homeDirectory = "/home/coden";
    stateVersion = "24.05"; 
  };
  programs.home-manager.enable = true;
}
