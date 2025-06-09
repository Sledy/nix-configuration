{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jdk
    maven
    gradle
    nodejs_24
    docker
    sbt
    python313Full # python 3.13
    python311Packages.pip # python pip for version 3.13
  ];
  
  

  
  virtualisation.docker.rootless = {
  	enable = true;
  	setSocketVariable = true;
  };
  users.users.adam.extraGroups = [ "docker" ];
}

