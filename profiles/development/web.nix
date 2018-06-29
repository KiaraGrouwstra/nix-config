{ pkgs, ... }:

let
  newPkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/dca7e24a11940477f6a3568fc49bade96ca59514.tar.gz";
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
