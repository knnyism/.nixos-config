{ pkgs, inputs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    sharedModules = [
      inputs.plasma-manager.homeModules.plasma-manager
      inputs.nix-flatpak.homeManagerModules.nix-flatpak
      inputs.nvf.homeManagerModules.default
    ];
    users.kenny = import ../home;
  };

  programs.zsh.enable = true;

  users.users.kenny = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Kenny";
    extraGroups = [ "networkmanager" "wheel" ];
    initialPassword = "changeme";
  };

  programs.steam.enable = true;
}