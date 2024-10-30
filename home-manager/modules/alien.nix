# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  inputs,
  lib,
  system,
  ...
}:
{
  imports = [
  ];
  options = {
  	modules.alien.enable = lib.options.mkEnableOption "nix-alien module";
  };
  config = lib.mkIf config.modules.alien.enable {

    home.packages = with inputs.nix-alien.packages.${system}; [
        nix-alien
    ]; 
    

    };
}
