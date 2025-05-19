{ pkgs, inputs, config, ... }:
{
  environment.systemPackages = [
    inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin
  ];
}
