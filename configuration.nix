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
    hostName = "nixos";

    networkmanager.insertNameservers = [
      # Google
      "8.8.8.8"
      "8.8.4.4"
      # OpenDNS
      "208.67.222.222"
      "208.67.220.220"
    ];

    # wireless = {
    #   # Enables wireless support via wpa_supplicant.
    #   enable = true;
    #   networks = {
    #     lia = {
    #       psk = "magnolia";
    #     };
    #   };
    # };

    firewall = {
      enable = false;
    };
  };

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enabled = "fcitx";
      fcitx.engines = with pkgs.fcitx-engines; [ mozc hangul ];
    };
  };

  time.timeZone = "Europe/Amsterdam";

  # List packages installed in system profile. To search, run $ nix search wget
  environment = {
    variables = {
      EDITOR = "vim";
    };
    systemPackages = with pkgs; [
      wget
      vim
      firefox
      git
      nox
      zsh
      oh-my-zsh
      fish
      docker
      lolcat
      gitkraken
      vscode
      stack
      thefuck
      figlet
    ];
  };

  programs = {
    bash.enableCompletion = true;
    zsh.enable = true;
    fish.enable = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  # sound
  sound.enable = true;
  hardware = {
    pulseaudio.enable = true;
  };

  fonts.fonts = with pkgs; [
    powerline-fonts
  ];

  services = {
    openssh.enable = true;
    printing.enable = true;

    # X11 windowing system
    xserver = {
      enable = true;
      layout = "us";
      # videoDrivers = [ "nvidia" ];

      # touchpad
      libinput.enable = true;

      desktopManager.gnome3.enable = true;
      displayManager.gdm.enable = true;
      # displayManager.sddm.enable = true;
      windowManager.xmonad.enable = true;
    };
  };

  security = {
    sudo = {
      enable = true;
      configFile = "tycho ALL=(ALL) NOPASSWD: ALL";
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
    # shell = pkgs.zsh;
    shell = pkgs.fish;
  };

  system = {
    stateVersion = "18.03";
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
  };

  nix = {
    gc = {
      automatic = true;
      dates = "03:15";
    };
  };

}

