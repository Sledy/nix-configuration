{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.catppuccin-kde
  ];
}
