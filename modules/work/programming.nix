{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jdk
    maven
    gradle
    nodejs_24
    docker
    chromedriver
  ];
  
  virtualisation.docker.rootless = {
  	enable = true;
  	setSocketVariable = true;
  };
  users.users.adam.extraGroups = [ "docker" ];
}

