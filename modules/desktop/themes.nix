{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.whitesur-gtk-theme
  ];
}
