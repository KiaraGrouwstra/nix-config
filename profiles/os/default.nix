{ config, pkgs, ... }:

{

  # search packages with `nix-env -qaP | grep wget` or `nox wget`
  environment.systemPackages = with pkgs; [
    wget
    git
    vim
    nox
    mkpasswd
    tmux
  ];

  virtualisation.docker.enable = true;

  users.mutableUsers = false;

}
