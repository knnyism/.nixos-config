{ config, ... }:

{
  services.flatpak.enable = true;
  services.printing.enable = true;
  programs.steam.enable = true;
}