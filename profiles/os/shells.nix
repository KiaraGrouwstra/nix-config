{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{

  imports = [
    ../../pkgs/gterm.nix
  ];

  environment.systemPackages = with master; [
    fish
    # oh-my-fish  # https://github.com/NixOS/nixpkgs/pull/42458
  ];

  fonts.fonts = with master; [
    powerline-fonts  # used in oh-my-* themes
  ];

  programs = {

    bash.enableCompletion = true;
    fish.enable = true;

  };

}
