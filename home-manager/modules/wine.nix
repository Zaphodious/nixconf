# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  inputs,
  lib,
  system,
  pkgs,
  ...
}:
{
  imports = [
  ];
  options = {
  	modules.wine.enable = lib.options.mkEnableOption "wine module";
  };
  config = lib.mkIf config.modules.wine.enable {
   
    home.packages = with pkgs; [
    # ...

    # support both 32-bit and 64-bit applications
    # wineWowPackages.stable

    # support 32-bit only
    # wine

    # support 64-bit only
    # (wine.override { wineBuild = "wine64"; })

    # support 64-bit only
    # wine64

    # wine-staging (version with experimental features)
    # wineWowPackages.staging

    # winetricks (all versions)
    # winetricks

    # native wayland support (unstable)
    wineWowPackages.waylandFull
  ];

    };
}
