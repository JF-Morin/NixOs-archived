{
  description = "JF's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... } @ inputs:
  {
      nixosConfigurations = {
# Use same config name as host name
          JFLaptop = nixpkgs.lib.nixosSystem {
              system = "x86_64-linux";
              modules = [
                ./hosts/laptop/configuration.nix
              ];
          };

          JFDesktop = nixpkgs.lib.nixosSystem {
              system = "x86_64-linux";
              modules = [
                ./hosts/desktop/configuration.nix
              ];
          };
      };
  };
}
