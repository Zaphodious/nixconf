# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  imports = [
  ];
  options = {
  	modules.kanata.enable = lib.options.mkEnableOption "Kanata Module";
  };
  config = libmkIf config.modules.kanata.enable {

	services.kanata = {
		enable = true;
		keyboards.default = {
			config = builtins.readFile ./kanata.kbd
		};

    };
}
