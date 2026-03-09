{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./nonrep/hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  security.sudo.wheelNeedsPassword = false;

  boot.kernelModules = [ "tun" ];
  networking = {
    hostName = "core";
    networkmanager.enable = true;
    firewall = {
      checkReversePath = false;
      allowedTCPPorts = [
        80
        443
      ];
    };
  };

  # Set your time zone.
  time.timeZone = "Asia/Yekaterinburg";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hollow = {
    isNormalUser = true;
    description = "hollow";
    extraGroups = [
      "networkmanager"
      "wheel"
      "kvm"
      "adbusers"
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

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

  #android setup

  nixpkgs.config.android_sdk.accept_license = true;
  programs.adb.enable = true;

  environment.systemPackages = with pkgs; [
    neovim
    git
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
