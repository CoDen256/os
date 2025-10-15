{
  lib,
  config,
  pkgs,
  ...
}:

{
  security.rtkit.enable = true; # used by PulseAudio and PipeWire use this to acquire realtime priority.
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };
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
  };
  boot = {
    extraModulePackages = [
      config.boot.kernelPackages.rtl8814au # Alpha AWUS wifi drivers
    ];

    loader = {
      # DO NOT REMOVE
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
