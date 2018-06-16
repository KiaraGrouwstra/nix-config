{ config, pkgs, ... }:

let secrets = import ../secrets.nix;
in
rec {

  imports = [
    # ESSENTIALS
    ./default.nix
    ./desktop.nix
    ./networking.nix
    # ./cuda.nix

    # PERSONALIZATION
    ./shells.nix
    ./theme.nix
    ./fonts.nix
    ./crap.nix

    # DEV
    # ./latex.nix
    # ./mathematics.nix
    ./devtop.nix
    # ../pkgs/gedit/config.nix  # TODO: solve appending gsettings

    # APPLICATIONS
    ./web.nix
    ./entertainment.nix
    ./office.nix
    # ./homeautomation.nix
    # ./virtualization.nix
  ];


  # TODO: add more
  # https://github.com/NixOS/nixpkgs/tree/master/pkgs
  # https://github.com/NixOS/nixpkgs/tree/master/nixos/modules
  # nox
  environment.systemPackages = with pkgs; [
    # ...
  ];

  networking.firewall.enable = false;
  services.xserver.xkbVariant = "colemak"; # TODO: switch thru fcitx?

  programs = {
    mtr.enable = true;
  };

  environment.variables = {
    EDITOR = "vim";
  };

  # TODO: ssh-keygen -t rsa -b 4096 -C "tychogrouwstra@gmail.com"

}
