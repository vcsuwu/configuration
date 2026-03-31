{
  pkgs,
  ...
}:

{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
          transparent = true;
        };
        options = {
          shiftwidth = 2;
          tabstop = 2;
        };
        lsp.enable = true;
        lsp.formatOnSave = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        statusline.lualine.enable = true;
        vimAlias = true;
        viAlias = true;
        globals = {
          loaded_netrwPlugin = 1;
        };
        autopairs.nvim-autopairs.enable = true;
        languages = {
          enableTreesitter = true;
          enableDAP = true;
          enableExtraDiagnostics = true;
          nix.enable = true;
          python.enable = true;
          html.enable = true;
          html.lsp.servers = [
            "superhtml"
            "emmet-ls"
          ];
          css.enable = true;
          ts.enable = true;
          clang.enable = true;
          rust.enable = true;
        };
        extraPackages = with pkgs; [
          ripgrep
        ];
        visuals.indent-blankline.enable = true;
        formatter.conform-nvim.enable = true;
        utility = {
          yazi-nvim = {
            enable = true;
            setupOpts = {
              open_for_directories = true;
            };
          };
        };
      };
    };
  };
}
