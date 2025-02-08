{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
let
in
{
  environment.systemPackages = with pkgs; [   
    wireshark

    mitmproxy
    httptoolkit
    zap
    burpsuite
    keystore-explorer

    apktool

        openssl
    nmap
    openssh


  ];
}
