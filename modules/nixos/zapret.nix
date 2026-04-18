{
  config,
  pkgs,
  lib,
  ...
}: {
  services.zapret = {
    enable = false;
    udpSupport = true;
    udpPorts = [
      "443"
      "80"
      "3478"
      "19292:19344"
      "49152:65535"
    ];
    configureFirewall = false;
    params = lib.strings.splitString "\n" ''
      --filter-tcp=443,80 --hostlist=${../../assets/whitelist.txt} --dpi-desync=multidisorder --dpi-desync-split-pos=midsld --new
      --filter-tcp=1-65535 --hostlist=${../../assets/robloxcidr.txt} --ipset=${../../assets/iplist-roblox.txt} --dpi-desync=fake --dpi-desync-fooling=ts --new
      --filter-tcp=443,80,2053,2083,2096,8843 --hostlist=${../../assets/discord.txt} --ipset=${../../assets/iplist-discord.txt} --dpi-desync=multidisorder --dpi-desync-split-pos=1,sniext+1,host+1,midsld-2,midsld,midsld+2,endhost-1 --new
      --filter-tcp=2053,2083,2096,8843 --hostlist-domains=discord,media --dpi-desync=fake --dpi-desync-fooling=ts --new --skip
      --filter-udp=443 --dpi-desync=fake --dpi-desync-repeats=5 --new
      --filter-udp=19294-19344,50000-65535,3478 --filter-l7=discord,stun --dpi-desync=fake
    '';
  };
}
