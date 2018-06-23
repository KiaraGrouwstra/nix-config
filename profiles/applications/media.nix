{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    vlc
    shotwell
    imagemagick
    gimp
    obs-studio
  ];

}
