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
  ];

}
