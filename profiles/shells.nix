{ config, pkgs, ... }:

{

  imports = [
    ../pkgs/gterm/config.nix
  ];

  environment.systemPackages = with pkgs; [
    fish
    # TODO: oh-my-fish
  ];

  fonts.fonts = with pkgs; [
    powerline-fonts  # used in oh-my-* themes
  ];

  programs = {

    bash.enableCompletion = true;
    fish.enable = true;

  };

}
