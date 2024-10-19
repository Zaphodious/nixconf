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
  ];

}
