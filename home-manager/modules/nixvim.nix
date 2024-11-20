{
  inputs,
  lib,
  config,
  system,
  pkgs,
  ...
}:
{
  options = {
    modules.custom-nixvim.enable = lib.mkEnableOption "enables Hyprland Config profile";
  };
  config = lib.mkIf config.modules.custom-nixvim.enable {

    home.packages = [
      inputs.nixvim-config.packages.${system}.default
      pkgs.util-linux
    ];


  };
}
