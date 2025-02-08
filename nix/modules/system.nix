{
  lib,
  config,
  pkgs,
  ...
}:
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
}
