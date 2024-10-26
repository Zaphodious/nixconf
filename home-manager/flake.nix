{
  description = "Home Manager configuration of zaph";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }:
    let
      custom-homes =
        {
        };
      standard-homes = [
        {
          username = "zaph";
          homedir = /home/zaph;
          hostname = "instapop";
          system = "x86_64-linux";
          homefile = ./home.nix;
        }
      ];

      make-standard-home =
        {
          username,
          homedir,
          hostname,
          system,
          homefile,
        }:
        {
          "${username}@${hostname}" =
            home-manager.lib.homeManagerConfiguration (nixpkgs.lib.debug.traceVal
              {

                # Specify your home configuration modules here, for example,
                # the path to your home.nix.
                modules = [
                  homefile
                  {
                    home = {
                      inherit username;
                      homeDirectory = homedir;

                    };

                  }
                ];
                #hmm
                pkgs = nixpkgs.legacyPackages.${system};

                # Optionally use extraSpecialArgs
                # to pass through arguments to home.nix
              });
        };
      make-the-homes =
        homedefs: nixpkgs.lib.attrsets.mergeAttrsList ((builtins.map make-standard-home homedefs) ++ [ custom-homes ]);
    in
    {

      homeConfigurations = make-the-homes standard-homes;
    };
}
