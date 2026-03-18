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

  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };

		intelBusId = "PCI:0:2:0";
		nvidiaBusId = "PCI:1:0:0";
	};

  services.xserver.videoDrivers = [ "modesetting" "nvidia" ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
}
