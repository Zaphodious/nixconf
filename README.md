# Zaph's Nix Configs

Zaph's personal nix configs for 

- [NixOS](./nixos/)
- [Home Manager](./home-manager/)
- [NixVim](./nixvim/)

## Running

After updating the config for NixOS, run [switch_nixos.sh](./switch_nixos.sh).
After updating the config for either Home Manager or NixVim, run
[switch_hm.sh](./switch_hm.sh). (To test NixVim config changes before switching,
run `nix run ./nixvim/`)

## First time setup

A new NixOS machine can be configured by running (setup_host.sh)[./setup_host.sh) 
(If no hostname is passed into the script, it will prompt for one). 

For convienence, the following can also be run from the admin user's 
home directory, which will clone the repo and run the above script 
automatically:

```
bash <(curl -s https://raw.githubusercontent.com/Zaphodious/nixconf/refs/heads/main/clonesetup.sh)
```

(Note that several scripts and configurations assume that this repo is cloned 
under the home directory. The clonesetup.sh script will not 
prevent cloning to a different location.)

## Updating 

If the hardware on a given system changes, running
(refresh-hardware.sh)[./refresh-hardware.sh] on the machine will update the
host's hardware-configuration.nix file.

To update dependencies, either specifically or system-wide, please see 
the documentation for how to update depencies using nix flakes.

## OneDrive

For logging into OneDrive on a new system, please refer to [this wiki article]
(https://nixos.wiki/wiki/OneDrive).
