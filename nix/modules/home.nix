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
      gnome-tweaks
      gnomeExtensions.blur-my-shell
      gnomeExtensions.user-themes
      maim
      xclip
    ];
  };

  dconf.settings = {
    "org/gnome/shell" = {
      "disable-user-extensions" = false;
      "enabled-extensions" = [
        "blur-my-shell@aunetx"
      ];
    };

    "org/gnome/desktop/wm/keybindings" = {
      "close" = [ "<Super><Shift><Alt>Escape" ];
      "minimize" = [ "<Super><Shift><Alt>3" ];
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
      "switch-to-workspace-8" = [ "<Super>8" ]; # use also switch left and right shortcuts
      "switch-to-workspace-9" = [ "<Super>9" ];
      "toggle-maximized" = [ "<Super><Shift><Alt>Return" ];
    };

    "org/gnome/desktop/wm/preferences" = {
      "button-layout" = lib.mkForce "";
      "focus-mode" = "sloppy";
      "focus-new-windows" = "smart";
      "num-workspaces" = 5;
      "titlebar-font" = "Roboto Bold 11";
      "workspace-names" = [ "1" ];
    };

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
      "command" = "ulauncher-toggle";
      "name" = "Ulauncher";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      "binding" = "<Super><Shift><Alt>Backspace";
      "command" = "kitty";
      "name" = "Kitty";
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      "settings-version" = 2;
    };

    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      "pipeline" = "pipeline_default_rounded";
    };

    "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
      "pipeline" = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      "pipeline" = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      "pipeline" = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
      "pipeline" = "pipeline_default";
    };
  };

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

  programs.home-manager.enable = true;
}
