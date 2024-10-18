{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Flake syntax means that only outputs can have arbitrary code.
  outputs =
    { self, nixpkgs, ... }@inputs:
    let
    in
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };
        modules = [
          # This lets us set the module for the machine to use 
          # out in box-conf.nix
          #./hardware-configuration.nix
          #(host + "/configuration.nix")
	  ./hosts/default/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      nixosConfigurations.inspatop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };
        modules = [
          # This lets us set the module for the machine to use 
          # out in box-conf.nix
          #./hardware-configuration.nix
          #(host + "/configuration.nix")
	  ./hosts/inspatop/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      # From vimjoyer video, don't touch, allows
      # modularity in homemanager
      homeManagerModules.default = ../home-manager;
      };
}
