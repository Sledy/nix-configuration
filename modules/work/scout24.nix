{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     awscli2
  ];
  
  programs.nix-ld.enable = true; # Required for running the generic linux binaries
}

