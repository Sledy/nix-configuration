{
  description = "NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    firefox.url = "github:nix-community/flake-firefox-nightly";
    firefox.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./hosts/nixos/configuration.nix
        ./modules/desktop/applications.nix
        ./modules/desktop/themes.nix
        
        ({ ... }: { _module.args.inputs = inputs; })
        ./modules/desktop/firefox-nightly.nix
        
        ./modules/desktop/firefox-nightly.nix
        ./modules/nix-optimization/garbage-collection.nix
        ./modules/environmental-variables/envs.nix

        # Make home-manager as a module of nixos
        # so that home-manager configuration will be deployed
        # automatically when executing `nixos-rebuild switch`


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
