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
    modules.lxqt.enabled = lib.options.mkEnableOption "lxqt Module";
  };
  config = lib.mkIf config.modules.lxqt.enabled {

    services.xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
      desktopManager = {
        lxqt.enable = true;
        xterm.enable = false;
      };
    };

    # Configure keymap in X11
    xkb = {
      layout = "us";
      variant = "";
    };

  };
}
