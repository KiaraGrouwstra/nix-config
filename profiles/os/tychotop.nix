{ config, pkgs, ... }:

let
  secrets = import ../../secrets.nix;
in
rec {

  # when disk is full / no drive space left:
  # https://nixos.wiki/wiki/Garbage_Collection
  # sudo rm -r /tmp/*
  # sudo nautilus /nix/var/nix/profiles/system-profiles/
  # sudo nix-collect-garbage -d
  # nix-store --gc
  # nix-store --optimise
  # nix-env --delete-generations
  # ls -shSa /nix/store/
  # sudo du -h /nix/store/ | grep -P '^[0-9\.]+G'
  # ncdu
  # baobab

  imports = [
    # ESSENTIALS
    ./default.nix
    ./desktop.nix
    ./networking.nix
    ../development/cuda.nix

    # PERSONALIZATION
    ./shells.nix
    ./theme.nix
    ./fonts.nix
    ../applications/crap.nix

    # DEV
    ../applications/devtop.nix

    # APPLICATIONS
    ../applications/browsers.nix
    ../applications/entertainment.nix
    ../applications/office.nix
    # ../applications/homeautomation.nix
    ../development/virtualization.nix
  ];


  # https://github.com/NixOS/nixpkgs/tree/master/pkgs
  # https://github.com/NixOS/nixpkgs/tree/master/nixos/modules
  environment.systemPackages = with pkgs; [
    # ...
  ];

  networking.firewall.enable = false;

  programs = {
    mtr.enable = true;
    adb.enable = true;
  };

  environment.variables = {
    EDITOR = "vim";
    TERMINAL = "konsole";  # non-standard, used by i3-sensible-terminal
  };

  security.sudo.extraConfig = ''
    %admin ALL=(ALL) NOPASSWD:ALL
    %wheel ALL=(ALL) NOPASSWD:ALL
  '';

  time.timeZone = "Europe/Amsterdam";

  i18n = {
    consoleUseXkbConfig = true;
    inputMethod = {
      enabled = "fcitx";
      uim.toolbar = "gtk"; # gtk-systray
      fcitx.engines = with pkgs.fcitx-engines; [
        # default:
        # fcitx-keyboard-us
        # pinyin

        # add:
        rime  # pinyin
        cloudpinyin
        mozc  # japanese
        # hangul  # korean
      ];
    };
  };

  services.xserver.displayManager.sddm.theme = "Adapta-Nokto-Eta";
  services.xserver.displayManager.sddm.autoLogin = {
    # enable = true;
    user = "tycho";
  };

}
