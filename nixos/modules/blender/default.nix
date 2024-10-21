# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
<<<<<<< HEAD
=======
  pkgs-unstable,
>>>>>>> a0c848d9c9d131bad61a23c218ab0cddbfd9b134
  inputs,
  lib,
  ...
}:

{
  imports =
    [
    ];
  options = {
    modules.blender.enabled = lib.options.mkEnableOption "Hyprland Module";
  };
  config = lib.mkIf config.modules.blender.enabled {


<<<<<<< HEAD
    environment.systemPackages = with pkgs; [
=======
    environment.systemPackages = with pkgs-unstable; [
>>>>>>> a0c848d9c9d131bad61a23c218ab0cddbfd9b134
      # ... other packages
      blender
    ];


  };
}
