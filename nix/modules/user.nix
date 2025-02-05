{ lib, config, pkgs, inputs, ... }:

let
  username = "coden";
  userDescription = "Denys Chernyshov";
in
{

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users.${username} = import ./home.nix;
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
      packages = with pkgs; [];
      shell = pkgs.zsh;
    };
  };
  programs.zsh.enable = true;
}
