cd ./home-manager
nix flake update nixvim-config
home-manager switch --flake ./ --show-trace
cd ../

