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


    # terminal navigation
    yazi
    zoxide
    fzf

    # terminals
    kitty
    ghostty
    warp-terminal
    termius

        # Shell and terminal utilities
    killall
    eza
    starship

    progress
    tree
    exfatprogs
    

    # File management and archives
    p7zip
    unzip
    unrar
    file-roller

    libinput
    wev
    ncdu
    duf

    # System monitoring and management
    htop
    btop
    lm_sensors
    inxi
    auto-cpufreq
    nvtopPackages.nvidia
    anydesk
    udiskie

    # Audio and video
    pulseaudio
    pavucontrol
    ffmpeg
    mpv
    deadbeef-with-plugins
    
    
    neofetch
    # Text editors and IDEs
   
    # tools

    nixfmt-rfc-style

    # network


    # Version control and development tools
    git
    stow
    wget
    curl
    busybox

    # Downloaders
    yt-dlp


    # Image and graphics
    imagemagick
    gimp
    hyprpicker
    swww
    hyprlock
    waypaper
    imv

    # System utilities
    libgcc
    bc
    lxqt.lxqt-policykit
    libnotify
    v4l-utils
    ydotool
    pciutils
    socat

    ripgrep
    lshw
    bat
    pkg-config
    brightnessctl
    virt-viewer
    swappy
    appimage-run
    yad
    playerctl
    nh
    ansible

    # Virtualization
    libvirt

    # File systems
    ntfs3g
    os-prober
  ];
}
