{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
let
  packageOverrides = pkgs.callPackage ./packages/python.nix { };
  python = pkgs.python3.override { inherit packageOverrides; };
  pythonWithPackages = python.withPackages (ps: [
    ps.memoization
  ]);
in
{
  nixpkgs.overlays = [
    (_: prev: {
      ulauncher = prev.ulauncher.overrideAttrs (old: {
        propagatedBuildInputs =
          with prev.python3Packages;
          old.propagatedBuildInputs
          ++ [
            pint
            simpleeval
            parsedatetime
            pytz
          ];
      });
    })
  ];

  systemd.services = {
    flatpak-repo = {
      path = [ pkgs.flatpak ];
      script = "flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo";
    };
  };

  virtualisation = {
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };

  programs = {
    nix-ld = {
      enable = true;
      package = pkgs.nix-ld-rs;
    };
    firefox.enable = false;
    dconf.enable = true;
    fuse.userAllowOther = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
    adb.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [

    ulauncher
    rofi
    walker

    yazi
    kitty
    ghostty
    warp-terminal
    zoxide
    fzf
    termius

    onedrive
    gparted

    slack
    obsidian
    google-chrome

    postman
    inputs.anyrun.packages.${pkgs.system}.anyrun

    just
    slack
    neofetch
    # Text editors and IDEs
    vscode
    jetbrains.idea-ultimate
    jetbrains.pycharm-community
    android-studio

    # Programming languages and tools
    pythonWithPackages
    python3Packages.pip
    jdk
    maven

    # tools
    openssl
    nmap
    openssh
    nixfmt-rfc-style

    # network
    networkmanager-l2tp

    # Version control and development tools
    git
    stow
    wget
    curl
    busybox

    apktool

    # Shell and terminal utilities
    killall
    eza
    starship
    kitty
    zoxide

    fzf
    progress
    tree
    exfatprogs

    postman

    # File management and archives
    yazi
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

    # Image and graphics
    imagemagick
    gimp
    hyprpicker
    swww
    hyprlock
    waypaper
    imv

    # Productivity and office
    obsidian

    # Communication and social
    telegram-desktop

    # Browsers
    google-chrome

    # Gaming and entertainment

    # System utilities
    libgcc
    bc
    kdePackages.dolphin
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

    # Downloaders
    yt-dlp

    # Clipboard managers
    cliphist

    # Education
    # ciscoPacketTracer8
    wireshark

    mitmproxy
    httptoolkit
    zap
    burpsuite
    keystore-explorer

    rpi-imager

  ];
}
