{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{

  imports = [
    ../../pkgs/gterm.nix
  ];

  environment.systemPackages = with master; [
    zsh
    oh-my-zsh
  ];

  fonts.fonts = with master; [
    powerline-fonts  # used in oh-my-* themes
  ];

  programs = {

    bash.enableCompletion = true;
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        theme = "agnoster";
        # plugins = [];
      };
    };

  };

}
