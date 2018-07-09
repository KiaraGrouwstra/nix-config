{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{
  environment.systemPackages = with master; [
    thefuck
    lolcat
    figlet
    beep
    ncdu

    # password managers
    # pkgs.1password
    keepass
    keepassx
  ];
}
