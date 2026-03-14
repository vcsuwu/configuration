{ ... }:
{
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
      alias nu="sudo nixos-rebuild switch --flake /home/hollow/for-sort/nix#core"
      alias nue="sudo nvim /etc/nixos/"
      export PS1="\u@\h:\w\$ "
    '';
  };
}
