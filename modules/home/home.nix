{
  pkgs,
  pkgs-stable,
  ...
}: {
  imports = [
    ./apps.nix
    ./desktop.nix
  ];

  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      ripgrep
      fd
      nixd
      alejandra
      lua-language-server
      typescript-language-server
      vscode-langservers-extracted
      emmet-ls
    ];
    extraLuaPackages = lp: with lp; [luarocks jsregexp];
    withPython3 = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      telescope-nvim
      plenary-nvim
      telescope-fzy-native-nvim
      nvim-lspconfig
      rose-pine
      nvim-web-devicons
      dashboard-nvim
      blink-cmp
      friendly-snippets
      luasnip
    ];
    initLua = ''
      require("hollow")
    '';
  };

  home.packages = with pkgs;
    [
      tmux
      ncmpcpp
      xray
      yazi
      zathura

      firefox
      qtox
      keepassxc
      qbittorrent
      gimp
      obsidian
      krita
      logisim-evolution
      mpv
      kitty
      fuzzel
      kdePackages.dolphin

      hyprpolkitagent
      hyprpaper
      wl-clipboard
      wl-screenrec
      grim
      slurp
      noto-fonts
      nerd-fonts.iosevka-term
    ]
    ++ (with pkgs-stable; [rnote]);

  home.username = "hollow";
  home.homeDirectory = "/home/hollow";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
