# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  lib,
  nixos-hardware,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../common.nix
    #inputs.home-manager.nixosModules.default
    inputs.nixos-hardware.nixosModules.framework-13-7040-amd
  ];
  #config = {
  config = {

    networking.hostName = "frameboycolor";

    # Wiki says to add this
    services.power-profiles-daemon.enable = true;
    services.fwupd.enable = true;

    # Toggle modules from local modules module
    modules.common.enabled = true;
    modules.fingerprint.enabled = true;
    modules.kde.enabled = true;
    modules.blender.enabled = true;
    modules.office.enabled = true;

    # Install programs
    programs.steam.enable = true;
    programs.firefox.enable = true;
    programs.neovim.enable = true;
    # programs.neovim.defaultEditor = true;

    environment.systemPackages =
      with pkgs;
      [
        #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
        #  wget
        wget
        git
        gh
        nixfmt-rfc-style
        kitty
        discord
        dissent
        vscode-fhs
        stacer
        inkscape
        vlc
        # godot_4
      ]
      ++ [ inputs.handlebars.packages."x86_64-linux".default ];

    # Bootloader.
    #boot.loader.grub.enable = true;
    #boot.loader.grub.device = "/dev/sda";
    #boot.loader.grub.useOSProber = true;
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Let's get some game

    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;

    services.iptsd.config.Touchscreen = {
      DisableOnPalm = true;
      DisableOnStylus = true;
    };

    services.xserver.videoDrivers = [ "amdgpu" ];

    boot.initrd.kernelModules = [ "amdgpu" ];

    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "America/New_York";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };

    # Enable the X11 windowing system.
    #services.xserver.enable = true;

    # Enable the XFCE Desktop Environment.
    #services.xserver.displayManager.lightdm.enable = false;
    #services.xserver.desktopManager.xfce.enable = false;

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.

    # Enable automatic login for the user.
    #services.displayManager.autoLogin.enable = true;
    #services.displayManager.autoLogin.user = "zaph";

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Get hyper!
    # programs.hyprland = {
    #	enable = true;
    #	#xwayland.enable = true;
    #    };

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;
  };
}
