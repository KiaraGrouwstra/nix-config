{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{
  environment.systemPackages = with master; [
    pandoc
    calibre
    texlive.combined.scheme-basic
  ];
}
