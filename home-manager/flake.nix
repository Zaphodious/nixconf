{
  description = "Home Manager configuration of zaph";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim-config.url = "path:../nixvim";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      custom-homes =
        {
        };
      standard-homes = (builtins.fromJSON (builtins.readFile ./homes.json)).homes;

      make-standard-home =
        {
          username,
          homedir,
          hostname,
          system,
          homefile,
        }:
        {
          "${username}@${hostname}" = home-manager.lib.homeManagerConfiguration (
            nixpkgs.lib.debug.traceVal {

              # Specify your home configuration modules here, for example,
              # the path to your home.nix.
              modules = [
                (./homes + ("/" + homefile))
                {
                  home = {
                    inherit username;
                    homeDirectory = builtins.toPath homedir;

                  };

                }
              ];
              #hmm
              pkgs = nixpkgs.legacyPackages.${system};

              # Optionally use extraSpecialArgs
              # to pass through arguments to home.nix
              extraSpecialArgs = {
                inherit inputs;
                inherit system;
              };
            }
          );
        };
      make-the-homes =
        homedefs:
        nixpkgs.lib.attrsets.mergeAttrsList (
          (builtins.map make-standard-home homedefs) ++ [ custom-homes ]
        );
    in
    {

      homeConfigurations = make-the-homes standard-homes;
    };
}
