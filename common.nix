
# Common elements that will be used by all hosts

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  options = {
  	modules.common.enabled = lib.options.mkEnableOption "Common module";
  };

  config = lib.mkIf config.modules.common.enabled {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable CUPS to print documents.
    services.printing.enable = true;

	 
    # The "zaph" user will usually always be with us
    # auto-gen'd comment: Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.zaph = {
      isNormalUser = true;
      description = "zaph";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      packages = with pkgs; [
        #  thunderbird
      ];
    };

    home-manager = {
      extraSpecialArgs = {
        inherit inputs;
      };
      users = {
        #"zaph" = import ./home.nix;
        "zaph" = {
          home.username = "zaph";
          home.homeDirectory = "/home/zaph";
          imports = [
            inputs.self.outputs.homeManagerModules.default
          ];
          profiles.dev.enable = true;
          profiles.dev.clojure.enable = true;
          profiles.dev.rust.enable = true;
        };
      };
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = lib.mkDefault true;

    # Make nvim the default editor
    programs.neovim.enable = true;
    programs.neovim.defaultEditor = true;

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # List services that you want to enable:

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.05"; # Did you read the comment?
    };
}
