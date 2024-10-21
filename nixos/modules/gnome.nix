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
    modules.gnome.enabled = lib.options.mkEnableOption "Gnome Module";
  };
  config = lib.mkIf config.modules.gnome.enabled {

	services.xserver = {
		enable = true;
		displayManager.gdm.enable = true;
		desktopManager.gnome.enable = true;
	};

	services.gnome = {
		games.enable = true;

	};

    environment.systemPackages =

		(with pkgs.gnomeExtensions; [
    	x11-gestures
	window-on-top
	wayland-or-x11
	useless-gaps
	tilingnome
	systemd-manager
	rounded-window-corners
	rounded-corners
	rocketbar
	quick-touchpad-toggle
	pop-shell
	onedrive
	nasa-apod
	media-controls
	maximize-to-empty-workspace
	maccy-menu
	logo-menu
	desktop-cube
    ]) ++ 

		(with pkgs; [
			gnome-tweaks
		]);

  };
}
