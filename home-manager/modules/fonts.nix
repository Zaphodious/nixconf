{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [ nerd-fonts.comic-shanns-mono];
  #fonts.fontconfig.enable = true;
  #fonts.packages = [pkgs.nerdfonts.ComicShannsMono];
  #fonts = pkgs: nerdfonts.ComicShannsMono};
}
