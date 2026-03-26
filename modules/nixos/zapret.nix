{
  config,
  pkgs,
  lib,
  ...
}:
{
  services.zapret = {
    enable = true;
    whitelist =  lib.strings.splitString "\n" (builtins.readFile ../../assets/whitelist.txt);
    udpSupport = true;
    udpPorts = [ "443" "80" ];
    params = lib.strings.splitString "\n" ''
       --filter-tcp=443,80 --dpi-desync=fake --dpi-desync-ttl=1 --dpi-desync-autottl=-5 --dpi-desync-fake-tls-mod=rnd,dupsid,rndsni,padencap
       --dpi-desync=fake --dpi-desync-repeats=5
    '';
  };
}

