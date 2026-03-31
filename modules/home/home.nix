{
  pkgs,
  pkgs-stable,
  ...
}: {
  imports = [
    ./apps.nix
    ./desktop.nix
  ];

  home.packages = with pkgs;
    [
      tmux
      ncmpcpp
      xray
      yazi
      zathura

      neovim-unwrapped
      python3
      luajitPackages.luarocks
      lua5_1
      ripgrep
      fd
      nixd
      alejandra

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
