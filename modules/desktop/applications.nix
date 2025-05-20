{ config, pkgs, ... }:

{

  services.flatpak.enable = true;
  
  environment.systemPackages = with pkgs; [
    pkgs.keepassxc
    pkgs.brave
    pkgs.jetbrains-toolbox
    pkgs.veracrypt
    pkgs.dbeaver-bin
    pkgs.vlc
  ];
}
