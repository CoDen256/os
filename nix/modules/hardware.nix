{
  lib,
  config,
  pkgs,
  ...
}:

{
  hardware = {
    logitech.wireless = { # logitech wireless devices
      enable = true;
      enableGraphical = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  security.rtkit.enable = true; # used by PulseAudio and PipeWire use this to acquire realtime priority.
  services.pulseaudio.enable = false;
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
}
