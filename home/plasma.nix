{ pkgs, ... }:

{
  programs.plasma = {
    enable = true;
    fonts = {
      fixedWidth = {
        family = "Iosevka Nerd Font Mono";
        pointSize = 12;
      };
    };
  };
}
