{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs
    yarn
    nodePackages.npm
    # nodePackages.webtorrent-cli
    postman
  ];
}
