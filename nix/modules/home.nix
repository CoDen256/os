{
  config,
  pkgs,
  ...
}: let
  userName = "coden";
  homeDirectory = "/home/${userName}";
  stateVersion = "24.11";
in {
  home = {
    username = userName;
    homeDirectory = homeDirectory;
    stateVersion = stateVersion; # Please read the comment before changing.

    file = {
      # wlogout icons
      ".config/wlogout/icons".source = ../assets/wlogout;
    };


    sessionPath = [
      "$HOME/.local/bin"
    ];

    packages = [
      (import ../scripts/rofi-launcher.nix {inherit pkgs;})
    ];
  };

  imports = [
    ./desktop/rofi/rofi.nix
    ./desktop/wlogout.nix
  ];

  # Styling
  stylix.targets.waybar.enable = false;
  gtk = {
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
  qt = {
    enable = true;
    style.name = "adwaita-dark";
    platformTheme.name = "gtk3";
  };

  services.hypridle = {
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock";
      };
      listener = [
        {
          timeout = 900;
          on-timeout = "hyprlock";
        }
        {
          timeout = 1200;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };

  programs.home-manager.enable = true;
}
