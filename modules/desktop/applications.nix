{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pkgs.signal-desktop
    pkgs.brave

  ];
}
