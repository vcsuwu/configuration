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
  ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "hollow";
  home.homeDirectory = "/home/hollow";
  home.packages =
    with pkgs;
    [
      nixfmt
      nil

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
