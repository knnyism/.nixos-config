{
  description = "Configuration for NixOS of Kenny";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    aerothemeplasma-nix = {
      url = "github:nyakase/aerothemeplasma-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = { nixpkgs, ... } @ inputs:
  let
    system = "x86_64-linux";
    mkHost = hostPath: nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs system; };
      modules = [
        inputs.home-manager.nixosModules.home-manager
        inputs.aerothemeplasma-nix.nixosModules.aerothemeplasma-nix
        hostPath
      ];
    };
  in
  {
    nixosConfigurations = {
      t1       = mkHost ./hosts/t1;
      thinkpad = mkHost ./hosts/thinkpad;
    };
  };
}
