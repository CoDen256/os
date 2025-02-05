# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
# https://github.com/nix-gui/nix-gui
# https://github.com/wochap/nix-config
# https://github.com/vasujain275/rudra

{
  config,
  lib,
  pkgs,
  inputs,
  options,
  ...
}: {
  imports =
    [ 
    inputs.home-manager.nixosModules.default

    ./modules/hardware-configuration.nix
    ./modules/amd-drivers.nix
   
    ./modules/boot.nix
    ./modules/networking.nix
    ./modules/locale.nix
    ./modules/stylix.nix
    ./modules/user.nix
    ./modules/hardware.nix
    ./modules/packages.nix
    ./modules/desktop.nix
    ./modules/system.nix
    ];
  system.stateVersion = "24.11";
}
