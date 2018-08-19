{ pkgs, ... }:

let
  pkgs = import <nixpkgs> {
    config.allowUnfree = true;
  };
  # webtorrentCli = import ./web/webtorrent-cli.nix {
  #   inherit (pkgs) fetchurl sources nodeEnv globalBuildInputs;
  # };
in
{
  imports = [
    # ./web/torrent-search-api/default.nix
  ];

  environment.systemPackages = with pkgs; [
    nodejs
    yarn
    pkgs.postman
  ] ++ (with nodePackages; [
    npm
    node2nix
    azure-cli
    # webtorrentCli
    # webtorrent-cli
  ]);
}
