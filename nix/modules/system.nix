{
  lib,
  config,
  pkgs,
  ...
}:

# TODO docker has not enough priviledges for idea
# TODO when closing intellij or postman, they are closing in some incorrect state that i have to kill background process via ps aux after closing the window
# TODO ulauncher search in web crashes and freezes everything if chome wasn't run before

{
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config.allowUnfree = true; # allow unfree packages

  programs.nix-ld = {
    # Run unpatched dynamic binaries on NixOS. # Run games or proprietary software that attempts to verify its integrity.
    enable = true;
    package = pkgs.nix-ld-rs;
  };
  programs = {
    fuse.userAllowOther = true; # run filesystem in user space, but who uses it?
    gnupg.agent = {
      # Gpg-agent is a program that runs in the background (a daemon) and stores GPG secret keys in memory.
      enable = true;
      enableSSHSupport = true;
    };
  };
  systemd.services = {
    flatpak-repo = {
      path = [ pkgs.flatpak ];
      script = "flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo";
    };
  };

  services.dbus.enable = true;
  services.gnome.core-utilities.enable = true;

  boot = {
    binfmt.registrations.appimage = {
      wrapInterpreterInShell = false;
      interpreter = "${pkgs.appimage-run}/bin/appimage-run";
      recognitionType = "magic";
      offset = 0;
      mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
      magicOrExtension = ''\x7fELF....AI\x02'';
    };
  };

  services = {
    asusd = {
      # control aspects for asus laptos
      enable = true;
      enableUserService = true;
    };

    cron = {
      enable = true;
    };

    libinput.enable = true; # handles input devices, input device processing and stuff
    fstrim.enable = true; # to discard (or "trim") blocks which are not in use by the filesystem
    gvfs.enable = true; # virtual filesystem, maybe needed for connecting via ssh to other servers
    udisks2.enable = true; # automounting of the usb devices (helpful for zmk keyboard auto mount)

    openssh.enable = true;

    flatpak.enable = true;

    printing = {
      enable = true;
      drivers = [ pkgs.hplipWithPlugin ];
    };

    gnome.gnome-keyring.enable = true;
  };

  environment.systemPackages = with pkgs; [
    udiskie # automounting

    libinput
    appimage-run

    nh # nix os helper
    nixfmt-rfc-style # nix formatter
  ];

  environment.sessionVariables = rec {
    #XDG_CACHE_HOME = "$HOME/.cache";
    #XDG_CONFIG_HOME = "$HOME/.config";
    #XDG_DATA_HOME = "$HOME/.local/share";
    #XDG_STATE_HOME = "$HOME/.local/state";
    #XDG_SCREENSHOTS_DIR = "$HOME/Pictures/screenshots";

    # Not officially in the specification
    #XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [
      #"${XDG_BIN_HOME}"
      "$HOME/rev/tools"
      "$HOME/Android/Sdk/build-tools/35.0.1/"
    ];

    _JAVA_AWT_WM_NOREPARENTING = 1;
    #XDG_SESSION_TYPE = "wayland";
    #XDG_CURRENT_DESKTOP = "Hyprland";
    #XDG_SESSION_DESKTOP = "Hyprland";
    #__GLX_VENDOR_LIBRARY_NAME = "nvidia";
    #GBM_BACKEND = "nvidia-drm";

    YDOTOOL_SOCKET = "/tmp/ydtools";

    # default apps
    TERMINAL = "kitty";
    BROWSER = "google-chrome-stable";
    ANDROID_DEBUG_KEYSTORE_PASS="android";
  };
}
