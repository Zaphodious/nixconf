#!/usr/bin/env -S nix shell --extra-experimental-features 'nix-command flakes' nixpkgs#nh nixpkgs#just nixpkgs#git --command bash


NEWHOSTNAME=$1 

while [ -z "${NEWHOSTNAME}" ]; do
	read -p "Please set a hostname: " NEWHOSTNAME
done

echo "testing"
echo $NEWHOSTNAME

git clone https://github.com/Zaphodious/nixosconf ~/nixconf


