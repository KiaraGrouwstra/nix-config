{ config, pkgs, ... }:

{

  imports = [
    ../pkgs/gterm/config.nix
  ];

  environment.systemPackages = with pkgs; [
    zsh
    oh-my-zsh
    fish
    # TODO: oh-my-fish
  ];

   fonts.fonts = with pkgs; [
    powerline-fonts  # used in oh-my-* themes
  ];

 programs = {

    bash.enableCompletion = true;
    zsh.enable = true;
    fish.enable = true;

  };

}
