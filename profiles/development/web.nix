{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{
  environment.systemPackages = with pkgs; [
    nodejs
    yarn
    nodePackages.npm
    nodePackages.azure-cli
    master.nodePackages.webtorrent-cli
    # postman
  ];
}
