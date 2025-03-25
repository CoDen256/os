{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
with lib.hm.gvariant;
{
  home = {
    username = "coden";
    homeDirectory = "/home/coden";
    stateVersion = "24.05"; # Please read the comment before changing.

    packages = with pkgs; [
      gnome-pomodoro
      gnome-tweaks
      gnomeExtensions.auto-move-windows
      gnomeExtensions.blur-my-shell
      gnomeExtensions.clipboard-history
      gnomeExtensions.dash-to-dock
      gnomeExtensions.just-perfection
      gnomeExtensions.pop-shell
      gnomeExtensions.rounded-window-corners-reborn
      gnomeExtensions.space-bar
      gnomeExtensions.unblank
      gnomeExtensions.user-themes
      maim
      xclip
    ];
  };

  dconf.settings = {
    #   "org/gnome/calculator" = {
    #     "accuracy" = 9;
    #     "angle-units" = "degrees";
    #     "base" = 10;
    #     "button-mode" = "basic";
    #     "number-format" = "automatic";
    #     "show-thousands" = false;
    #     "show-zeroes" = false;
    #     "source-currency" = "";
    #     "source-units" = "degree";
    #     "target-currency" = "";
    #     "target-units" = "radian";
    #     "window-maximized" = false;
    #   };

    # "org/gnome/desktop/interface" = {
    #   "cursor-theme" = "Yaru";
    #   "font-name" = "Roboto 11";
    #   "icon-theme" = "Tela-circle-dark";
    #   "color-scheme" = "prefer-dark";
    #   "document-font-name" = "Roboto 11";
    #   "enable-animations" = false;
    #   "enable-hot-corners" = false;
    #   "font-antialiasing" = "grayscale";
    #   "font-hinting" = "slight";
    #   "monospace-font-name" = "MesloLGS Nerd Font Mono 13";
    #   "show-battery-percentage" = true;
    #   "toolkit-accessibility" = false;
    # };

    #   "org/gnome/tweaks" = {
    #     "show-extensions-notice" = false;
    #   };

    #   "org/gtk/gtk4/settings/file-chooser" = {
    #     "show-hidden" = true;
    #   };

    #   "org/gtk/settings/file-chooser" = {
    #     "date-format" = "regular";
    #     "location-mode" = "path-bar";
    #     "show-hidden" = true;
    #     "show-size-column" = true;
    #     "show-type-column" = true;
    #     "sort-column" = "name";
    #     "sort-directories-first" = true;
    #     "sort-order" = "ascending";
    #     "type-format" = "category";
    #     "view-type" = "list";
    #   };

    #   "org/gnome/desktop/session" = {
    #     "idle-delay" = mkUint32 0;
    #   };

    "org/gnome/desktop/wm/keybindings" = {
      "close" = [ "<Super><Shift><Alt>Escape" ];
      "minimize" = [ "<Super><Shift><Alt>Return" ];
      "move-to-workspace-1" = [ "<Super><Shift>1" ];
      "move-to-workspace-10" = [ "<Super><Shift>0" ];
      "move-to-workspace-2" = [ "<Super><Shift>2" ];
      "move-to-workspace-3" = [ "<Super><Shift>3" ];
      "move-to-workspace-4" = [ "<Super><Shift>4" ];
      "move-to-workspace-5" = [ "<Super><Shift>5" ];
      "move-to-workspace-6" = [ "<Super><Shift>6" ];
      "move-to-workspace-7" = [ "<Super><Shift>7" ];
      "move-to-workspace-8" = [ "<Super><Shift>8" ];
      "move-to-workspace-9" = [ "<Super><Shift>9" ];
      "switch-applications" = [ "<Super><Shift><Alt>c" ];
      "switch-applications-backward" = [ "<Super><Shift><Alt>g" ];
      "switch-to-workspace-1" = [ "<Super>1" ];
      "switch-to-workspace-2" = [ "<Super>2" ];
      "switch-to-workspace-3" = [ "<Super>3" ];
      "switch-to-workspace-4" = [ "<Super>4" ];
      "switch-to-workspace-5" = [ "<Super>5" ];
      "switch-to-workspace-6" = [ "<Super>6" ];
      "switch-to-workspace-7" = [ "<Super>7" ];
      "switch-to-workspace-8" = [ "<Super>8" ];
      "switch-to-workspace-9" = [ "<Super>9" ];
      "toggle-fullscreen" = [ "<Super><Shift><Alt>3" ];
    };

    #   "org/gnome/desktop/wm/preferences" = {
    #     "button-layout" = lib.mkForce "";
    #     "focus-mode" = "sloppy";
    #     "num-workspaces" = 5;
    #     "titlebar-font" = "Roboto Bold 11";
    #     "workspace-names" = [ "1" ];
    #   };

    #   "org/gnome/mutter" = {
    #     "center-new-windows" = true;
    #     "dynamic-workspaces" = true;
    #     "edge-tiling" = false;
    #   };

    #   "org/gnome/nautilus/preferences" = {
    #     "default-folder-viewer" = "list-view";
    #     "migrated-gtk-settings" = true;
    #     "search-filter-time-type" = "last_modified";
    #     "search-view" = "list-view";
    #   };

    #   "org/gnome/settings-daemon/plugins/color" = {
    #     "night-light-enabled" = true;
    #     "night-light-last-coordinates" = mkTuple [
    #       44.437359000257999
    #       26.090661799999999
    #     ];
    #     "night-light-temperature" = mkUint32 4000;
    #   };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      "custom-keybindings" = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      "binding" = "<Super><Shift><Alt>h";
      "command" = "ulauncher ";
      "name" = "Ulauncher";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      "binding" = "<Super><Shift><Alt>Backspace";
      "command" = "kitty";
      "name" = "Kitty";
    };

    #   "org/gnome/settings-daemon/plugins/power" = {
    #     "sleep-inactive-ac-type" = "nothing";
    #     "sleep-inactive-battery-type" = "nothing";
    #   };

    "org/gnome/shell/extensions/blur-my-shell" = {
      "settings-version" = 2;
    };

    #   "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
    #     "pipeline" = "pipeline_default_rounded";
    #   };

    #   "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
    #     "pipeline" = "pipeline_default";
    #   };

    #   "org/gnome/shell/extensions/blur-my-shell/overview" = {
    #     "pipeline" = "pipeline_default";
    #   };

    #   "org/gnome/shell/extensions/blur-my-shell/panel" = {
    #     "pipeline" = "pipeline_default";
    #   };

    #   "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
    #     "pipeline" = "pipeline_default";
    #   };

    #   "org/gnome/shell/extensions/clipboard-history" = {
    #     "display-mode" = 3;
    #     "next-entry" = [ "<Shift><Alt>j" ];
    #     "prev-entry" = [ "<Shift><Alt>k" ];
    #     "toggle-menu" = [ "<Shift><Alt>v" ];
    #   };

    #   "org/gnome/shell/extensions/dash-to-dock" = {
    #     "animate-show-apps" = false;
    #     "apply-custom-theme" = false;
    #     "autohide" = true;
    #     "background-color" = "rgb(24,25,38)";
    #     "background-opacity" = 0.8;
    #     "custom-background-color" = true;
    #     "custom-theme-shrink" = true;
    #     "dash-max-icon-size" = 32;
    #     "dock-fixed" = false;
    #     "dock-position" = "BOTTOM";
    #     "extend-height" = false;
    #     "height-fraction" = 0.9;
    #     "hot-keys" = false;
    #     "intellihide" = false;
    #     "intellihide-mode" = "FOCUS_APPLICATION_WINDOWS";
    #     "preferred-monitor" = -2;
    #     "preferred-monitor-by-connector" = "DisplayPort-0";
    #     "preview-size-scale" = 0.0;
    #     "show-show-apps-button" = false;
    #     "show-trash" = false;
    #     "transparency-mode" = "DYNAMIC";
    #   };

    #   "org/gnome/shell/extensions/pop-shell" = {
    #     "active-hint" = false;
    #     "gap-inner" = mkUint32 1;
    #     "gap-outer" = mkUint32 1;
    #     "tile-by-default" = true;
    #   };

    #   "org/gnome/shell/extensions/just-perfection" = {
    #     "accessibility-menu" = true;
    #     "activities-button" = true;
    #     "activities-button-icon-monochrome" = false;
    #     "activities-button-label" = true;
    #     "animation" = 0;
    #     "app-menu" = false;
    #     "app-menu-icon" = true;
    #     "app-menu-label" = true;
    #     "background-menu" = true;
    #     "clock-menu" = true;
    #     "controls-manager-spacing-size" = 0;
    #     "dash" = true;
    #     "dash-icon-size" = 0;
    #     "dash-separator" = true;
    #     "double-super-to-appgrid" = true;
    #     "gesture" = true;
    #     "hot-corner" = false;
    #     "keyboard-layout" = true;
    #     "notification-banner-position" = 2;
    #     "osd" = false;
    #     "panel" = true;
    #     "panel-arrow" = true;
    #     "panel-button-padding-size" = 4;
    #     "panel-corner-size" = 0;
    #     "panel-in-overview" = true;
    #     "panel-indicator-padding-size" = 0;
    #     "panel-notification-icon" = true;
    #     "panel-size" = 0;
    #     "power-icon" = true;
    #     "quick-settings" = true;
    #     "ripple-box" = true;
    #     "screen-sharing-indicator" = true;
    #     "search" = true;
    #     "show-apps-button" = true;
    #     "startup-status" = 0;
    #     "theme" = false;
    #     "window-demands-attention-focus" = false;
    #     "window-menu-take-screenshot-button" = true;
    #     "window-picker-icon" = true;
    #     "window-preview-caption" = true;
    #     "window-preview-close-button" = true;
    #     "workspace" = false;
    #     "workspace-background-corner-size" = 0;
    #     "workspace-peek" = false;
    #     "workspace-popup" = true;
    #     "workspace-switcher-size" = 0;
    #     "workspace-wrap-around" = false;
    #     "workspaces-in-app-grid" = true;
    #   };

    #   "org/gnome/shell/extensions/rounded-window-corners-reborn" = {
    #     skip-libadwaita-app = false;
    #     border-width = 1;
    #     border-color = mkTuple [
    #       0.71764707565307617
    #       0.74117660522460938
    #       0.97254902124404907
    #       1.0
    #     ];
    #     global-rounded-corner-settings = [
    #       (mkDictionaryEntry [
    #         "padding"
    #         (mkVariant [
    #           (mkDictionaryEntry [
    #             "left"
    #             (mkUint32 1)
    #           ])
    #           (mkDictionaryEntry [
    #             "right"
    #             (mkUint32 1)
    #           ])
    #           (mkDictionaryEntry [
    #             "top"
    #             (mkUint32 1)
    #           ])
    #           (mkDictionaryEntry [
    #             "bottom"
    #             (mkUint32 1)
    #           ])
    #         ])
    #       ])
    #       (mkDictionaryEntry [
    #         "keepRoundedCorners"
    #         (mkVariant [
    #           (mkDictionaryEntry [
    #             "maximized"
    #             false
    #           ])
    #           (mkDictionaryEntry [
    #             "fullscreen"
    #             false
    #           ])
    #         ])
    #       ])
    #       (mkDictionaryEntry [
    #         "borderRadius"
    #         (mkVariant (mkUint32 8))
    #       ])
    #       (mkDictionaryEntry [
    #         "smoothing"
    #         (mkVariant 0.0)
    #       ])
    #       (mkDictionaryEntry [
    #         "borderColor"
    #         (mkVariant (mkTuple [
    #           0.71764707565307617
    #           0.74117660522460938
    #           0.97254902124404907
    #           1.0
    #         ]))
    #       ])
    #       (mkDictionaryEntry [
    #         "enabled"
    #         (mkVariant true)
    #       ])
    #     ];
    #     settings-version = mkUint32 7;
    #     blacklist = [ "ulauncher" ];
    #   };

    #   "org/gnome/shell/extensions/space-bar/appearance" = {
    #     "inactive-workspace-text-color" = "rgb(154,153,150)";
    #     "workspace-margin" = 3;
    #     "workspaces-bar-padding" = 3;
    #   };

    #   "org/gnome/shell/extensions/space-bar/behavior" = {
    #     "scroll-wheel" = "panel";
    #     "show-empty-workspaces" = false;
    #     "smart-workspace-names" = false;
    #     "toggle-overview" = false;
    #   };

    #   "org/gnome/shell/extensions/space-bar/shortcuts" = {
    #     "enable-activate-workspace-shortcuts" = true;
    #     "enable-move-to-workspace-shortcuts" = true;
    #   };

    #   "org/gnome/shell/extensions/unblank" = {
    #     "power" = false;
    #     "time" = 0;
    #   };

    #   "org/gnome/shell/keybindings" = {
    #     "show-screen-recording-ui" = [ "<Shift><Super>r" ];
    #     "show-screenshot-ui" = [ "<Ctrl><Alt>S" ];
    #     "switch-to-application-1" = [ ];
    #     "switch-to-application-2" = [ ];
    #     "switch-to-application-3" = [ ];
    #     "switch-to-application-4" = [ ];
    #     "switch-to-application-5" = [ ];
    #     "switch-to-application-6" = [ ];
    #     "switch-to-application-7" = [ ];
    #     "switch-to-application-8" = [ ];
    #     "switch-to-application-9" = [ ];
    #     "toggle-application-view" = [ "<Super>a" ];
    #     "toggle-message-tray" = [ "<Super>v" ];
    #   };

    #   "org/gnome/system/location" = {
    #     "enabled" = true;
    #   };

    #   "system/locale" = {
    #     "region" = "en_IE.UTF-8";
    #   };
  };

  # # pop-shell settings
  # xdg.configFile = {
  #   "pop-shell/config.json".text = ''
  #     {
  #       "float": [
  #         {
  #           "class": "ulauncher"
  #         },
  #         {
  #           "class": "org.gnome.Calculator"
  #         },
  #         {
  #           "class": "zoom",
  #           "disabled": true
  #         },
  #         {
  #           "class": "crx_.*"
  #         },
  #         {
  #           "title": "crx_.*"
  #         }
  #       ],
  #       "skiptaskbarhidden": [],
  #       "log_on_focus": false
  #     }
  #   '';
  # };

  # gtk = {
  #   enable = true;
  #   iconTheme = {
  #     name = "Tela-circle-dark";
  #     package = pkgs.tela-circle-icon-theme;
  #   };
  #   cursorTheme = {
  #     name = "Yaru";
  #     package = pkgs.yaru-theme;
  #     size = 24;
  #   };
  #   font = {
  #     name = "Roboto";
  #     size = 11;
  #   };
  #   gtk3 = {
  #     bookmarks = [
  #       "file:///home/coden/Documents"
  #       "file:///home/coden/Downloads"
  #       "file:///home/coden/Pictures"
  #       "file:///home/coden/Videos"
  #       "file:///home/coden/Downloads/temp"
  #       "file:///home/coden/Documents/repositories"
  #     ];
  #   };

  # };

  # qt = {
  #     enable = true;
  #     platformTheme.name = "kvantum";
  #     style.name = "kvantum";
  #   };

  #   # catppuccin.kvantum.enable = true;
  #   # catppuccin.kvantum.apply = true;

  #   home.sessionVariables = {
  #     # use wayland as the default backend, fallback to xcb if wayland is not available
  #     QT_QPA_PLATFORM = "xcb";

  #     # remain backwards compatible with qt5
  #     DISABLE_QT5_COMPAT = "0";

  #     # tell calibre to use the dark theme
  #     CALIBRE_USE_DARK_PALETTE = "1";
  #   };

  # Styling
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

  programs.home-manager.enable = true;
}
