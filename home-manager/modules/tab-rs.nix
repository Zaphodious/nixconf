{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:

{
  options = {
    modules.tab-rs.enable = lib.mkEnableOption "enables tag-rs profile";
  };

  config = lib.mkIf config.modules.tab-rs.enable {
    home.packages = with pkgs; [
      tab-rs
    ];
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
      ".config/tab.yaml".text = ''
         workspace:
            # this is a global tab, that is always available, and initializes in ~/nixconf
            - tab: nixconf
              doc: "Global Tab (goes to ~/nixconf)"
              dir: nixconf

            # this links to a workspace config in ~/my-workspace
            #   workspaces are only active within the workspace directory
            #   this creates a link to that workspace, so you can always activate it with `tab my-workspace`
            # - workspace: my-workspace 
      '';
    };
  };
}
