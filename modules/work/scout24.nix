{ config, pkgs, inputs, ... }:

let
  chrome = (import inputs.chrome-pkgs {
    inherit (pkgs) system;
    config.allowUnfree = true;
  }).google-chrome;
in
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    awscli2
    chrome
  ];
}

