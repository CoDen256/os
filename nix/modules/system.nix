{
  lib,
  config,
  pkgs,
  ...
}:

# TODO docker has not enough priviledges for idea
# TODO when closing intellij or postman, they are closing in some incorrect state that i have to kill background process via ps aux after closing the window

{
  nixpkgs.config.allowUnfree = true; # allow unfree packages
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  boot.loader = {
    # DO NOT REMOVE
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
  };

  services = {
    cron.enable = true;
    udisks2.enable = true; # automounting of the usb devices (helpful for zmk keyboard auto mount)

    # custom phonetic russian and german layout
    xserver = {
      enable = true;
      xkb = {
        layout = "us,rupho,depho";
        variant = "";

        extraLayouts.rupho = {
          description = "Russian Phonetic Mirror of US";
          languages = [ "rus" ];
          symbolsFile = pkgs.copyPathToStore ../../input/symbols/rupho;
        };
        extraLayouts.depho = {
          description = "German Phonetic Mirror of US";
          languages = [ "ger" ];
          symbolsFile = pkgs.copyPathToStore ../../input/symbols/depho;
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    xorg.xmodmap # remaps fn keys
    xorg.xev # checks key presses 
    wev # checks key presses on wayland

    udiskie # automounting

    nh # nix os helper
    nixfmt-rfc-style # nix formatter
  ];

  environment.sessionVariables = rec {
    PATH = [
      "$HOME/rev/tools"
      "$HOME/Android/Sdk/build-tools/35.0.1/"
    ];

    _JAVA_AWT_WM_NOREPARENTING = 1;

    # default apps
    TERMINAL = "kitty";
    BROWSER = "google-chrome-stable";
    ANDROID_DEBUG_KEYSTORE_PASS = "android";
  };

  system.stateVersion = "25.05";
}
