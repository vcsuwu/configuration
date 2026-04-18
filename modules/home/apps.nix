{...}: {
  programs = {
    git = {
      enable = true;
      settings = {
        user.name = "hollow";
        user.email = "placeholder";
        init.defaultBranch = "main";
      };
    };
    direnv.enable = true;
    direnv.enableBashIntegration = true;
    direnv.nix-direnv.enable = true;
    bash.enable = true;
    bash.bashrcExtra = ''
      alias nu="sudo nixos-rebuild switch --flake /home/hollow/personal/projects/nix#core"
      alias nue="nvim /home/hollow/personal/projects/nix/"
      alias tmux="tmux -f /home/hollow/.config/tmux.conf"
      export PS1="\w\$ "
      function y() {
       local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
       command yazi "$@" --cwd-file="$tmp"
       IFS= read -r -d ''' cwd < "$tmp"
       [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
       rm -f -- "$tmp"
      }
      alias n="nvim"
    '';
  };
}
