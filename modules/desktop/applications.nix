{ config, pkgs, ... }:

{

  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    pkgs.signal-desktop
    pkgs.keepassxc
    pkgs.brave
  ];
}
