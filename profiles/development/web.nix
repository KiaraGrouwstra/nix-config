{ pkgs, ... }:

let
  newPkgs = import (fetchTarball {
    # 2018-05-25?
    url = "https://github.com/NixOS/nixpkgs/archive/696c6bed4e8e2d9fd9b956dea7e5d49531e9d13f.tar.gz";
    sha256 = "1v3yrpj542niyxp0h3kffsdjwlrkvj0mg4ljb85d142gyn3sdzd4";
  }) {
    config.allowUnfree = true;
  };
in

{
  environment.systemPackages = with pkgs; [
    nodejs
    yarn
    nodePackages.npm
    nodePackages.azure-cli
    newPkgs.nodePackages.webtorrent-cli
    postman
  ];
}
