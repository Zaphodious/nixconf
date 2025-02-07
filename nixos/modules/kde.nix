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
    modules.kde.enabled = lib.options.mkEnableOption "KDE Module";
  };
  config = lib.mkIf config.modules.kde.enabled {

    environment.systemPackages =
      (with pkgs; [
      kdePackages.kdecoration
      kdePackages.applet-window-buttons6
      sweet
      sweet-nova
      sweet-folders
      candy-icons
      #libsForQt5.qtstyleplugin-kvantum
      kdePackages.qtstyleplugin-kvantum
      ]);

	services = {
		displayManager.sddm = {
			enable = true;
			wayland.enable = true;
		};
		desktopManager.plasma6.enable = true;
	};

  };
}
