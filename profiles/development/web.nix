{ pkgs, ... }:

let
  pkgs = import <nixpkgs> {
    config.allowUnfree = true;
  };
in
{
  imports = [
    # ./web/torrent-search-api/default.nix
  ];

  environment.systemPackages = with pkgs; [
    nodejs
    yarn
    gnome3.gjs
    pkgs.postman
  ] ++ (with nodePackages; [
    npm
    node2nix
    azure-cli
    # webtorrent-cli
  ]);
}
