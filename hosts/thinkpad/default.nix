{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    
    ../../modules/desktop.nix
    ../../modules/locale.nix
    
    ../../modules/users.nix
    
    ../../modules/audio.nix
    ../../modules/services.nix
    ../../modules/networking.nix
    ../../modules/nvidia.nix
  ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
    };
  };

  networking.hostName = "thinkpad";

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
}
