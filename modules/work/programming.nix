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

    virtualisation.docker = {
      enable = false;
      enableNvidia = true;

      rootless = {
        enable = true;
        setSocketVariable = true;
        # Optionally customize rootless Docker daemon settings
        daemon.settings = {
          dns = [ "1.1.1.1" "8.8.8.8" ];
          registry-mirrors = [ "https://mirror.gcr.io" ];
        };
      };
    };

  users.users.adam.extraGroups = [ "docker" ];
}

