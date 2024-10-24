{pkgs, ...}:
{
	/*
	colorschemes.onedark = {
		enable = true;
		settings = {
			style = "warmer";
		};
	};
	*/
	extraPlugins = [
		(pkgs.vimUtils.buildVimPlugin {
			name = "vscode_modern";
			src = pkgs.fetchFromGitHub {
					owner = "gmr458";
					repo = "vscode_modern_theme.nvim";
					rev = "07b2cecfbc53e9edede889a852e7ccab714a5529";
					hash = "sha256-KNLp+tu2uKf67BMUrnTZIEfTnyAnvtrQJGMqgBkgxco=";
					#hash = "<nix NAR hash>";
			};
			extraConfigLua = ''
			require('vscode-modern').setup({
				cursorline = true,
				transparent_background = true,
				nvim_tree_darker = true,
			})
			'';
		})
		(pkgs.vimUtils.buildVimPlugin {
			name = "calvera-dark";
			src = pkgs.fetchFromGitHub {
					owner = "niyabits";
					repo = "calvera-dark.nvim";
					rev = "84802d0bde047ce79ebfddc1800800f0bd67f37a";
					hash = "sha256-DMyElTyzSqqcKnfVm/Rjkg9Ax5WvRw5lDW1A/0+Tmfg=";
					#hash = "<nix NAR hash>";
			};
			extraConfigLua = ''

			vim.g.calvera_italic_comments = true
			vim.g.calvera_italic_keywords = true
			vim.g.calvera_italic_functions = true
			vim.g.calvera_italic_variables = false
			vim.g.calvera_contrast = true
			vim.g.calvera_borders = true
			vim.g.calvera_disable_background = true
			vim.g.transparent_bg = true
			require('calvera').set()
			'';
		})
	];
	colorscheme = "vscode_modern";

}
