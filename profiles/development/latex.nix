{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pandoc
    calibre
    texlive.combined.scheme-basic
  ];
}
