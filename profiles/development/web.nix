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
    # postman
  ] ++ (with nodePackages; [
    npm
    node2nix
    azure-cli
    node-gyp-build
    # webtorrent-cli
    webpack
  ]);
}
