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
  outputs = { self, nixpkgs, ... }@inputs: 
  let 	
  	# Not using lib.mk stuff, just direct nix attributes
	# because we don't want to override what is set here.
	box-conf = import ./box-conf.nix;
	host = (./hosts + ("/" + box-conf.host-profile));

  in {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {
	      inherit inputs;
	      inherit box-conf;
	      paths = {
	      	  inherit host;
		  home = ./hmmodules;

	      };
      };
      modules = [
        # This lets us set the module for the machine to use 
	# out in box-conf.nix
	./hardware-configuration.nix
        (host + "/configuration.nix") 
        inputs.home-manager.nixosModules.default
      ];
    };
    # From vimjoyer video, don't touch, allows
    # modularity in homemanager
    homeManagerModules.default =  ./dotfiles;
  };
}
