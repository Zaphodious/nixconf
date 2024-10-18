# Make sure that dotfiles are fully here
git submodule update --init --recursive

# Make sure that we can change necessary files without checking
# changes into git

git update-index --skip-worktree hardware-configuration.nix
git update-index --skip-worktree box.nix

#sudo rm hardware-configuration.nix
sudo nixos-generate-config --show-hardware-config > ./hardware-configuration.nix

# Kick everything off
sudo nixos-rebuild switch --flake /etc/nixos?submodules=1#default
