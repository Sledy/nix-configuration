{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Disable KDE Plasma Desktop Environment and SDDM.
  services.displayManager.sddm.enable = false;
  services.desktopManager.plasma6.enable = false;

  # Enable GNOME and GDM.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Optional: Enable GNOME accessibility features.
  services.gnome.core-apps.enable = true;
}

