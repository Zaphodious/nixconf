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
    modules.kde.enable = lib.options.mkEnableOption "KDE apps";
  };
  config = lib.mkIf config.modules.kde.enable {

    home.packages = with pkgs; [
      kdePackages.kdeconnect-kde
    ];

  };
}
