{
  lib,
  config,
  pkgs,
  ...
}:

{

  environment.systemPackages = with pkgs; [
    # Wayland specific
    hyprshot # screenshot utility
    grim # screenshot with slurp
    slurp  # select a region on screen and print the coordinates and resolution to output

    hypridle # idle daemon, like when to turn off the screen and suspend


    waybar # the waybar above
    

     # Clipboard managers
    wl-clipboard 
    cliphist
    
    where-is-my-sddm-theme # login manager theme

    dunst # notification manager

    # Networking applet in the waybar
    networkmanagerapplet

    # Keyboard mappings
    xorg.xev     # for tracking keyboard events
    xorg.xmodmap # for modifying keyboard events
  ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal
    ];
  };

  fonts.packages = with pkgs; [
    noto-fonts-emoji
    fira-sans
    roboto
    noto-fonts-cjk-sans
    font-awesome
    material-icons
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs = {
    # settings database for gnome
    dconf.enable = true; # dconf is a low-level configuration system. Its main purpose is to provide a backend to GSettings on platforms that don't already have configuration storage systems.
  }

  services = {
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "coden";
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

  xdg.mime.defaultApplications = {
    # Web and HTML
    "x-scheme-handler/http" = "google-chrome.desktop";
    "x-scheme-handler/https" = "google-chrome.desktop";
    "x-scheme-handler/chrome" = "google-chrome.desktop";
    "text/html" = "google-chrome.desktop";
    "application/x-extension-htm" = "google-chrome.desktop";
    "application/x-extension-html" = "google-chrome.desktop";
    "application/x-extension-shtml" = "google-chrome.desktop";
    "application/x-extension-xhtml" = "google-chrome.desktop";
    "application/xhtml+xml" = "google-chrome.desktop";

    # File management
    "inode/directory" = "thunar.desktop";    #org.kde.dolphin.desktop alternatively


    # Text editor
    "text/plain" = "code.desktop";

    # Terminal
    "x-scheme-handler/terminal" = "kitty.desktop";

    # LibreOffice formats
    "application/vnd.oasis.opendocument.text" = "libreoffice-writer.desktop";
    "application/vnd.oasis.opendocument.spreadsheet" = "libreoffice-calc.desktop";
    "application/vnd.oasis.opendocument.presentation" = "libreoffice-impress.desktop";
    "application/vnd.ms-excel" = "libreoffice-calc.desktop";
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = "libreoffice-calc.desktop";
    "application/msword" = "libreoffice-writer.desktop";
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document" =
      "libreoffice-writer.desktop";
    "application/vnd.ms-powerpoint" = "libreoffice-impress.desktop";
    "application/vnd.openxmlformats-officedocument.presentationml.presentation" =
      "libreoffice-impress.desktop";

    # PDF
    "application/pdf" = "google-chrome.desktop";

    # Other handlers
    "x-scheme-handler/about" = "google-chrome.desktop";
    "x-scheme-handler/unknown" = "google-chrome.desktop";
    "x-scheme-handler/postman" = "Postman.desktop";
    "x-scheme-handler/tonsite" = "org.telegram.desktop.desktop";
  };
}
