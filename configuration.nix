# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    # Define your hostname.
    hostName = "nixos";
    # wireless = {
    #   # Enables wireless support via wpa_supplicant.
    #   enable = true;
    #   networks = {
    #     lia = {
    #       psk = "magnolia";
    #     };
    #   };
    # };

    # firewall = {
    #   # Open ports in the firewall.
    #   allowedTCPPorts = [ ... ];
    #   allowedUDPPorts = [ ... ];
    #   # Or disable the firewall altogether.
    #   enable = false;
    # };
  };

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      # enabled = "ibus";
      # ibus.engines = with pkgs.ibus-engines; [ anthy hangul mozc ];
      enabled = "fcitx";
      fcitx.engines = with pkgs.fcitx-engines; [ mozc hangul ]; #  m17n
    };
  };

  time.timeZone = "Europe/Amsterdam";

  # List packages installed in system profile. To search, run $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    vim
    firefox
    git
    # nox
    # zsh
    # oh-my-zsh
    # fish
    # docker
    # gitkraken
    # vscode
    # stack
    # thefuck
  ];

  # programs = {
  #   bash.enableCompletion = true;
  #   zsh.enable = true;
  #   fish.enable = true;
  #   mtr.enable = true;
  #   gnupg.agent = {
  #     enable = true;
  #     enableSSHSupport = true;
  #   };
  # };

  # Enable sound.
  sound.enable = true;
  hardware = {
    pulseaudio.enable = true;
  };

  # List services that you want to enable:
  services = {
    # Enable the OpenSSH daemon.
    openssh.enable = true;

    # Enable CUPS to print documents.
    printing.enable = true;

    # X11 windowing system
    xserver = {
      enable = true;
      layout = "us";
      videoDrivers = [ "nvidia" ];

      # Enable touchpad support.
      libinput.enable = true;

      desktopManager.gnome3.enable = true;
      displayManager.gdm.enable = true;
      # xserver.displayManager.sddm.enable = true;
    };
  };

  users.users.tycho = {
    isNormalUser = true;
    uid = 1000;
    home = "/home/tycho";
    description = "Tycho Grouwstra <tychogrouwstra@gmail.com>";
    extraGroups = [ "wheel" "networkmanager" ];
    openssh.authorizedKeys.keys = [];
    initialPassword = "password";
    shell = pkgs.zsh;
    # shell = pkgs.fish;
  };

  system = {
    stateVersion = "18.03";
    autoUpgrade = {
      enable = true;
      channel = https://nixos.org/channels/nixos-18.03;
    };
  };

  nix = {
    gc = {
      automatic = true;
      dates = "03:15";
    };
  };

}

