{ pkgs, ... }:

let
  master = import ../../master.nix;
in
{
  environment.systemPackages = with master; [
    nodejs
    yarn
    pkgs.postman
  ] ++ (with nodePackages; [
    npm
    node2nix
    azure-cli
    webtorrent-cli
  ]);
}
