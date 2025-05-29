{ config, pkgs, ... }:

{
  # Enable sound with PipeWire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # If you want to use JACK applications, uncomment this:
    # jack.enable = true;

    # Use the example session manager (enabled by default, no need to redefine it):
    # media-session.enable = true;
  };
}

