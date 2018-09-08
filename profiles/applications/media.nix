{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    pkgs.vlc
    shotwell
    imagemagick
    gimp
    pkgs.obs-studio
    mpd
    ympd
    cantata
    ffmpeg
  ];

}
