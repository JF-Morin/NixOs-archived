{
  description = "JF's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-25.05";
    home-manager = {
        url = "github:nix-community/home-manager/release-25.05";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
      nixosConfigurations = {
        # Use same config name as host name if not specified in the "nixos-rebuild switch --flake" command
          laptop = nixpkgs.lib.nixosSystem {
              inherit system;
              modules = [
                ./hosts/laptop/configuration.nix
              ];
          };

          desktop = nixpkgs.lib.nixosSystem {
              inherit system;
              modules = [
                ./hosts/desktop/configuration.nix
              ];
          };
      };

      homeConfigurations= {
          jf = home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              modules = [
                  ./home.nix
              ];
          };
      };

  };
}
