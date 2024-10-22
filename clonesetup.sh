#!/usr/bin/env -S nix shell --extra-experimental-features 'nix-command flakes' nixpkgs#nh nixpkgs#just nixpkgs#git --command bash


NEWHOSTNAME=$1 
SYSTEMTYPE=$2

while [ -z "${NEWHOSTNAME}" ]; do
	echo "No hostname argument detected"
	read -p "Please set a hostname: " NEWHOSTNAME
done

echo "Installing for ${NEWHOSTNAME}"
echo




# Check to make sure that we're not in a git repo
(git -C . rev-parse) 2> /dev/null
if [ $? -ne 0 ];
then
	# If nixconf doesn't exist, we can clone
    if [ ! -d ./nixconf ];
    then
		echo "We can install in this location!"
		echo
		git clone https://github.com/Zaphodious/nixconf
		cd nixconf
    else # If it does exist, we error out
		echo "The nixconf directory already exists"
		exit 17
    fi
fi 

./newhost.sh $NEWHOSTNAME $SYSTEMTYPE

