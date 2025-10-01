{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
let
  packageOverrides = pkgs.callPackage ./python.nix { }; # build derivation (set of keys, each key is a package)
in
{
  nixpkgs.overlays = [
    (_: prev: {
      # add python packages for ulauncher extensions
      ulauncher = prev.ulauncher.overrideAttrs (old: {
        propagatedBuildInputs =
          with prev.python3Packages
          // {
            memoization = packageOverrides.memoization; # Ensure memoization is included
          };
          old.propagatedBuildInputs
          ++ [
            pint
            simpleeval
            parsedatetime
            pytz
            memoization
          ];
      });
    })
  ];


  environment.systemPackages = with pkgs; [

    # system utilities
    gparted
    ncdu # cli disk usage analyzer
    baobab # gui disk usage analyser
    duf # Disk Usage/Free Utility
    imv # image viewer
    vlc
    ydotool # automation
    bootiso

    # System monitoring and management
    htop
    btop
    killall
  
    zsh
    # Audio and video
    pulseaudio
    pavucontrol    
  ];
}
