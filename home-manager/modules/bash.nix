{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  options = {
    modules.bash.enable = lib.mkEnableOption "enables Bash config module";
  };

  config = lib.mkIf config.modules.bash.enable {

    programs.bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        nvim = "vim";
        ".." = "cd ../";
      };
      bashrcExtra = ''
        OS=""

        case "$(uname -sr)" in

           Darwin*)
               OS="MacOS"
             ;;

           Linux*Microsoft*)
               OS="WSL"
             ;;

           Linux*)
             OS="Linux"
             ;;

           CYGWIN*|MINGW*|MINGW32*|MSYS*)
               OS="Windows"
             ;;

           *)
           OS="Other"
             ;;
        esac

        WNUTS="\w"
        THETIME="\t"
        if [ $OS = "MacOS" ]
        then
            USTRING="\u@bistromath"
        else
            USTRING="\u@\h"
        fi

        function proomptme {
            PS1="$(proompt -i $EUID -c '🮲 🮳' f09432\
                -g "$(git status --porcelain=v2 --branch 2>&1)"\
                -t trains 640635\
                -s fbd439 4b3409 "$\{THETIME@P}"\
                -s f43666 440616 " $\{USTRING@P}"\
                -s c635bc 36052c "$\{WNUTS@P}"\
                --git-s committed 26a630 063600\
                --git-s staged 08a0c0 083040 \
                --git-s unstaged dc532d 3c130d \
                ) "
        }

        PROMPT_COMMAND=proomptme
      '';
    };

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
  };
}
