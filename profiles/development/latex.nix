{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{
  environment.systemPackages = with master; [
    # pandoc
    texlive.combined.scheme-basic
  ];
}
