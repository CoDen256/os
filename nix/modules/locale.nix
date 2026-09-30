{
  config,
  lib,
  pkgs,
  modulesPath,
  options,
  ...
}:
{

  # custom phonetic russian and german layout
  services.xserver = {
    enable = true;
    xkb = { # shortcuts -> add new command -> /run/current-system/sw/bin/qdbus org.kde.keyboard /Layouts org.kde.KeyboardLayouts.setLayout 3 # 0,1,2,3
      layout = "us,rupho,depho,nopho";
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
      extraLayouts.nopho = {
        description = "Norwegian Phonetic Mirror of US";
        languages = [ "nor" ];
        symbolsFile = pkgs.copyPathToStore ../../input/symbols/nopho;
      };
    };
  };

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };
}
