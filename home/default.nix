{ pkgs, ... }:

{
  imports = [
    ./flatpak.nix
    ./vscode.nix
    ./neovim.nix
    ./plasma.nix
  ];

  home = {
    username = "kenny";
    homeDirectory = "/home/kenny";
    packages = with pkgs; [
      # tools
      wget
      p7zip

      # fonts
      nerd-fonts.iosevka
      nerd-fonts.iosevka-term

      # apps
      qbittorrent
      nextcloud-client
      keepassxc
      vinegar
      legcord
      vlc
    ];
  };

  programs.home-manager.enable = true;
  programs.firefox.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.zsh = {
    enable = true;
    dotDir = "/home/kenny";
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch --flake ~/.nixos-config";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "z" ];
      theme = "juanghurtado";
    };
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
    settings.user.name  = "knnyism";
    settings.user.email = "icanismar@gmail.com";
  };

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "25.11";
}
