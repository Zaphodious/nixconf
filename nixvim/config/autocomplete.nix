{ pkgs, ... }:
{
  plugins = {
    dap.enable = true;
    cmp = {
      enable = true;
        settings.sources = [
          {name = "path";}
          {name = "nvim_lsp";}
          {name = "luasnip";}
          {
            name = "buffer";
            # Words from other open buffers can also be suggested.
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          }
          {name = "neorg";}
        ];
    };
    nvim-cmp = {
        enable = true;

        #snippet.expand = "luasnip";

        mapping = {
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";
          "<Tab>" = "cmp.mapping.select_next_item()"; 
          "<S-Tab>" = "cmp.mapping.select_prev_item()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };

      };
    #cmp-nvim-lsp.enable = true;

  };
  extraPlugins = [
    pkgs.vimPlugins.nvim-lspconfig
  ];

  # https://www.reddit.com/r/neovim/comments/1c2bhcs/godotgdscript_in_neovim_with_lsp_and_debugging_in/
  extraConfigLua = ''
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require("lspconfig")["gdscript"].setup({
        	name = "godot",
        	cmd = vim.lsp.rpc.connect("127.0.0.1", "6005"),
            capabilities = capabilities,
        })
        local dap = require("dap")
    dap.adapters.godot = {
    	type = "server",
    	host = "127.0.0.1",
    	port = 6006,
    }

    dap.configurations.gdscript = {
    	{
    		type = "godot",
    		request = "launch",
    		name = "Launch scene",
    		project = "''${workspaceFolder}",
    		launch_scene = true,
    	},
    }
  '';
  /*
    extraConfigLua = ''
          local port = os.getenv('GDScript_Port') or '6005'
          local cmd = vim.lsp.rpc.connect('127.0.0.1', port)
          local pipe = '/tmp/godot.pipe' -- I use /tmp/godot.pipe

          vim.lsp.start({
            name = 'Godot',
            cmd = cmd,
            root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
            on_attach = function(client, bufnr)
              vim.api.nvim_command('echo serverstart("' .. pipe .. '")')
            end
          })
    '';
  */
}
