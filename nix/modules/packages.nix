{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./packages/dev.nix
    ./packages/rev.nix
    ./packages/apps.nix
    ./packages/os.nix
    ./packages/cli.nix
  ];
}
