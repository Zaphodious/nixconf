{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
let
  foo = 1;
in
{

  imports = [
    ./dev
    ./nixos
    ./hyprland.nix
    ./nixvim.nix
    ./tab-rs.nix
    ./fonts.nix
    ./fonts.nix
    ./alien.nix
    ./bash.nix
    ./alacritty
  ];

}
