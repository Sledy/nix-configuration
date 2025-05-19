{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jdk
    maven
    gradle
    nodejs_23
    docker
  ];
  
  virtualisation.docker.rootless = {
  	enable = true;
  	setSocketVariable = true;
  };
  users.users.adam.extraGroups = [ "docker" ];
}

