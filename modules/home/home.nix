{
  config,
  pkgs,
  pkgs-stable,
  zen,
  nixvim,
  ...
}:

{
  imports = [
    ./apps.nix
    nixvim
  ];

  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;
    plugins = {
      lspconfig.enable = true;
      telescope.enable = true;
      web-devicons.enable = true;
      treesitter = {
    	enable = true;
    	highlight.enable = true;
  	};
    };
    globals.mapleader = " ";
    opts = {
      rnu = true;
      nu = true;
    };
    lsp.servers = {
      pyright = {
        enable = true;
	package = pkgs.pyright;
      };
      nil_ls = {
        enable = true;
	package = pkgs.nil;
      };

    };
    keymaps = [
      {key = "<leader>f";
      mode = "n";
      action = ":Telescope find_files<CR>";}
    ];
  };




  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "hollow";
  home.homeDirectory = "/home/hollow";
  home.packages =
    with pkgs;
    [
      nixfmt
      nil
      qtox
      keepassxc

      obsidian
      vscode
      mpv
      logisim-evolution
      zathura
      xray
      lf
      kitty
      fuzzel
      qbittorrent

      hyprpolkitagent
      wl-clipboard
      wl-screenrec
      grim
      slurp
      noto-fonts
    ]
    ++ (with pkgs-stable; [ rnote ])
    ++ [ zen.packages."x86_64-linux".default ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";

  gtk = {
    enable = true;
    colorScheme = "dark";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
