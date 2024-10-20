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
    modules.hyprland.enable = lib.options.mkEnableOption "Hyprland Module";
  };
  config = lib.mkIf config.modules.hyprland.enable {

    # Get hyper!
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    environment.systemPackages = [
      # ... other packages
      pkgs.kitty # required for the default Hyprland config
    ];

  };
}
