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
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config.allowUnfree = true; # allow unfree packages

  services = {
    cron = {
      enable = true;
    };
    
    udisks2.enable = true; # automounting of the usb devices (helpful for zmk keyboard auto mount)
  };

  environment.systemPackages = with pkgs; [
    udiskie # automounting

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
