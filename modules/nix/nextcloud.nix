{
  config,
  pkgs,
}:
{
  environment.etc."nextcloud-admin-pass".text = "123456";
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud33;
    hostName = "localhost";
    config.adminpassFile = "/etc/nextcloud-admin-pass";
    config.dbtype = "sqlite";
    settings.trusted_domains = [
      "192.168.0.12"
      "localhost"
    ];
  };
}
