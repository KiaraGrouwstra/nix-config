{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pandoc
    calibre
    # texlive.combined.scheme-basic
    # texlive.combined.scheme-medium
    texlive.combined.scheme-full
  ];
}
