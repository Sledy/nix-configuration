{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.whitesur-gtk-theme
    pkgs.whitesur-icon-theme
  ];
}
