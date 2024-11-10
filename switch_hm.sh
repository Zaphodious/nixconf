cd ./home-manager
nix flake update nixvim-config --extra-experimental-features "nix-command flakes"
home-manager switch --flake ./ --show-trace --extra-experimental-features "nix-command flakes"
cd ../
cd ./nixvim/config/keys/
./gen-nixvim-mapping-md.sh
cd ../../../
