{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    vlc
    imagemagick
    gimp
  ];

}
