CONFDIR="./nixos/hosts/$(uname -n)"
HARDWARE_CONF_FILE="$CONFDIR/hardware-configuration.nix"

if [ -d $CONFDIR ]; then
    echo "Refreshing hardware configuration"
    nixos-generate-config --show-hardware-config > "$HARDWARE_CONF_FILE"
else
    echo "It doesn't look like this host is configured yet. Which is odd."
fi