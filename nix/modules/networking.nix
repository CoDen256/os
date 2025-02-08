{
  config,
  lib,
  pkgs,
  modulesPath,
  options,
  ...
}:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true; # gtk bluetooth manager

  networking = {
    hostName = "deimos";
    networkmanager.enable = true;
    networkmanager.enableStrongSwan = true; # for vpn
    timeServers = options.networking.timeServers.default ++ [ "pool.ntp.org" ];
  };

  services.xl2tpd.enable = true; # for l2tp vpn
  services.strongswan = {
    # for vpn
    enable = true;
    secrets = [
      "ipsec.d/ipsec.nm-l2tp.secrets"
    ];
  };
  environment.etc."strongswan.conf".text = ""; # fix vpn cotfigure via networl manager /etc/NetworkManager/system-connections
  environment.systemPackages = with pkgs; [
    networkmanager-l2tp # l2tp vpn
  ];

}
