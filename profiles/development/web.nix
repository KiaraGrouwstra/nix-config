{ pkgs, ... }:

let
  master = import ../../master.nix;
  pkgs = import <nixpkgs> {
    config.allowUnfree = true;
  };
  webtorrent = import ./web/webtorrent.nix;
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
    # webtorrent
  ]);
}
