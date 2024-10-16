# Make sure that dotfiles are fully here
git submodule update --init --recursive

sudo rm hardware-configuration.nix
sudo nixos-generate-config --show-hardware-config > $1/hardware-configuration.nix

# Kick everything off
sudo nixos-rebuild switch --flake /etc/nixos?submodules=1#default
