{ config, lib, pkgs, modulesPath, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_zen; 

    extraModulePackages = [
      config.boot.kernelPackages.rtl8814au # Alpha AWUS wifi drivers 
    ];

    loader = { # DO NOT REMOVE
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };

      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
      };
    };
  };
}