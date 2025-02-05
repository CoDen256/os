{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

{
  systemd.services = {
    flatpak-repo = {
      path = [ pkgs.flatpak ];
      script = "flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo";
    };
  };

  virtualisation = {
    docker = {
      enable = true;
    };
  };
  nixpkgs.config.allowUnfree = true;
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

  environment.systemPackages = with pkgs; [
        android-studio
    just
    slack
    neofetch
    # Text editors and IDEs
    vscode
    jetbrains.idea-ultimate
    jetbrains.pycharm-community

    # Programming languages and tools
    go
    lua
    python3
    python3Packages.pip
    uv
    clang
    zig
    rustup
    nodePackages_latest.pnpm
    nodePackages_latest.yarn
    nodePackages_latest.nodejs
    bun
    jdk
    maven
    gcc
    openssl
    nodePackages_latest.live-server
# network
    networkmanager-l2tp

    # Version control and development tools
    git
    postman

    # Shell and terminal utilities
    stow
    wget
    killall
    eza
    starship
    kitty
    zoxide

    fzf
    progress
    tree
    exfatprogs

    inputs.ghostty.packages.${pkgs.system}.default

    apktool
    # File management and archives
    yazi
    p7zip
    unzip
    unrar
    file-roller
    ulauncher
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
    cowsay
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
  ];
}
