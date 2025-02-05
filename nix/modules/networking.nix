{
  config,
  lib,
  pkgs,
  modulesPath,
  options,
  ...
}:

{
  services.blueman.enable = true;
  networking = {
    hostName = "deimos";
    networkmanager.enable = true;
    networkmanager.enableStrongSwan = true;
    timeServers = options.networking.timeServers.default ++ [ "pool.ntp.org" ];
    firewall = {
      allowedTCPPortRanges = [
        {
          from = 8060;
          to = 8090;
        }
      ];
      allowedUDPPortRanges = [
        {
          from = 8060;
          to = 8090;
        }
      ];
    };
  };

  services.xl2tpd.enable = true;
  services.strongswan = {
    enable = true;
    secrets = [
      "ipsec.d/ipsec.nm-l2tp.secrets"
    ];
  };
  environment.etc."strongswan.conf".text = ""; # fix vpn cotfigure via networl manager /etc/NetworkManager/system-connections

}
