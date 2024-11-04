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


    lib.meta = {
      configPath = lib.debug.traceValSeq "${config.home.homeDirectory}/nixconf/home-manager/mutable-configs";
      linkMutableConfig = path: config.lib.file.mkOutOfStoreSymlink
        (config.lib.meta.configPath + lib.strings.removePrefix (toString inputs.self) ("/" + (toString path)));
    };

}
