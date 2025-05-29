{ config, pkgs, ... }:
{
  boot.loader.systemd-boot.enable = false; # Disable systemd
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
      default = "saved";
    };
  };
  boot.supportedFilesystems = [ "ntfs" ];
}
