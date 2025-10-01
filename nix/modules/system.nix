{
  lib,
  config,
  pkgs,
  ...
}:

# TODO docker has not enough priviledges for idea
# TODO when closing intellij or postman, they are closing in some incorrect state that i have to kill background process via ps aux after closing the window

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

    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
        extraLayouts.ru-phonetic = {

          description = "Russian phonetic mirror keyboard of the us";
          languages = [ "rus" ];
          symbolsFile = pkgs.copyPathToStore ../../input/symbols/ru-phonetic;
        };
        extraLayouts.de-simple = {
          description = "German simple us keyboard, with some tweaks for umlauts";
          languages = [ "ger" ];
          symbolsFile = pkgs.copyPathToStore ../../input/symbols/de-simple;
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    udiskie # automounting

    nh # nix os helper
    nixfmt-rfc-style # nix formatter
  ];

  environment.sessionVariables = rec {
    PATH = [
      #"${XDG_BIN_HOME}"
      "$HOME/rev/tools"
      "$HOME/Android/Sdk/build-tools/35.0.1/"
    ];

    _JAVA_AWT_WM_NOREPARENTING = 1;

    # default apps
    TERMINAL = "kitty";
    BROWSER = "google-chrome-stable";
    ANDROID_DEBUG_KEYSTORE_PASS="android";
  };
}
