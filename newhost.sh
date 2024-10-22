#!/usr/bin/env -S nix shell --extra-experimental-features 'nix-command flakes' nixpkgs#nh nixpkgs#just nixpkgs#git --command bash

NEWHOSTNAME=$1 

SYSTEMTYPE=$2
if [ -z $FOO ]; then
    SYSTEMTYPE="desktop"
fi

TEMPLATE_FILE="./template/configuration_$SYSTEMTYPE.template.nix"

if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "Sorry, $SYSTEMTYPE does not have a corresponding config template"
    exit 2
fi


# If a certain file doesn't exist, abort
if [ ! -f ./nixos/hostnames.nix ];
then 
    echo "Please run this from the nixconf directory"
    exit 2
fi

# Note that we don't add the host to the file here.
# we wait until the end, to allow the script to
# run again if it fails

# If there is no hostname passed in, ask for it
while [ -z "${NEWHOSTNAME}" ]; do
	echo "No hostname argument detected"
	read -p "Please set a hostname: " NEWHOSTNAME
done

NEW_HDIR="./nixos/hosts/$NEWHOSTNAME"
NEW_CONF="$NEW_HDIR/configuration.nix"
NEW_HARD="$NEW_HDIR/hardware-configuration.nix"

# If the hostname is already in the hostlist.txt, we
# cannot continue
if grep NEWHOSTNAME ./nixos/hostnames.nix;
then
    echo "The host ${NEWHOSTNAME} is already configured"
    exit 17
fi

# Start creating the new profile from the template

echo "Setting up host named ${NEWHOSTNAME} of type ${SYSTEMTYPE}"
echo


# Try to make the host config folder
mkdir "$NEW_HDIR" 2> /dev/null

# If the new config file doesn't exist, create it
if [ ! -f "$NEW_CONF" ]; then
    sed "s/{{hostname}}/$NEWHOSTNAME/g" "$TEMPLATE_FILE" > "$NEW_CONF"
fi

# Populate the hardware profile file
# (it's auto-generated anyway, so if it exists then
# at worst we keep it the same, and at best we update it)
nixos-generate-config --show-hardware-config > "$NEW_HARD"

# Make the switch_nixos.sh shell script
sed "s/{{hostname}}/$NEWHOSTNAME/g" ./template/switch_nixos.template.sh > ./switch_nixos.sh
chmod a+x ./switch_nixos.sh

# Add the hostname to the hostnames.nix file, confirming that it has been created
sed "/script-created-hosts/a \ \ \"${NEWHOSTNAME}\"" ./nixos/hostnames.nix

# Add the files to git, and commit
git add .
git commit -m "Added new ${SYSTEMTYPE} host: ${NEWHOSTNAME}"

# The new host is now in the system, and is ready to be configured.

# Open the new configuration file for editing.
edit $NEW_CONF

echo
echo
echo "Use switch_nixos.sh to rebuild your Nix system"

