{ config, pkgs, ... }:

{
  # TODO: Please change the username & home directory to your own
  home.username = "adam";
  home.homeDirectory = "/home/adam";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
      gnomeExtensions.system-monitor-next
      gnomeExtensions.appindicator
      gnomeExtensions.dash-to-dock
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        dash-to-dock.extensionUuid
        appindicator.extensionUuid
        system-monitor-next.extensionUuid
      ];
    };
  };

  # Basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Adam Śledziewski";
    userEmail = "sledziewski.adam@proton.me";
    signing = {
      key = "14BD25CDFCC9D9C62BB6DB81BE0FEF77B908998C";
      signByDefault = true;
    };
    maintenance = {
      enable = true;
      repositories = [
        "/home/adam/Work/KraftCode/Scout24/Repositories/is24-sso-iterable-sync"
      ];
    };
    
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
