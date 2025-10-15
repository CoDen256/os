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

    amdgpu.amdvlk = {
      enable = true;
      support32Bit.enable = true;
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

  boot = {
    extraModulePackages = [
      config.boot.kernelPackages.rtl8814au # Alpha AWUS wifi drivers
    ];
  };
}
