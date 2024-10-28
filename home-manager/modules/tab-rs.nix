{ pkgs, lib, inputs, config, ... }:

{
  options = {
    modules.tab-rs.enable = lib.mkEnableOption "enables tag-rs profile";
  };

  config = lib.mkIf config.modules.tab-rs.enable {
        home.packages = with pkgs; [
            tab-rs
        ];
	};
}
