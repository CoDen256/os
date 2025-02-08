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

  programs = {
    thunar = {
      # file manager
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    # app launchers
    ulauncher
    rofi
    walker
    inputs.anyrun.packages.${pkgs.system}.anyrun

    # system utilities
    gparted
    file-roller # File Roller is an archive manager for the GNOME environment., just a frontend 
    ncdu # disk usage analyzer
    duf # Disk Usage/Free Utility
    imv # image viewer
    vlc 

    # terminals
    kitty
    ghostty
    warp-terminal
    termius
    starship
    

    # System monitoring and management
    htop
    btop
    killall
    
    # Audio and video
    pulseaudio
    pavucontrol    
  ];
}
