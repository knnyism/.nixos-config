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
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "explorer-gitignore";
          publisher = "timgthomas";
          version = "0.3.1";
          sha256 = "sha256-OlAa7s9rMG+//XlWVvMONAS1Enyysz32TXw8AowUHZ4=";
        }
        {
          name = "vscode-icontheme-nomo-dark";
          publisher = "be5invis";
          version = "1.3.9";
          sha256 = "sha256-1wW2YhD5XpY4K5Jv2Ca+zD3TxU8lauX03ko/WE8Yayc=";
        }
        {
          name = "nomo-light-extended";
          publisher = "microhobby";
          version = "0.0.2";
          sha256 = "sha256-B6T4+js78msz1WM8QVt1oiSwDiqxw03L749u8CjUSHQ=";
        }
        {
          name = "icons-carbon";
          publisher = "antfu";
          version = "0.2.9";
          sha256 = "sha256-GSK12dIrtMnz4O77G6Rg/YBGxmlQrm+4+XodM6MbBs0=";
        }
      ];
      userSettings = {
        "workbench.productIconTheme" = "icons-carbon";
        "workbench.iconTheme" = "vs-nomo-dark";
        "workbench.colorTheme" = "Experimental Dark";
        "editor.fontFamily" = "Iosevka Nerd Font Mono";
        "editor.fontSize" = 16;
        "editor.fontLigatures" = true;
        "terminal.integrated.fontFamily" = "IosevkaTerm Nerd Font Mono";
        "terminal.integrated.fontSize" = 16;
        "terminal.integrated.fontLigatures.enabled" = true;
        "editor.formatOnSave" = true;
        "workbench.sideBar.location" = "right";
        "terminal.integrated.initialHint" = false;
        "editor.minimap.enabled" = false;
        "markdown.preview.breaks" = true;
        "explorer.confirmDragAndDrop" = false;
        "explorer.confirmDelete" = false;
        "terminal.integrated.tabs.location" = "left";
        "git.autofetch" = true;
        "git.confirmSync" = false;
        "explorer.excludeGitIgnore" = true;
        "direnv.restart.automatic" = true;
        "git.suggestSmartCommit" = false;
      };
    };
  };
}
