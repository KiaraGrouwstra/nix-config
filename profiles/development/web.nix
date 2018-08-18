{ pkgs, ... }:

let
  master = import ../../master.nix;
  pkgs = import <nixpkgs> {
    config.allowUnfree = true;
  };
in
{
  imports = [
    # ./web/torrent-search-api/default.nix
  ];

  environment.systemPackages = with master; [
    nodejs
    yarn
    pkgs.postman
  ] ++ (with nodePackages; [
    npm
    node2nix
    azure-cli
    # webtorrent-cli
  ]);
}
