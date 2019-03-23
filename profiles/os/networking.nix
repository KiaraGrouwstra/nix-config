# https://github.com/ghuntley/dotfiles-nixos/tree/master/machines
{ pkgs, ... }:

let
  secrets = import ../../secrets.nix;
in
rec {

  environment.systemPackages = with pkgs; [
    kubernetes
    openssl
    sshfs
    sshfs-fuse
    mosh
    ethtool

    # hacking tools
    metasploit
    aircrack-ng
    arpoison
  ];

  services.dnsmasq = {
    # enable = true;
    servers = [
      # Google
      "8.8.8.8"
      "8.8.4.4"
      # OpenDNS
      "208.67.222.222"
      "208.67.220.220"
    ];
  };

  networking = {

    # /etc/hosts
    extraHosts = secrets.extraHosts;
    networkmanager = {
      enable = true;
      dns = "dnsmasq";
    };

    firewall = {
      # enable = true;
      allowPing = true;

      # # Allow ChromeCast to send/receive packets
      # # http://askubuntu.com/a/326224/177448
      # extraCommands = ''
      #   iptables -I INPUT -p udp -m udp --dport 32768:60999 -j ACCEPT
      # '';

    };

    # # Set a static IP when I didn't want to set up dhcp
    # defaultGateway = "192.168.0.1";
    # interfaces.enp3s0 = {
    #   ipAddress = "192.168.0.42";
    #   prefixLength = 24;
    # };

  };

}
