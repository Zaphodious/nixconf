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
  imports =
    [
    ];
  options = {
    modules.gnome.enabled = lib.options.mkEnableOption "Hyprland Module";
  };
  config = lib.mkIf config.modules.gnome.enabled {

	#services.xserver.enable = true;
	services.displayManager.gdm.enable = true;
	services.displayManager.gnome.enable = true;

    environment.systemPackages = with pkgs; [
      # ... other packages
    ];


  };
}
