{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{

  environment.systemPackages = with master; [
    # vlc
    shotwell
    imagemagick
    gimp
    # obs-studio
  ];

}
