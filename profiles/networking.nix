# https://github.com/ghuntley/dotfiles-nixos/tree/master/machines
{ config, pkgs, ... }:

{

  wireless = {
    # Enables wireless support via wpa_supplicant.
    enable = true;
    # TODO: figure out how how to enable wireless
    # networks = secrets.networks;
  };

  # FIXME: wpa_supplicant expects the wpa_supplicant.conf file to be in a read/write filesystem. This is a problem.
  #    # Configure wireless networks
  #    wpa_supplicant = ''  # FIXME: does this name have potential for conflict? must investigate
  #      ln -fs ${./private/etc/wpa_supplicant.conf} /etc/wpa_supplicant.conf
  #    '';
  #  };

  networking = {

    firewall = {

      enable = true;
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
