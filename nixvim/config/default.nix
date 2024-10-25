{util, ...}:
{
  # Import all your configuration modules here
  imports = [
  	./bufferline.nix
		./colorscheme.nix
		./neotree.nix
		./lsp.nix
		./snipe.nix
		./keys
	];

	globals.mapleader = " ";

	enableMan = true;
	viAlias = true;
	vimAlias = true;

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
