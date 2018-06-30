{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{
  environment.systemPackages = with master; [
    nodejs
    # pkgs.node2nix
    yarn
    nodePackages.npm
    nodePackages.azure-cli
    nodePackages.webtorrent-cli
    pkgs.postman
  ];
}
