# Zaph's NixVim Configuration (2024)

NixVim configuration taken from Zaph's previous dotfiles, and updated.

## Key Maps

Declared remaps: [`Remaps.md`](./Remaps.md) 

Plugin which-key is installed, which should help make complex
mappings easier to navigate

# Organization

If a plugin doesn't have any configuring to do,
it is declared in [`config/default.nix`](./config/default.nix). Color schemes are 
declared in [`config/colorscheme.nix.`](./config/colorscheme.nix).
LSP servers are declared in lsp.nix.

Key maps are declared in
[`config/keys/remaps.json`](./config/keys/remaps.json),
where they are parsed by
[`config/keys/parsed-remaps.nix`](./config/keys/parsed-remaps.nix) 
into registered mappings,
[`config/keys/which-key.nix`](./config/keys/which-key.nix) 
into properly-declared which-key configs, and manually by
[`config/keys/gen-nixvim-mapping-md.sh`](./config/keys/gen-nixvim-mapping-md.sh)
into
[`Remaps.md`](./Remaps.md). (Why a json file? It's easily parsed and understood
by everything, including handlbars (for remaps.md) and lua (if the config
needs migrating back to regular old neovim for some reason).)

If a new config file is added, it should be imported in
[`config/default.nix`](config/default.nix)
and added to git (it will not work otherwise).

## Running

From a computer where nix is installed and flakes are enabled, run

```bash
nix run "github:zaphodious/nixconf?dir=nixvim"
```

## As a module

To use as a module within another flake, see Nixvim's [Standalone Usage](https://nix-community.github.io/nixvim/platforms/standalone.html)
documentation.

## Nixconf Home manager

If using the home manager configuration from this repo, running 
(switch_hm.sh)[../switch_hm.sh] will automatically 
use the up to date version of this configuration (and will generate 
an updated [`Remaps.md`](./Remaps.md)
