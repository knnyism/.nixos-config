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

  networking.hostName = "t1";

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
}
