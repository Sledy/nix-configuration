{
  description = "NixOS flake";

  inputs = {
    # NixOS official package source (nixos-25.05)
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    # Firefox Nightly from nix-community
    firefox.url = "github:nix-community/flake-firefox-nightly";
    firefox.inputs.nixpkgs.follows = "nixpkgs";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        # Main host configuration
        ./hosts/nixos/configuration.nix

        # Themes
        ./modules/desktop/themes.nix

        # Applications
        ./modules/desktop/applications.nix

        # Infrastructure
        ./hosts/nixos/Infrastructure_modules/bootloader.nix
        ./hosts/nixos/Infrastructure_modules/desktop_environment.nix
        ./hosts/nixos/Infrastructure_modules/nvidia_drivers.nix
        ./hosts/nixos/Infrastructure_modules/sound_drivers.nix

        # Provide flake inputs to all modules
        ({ ... }: { _module.args.inputs = inputs; })

        # Firefox Nightly module
        ./modules/desktop/firefox-nightly.nix

        # NixOS optimizations
        ./modules/nix-optimization/garbage-collection.nix

        # Environment variables
        ./modules/environmental-variables/envs.nix

        # Work-related tools
        ./modules/work/programming.nix
        ./modules/work/gnupg.nix

        # Scout24
	./modules/work/scout24.nix

        # Terminal utilities
        ./modules/terminal/terminal-utilities.nix

        # External devices
        ./modules/desktop/printer.nix

        # Partitioning tools
        ./modules/desktop/partitioning-tools.nix

        # Home Manager integration
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.adam = import ./home.nix;
        }
      ];
    };
  };
}

