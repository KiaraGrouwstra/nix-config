{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{

  environment.systemPackages = with master; [
    pkgs.vlc
    shotwell
    imagemagick
    gimp
    pkgs.obs-studio
  ];

}
