{ config, pkgs, ... }:

{
  
  environment.systemPackages = with pkgs; [
    pkgs.exfatprogs
    pkgs.gparted
  ];
}
