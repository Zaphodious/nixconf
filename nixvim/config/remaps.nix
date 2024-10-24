# Remaps. 
# Note: the formatting in this file is intentional,
# to make it easier to reference
  {util, ... }: {
    keymaps =
    util.concise-remaps 
    [
  ## Movement
    # Open a new vertical window
        ["n" "<leader>ww" "<C-w>v" {desc = "Open a new vertical window";}]

    # Open a new horizontal window
        ["n" "<leader>we" "<C-w>n"]

    # Close a window
        ["n" "<leader>wq" "<C-w>q"]

    # Resize the current vertical window to 80
        ["n" "<leader>wr" "<C-w>80|"]

    # Equalize the width of panes
        ["n" "<leader>w=" "<C-w>="]

    # Move in the four directions between windows
        ["n" "<tab>l" "<C-w>l"]
        ["n" "<tab>k" "<C-w>k"]
        ["n" "<tab>j" "<C-w>j"]
        ["n" "<tab>h" "<C-w>h"]

  ## Git (fugitive)
    # Open the Fugitive Git view
        ["n" "<leader>gs" ":Git<cr>"]

    # Push to the remote
        ["n" "<leader>gp" ":Git push<cr>"]

    # Add everything and commit
        ["n" "<leader>gc" ":Git add -A | :Git commit<cr>"]
  
  ## Telescope
    # Fuzzy Find
        ["n" "<leader>pf" ":Telescope find_files<cr>" {}]
    # Fuzzy Find within git
        ["n" "<C-p>" '':Telescope git_files<cr>'' {}]
    # Fuzzy Find with Grep
        ["n" "<leader>ps" '':Telescope live_grep<cr>'']

  ## Misc
    # Rename-refactors symbol in project (make sure to :wa afterword)
        ["n" "<leader>rn" "<cmd>lua vim.lsp.buf.rename()<CR>" {noremap = true;}]
    # Replace text matches under cursor
        ["n" "<leader>s" "[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]"]
    ]
  ;
  ## LSP
        plugins.lsp = {
    # Mappings that get applied when the LSP connects, that call vim.lsp.buf.<action>
        keymaps.lspBuf = {
          "gd" = "definition";
          "gh" = "hover";
          "<leader>vws" = "workspace_symbol";
          "<leader>vd" = "open_float";
          "[d" = "goto_next";
          "]d" = "goto_prev";
          "<leader>vca" = "code_action";
          "<leader>vrr" = "references";
          "<leader>vrn" = "rename";
          "<C-h>" = "signature_help";
          "<leader>f" = "format";
        };
        };
  ## Neotree
        plugins.neo-tree.window.mappings = {
          l = {
            command = "toggle_node";
            # disable `nowait` if you have existing combos starting with this char that you want to use
            nowait = false;
          };
        };
}
