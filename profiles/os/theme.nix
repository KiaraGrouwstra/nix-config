{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{

  environment.systemPackages = with master; [
    adapta-gtk-theme
    paper-icon-theme
  ];

}
