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
      lib,
      ...
    }:
    let
        custom-homes = {
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
          "${username}@${hostname}" = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.${system};
            home.username = username;
            home.homeDirectory = homedir;

            # Specify your home configuration modules here, for example,
            # the path to your home.nix.
            modules = [ homefile ];

            # Optionally use extraSpecialArgs
            # to pass through arguments to home.nix
          };
        };
    make-the-homes = homedefs: lib.mkMerge ((builtins.map make-standard-home homedefs)
                  ++ [custom-homes]);
    in
    {

      homeConfigurations = make-the-homes standard-homes;
    };
}
