{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    pkgs.rclone
    pkgs.ffmpeg-full
    pkgs.wl-clipboard
  ];
}

