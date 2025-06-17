{ config, pkgs, ... }:

{
  systemd.services."gnome-suspend" = {
    description = "Suspend GNOME Shell";
    before = [
      "systemd-suspend.service"
      "systemd-hibernate.service"
      "nvidia-suspend.service"
      "nvidia-hibernate.service"
    ];
    wantedBy = [
      "systemd-suspend.service"
      "systemd-hibernate.service"
    ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        ${pkgs.procps}/bin/pkill -f -STOP ${pkgs.gnome-shell}/bin/gnome-shell
      '';
    };
  };

  systemd.services."gnome-resume" = {
    description = "Resume GNOME Shell";
    after = [
      "systemd-suspend.service"
      "systemd-hibernate.service"
      "nvidia-resume.service"
    ];
    wantedBy = [
      "systemd-suspend.service"
      "systemd-hibernate.service"
    ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        ${pkgs.procps}/bin/pkill -f -CONT ${pkgs.gnome-shell}/bin/gnome-shell
      '';
    };
  };
}

