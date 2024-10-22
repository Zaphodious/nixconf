

#sudo rm hardware-configuration.nix
sudo nixos-generate-config --show-hardware-config > ./hardware-configuration.nix

# Kick everything off
sudo nixos-rebuild switch --flake /etc/nixos?submodules=1#default
