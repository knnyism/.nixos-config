{ ... }:

{
  programs.nvf = {
    enable = true;
    settings.vim = {
      theme.enable = true;
      
      statusline.lualine.enable = true;
      telescope.enable = true;
      autocomplete.nvim-cmp.enable = true;
      treesitter.enable = true;

      lsp = {
        enable = true;
        formatOnSave = true;
      };

      languages = {
        nix.enable = true;
        rust.enable = true;
        clang.enable = true;
      };
    };
  };
}