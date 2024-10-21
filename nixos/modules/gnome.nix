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

    hardware.sensor.iio.enable = true;

    environment.systemPackages =

      (with pkgs; [
        gnome-tweaks
        wev
      ]) ++ 
      (with pkgs.gnomeExtensions; [
        x11-gestures
        window-on-top
        wayland-or-x11
        systemd-manager
        rocketbar
        nasa-apod
        media-controls
        logo-menu
        desktop-cube
        just-perfection
        fullscreen-to-empty-workspace
        fullscreen-button
        appindicator
        open-bar
        top-bar-organizer

      ]);

  };
}
