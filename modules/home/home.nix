{
  config,
  pkgs,
  pkgs-stable,
  zen,
  ...
}:

{
  imports = [
    ./apps.nix
    ./desktop.nix
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
      nil
      qtox
      keepassxc

      neovim-unwrapped
      tmux

      ncmpcpp
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
