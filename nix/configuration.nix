# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
# https://github.com/nix-gui/nix-gui
# https://github.com/wochap/nix-config
# https://github.com/vasujain275/rudra

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.extraModulePackages = [
    config.boot.kernelPackages.rtl8814au
  ];

  networking.hostName = "nix"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.coden = {
    isNormalUser = true;
    description = "Denys Chernyshov";
    extraGroups = [ "networkmanager" "wheel" "adbusers"  "docker"  ];
    packages = with pkgs; [

    ];
  };
  #users.defaultUserShell = pkgs.python311Packages.xonsh;

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "coden";
  programs.hyprland.enable = true; # enable Hyprland


  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
      (_: prev: {
        ulauncher = prev.ulauncher.overrideAttrs (old: {
          propagatedBuildInputs = with prev.python3Packages;
            old.propagatedBuildInputs
            ++ [
              pint simpleeval parsedatetime pytz
            ];
        });
      })
    ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.variables.EDITOR = "code";
  environment.systemPackages = with pkgs; [
    git
    stow
    wget
    curl
    busybox
    libgcc
  apktool

    pipx
    (python310.withPackages(ps: with ps; [
      pytz
      ]))
    zulu23
    zulu21
    asdf-vm
    python312Packages.pip
    nodejs_23

    ulauncher 
    rofi

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
    

    rpi-imager

    mitmproxy
    httptoolkit
    zap
    burpsuite
    keystore-explorer
    wireshark 

    openssl
    nmap
    openssh
    android-studio
    jetbrains.idea-ultimate
    jetbrains.pycharm-community
    vscode
  ];

  programs.adb.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  system.stateVersion = "24.11";
}
