# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
# https://github.com/nix-gui/nix-gui
# https://github.com/wochap/nix-config
# https://github.com/vasujain275/rudra
# https://ryantm.github.io/nixpkgs/languages-frameworks/java/

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

    ./modules/hardware-configuration.nix
   
    ./modules/system.nix
    ./modules/user.nix
    ./modules/hardware.nix
    ./modules/locale.nix
    ./modules/desktop.nix

    ./modules/packages/dev.nix
    ./modules/packages/rev.nix
    ./modules/packages/apps.nix
    ./modules/packages/os.nix
    ./modules/packages/cli.nix
    ];
}
