{ config, pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.whitesur-gtk-theme
    pkgs.whitesur-icon-theme
    pkgs.sassc
    pkgs.go
    pkgs.glib
    pkgs.libxml2
    pkgs.dialog
    pkgs.jdupes
    pkgs.util-linux
    pkgs.ubuntu_font_family
  ];
}
