{
  # https://nixos-and-flakes.thiscute.world/nixos-with-flakes/nixos-flake-configuration-explained
  # you can also sudo nixos-rebuild switch --flake github:owner/repo#your-hostname
  description = "A NixOS flake";

  inputs = {
    # input can be flake, git repo or local path
    # NixOS official package source, using the nixos-24.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.deimos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        inputs.stylix.nixosModules.stylix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}