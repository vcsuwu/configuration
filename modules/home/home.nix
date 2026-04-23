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
    defaultEditor = true;
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
      gopls
      rust-analyzer
      tailwindcss-language-server
      pyright
      superhtml
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
      blink-cmp
      friendly-snippets
      luasnip
      nvim-autopairs
      indent-blankline-nvim
      nvim-ts-autotag
    ];
    initLua = ''
      require("hollow")
    '';
  };

  home.packages = with pkgs;
    [
      tmux
      ncmpcpp
      yazi
      discord
      zathura

      blender
      inkscape
      godot
      telegram-desktop
      flatpak
      firefox
      qtox
      keepassxc
      qbittorrent
      gimp
      obsidian
      logisim-evolution
      mpv
      kitty
      fuzzel
      kdePackages.dolphin
      mangohud
      aseprite
      gtk3

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
