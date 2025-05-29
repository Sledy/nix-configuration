{ config, pkgs, ... }:

{
  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    keepassxc
    brave
    jetbrains-toolbox
    veracrypt
    dbeaver-bin
    mpv
    smplayer
    gthumb
    obs-studio
    logseq
    vim  # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git
    gnome-control-center
    htop
  ];
}

