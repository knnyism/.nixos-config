{ pkgs, ... }:

{
  boot.plymouth.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    okular
    gwenview
    discover
  ];

  services.displayManager.defaultSession = "aerothemeplasma";
  programs.aeroshell = {
    enable = true;
    fonts.enable = true;
    polkit.enable = true;
    aerothemeplasma = {
      enable = true;
      sddm.enable = true;
      plymouth.enable = true;
    };
  };
}
