{
  config,
  pkgs,
  ...
}: {
  imports = let
    mod_dir = ../../modules/nixos;
  in [
    ./hardware-configuration.nix
    (mod_dir + "/nextcloud.nix")
    (mod_dir + "/zapret.nix")
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = ["tun"];
  security.sudo.wheelNeedsPassword = false;
  programs.nix-ld.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    gamescopeSession.enable = true;
  };
  programs.gamescope = {
    enable = true;
  };
  programs.gamemode.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs.wireshark.enable = true;
  programs.wireshark.dumpcap.enable = true;
  programs.wireshark.package = pkgs.wireshark;

  networking = {
    firewall = {
      enable = true;
    };
    nftables.enable = true;
    hostName = "core";
    networkmanager.enable = true;
    nameservers = ["1.1.1.1" "8.8.8.8"];
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
      "wireshark"
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

  programs.throne = {
    enable = true;
    tunMode.enable = true;
    tunMode.setuid = true;
  };

  environment.systemPackages = with pkgs; [
    neovim
    git
    mangohud
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
