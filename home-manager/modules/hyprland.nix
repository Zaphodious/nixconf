{ pkgs, lib, inputs, config, ... }:

{
  options = {
    modules.hyprland-hm.enable = lib.mkEnableOption "enables Hyprland Config profile";
  };

  config = lib.mkIf config.modules.hyprland-hm.enable {
		wayland.windowManager.hyprland = {
			enable = true;
			plugins = with pkgs.hyprlandPlugins; [
				hyprbars
			];
			settings = {
				
			};
		};
	};
}
