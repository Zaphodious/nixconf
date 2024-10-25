{
  pkgs,
  lib,
  helpers,
  config,
  ...
}:
{
  options =
    let
      MkDefOpt = thing: lib.options.mkOption { default = thing; };
    in
    {
      plugins.snipe.navigation.keys = {
        next_page = MkDefOpt "J";
        prev_page = MkDefOpt "K";
        under_cursor = MkDefOpt "<cr>";
        cancel_snipe = MkDefOpt "<esc>";
        close_buffer = MkDefOpt "D";
      };
    };
  config = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "snipe";
        src = pkgs.fetchFromGitHub {
          owner = "leath-dub";
          repo = "snipe.nvim";
          rev = "4e162869cf0a777180c38afdf18f6364dadf877c";
          hash = "sha256-iRAX0xestLjPPP8IMimGJJfNqgQINb5lp6eoi6J+BSQ=";
        };
      })
    ];
    extraConfigLua = with config.plugins.snipe.navigation; ''
      require("snipe").setup({
          
        ui = {
          position = "center",
          open_win_override = {
            border = "rounded",
          },
        },
        hints = {
          -- Charaters to use for hints (NOTE: make sure they don't collide with the navigation keymaps)
          dictionary = "sadflewcmpghio",
        },
        navigate = {
            next_page = "${keys.next_page}",
            prev_page = "${keys.prev_page}",
            under_cursor = "${keys.under_cursor}",
            cancel_snipe = "${keys.cancel_snipe}",
            close_buffer = "${keys.close_buffer}",

        },
    })'';

  };

}
