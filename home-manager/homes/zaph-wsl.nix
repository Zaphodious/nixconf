{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ../modules
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.

  # Enable custom modules
  modules.dev.enable = true;
  modules.dev.clojure.enable = true;
  modules.dev.rust.enable = true;
  modules.dev.go.enable = true;
  modules.dev.godot.enable = true;
  modules.dev.dotnet.enable = true;
  modules.custom-nixvim.enable = true;
  modules.alien.enable = true;
  modules.bash.enable = true;
  modules.alacritty.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    xournalpp
    krita
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    ".config/nix/nix.conf".text = "extra-experimental-features = flakes nix-command";
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/zaph/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "vi";
    TERMINAL = "alacritty";
    PATH = "$PATH:$HOME/.nix-profile/etc/profile.d";
  };
  # Manage git
  programs.git = {
    enable = true;
    extraConfig = {
      user = {
        name = "HotFish";
        email = "admin@hot.fish";
      };
      pull.rebase = false;
      init.defaultBranch = "main";
    };
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.stateVersion = "24.05"; # Please read the comment before changing.
  # Make sure that nix is usable
  programs.bash.bashrcExtra = ''
    source $HOME/.nix-profile/etc/profile.d/nix.sh
  '';
}
