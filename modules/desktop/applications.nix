{ config, pkgs, ... }:

{

  services.flatpak.enable = true;
  
  environment.systemPackages = with pkgs; [
    pkgs.keepassxc
    pkgs.brave
    pkgs.signal-desktop
    pkgs.jetbrains-toolbox
    pkgs.veracrypt
    pkgs.dbeaver-bin
  ];
}
