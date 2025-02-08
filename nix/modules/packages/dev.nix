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
  virtualisation = {
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };

}
