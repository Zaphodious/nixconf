{util, ...}:
{
  # Import all your configuration modules here
  imports = [
  	./bufferline.nix
		./colorscheme.nix
		./neotree.nix
		./lsp.nix
		./snipe.nix
        ./oil.nix
		./keys
	];

	globals.mapleader = " ";

	enableMan = true;
	viAlias = true;
	vimAlias = true;

	opts = {
		nu = true;
		relativenumber = true;

		tabstop = 4;
		softtabstop = 4;
		shiftwidth = 4;

		expandtab = true;

		smartindent = true;

		wrap = false;

		swapfile = false;
		backup = false;

		undofile = true;

		hlsearch = false;
		incsearch = true;

		termguicolors = true;

		scrolloff = 8;
		signcolumn = "yes";

		updatetime = 50;

		colorcolumn = "80";
	};

	extraConfigLua = ''
		local home = os.getenv("HOME") or os.getenv("LOCALAPPDATA")
		vim.opt.undodir = home .. "/.vim/undodir"
		vim.opt.isfname:append("@-@")
	'';

	# Simple plugin enabling
	plugins = {
		treesitter.enable = true; # Highlighting
        fugitive.enable = true; # Git
		telescope.enable = true; # Fuzzy Finder
		undotree.enable = true; # Multiple undo path viewer
		lualine.enable = true; # Smart info line at the bottom of a buffer
        parinfer-rust.enable = true; # Parinfer for lisps

	};
} 
