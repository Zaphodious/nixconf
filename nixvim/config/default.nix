{util, ...}:
{
  # Import all your configuration modules here
  imports = [
  	#./remaps.nix
		./mapping-adapter.nix
  	./bufferline.nix
		./colorscheme.nix
		./neotree.nix
		./lsp.nix
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

	};
} 
