{ config, pkgs, ... }:

{

  imports = [
    ../../pkgs/gterm/config.nix
  ];

  environment.systemPackages = with pkgs; [
    fish
    # oh-my-fish  # https://github.com/NixOS/nixpkgs/pull/42458
  ];

  fonts.fonts = with pkgs; [
    powerline-fonts  # used in oh-my-* themes
  ];

  programs = {

    bash.enableCompletion = true;
    fish.enable = true;

  };

}
