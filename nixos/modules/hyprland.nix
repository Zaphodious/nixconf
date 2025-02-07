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
    modules.hyprland.enabled = lib.options.mkEnableOption "Hyprland Module";
  };
  config = lib.mkIf config.modules.hyprland.enabled {

	#services.xserver.enable = true;
	services.displayManager.sddm = {
		enable = true;
		wayland.enable = true;
		theme = "where_is_my_sddm_theme";
	};

	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};

    environment.systemPackages = with pkgs; [
      # ... other packages
      kitty
      where-is-my-sddm-theme
      libinput
      libinput-gestures
    ];


  };
}
