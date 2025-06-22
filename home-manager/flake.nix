{
  description = "Home Manager configuration of zaph";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    proompt = {
      url = "github:Zaphodious/proompt";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    godot-bin = {
      url = "github:Damianu/godot4-bin";
      inputs.nixpkgs.follows = "nixpkgs"; # Might prevent some OpenGL issues
    };
    nixvim-config.url = "path:../nixvim";
    nix-alien.url = "github:thiagokokada/nix-alien";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      custom-homes = {
      };
      standard-homes = (builtins.fromJSON (builtins.readFile ./homes.json)).homes;

      make-standard-home =
        {
          username,
          homedir,
          hostname,
          system,
          homefile,
          single-user,
        }:
        let
          optname = if single-user then "${username}" else "${username}@${hostname}";
        in
        {
          "${optname}" = home-manager.lib.homeManagerConfiguration (
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
              pkgs = (
                import nixpkgs {
                  inherit system;
                  config = {
                    permittedInsecurePackages = [
                      "dotnet-sdk-6.0.428"
                    ];
                  };
                }
              );


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
