{
  config,
  pkgs,
  pkgs-stable,
  ...
}:

{
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

      hyprpolkitagent
      wl-clipboard
      wl-screenrec
      grim
      slurp
      firefox
      kitty
      noto-fonts
      fuzzel
    ]
    ++ (with pkgs-stable; [ rnote ]);

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

  programs = {
    git = {
      enable = true;
      settings = {
        user.name = "hollow";
        user.email = "placeholder";
        init.defaultBranch = "main";
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
