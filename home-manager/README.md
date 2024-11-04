# Home Manager System

Home manager subsystem.

## Running

To update the configuration after editing, set the working
directory to this directory's parent and run [../switch_hm.sh](../switch_hm.sh).

## Structure

Entry point for the configuration is [flake.nix](./flake.nix). Individual
homes are defined in terms of username hostname in homes.json. Home
files therein are stored in [homes/](./homes/). Configuration modules are
stored in [modules/](./modules/). Modules are enabled by setting the "enabled"
option for each one to "true".

By default, Home Manager stores all configuration information in
nix/store, which means that configuration cannot be changed from their
locations around the home directory. For modules with configuration that
needs to be changable in situ, those configs are to be stored in
[mutable-configs/](./mutable-configs/), and and referenced within 'home.file' with 
`config.lib.meta.linkMutableConfig` (example: 
`".config/godot/".source = config.lib.meta.linkMutableConfig "godot";` for
the folder [mutable-configs/godot/](./mutable-configs/godot/))

## New user configuration

Unlike with this repository's NixOS config, there is no automated setup system
for the Home Manager configuration. This is intentional. To add a user, go
to [homes.json](./homes.json) and copy a home block, then change the username
and hostname appropriately. If the home nix file listed does not work, copy
a new one. Note that folders with [mutable-configs/](./mutable-configs/) can be copied and
refereneced by the copy name, if needed.

