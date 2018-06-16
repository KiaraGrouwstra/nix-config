# see `nixos-help`, https://nixos.org/nixos/options.html

{ config, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;

    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/networking/browsers/firefox/wrapper.nix
    # TODO: login, ublock prebake
    # firefox = {
    #   enableAdobeFlash = true;
    # };
  };

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
    hostName = "tycho";

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
    # https://en.wikipedia.org/wiki/ISO/IEC_8859-15
    # consoleKeyMap = "us";
    consoleKeyMap = "colemak/en-latin9";
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
      DEFAULT_USER = "tycho";
    };
    systemPackages = with pkgs; [
      wget
      vim
      firefox
      # firefox-bin
      # firefox-devedition-bin
      git
      nox
      zsh
      oh-my-zsh
      fish
      docker
      lolcat
      gitkraken
      vscode
      # vscode-with-extensions.override {
      #   vscodeExtensions = vscode-utils.extensionsFromVscodeMarketplace [
      #     {
      #       name = "code-runner";
      #       publisher = "formulahendry";
      #       version = "0.6.33";
      #       sha256 = "166ia73vrcl5c9hm4q1a73qdn56m0jc7flfsk5p5q41na9f10lb0";
      #     }
      #   ];
      # }
      stack
      thefuck
      figlet
      adapta-gtk-theme
      paper-icon-theme
      gnumake
      tmux
      mkpasswd
      tdesktop  # telegram
      vlc
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

    # gnome-terminal = {
    #   enable = true;
    #   showMenubar = false;
    #   # profile = {
    #   #   "5ddfe964-7ee6-4131-b449-26bdd97518f7" = {
    #   #     default = true;
    #   #     visibleName = "Tomorrow Night - RAH";
    #   #     cursorShape = "ibeam";
    #   #     font = "DejaVu Sans Mono 8";
    #   #     showScrollbar = false;
    #   #     colors = {
    #   #       foregroundColor = "rgb(197,200,198)";
    #   #       palette = [
    #   #         "rgb(0,0,0)" "rgb(145,34,38)" "rgb(119,137,0)"
    #   #         "rgb(174,123,0)" "rgb(103,123,192)" "rgb(104,42,155)"
    #   #         "rgb(43,102,81)" "rgb(146,149,147)" "rgb(102,102,102)"
    #   #         "rgb(204,102,102)" "rgb(181,189,104)" "rgb(240,198,116)"
    #   #         "rgb(140,152,191)" "rgb(178,148,187)" "rgb(138,190,183)"
    #   #         "rgb(236,235,236)"
    #   #       ];
    #   #       boldColor = "rgb(138,186,183)";
    #   #       backgroundColor = "rgb(29,31,33)";
    #   #     };
    #   #   };
    #   # };
    # };

  };

  # sound
  sound.enable = true;
  hardware = {
    pulseaudio.enable = true;
  };

  fonts.fonts = with pkgs; [
    powerline-fonts  # used in oh-my-* themes
    corefonts  # Micrsoft free fonts
    inconsolata  # monospaced
    ubuntu_font_family  # Ubuntu fonts
    terminus_font # for hidpi screens, large fonts
    liberation_ttf
  ];

  services = {
    openssh.enable = true;
    printing.enable = true;

    # # https://askubuntu.com/questions/742946/how-to-find-the-hwdb-header-of-a-general-input-device#743291
    # udev.extraHwdb = ''
    #   # Microsoft Natural Ergonomic Keyboard 4000
    #   keyboard:usb:v045Ep00DB*
    #   KEYBOARD_KEY_c022d=pageup
    #   KEYBOARD_KEY_c022e=pagedown
    # '';

    # X11 windowing system
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "colemak";
      # https://wiki.archlinux.org/index.php/Keyboard_configuration_in_Xorg
      # https://help.ubuntu.com/community/GtkComposeTable
      xkbOptions = "compose:swapcaps, menu:ralt";
      videoDrivers = [ "intel" ];  # "nvidia"

      # touchpad
      libinput.enable = true;

      # # https://github.com/NixOS/nixpkgs/pull/2315/files?utf8=%E2%9C%93&diff=split&w=1#diff-ccba88566614c96adaf4c39ce48526c1
      # .override {
      #   mimeAppsList = pkgs.writeTextFile {
      #     name = "gnome-mimeapps";
      #     destination = "/share/applications/mimeapps.list";
      #     text = ''
      #       [Default Applications]
      #       inode/directory=nautilus.desktop
      #     '';
      #   };
      # }
      desktopManager.gnome3 = {
        enable = true;

        extraGSettingsOverridePackages = with pkgs; [
          gnome3.gedit
        ];

        extraGSettingsOverrides = ''

          # theme

          [org.gnome.desktop.background]
          picture-uri='https://people.csail.mit.edu/vgod/vim/vim-cheat-sheet-en.png'

          [org.gnome.desktop.screensaver]
          picture-uri='https://people.csail.mit.edu/vgod/vim/vim-cheat-sheet-en.png'

          [org.gnome.desktop.interface]
          gtk-theme="Adapta-Nokto"
          icon-theme="Paper-Mono-Dark"
          cursor-theme="Paper"

          [org.gnome.desktop.wm.preferences]
          theme="Adapta-Nokto"

          # gedit

          [org.gnome.gedit.preferences.editor]
          auto-indent=true
          bracket-matching=true
          create-backup-copy=false
          display-line-numbers=true
          highlight-current-line=true
          insert-spaces=true
          tabs-size=4

        '';
      };
      displayManager.gdm.enable = true;
      # displayManager.sddm.enable = true;
      # displayManager.slim.defaultUser = "tycho";

      windowManager = {
        xmonad.enable = true;
        xmonad.enableContribAndExtras = true;
        default = "xmonad";
      };

    };
  };

  security = {
    sudo = {
      enable = true;
      configFile = "tycho ALL=(ALL) NOPASSWD: ALL";
    };
  };

  users = {
    # mutableUsers = false;
    users.tycho = {
      isNormalUser = true;
      uid = 1000;
      home = "/home/tycho";
      description = "Tycho Grouwstra <tychogrouwstra@gmail.com>";
      extraGroups = [ "wheel" "networkmanager" "docker" ];
      openssh.authorizedKeys.keys = [
        # (builtins.readFile (builtins.fetchurl {
        #   url = "https://github.com/puffnfresh.keys";
        #   sha256 = "0gv8wpjxvb18fmvjvlg5ba9phqdhrmyl86qkkv8n7s7kq4dy12di";
        # }))
      ];
      initialPassword = "password";
      # hashedPassword = "YS94gZUENJ1ns";
      shell = pkgs.fish;
    };
  };

  virtualisation = {
    docker = {
      enable = true;
    };
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

  # TODO:
  # - Gnome default applications
  # - ssh-keygen -t rsa -b 4096 -C "tychogrouwstra@gmail.com"
  # - wifi password
  # - oh-my-fish
  # - firefox settings: ublock prebake
  # - telegram: Adapta-Nokto theme

}
