{
  config,
  pkgs,
  lib,
  ...
}: {
  services.zapret = {
    enable = false;
    whitelist = lib.strings.splitString "\n" (builtins.readFile ../../assets/whitelist.txt);
    udpSupport = true;
    udpPorts = [
      "443"
      "80"
    ];
    params = lib.strings.splitString "\n" ''
      --filter-tcp=443,80  --dpi-desync=fakedsplit --dpi-desync-fooling=md5sig --dup=1 --dup-cutoff=n2 --dup-fooling=md5sig --dpi-desync-split-pos=1 --new
      --filter-udp=443,80 --dpi-desync=fake --dpi-desync-repeats=5
    '';
  };
}
