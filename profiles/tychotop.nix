{ config, pkgs, ... }:

let
  secrets = import ../secrets.nix;
  # settings
  theme = import ./theme.settings.nix;
  gedit = import ../pkgs/gedit/config.nix { pkgs = pkgs; };
in
rec {

  imports = [
    # ESSENTIALS
    ./default.nix
    ./desktop.nix
    ./networking.nix
    ./cuda.nix

    # PERSONALIZATION
    ./shells.nix
    ./theme.nix
    ./fonts.nix
    ./crap.nix

    # DEV
    ./latex.nix
    ./mathematics.nix
    ./devtop.nix

    # APPLICATIONS
    ./web.nix
    ./entertainment.nix
    ./office.nix
    # ./homeautomation.nix
    ./virtualization.nix
  ];


  # TODO: add more
  # https://github.com/NixOS/nixpkgs/tree/master/pkgs
  # https://github.com/NixOS/nixpkgs/tree/master/nixos/modules
  environment.systemPackages = with pkgs; [
    # ...
  ];

  networking.firewall.enable = false;

  programs = {
    mtr.enable = true;
  };

  environment.variables = {
    EDITOR = "vim";
  };

  security.sudo.extraConfig = ''
    %wheel ALL=(ALL) NOPASSWD:ALL
  '';

  time.timeZone = "Europe/Amsterdam";

  i18n = {
    consoleUseXkbConfig = true;
    inputMethod = {
      enabled = "fcitx";
      fcitx.engines = with pkgs.fcitx-engines; [
        # default:
        # fcitx-keyboard-us
        # pinyin

        # add:
        mozc  # japanese
        # hangul  # korean
      ];
    };
  };

  services.xserver.desktopManager.gnome3.extraGSettingsOverridePackages = gedit.extraGSettingsOverridePackages;
  services.xserver.desktopManager.gnome3.extraGSettingsOverrides = theme.extraGSettingsOverrides + gedit.extraGSettingsOverrides;

  services.xserver.displayManager.gdm.autoLogin = {
    enable = true;
    user = "tycho";
  };

  # more:
  # - gnome shell extensions: ~/.local/share/app-info/xmls/extensions-web.xml

}
