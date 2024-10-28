{
  inputs,
  lib,
  config,
  pkgs,
  system,
  ...
}:
{
  options = {
    modules.custom-nixvim.enable = lib.mkEnableOption "enables Hyprland Config profile";
  };
  config = lib.mkIf config.modules.custom-nixvim.enable {

    home.packages = with pkgs; [
      inputs.nixvim-config.packages.${system}.default
    ];
  };
}
