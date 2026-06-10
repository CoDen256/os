{
  lib,
  config,
  pkgs,
  options,
  ...
}:

{
  security.rtkit.enable = true; # used by PulseAudio and PipeWire use this to acquire realtime priority.

  hardware = {
    logitech.wireless = {
      # logitech wireless devices
      enable = true;
      enableGraphical = true;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
  services = {
    blueman.enable = true; # gtk bluetooth manager
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };

    strongswan = {
      # for vpn
      enable = true;
      secrets = [
        "ipsec.d/ipsec.nm-l2tp.secrets"
      ];
    };

    xl2tpd.enable = true; # for l2tp vpn
  };

  networking = {
    hostName = "deimos";
    networkmanager.enable = true;
    timeServers = options.networking.timeServers.default ++ [ "pool.ntp.org" ];
    networkmanager.plugins = [ pkgs.networkmanager_strongswan ];
  };

  environment.etc."strongswan.conf".text = ""; # fix vpn cotfigure via networl manager /etc/NetworkManager/system-connections
  environment.systemPackages = with pkgs; [
    networkmanager-l2tp # l2tp vpn
  ];
  boot.extraModulePackages = [
  (config.boot.kernelPackages.rtl8814au.overrideAttrs (old: {
    version = "unstable-2026-xx-xx";
    src = pkgs.fetchFromGitHub {
      owner = "morrownr";
      repo = "8814au";
      rev = "b1866ce2b857a8dfe2e147e19eb8eca0a842ce18";
      hash = "sha256-vT6U30w4HK0S7P63adkBZfpLg7OG+I6d0nEljE8yvqY=";  # leave empty, copy the correct hash from the build error
    };
    meta = old.meta // { broken = false; };
  }))
];
}
