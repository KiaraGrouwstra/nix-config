{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{
  environment.systemPackages = with master; [
    jekyll
    ruby
    bundler
    bundix
  ];
}
