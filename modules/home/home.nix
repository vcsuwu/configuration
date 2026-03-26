{
  config,
  pkgs,
  pkgs-stable,
  zen,
  nvf,
  ...
}:

{
  imports = [
    ./apps.nix
    ./desktop.nix
    nvf.homeManagerModules.default
  ];

  home.file.".config/kitty/kitty.conf".source = config.lib.file.mkOutOfStoreSymlink (
    config.home.homeDirectory + "/.files/kitty.conf"
  );

  home.packages =
    with pkgs;
    [
      nerd-fonts.iosevka-term
      nixfmt
      qbittorrent
      qtox
      keepassxc

      #neovim setupik
     # vimPlugins.nvim-treesitter.withAllGrammars
     # lua-language-server
     # nixd
     # neovim-unwrapped
     # ripgrep
     # luajitPackages.luarocks
     # lua5_1
      tmux

      ncmpcpp
      gimp
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
      kdePackages.dolphin

      hyprpolkitagent
      hyprpaper
      wl-clipboard
      wl-screenrec
      grim
      slurp
      noto-fonts
    ]
    ++ (with pkgs-stable; [ rnote ])
    ++ [ zen.packages."x86_64-linux".default ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
         vimAlias = true;
         viAlias = true;
         autopairs.nvim-autopairs.enable = true;
         languages.nix.enable = true;
         extraPackages = with pkgs; [ripgrep];
         visuals.indent-blankline.enable = true;
      };
    };
  };

  home.username = "hollow";
  home.homeDirectory = "/home/hollow";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
