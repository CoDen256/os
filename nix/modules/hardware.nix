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
  hardware = {
    graphics = {
        enable = true;
        enable32Bit = true;
    };

    amdgpu.amdvlk = {
        enable = true;
        support32Bit.enable = true;
    };
};
}
