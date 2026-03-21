{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        vadimcn.vscode-lldb
        fill-labs.dependi
        tamasfe.even-better-toml
        jeff-hykin.better-nix-syntax
        rust-lang.rust-analyzer
        mkhl.direnv
        pkief.material-icon-theme
      ];
      userSettings = {
        "workbench.colorTheme" = "Experimental Dark";
        "workbench.preferredDarkColorTheme" = "Experimental Dark";
        "workbench.preferredLightColorTheme" = "Experimental Light";
        "workbench.iconTheme" = "material-icon-theme";
        "workbench.sideBar.location" = "left";
        "workbench.activityBar.location" = "top";
        "editor.fontFamily" = "Iosevka Nerd Font Mono";
        "editor.fontSize" = 16;
        "editor.fontLigatures" = true;
        "editor.formatOnSave" = true;
        "editor.minimap.enabled" = true;
        "explorer.confirmDragAndDrop" = false;
        "explorer.confirmDelete" = false;
        "terminal.integrated.fontFamily" = "IosevkaTerm Nerd Font Mono";
        "terminal.integrated.fontSize" = 16;
        "terminal.integrated.fontLigatures.enabled" = true;
        "terminal.integrated.initialHint" = false;
        "terminal.integrated.tabs.location" = "left";
        "material-icon-theme.saturation" = 0.8;
        "material-icon-theme.hidesExplorerArrows" = true;
        "markdown.preview.breaks" = true;
        "git.autofetch" = true;
        "git.confirmSync" = false;
        "git.suggestSmartCommit" = false;
        "direnv.restart.automatic" = true;
      };
    };
  };
}
