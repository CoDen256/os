{ lib, config, pkgs, inputs, ... }:

let
  username = "coden";
  userDescription = "Denys Chernyshov";
in
{

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users.${username} = {
      home = {
        username = "coden";
        homeDirectory = "/home/coden";
        stateVersion = "25.05"; 
      };
      programs.home-manager.enable = true;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
  };

  users = {
    mutableUsers = true;
    users.${username} = {
      isNormalUser = true;
      description = userDescription;
      extraGroups = ["networkmanager" "wheel" "docker" "adbusers" "wireshark" ];
      packages = with pkgs; [
      ];
      shell =  pkgs.xonsh;
    };
  };
  programs.xonsh.enable = true;
}
