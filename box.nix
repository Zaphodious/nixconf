# Used to switch host profiles, and set minor settings
# that aren't worth checking into git

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
  imports = [
    # !!!!!! This is where you change it!
    # Specify the required configuration file
    ./hosts/grub-vm/configuration.nix
  ];

    networking.hostName = "nixos"; # Define your hostname.
    # Enable networking
    networking.networkmanager.enable = true;
}
