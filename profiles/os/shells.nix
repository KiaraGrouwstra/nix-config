{ pkgs, ... }:

{

  imports = [
    ../../pkgs/gterm.nix
  ];

  environment.systemPackages = with pkgs; [
    zsh
    oh-my-zsh
    fish
    # bass: fisher edc/bass
    # oh-my-fish  # https://github.com/NixOS/nixpkgs/pull/42458
  ];

  fonts.fonts = with pkgs; [
    powerline-fonts  # used in oh-my-* themes
  ];

  programs = {

    bash.enableCompletion = true;
    fish.enable = true;
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
