#!/usr/bin/env -S nix shell --extra-experimental-features 'nix-command flakes' nixpkgs#nh nixpkgs#just nixpkgs#git nixpkgs#neovim --command bash

# Arg 1: Name of the host
NEWHOSTNAME=$1 

# Arg 2: What kind of system
SYSTEMTYPE=$2
echo $SYSTEMTYPE
if [ -z "${SYSTEMTYPE}" ]; then
    SYSTEMTYPE="desktop"
fi
echo $SYSTEMTYPE

# Arg 3: What mode do we run in?
#        Current options are ["unattended"]
MODE=$3

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


# If there is no hostname passed in, ask for it
while [ -z "${NEWHOSTNAME}" ]; do
	echo "No hostname argument detected"
	read -p "Please set a hostname: " NEWHOSTNAME
done

# Makes the switch script. We'll do this either immediately
# after determining that we've already set this up, or
# later once the new host is properly configured

NEW_HDIR="./nixos/hosts/$NEWHOSTNAME"
NEW_CONF="$NEW_HDIR/configuration.nix"
NEW_HARD="$NEW_HDIR/hardware-configuration.nix"

rebuild_nix() {
    # If the user wants, we let them edit the config file. Then
    # if the user wants, we rebuild nix
    EDITFIRST="n"
    DO_REBUILD="y"
    if [ ! $MODE = "unattented" ]; then
        read -p "Edit the config file before building? y/n: " EDITFIRST
    fi
    if [ "$EDITFIRST" = "y" ]; then
        # Edits the file :D
        nvim $NEW_CONF
    fi
    if [ ! $MODE = "unattented" ]; then
        read -p "Rebuild Nix? y/n: " DO_REBUILD
    fi
    if [ "$DO_REBUILD" = "y" ]; then
        # Rebuilds the config, using the spcific flake. After this,
        # any time the flake is run without a param it will
        # get the system hostname and do the right thing
        echo "Rebuilding nix for $NEWHOSTNAME"
        #sudo nixos-rebuild switch --flake ./nixos/?submodules=1#$NEWHOSTNAME
    else
        echo "Alright."
        echo "To finish configuring your system, run the following command:"
        echo 
        echo "   sudo nixos-rebuild switch --flake ./nixos/?submodules=1#$NEWHOSTNAME"  
        echo 
        echo "(After that, running ./switch_nixos.sh will work properly)"
    fi
    
}

# If the hostname is already in the hostnames.nix file, we
# know that we've already configured the script.  
grep NEWHOSTNAME ./nixos/hostnames.nix > /dev/null
if [ $? -eq 0 ];
then
    echo "The host ${NEWHOSTNAME} is already configured."
    echo "Just in case, we're going to run through the rebuild procedure."
    echo
    rebuild_nix
    exit 0
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

# Add the hostname to the hostnames.nix file, confirming that it has been created
sed -i "/script-created-hosts/a \ \ \"${NEWHOSTNAME}\"" ./nixos/hostnames.nix

# Add the files to git, and commit
git add .
git commit -m "Added new ${SYSTEMTYPE} host: ${NEWHOSTNAME}"

# The new host is now in the system, and is ready to be configured.

# Rebuild the system
rebuild_nix

echo
echo
echo "Use switch_nixos.sh to rebuild your Nix system"

