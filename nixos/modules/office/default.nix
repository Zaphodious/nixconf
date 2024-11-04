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
    modules.office.enabled = lib.options.mkEnableOption "Hyprland Module";
  };
  config = lib.mkIf config.modules.office.enabled {

    # https://nixos.wiki/wiki/OneDrive

    environment.systemPackages = with pkgs; [
      # ... other packages
      libreoffice
      onedrive

    ];
    services.onedrive.enable = true;


  };
}
