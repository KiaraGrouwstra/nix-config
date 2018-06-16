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

  # # TODO: set to `false` after setting user password in conf
  # users.mutableUsers = false;

}
