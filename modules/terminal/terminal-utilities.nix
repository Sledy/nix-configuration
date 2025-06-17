{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rclone
    ffmpeg-full
    wl-clipboard
    glxinfo
    tldr
  ];

  programs = {
    zsh = {
      enable = true;
      ohMyZsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "sudo"
          "terraform"
          "systemadmin"
          "vi-mode"
        ];
      };
    };
  };
}

